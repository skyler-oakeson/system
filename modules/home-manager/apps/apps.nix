{ pkgs, lib, inputs, ... }: 
{
  home.packages = with pkgs; [
    steam
    firefox
    discord
  ];
}
