{isMinimal}: {
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  home.username = "mrobohm";
  #home.homeDirectory = /home/mrobohm;
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    zsh-powerlevel10k
    brave

    # Normalfag-Programme
    tdesktop
    steam
    thunderbird
    heroic

    # Libreoffice
    libreoffice-qt
    hunspell
    hunspellDicts.de_DE

    # Desktopumgebung
    masterpdfeditor
    killall
    bitwarden
    feh
    viu
    # flameshot
    # xsel # benötigt für ocr
    tesseract # benötigt für ocr
    betterlockscreen
    deadbeef

    # Grafikprogramme
    inkscape
    pinta

    # Reiszeug
    neofetch
    cbonsai
    htop
    nix-output-monitor
    cowsay
    bat

    # Entwicklung
    #unstable.jetbrains.idea-community maven
    jetbrains.idea-community
    maven
    gcc12
    cabal-install
    stack
    haskell-language-server
    lua-language-server
    nil
    mycli
    ghc # wird auch von neovim benötigt
    # dotnet-sdk
    cargo
    rustc

    # Sonstiges
    tree
    element-desktop
    # _2048-in-terminal
    ripgrep # genutzt von Neovim-Telescope
    # openttd
    lutris
    wineWowPackages.stable
    r2modman
    uhk-agent
    polkit
    keepassxc
  ];
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = "zen-beta.desktop";
    "x-scheme-handler/https" = "zen-beta.desktop";
    "x-scheme-handler/about" = "zen-beta.desktop";
    "x-scheme-handler/unknown" = "zen-beta.desktop";
    "x-scheme-handler/chrome" = "zen-beta.desktop";
    "text/html" = "zen-beta.desktop";
    "application/x-extension-htm" = "zen-beta.desktop";
    "application/x-extension-html" = "zen-beta.desktop";
    "application/x-extension-shtml" = "zen-beta.desktop";
    "application/xhtml+xml" = "zen-beta.desktop";
    "application/x-extension-xhtml" = "zen-beta.desktop";
    "application/x-extension-xht" = "zen-beta.desktop";
    "application/x-www-browser" = "zen-beta.desktop";
    "application/pdf" = "org.pwmt.zathura.desktop";
    "application/html" = "zen-beta.desktop";
    "x-www-browser" = "zen-beta.desktop";
    "x-scheme-handler/webcal" = "zen-beta.desktop";
  };
  programs.home-manager = {
    enable = true;
  };
  imports =
    [./stylix]
    ++ builtins.concatLists (builtins.map (modules: modules {isMinimal = isMinimal;}) (builtins.map import [
      ./programs
      ./services
      ./misc
    ]));
}
