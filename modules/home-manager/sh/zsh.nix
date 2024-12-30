{
  config,
  pkgs,
  users,
  ...
}: {
  home.packages = with pkgs; [
    zsh
    (pkgs.writeShellScriptBin "rebuild" ''
      Help() {
          echo "
              Usage: rebuild [OPTION]
              Rebuilds NixOS and home-manager configurations.

                  -m,            Rebuilds only home-manager modules
                  -n,            Rebuilds only nixos modules
                  -a,            Rebuilds both nixos and home-manager modules
          "
      }

      if [ "#$" -ne 1 ]; then
          echo "Illegal number of arguments."
          exit 1
      fi

      pushd /home/skyler/.config/system

      # Autoformat your nix files
      alejandra . &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)

      git diff -U0 '*.nix'

      echo "NixOS Rebuilding..."

      while getopts ":hna:" option; do
          case $option in
            h) # display help
               Help
               exit;;
            n) # rebuild nixos
               git add modules/nixos/
               sudo nixos-rebuild switch --flake .
               exit;;
            m) # rebuild home-manager
               git add modules/home-manager/
               sudo home-manager switch --flake .
               exit;;
            a) # rebuild all
               git add --all
               sudo nixos-rebuild switch --flake .
               sudo home-manager switch --flake .
               exit;;
          esac
      done



      # Get current generation metadata
      currentNix=$(nixos-rebuild list-generations | grep current)
      currentHM=$(home-manager generations | head -1)

      sudo git commit -am "NixOS Gen := $currentNix
                           home-manager Gen := $currentHM"
    '')
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    dotDir = ".config/zsh";
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
