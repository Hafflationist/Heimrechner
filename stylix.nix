{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    cursor.size = 24;
    cursor.package = pkgs.graphite-cursors;
    cursor.name = "graphite-dark";
    image = ./users/mrobohm/services/hyprpaper/hintergrund.png;
  };
}
