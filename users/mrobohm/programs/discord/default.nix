{ pkgs, ... }:

{
  home.file = {
    ".config/BetterDiscord/themes/translucence-plus.css" = {
      source = ./blur-theme.css;
    };
  };
  home.packages = with pkgs; [
    discord
    betterdiscordctl
  ];
}
