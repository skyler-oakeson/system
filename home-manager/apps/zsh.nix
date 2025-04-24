{
  config,
  pkgs,
  users,
  ...
}: {
  home.packages = with pkgs; [
    zsh
    (pkgs.writeShellScriptBin "initpy" ''
        echo "let
          pkgs = import <nixpkgs> {}; 
        in pkgs.mkShell {
          packages = [
            (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
            ]))
          ];
        }" >> shell.nix
    '')

    (pkgs.writeShellScriptBin "rebuild" ''
      Help() {
          echo "
              Usage: rebuild [OPTION]
              Rebuilds NixOS and home-manager configurations.
                  -h,            Displays help message
                  -m,            Rebuilds only home-manager modules
                  -n,            Rebuilds only nixos modules
          "
      }

      pushd /home/skyler/.config/system
      git diff -U0 '*.nix'

      if "$#" -eq 0; then
          # rebuild all
          echo "Rebuilding all..."
          git add --all
          sudo nixos-rebuild switch --flake .
          home-manager switch --flake .
          exit;
      fi

      while getopts ":hnm:" option; do
          case $option in
            h) # display help
               Help
               exit;;
            n) # rebuild nixos
               echo "Rebuilding NixOS..."
               git add modules/nixos/
               sudo nixos-rebuild switch --flake .
               exit;;
            m) # rebuild home-manager
               echo "Rebuilding Home-Manager..."
               git add modules/home-manager/
               home-manager switch --flake .
               exit;;
          esac
          # Autoformat your nix files
          # alejandra . &>/dev/null || ( alejandra . ; echo "formatting failed!" && exit 1)
      done

      # Get current generation metadata
      genNix=$(nixos-rebuild list-generations | grep current)
      genHM=$(home-manager generations | head -1)

      sudo git commit -am "NixOS Gen := genNix$ home-manager Gen := $genHM"
      popd
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

    initExtra = ''
        PATH=$PATH:$HOME/.cargo/bin
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
