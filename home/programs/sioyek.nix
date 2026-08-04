{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_right" = "k";
      "move_down" = "j";
      "move_up" = "k";
      "move_left" = "h";
      "next_page" = "J";
      "previous_page" = "K";
    };
    config = {
      background_color = "1.0 1.0 1.0";
      strup_commands = [
        "toggle_visual_scroll"
        "toggle_dark_mode"
      ];
      text_highlight_color = "0.0 0.7 1.0";
      dark_mode_background_color = "0 0 0 0";
      dark_mode_contrast = "1.0";
    };
  };
}
