{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "de";
      displayManager.defaultSession = "none+xmonad";
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
}
