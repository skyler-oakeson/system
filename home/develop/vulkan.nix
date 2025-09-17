{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
    ];
  };
}
