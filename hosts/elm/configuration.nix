{
  pkgs,
  inputs,
  user,
  host,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/deskenv
    ../../modules/nixos/virtual
    ../../modules/nixos/fonts
    ../../modules/nixos/games
    ../../modules/nixos/utils
    ../../modules/nixos/maintenance
    ../../modules/nixos/boot
    ../../modules/nixos/network
    ../../modules/nixos/services
    ../../modules/nixos/hardware
  ];

  nix.package = pkgs.lix;

  networking = {
    hostName = "elm";
    locale = "en_US.UTF-8";
    timeZone = "America/Denver";
  };

  deskenv.hyprland.enable = true;

  programs.dconf.enable = true;

  games.steam.enable = true;
  hardware.drivers.amd.enable = true;

  maintenance.garbageCollection = {
    enable = true;
    schedule = "daily";
    deleteOlderThan = "10d";
  };

  users.groups.${user.username} = { };
  users.mutableUsers = false;
  users.users.${user.username} = {
    home = "/home/${user.username}";
    isSystemUser = user.isSystemUser;
    isNormalUser = user.isNormalUser;
    hashedPassword = user.hashedPassword;
    description = user.username;
    group = user.username;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = false;
    shell = pkgs.${user.preferences.default.shell};
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  security.rtkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
