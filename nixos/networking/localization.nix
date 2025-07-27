{ host, ... }:
{
  # Set your time zone.
  time.timeZone = host.timeZone or "America/Denver";

  # Select internationalisation properties.
  i18n.defaultLocale = host.locale or "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = host.locale or "en_US.UTF-8";
    LC_IDENTIFICATION = host.locale or "en_US.UTF-8";
    LC_MEASUREMENT = host.locale or "en_US.UTF-8";
    LC_MONETARY = host.locale or "en_US.UTF-8";
    LC_NAME = host.locale or "en_US.UTF-8";
    LC_NUMERIC = host.locale or "en_US.UTF-8";
    LC_PAPER = host.locale or "en_US.UTF-8";
    LC_TELEPHONE = host.locale or "en_US.UTF-8";
    LC_TIME = host.locale or "en_US.UTF-8";
  };
}
