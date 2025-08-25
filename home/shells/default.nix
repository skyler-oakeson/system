{ ... }:
{
  imports = [
    ./nushell.nix
    ./zsh.nix
  ];

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
  };
}
