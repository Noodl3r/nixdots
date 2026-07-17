{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    clock24 = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    shortcut = "a";
    baseIndex = 1;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      resurrect
      continuum
    ];
    # must be a better way to do this lol
    extraConfig = ''
      set -g status-position top
      set -g status on
      set -g status-left ""
      set -g status-right ""

      set -g status-style fg=#000000,bg=#000000
      set -g window-status-current-style fg=#ffffff,bg=#0088cc,bold
      set -g window-status-style fg=#ffffff,bg=#333333

      set -g window-status-separator ""
      set -g window-status-format " #I "
      set -g window-status-current-format " #I "
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g set-clipboard on
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"
      bind-key e display-popup -E -w 80% -h 80% "ts"
      set -g @continuum-save-interval '10'
      set -g @continuum-restore 'on'
      set -g @continuum-save 'on'
    '';
  };
}
