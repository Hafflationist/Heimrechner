{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = "16";
      #background_opacity = "0.0";
      background = "#11111b";
      background_opacity = "0.25";
      #background = "#0d0d1b";
      foreground = "#ccccce";
      selection_background = "#002a3a";
      selection_foreground = "#0d0f18";
      cursor = "#ff0087";
      color0 = "#282828";
      color1 = "#ca1444";
      color2 = "#789aba";
      color3 = "#b3879f";
      color4 = "#c50ed2";
      color5 = "#cb6fa1";
      color6 = "#fb6e93";
      color7 = "#cf98c1";
      color8 = "#98218e";
      color9 = "#cb515d";
      color10 = "#5a87b1";
      color11 = "#9c61ab";
      color12 = "#9a77b1";
      color13 = "#f2a297";
      color14 = "#f4436f";
      color15 = "#ebdbb2";
      cursor_trail = 3;
    };
  };
}
