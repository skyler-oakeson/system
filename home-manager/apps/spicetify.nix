{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];
    theme = spicePkgs.themes.text;
    customColorScheme = with config.walnix.colors.noHash; {
      accent = color12;
      accent-active = color11;
      accent-inactive = color3;
      banner = color14;
      border-active = color12;
      border-inactive = color4;
      header = color12;
      highlight = color12;
      highlight-elevated = color11;
      main = background;
      main-elevated = color0;
      text = color12;
      subtext = color5;

      sidebar = background;
      player = color3;
      card = color0;
      shadow = background;
      selected-row = color3;
      button = color3;
      button-active = color13;
      button-disabled = color5;
      tab-active = color2;
      notification = color4;
      notification-error = color1;
      equalizer = color8;
      misc = color2;
    };
  };
}
