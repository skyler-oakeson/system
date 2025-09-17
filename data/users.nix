{
  user0 = rec {
    username = "skyler";
    hashedPassword = "$y$j9T$31mA5FUM9TmnW8QQ..tfE/$HhS.b0lJsptxlb7243Qg2duXua/FRgKjZaCT3s4wYn5";
    isNormalUser = true;
    isSystemUser = false;

    git = {
      userEmail = "skyler.oakeson@gmail.com";
      userName = "skyler-oakeson";
    };

    preferences = {
      ui = {
        radius = 0;
        border = true;
        borderSize = 1;
      };

      default = {
        shell = "zsh";
      };

      theme = {
        borderColor = "$color8";
        inactiveBorderColor = "$color0";
      };

      wallpaper = {
        repo = "https://github.com/skyler-oakeson/wallpapers.git";
        file = "trees_river_painting.jpg";
      };
    };

    locations = {
      downloads = "/home/${username}/dwn";
      theme = "/home/${username}/.cache/wallust";
    };
  };
}
