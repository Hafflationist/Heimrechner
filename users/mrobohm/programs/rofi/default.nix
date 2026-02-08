{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages = with pkgs; [
    # used for plugin
    xclip
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ./launcher/style.rasi;
    plugins = [pkgs.rofi-calc];
  };
}
