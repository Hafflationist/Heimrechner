{pkgs, ...}: {
  services.clipse = {
    enable = true;
    imageDisplay.type = "kitty";
  };
}
