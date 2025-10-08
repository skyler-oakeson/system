{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dua # interactive disk usage analyzer
    dust # modern du replacement with colors
    eza # modern ls replacement
    file # determine file types
    gawk # GNU's awk
    lsof # tool to list open files
    ncdu # NCurses disk usage analyzer
    p7zip # 7-Zip archiver
    rar # RAR archives
    unzip # extract ZIP archives
    zip # create ZIP archives
    unzip # unzip ZIP archives
    zstd # compression algorithm (optional Emacs dep)
    ripgrep # search
    tree # view file tree
    fd # find entries in file system
    fzf # search file system
    findutils # search file system
  ];
}
