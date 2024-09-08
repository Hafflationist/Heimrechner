
{ lib, pkgs, inputs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        # cursor_theme_name = "oreo_custom_cursors";
        theme_name = "Sweet-Dark";
      };
      appearance.greeting_msg = "WichsOS";
      background = {
        path = ./schwarz.png;
        fit = "Fill";
      };
    };
  };
}
