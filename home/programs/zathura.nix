{
  programs.zathura = {
    enable = true;
    mappings = {
      f = "toggle_fullscreen";
    };
    options = {
      default-bg = "#000000";
      default-fg = "#4C8BF5";
      recolor = "true";
      recolor-reverse-video = "true";
      synctex = "true";
      render-loading = "false";
      adjust-open = "best-fit";
      selection-clipboard = "clipboard";
      recolor-lightcolor = "000000";
      recolor-darkcolor = "4C8BF5";
      scroll-step = "50";
      guioptions = "none";
    };
  };
}
