{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: {
  services.desktopManager.cosmic.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
  environment.systemPackages = [
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.tiling-shell
  ];
  environment.gnome.excludePackages = with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ];
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland;
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        # cursor_theme_name = "oreo_custom_cursors";
        # theme_name = "Sweet-Dark";
      };
      appearance.greeting_msg = "WichsOS";
      background = {
        path = ./schwarz.png;
        fit = "Fill";
      };
    };
  };
}
