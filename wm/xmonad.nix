{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.defaultSession = "none+xmonad";
    xserver = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
      displayManager.lightdm = {
        enable = true;
        greeters.pantheon.enable = true;
      };
      serverFlagsSection = ''
        Option "StandbyTime" "0"
        Option "SuspendTime" "0"
        Option "OffTime" "0"
        Option "BlankTime" "0"
      '';
      xkb.layout = "de";
      xkb.variant = "";
    };
  };
}
