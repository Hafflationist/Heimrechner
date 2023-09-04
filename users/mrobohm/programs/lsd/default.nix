{ pkgs, lib, ... }:

{
  programs.lsd = {
    enable = true;
    enableAliases = true;
    settings = {
      date = "+%Y-%m-%d %H:%M:%S";
    };
  };
}
