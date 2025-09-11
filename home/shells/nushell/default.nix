{ user, ... }:
{
  config = {
    programs.carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.nushell = {
      enable = true;
      extraConfig = ''
        source /home/${user.username}/.config/system/home/shells/nushell/config.nu
      '';
    };
  };
}
