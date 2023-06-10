{ pkgs, ... }:

{
  home.packages = [ pkgs.dconf ];
  gtk = {
    enable = true;
    theme = {
      name = "Sweet-Dark";
      package = pkgs.sweet;
    };
  };
}
