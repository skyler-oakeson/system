{ config, pkgs, users, ... }:

{
  home.packages = with pkgs; [
      zsh
      (pkgs.writeShellScriptBin "rebuild" ''
        pushd /home/skyler/.config/system

        git add --all

        # Early return if no changes
        # if git diff --quiet '*.nix'; then
        #     echo "No changes detected, exiting."
        #     popd
        #     exit 0
        # fi

        # Autoformat your nix files
        # alejandra . &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)

        git diff -U0 '*.nix'

        echo "NixOS Rebuilding..."

        # Rebuild, output simplified errors, log trackebacks, if error find the errors print them and return
        sudo nixos-rebuild switch --flake . &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

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
