{ config, pkgs, users, ... }:

{
  home.packages = with pkgs; [
      zsh
      (pkgs.writeShellScriptBin "rebuild" ''
        cd ~/.config/system/flake.nix  
        nixos-rebuild switch --flake .
        git add --all
        git commit -am ""
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
