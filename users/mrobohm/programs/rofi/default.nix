{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./launcher/style.rasi;
    plugins = [ pkgs.rofi-calc ];
  };
}
