{
  config,
  pkgs,
  inputs,
  ...
}: 
{
  programs.spicetify = 
  let 
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
       adblock
    ];
    theme = spicePkgs.themes.text;
    customColorScheme = with config.walnix.colors.noHash; {
      accent = color10;
      accent-active = color2;
      accent-inactive = color0;
      banner = color5;
      border-active = color5;
      border-inactive = color0;
      header = color0;
      highlight = color0;
      highlight-elevated = foreground;
      main = background;
      main-elevated = color0;
      text = color5;
      subtext = foreground;


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
