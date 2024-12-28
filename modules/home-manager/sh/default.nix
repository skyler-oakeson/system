{ config, pkgs, users, ... }:

{
  home.packages = with pkgs; [
      zsh
      (pkgs.writeShellScriptBin "rebuild" ''
        pushd /home/skyler/.config/system

        # Early return if no changes
        if git diff --quiet '*.nix'; then
            echo "No changes detected, exiting."
            popd
            exit 0
        fi

        git add --all

        # Autoformat your nix files
        # alejandra . &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)

        git diff -U0 '*.nix'

        echo "NixOS Rebuilding..."

        # In my case I use flakes but here it checks whether it fails or not
        if sudo nixos-rebuild switch --flake ".#$1" &>.nixos-switch.log; then
            echo -e "Done\n"
        else
            echo "$(cat .nixos-switch.log | grep --color error)"

            # this is needed otherwise the script would not start next time telling you "no changes detected"
            # (The weird patter is to include all subdirectories)
            sudo git restore --staged ./**/*.nix

            if read -p "Open log? (y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
                cat .nixos-switch.log | nvim - 	
            fi

            # Clean stuff and exit
            shopt -u globstar
            popd > /dev/null
            exit 1
        fi

        # Get current generation metadata
        current=$(nixos-rebuild list-generations | grep current)

        git commit -am "$current"
        '')
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [
        {
            name = "zsh-vi-mode";
            file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
            src = pkgs.zsh-vi-mode;
        }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo"
      ];
      theme = "mh";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
