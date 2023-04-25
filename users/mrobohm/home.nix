{ pkgs, config, lib, stdenv, ... }:
let
  unstable = import <unstable> { config = { allowUnfree = true; }; };
in {
    home.username = "mrobohm";
    #home.homeDirectory = /home/mrobohm;
    home.stateVersion = "22.11";
    home.packages = with pkgs; [
      zsh-powerlevel10k
      librewolf
      brave
      # Normalfag-Programme
      discord betterdiscordctl spotify tdesktop whatsapp-for-linux
      # Desktopumgebung
      killall bitwarden
      feh viu
      flameshot
      betterlockscreen
      # Reiszeug
      neofetch cbonsai htop bpytop
      glxinfo
      # Entwicklung
      unstable.jetbrains.idea-community maven unstable.jdk gcc12
    ];
    xdg.mimeApps.defaultApplications = {
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
      "x-scheme-handler/chrome" = "librewolf.desktop";
      "text/html" = "librewolf.desktop";
      "application/x-extension-htm" = "librewolf.desktop";
      "application/x-extension-html" = "librewolf.desktop";
      "application/x-extension-shtml" = "librewolf.desktop";
      "application/xhtml+xml" = "librewolf.desktop";
      "application/x-extension-xhtml" = "librewolf.desktop";
      "application/x-extension-xht" = "librewolf.desktop";
      "application/x-www-browser" = "librewolf.desktop";
      "x-www-browser" = "librewolf.desktop";
      "x-scheme-handler/webcal" = "librewolf.desktop";
    };
    programs.home-manager = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    imports = builtins.concatMap import [
      ./programs
      ./services
    ];
  }
