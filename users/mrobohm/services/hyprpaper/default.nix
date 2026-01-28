{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.file = {
    ".hintergrund/hintergrund.png".source = ./hintergrund.png;
  };
  home.packages = with pkgs-stable; [
    hyprpaper
  ];
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["~/.hintergrund/hintergrund.png"];
      wallpaper = [",~/.hintergrund/hintergrund.png"];
    };
  };
}
