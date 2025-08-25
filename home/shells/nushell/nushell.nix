{ ... }:
{
  config = {
    programs.nushell = {
      enable = true;
      configFile.source = ./config.nu;
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
