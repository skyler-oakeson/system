{ user, ... }:
{
  config = {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        source $HOME/.config/system/home/shells/nushell/config.nu
      '';
    };

    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
