{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    steam
    firefox
    discord
    wofi
    pywal
  ];
}
