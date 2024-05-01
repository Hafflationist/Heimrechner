{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.defaultSession = "none+xmonad";
    xserver = {
      enable = true;
      xkb.layout = "de";
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
}
