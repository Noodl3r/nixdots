{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_right" = "l";
      "move_down" = "j";
      "move_up" = "k";
      "move_left" = "h";
      "move_document_down" = "J";
      "move_document_up" = "K";
      "screen_down" = "d";
      "screen_up" = "u";
      "zoom_in" = "+";
      "zoom_out" = "-";
      "fit_to_page" = "=";
      "prev_state" = "<C-o>";
      "next_state" = "<C-i>";
      "toggle_table_of_contents" = "t";
    };
    config = {
      background_color = "1.0 1.0 1.0";
      startup_commands = [
        "toggle_visual_scroll"
        "toggle_dark_mode"
      ];
      text_highlight_color = "0.0 0.7 1.0";
      dark_mode_background_color = "0 0 0 0";
      dark_mode_contrast = "1.0";
      smooth_scroll = "1";
      startup_zoom_type = "fit_to_width";
      should_launch_new_window = "1";
      trim_white_margins = "1";
      show_status_bar = "0";
      super_fast_search = "1";
    };
  };
}
