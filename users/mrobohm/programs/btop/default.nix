{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      theme_backgrouns = false;
    };
  };
}
