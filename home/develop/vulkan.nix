{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-headers

      glfw # window creation
      glm # linear algebra library
      shaderc # shader compilation
      glsl_analyzer # lsp for glsl
    ];
  };
}
