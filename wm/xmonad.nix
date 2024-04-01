{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "de";
      displayManager.defaultSession = "none+xmonad";
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
}
