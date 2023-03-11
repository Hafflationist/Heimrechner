{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    activeOpacity = 0.95;
    inactiveOpacity = 0.9;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    opacityRules = [];
    shadow = false;
    settings = {
      blur = {
        method = "dual_kawase";
        size = 32;
        deviation = 4.0;
      };
      cornerRadius = 16;
    };
    #extraOptions = ''
    #  blur-method = "dual_kawase";
    #  blur-strength = 10;
    #  corner-radius = 16;
    #  detect-client-opacity = true;
    #'';
    package = pkgs.picom.overrideAttrs(o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "ibhagwan";
        rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
        sha256 = "0iff4bwpc00xbjad0m000midslgx12aihs33mdvfckr75r114ylh";
      };
    });
  };
}
