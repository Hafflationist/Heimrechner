{
  pkgs,
  lib,
  ...
}: {
  home.file.".config/lsd/themes/lsd-colors.yaml".source = ./lsd-colors.yaml;
  programs.lsd = {
    enable = true;
    settings = {
      date = "+%Y-%m-%d %H:%M:%S";
      color.theme = "lsd-colors";
    };
  };
}
