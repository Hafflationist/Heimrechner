{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      #"privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "privacy.clearOnShutdown.history" = false;
      "network.cookie.lifetimePolicy" = 0;
      #"webgl.disabled" = false;
    };
  };
}
