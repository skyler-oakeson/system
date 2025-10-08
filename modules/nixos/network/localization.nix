{ config, lib, ... }:
with lib; {
  options = {
    networking = {
      timeZone = mkOption {
        default = "America/Denver";
      };
      locale = mkOption {
        default = "en_US.UTF-8";
      };
    };
  };

  config = {
    # Set your time zone.
    time.timeZone = config.networking.timeZone;

    # Select internationalisation properties.
    i18n.defaultLocale = config.networking.locale;

    i18n.extraLocaleSettings = {
      LC_ADDRESS = config.networking.locale;
      LC_IDENTIFICATION = config.networking.locale; 
      LC_MEASUREMENT = config.networking.locale;
      LC_MONETARY = config.networking.locale;
      LC_NAME = config.networking.locale;
      LC_NUMERIC = config.networking.locale;
      LC_PAPER = config.networking.locale;
      LC_TELEPHONE = config.networking.locale;
      LC_TIME = config.networking.locale;
    };
  };
}
