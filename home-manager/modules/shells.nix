{
  config,
  pkgs,
  users,
  lib,
  ...
}:
let
  cfg = config.shells;
in
{
  config = {
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

        pushd /home/skyler/.config/system
        if [[ $* != *-h* && $* != *-m* && $* != *-n* ]] then
            # rebuild all
            git add --all
            echo "-> Rebuilding home-manager"
            home-manager switch --flake .
            echo "-> Rebuilding NixOs"
            sudo nixos-rebuild switch --flake .
            exit;
        fi

        while [$# -gt 0]; do
          case $1 in
            h | --help) # display help
            echo "
            NAME
                  rebuild - rebuilds NixOS and home-manager configurations.
            OPTIONS:
                  -h,            Displays help message
                  -m,            Rebuilds only home-manager modules
                  -n,            Rebuilds only nixos modules
            "
               ;;
            n | --nixos) # rebuild nixos
               echo "Rebuilding NixOS..."
               git add modules/nixos/
               sudo nixos-rebuild switch --flake .
               ;;
            m | --home-manager) # rebuild home-manager
               echo "Rebuilding Home-Manager..."
               git add modules/home-manager/
               home-manager switch --flake .
               ;;
            c | --commit) # commit
               # Get current generation metadata
               genNix=$(nixos-rebuild list-generations | grep current)
               genHM=$(home-manager generations | head -1)
               echo "-> Please enter a commit message:"
               read message
               sudo git commit -am "
               NixOS := $genNix
               home-manager := $genHM
               Message := $message" > /dev/null
               ;;
          esac
          shift
        done
        popd > /dev/null
      '')
    ];

    home.shellAliases = {
      "..." = "cd ../..";
      "plshell" = "docker exec -it mypl /bin/bash";
      "plstart" =
        "sudo docker run -it --rm -p 3000:3000 -e NODEMON=true -v ~/cde/py/PrairieLearn:/PrairieLearn --name mypl prairielearn/prairielearn";
    };

    home.shell.enableZshIntegration = true;

    programs.zsh = {
      enableCompletion = true;
      enableVteIntegration = true;
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

      initContent = ''
        PATH=$PATH:$HOME/.cargo/bin
      '';
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      fileWidgetOptions = [
      ];
    };
  };
}
