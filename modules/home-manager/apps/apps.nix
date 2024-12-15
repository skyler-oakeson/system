{ pkgs, lib, inputs, home,... }: 
{
  home.packages = with pkgs; [
    steam
  ];
}
