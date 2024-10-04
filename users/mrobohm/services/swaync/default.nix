{ pkgs, ... }:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "center";
      positionY = "top";
      notification-inline-replies = true;
      notification-icon-size = 64;
      notification-window-width = 768;
    };
    style = ./style.css;
  };
}
