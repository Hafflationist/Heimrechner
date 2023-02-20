{ pkgs, config, lib, stdenv, ... }:
  {
    home.username = "mrobohm";
    #home.homeDirectory = /home/mrobohm;
    home.stateVersion = "22.11";
    home.packages = with pkgs; [
      zsh-powerlevel10k
      librewolf
      brave
      # Normalfag-Programme
      discord spotify tdesktop
      # Desktopumgebung
      zathura killall bitwarden
      feh viu
      # Reiszeug
      neofetch cbonsai htop bpytop
      glxinfo
    ];
    programs.home-manager = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    imports = builtins.concatMap import [
      ./programs
      ./services
    ];
  }
