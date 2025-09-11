{ user, ... }:
{
  config = {
    programs.git = {
      enabel = true;
      userName = user.git.userName;
      userEmail = user.git.userEmail;
      diff-so-fancy = {
        enable = true;
      };
      ignores = [
        "shell.nix"
      ];
    };
  };
}
