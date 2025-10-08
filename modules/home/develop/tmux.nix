{ ... }:
{
  config = {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      extraConfig = ''
        set -a terminal-features "tmux-256color:RGB"
        set -g base-index 1
        set-option -g prefix C-b
        set -g renumber-windows on   
        set -g mode-keys vi
        set -g status-position top
        set -g status-justify absolute-centre
        set -g status-style "bg=default"
        set -g window-status-current-style "fg=blue bold"
        set -g status-right ""
        set -g status-left "#S"
        set -g escape-time 0
        set -g extended-keys always
        set -g allow-passthrough on

        bind r source-file "~/.config/tmux/tmux.conf"
        bind b set -g status
        bind g neww -n "lazygit" lazygit
        bind E show-environment -g
      '';
    };
  };
}
