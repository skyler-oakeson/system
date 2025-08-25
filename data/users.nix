{
  user0 = rec {
    username = "skyler";
    password = "$y$j9T$GvFH.glheNSCw5Ppegi/4.$6OLZfi.F/NSoPQ8IlyygO0yuLcGvk188TKo1OYkc6DD";
    isNormalUser = true;
    isSystemUser = false;

    preferences = {
      ui = {
        radius = 0;
        border = true;
        borderSize = 1;
      };

      default = {
        shell = "nushell";
      };
    };

    locations = {
      downloads = "/home/${username}/dwn";
      theme = "/home/${username}/.cache/wallust";
      wallpapers = "/home/${username}/.config/wallpapers";
    };
  };
}
