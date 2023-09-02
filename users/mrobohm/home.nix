{ isMinimal }:
{ pkgs, ... }:
{
    home.username = "mrobohm";
    #home.homeDirectory = /home/mrobohm;
    home.stateVersion = "22.11";
    home.packages = with pkgs; [
      zsh-powerlevel10k
      brave

      # Normalfag-Programme
      discord betterdiscordctl spotify tdesktop whatsapp-for-linux
      steam

      # Libreoffice
      libreoffice-qt
      hunspell
      hunspellDicts.de_DE

      # Desktopumgebung
      libsForQt5.dolphin
      killall bitwarden
      feh viu
      flameshot
      xsel      # benötigt für ocr
      tesseract # benötigt für ocr
      betterlockscreen

      # Grafikprogramme
      gimp inkscape

      # Reiszeug
      neofetch cbonsai htop btop
      nix-output-monitor
      glxinfo

      # Entwicklung
      #unstable.jetbrains.idea-community maven unstable.jdk gcc12
      jetbrains.idea-community maven jdk gcc12
      cabal-install stack haskell-language-server
      lua-language-server
      nil
      mycli
      ghc # wird auch von neovim benötigt

      # Sonstiges
      tree element-desktop _2048-in-terminal
      ripgrep # genutzt von Neovim-Telescope
      openttd
    ];
    xdg.mimeApps.enable = true;
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
      "application/pdf" = "org.pwmt.zathura.desktop";
      "application/html" = "librewolf.desktop";
      "x-www-browser" = "librewolf.desktop";
      "x-scheme-handler/webcal" = "librewolf.desktop";
    };
    programs.home-manager = {
      enable = true;
    };
    nixpkgs.config.allowUnfree = true;
    imports = builtins.concatLists (builtins.map (modules: modules { isMinimal = isMinimal; }) (builtins.map import [
      ./programs
      ./services
      ./misc
    ]));
  }
