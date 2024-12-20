{ pkgs, lib, inputs, ... }: 
{
  environment.systemPackages = with pkgs; [
    steam
    firefox
    discord
  ];
}
