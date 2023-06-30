{ pkgs, ... }:

{
  services.status-notifier-watcher.enable = true;
  services.picom = {
    enable = true;
    activeOpacity = 0.95;
    inactiveOpacity = 0.9;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    opacityRules = [
      "100:class_g =  'jetbrains-idea-ce'"
      "100:class_g =  'factorio'"
      "100:class_g =  '.openttd-wrapped'"
    ];
    shadow = true;
    extraArgs = [
      "--corner-radius 32"
      "--blur-method \"dual_kawase\""
      "--blur-strength 10"
    ];
  };
}
