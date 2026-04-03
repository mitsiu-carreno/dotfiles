{ ... }: {
  programs.kitty = {
    enable = true;

#    font = {
#      name = "JetBrainsMono Nerd Font"
#      size = 11;
#    };

    # themeFile = "tokyo_night_night";

    settings = {
      # Window
      background_opacity = "0.75";
      hide_window_decorations = "titlebar-only";
      enabled_layouts = "splits,stack";

      # Cursor
      cursor_shape = "block";
      shell_integration = "no-cursor";

      # Bell
      enable_audio_bell = false;
      
      # Tab
      tab_bar_style = "fade";
      tab_fade = "0 0 1 1";

    };
    
    keybindings = {
      # Splitting
      "ctrl+shift+|" = "launch --location=vsplit --cwd=current";
      "ctrl+shift+-" = "launch --location=hsplit --cwd=current";

      # Focus
      "ctrl+h" = "neighboring_window left";
      "ctrl+l" = "neighboring_window right";
      "ctrl+j" = "neighboring_window down";
      "ctrl+k" = "neighboring_window up";

      # Resize
      "ctrl+shift+h" = "resize_window wider 2";
      "ctrl+shift+l" = "resize_window narrower 2";
      "ctrl+shift+k" = "resize_window taller 2";
      "ctrl+shift+j" = "resize_window shorter 2";
    };
  };
}

