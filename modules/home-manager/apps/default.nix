{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    steam-tui
    steamcmd
    firefox
    discord
  ];
}
