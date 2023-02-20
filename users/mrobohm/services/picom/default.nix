{
  services.picom = {
    enable = true;
    activeOpacity = 1.0;
    inactiveOpacity = 0.8;
    #backend = "glx";
    fade = true;
    fadeDelta = 5;
    opacityRules = [];
    shadow = false;
    settings = {
      blur = {
        method = "kawase";
        size = 32;
        deviation = 5.0;
      };
    };
  };
}
