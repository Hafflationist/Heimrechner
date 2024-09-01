{ pkgs, ... }:

{
  home.file = {
    ".hintergrund/hintergrund.png".source = ./hintergrund.png;
  };
  home.packages = with pkgs; [
    hyprpaper
  ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["~/.hintergrund/hintergrund.png"];
      wallpaper = ["DP-2,~/.hintergrund/hintergrund.png"];
    };
  };
}
