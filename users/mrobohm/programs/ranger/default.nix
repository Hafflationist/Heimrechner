{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ranger
    file # Dateityperkennung
    w3m
    highlight
  ];
  xdg.configFile."ranger/rc.conf".source = ./rc.conf;
  xdg.configFile."ranger/rifle.conf".source = ./rifle.conf;
}
