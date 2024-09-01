
{ lib, pkgs, inputs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  programs.regreet = {
    enable = true;
    package = pkgs.greetd.regreet;
  };
}
