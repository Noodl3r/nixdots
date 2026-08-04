{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_add_path ~/.local/bin
      set -g fish_key_bindings fish_vi_key_bindings
      set -f fish_cursor_default block blink
      set -f fish_cursor_insert line blink
      set -f fish_cursor_replace_one underscore blink
      set -f fish_cursor_visual block
    '';
    #set -gx DIRENV_LOG_FORMAT ""

    shellAliases = {
      btw = "echo I use nixos btw";
      v = "nvim";
      rebuild-mini = "sudo nixos-rebuild switch --flake ~/dotfiles#minivac --no-reexec";
      rebuild-multi = "sudo nixos-rebuild switch --flake ~/dotfiles#multivac --no-reexec";
      check = "nix flake check ~/dotfiles";
      lg = "lazygit";
    };
    functions = {
      zath = ''
        nohup zathura $argv >/dev/null 2>&1 &
        disown
      '';
    };
  };
}
