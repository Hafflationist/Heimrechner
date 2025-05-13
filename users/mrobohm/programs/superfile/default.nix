{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.superfile = {
    enable = true;
    settings = {
      transparent_background = true;
    };
  };
}
