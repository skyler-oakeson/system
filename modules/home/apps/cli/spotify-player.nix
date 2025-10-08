{
  pkgs,
  ...
}:
{
  config = {
    programs.spotify-player = {
      enable = true;
      actions = [
        {
          action = "GoToArtist";
          key_sequence = "g A";
        }
        {
          action = "GoToAlbum";
          key_sequence = "g B";
          target = "PlayingTrack";
        }
        {
          action = "ToggleLiked";
          key_sequence = "C-l";
        }
      ];

      settings = {
        cover_img_width = 5;
        cover_img_length = 12;
        cover_img_scale = 1.0;
        seek_duration_secs = 10;
        device = {
          volume = 100;
        };
      };
    };
  };
}
