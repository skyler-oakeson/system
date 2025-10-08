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
      (pkgs.writeShellScriptBin "dockershell" ''
        CONTAINER_ID=$(docker ps --format "{{.ID}}\t{{.Names}}" | fzf --with-nth=2 --delimiter="\t" | awk '{print $1}')
        if [ -n "$CONTAINER_ID" ]; then
          docker exec -it "$CONTAINER_ID" bash
        fi
      '')

    ];

    home.shellAliases = {
      "..." = "cd ../..";
      "plshell" = "sudo docker exec -it mypl /bin/bash";
      "plinit" =
        "sudo docker run -it --rm -p 3000:3000 -e NODEMON=true DEV=true -v ~/cde/py/PrairieLearn:/PrairieLearn --name mypl prairielearn/prairielearn -it mypl /bin/bash -c make deps && /PrairieLearn/scripts/init.sh";
      "plstart" =
        "sudo docker run -it --rm -p 3000:3000 -e NODEMON=true -v ~/cde/py/PrairieLearn:/PrairieLearn --name mypl prairielearn/prairielearn";
      "switch" = "sudo nixos-rebuild switch --flake ~/.config/system/";
      "test" = "sudo nixos-rebuild test --flake ~/.config/system/";
      "config" = "cd ~/.config/system/; nvim";
      "cdf" = "cd $(fzf --walker=dir)";
    };

    home.shell.enableZshIntegration = true;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      dotDir = config.xdg.configHome + ".zsh/";
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
