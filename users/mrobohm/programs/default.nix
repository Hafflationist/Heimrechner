{ isMinimal }:
let
  more = { pkgs, ... }: {
    programs = {

      gpg.enable = true;

      htop = {
        enable = true;
        settings = {
          sort_direction = true;
          sort_key = "PERCENT_CPU";
        };
      };

      ssh.enable = true;
    };
  };
  xmonadFunc = import ./xmonad;
in
[
  ./git
  ./java
  ./kitty
  ./lf
  ./librewolf
  ./lsd
  ./neofetch
  #./neovim
  ./nushell
  ./ranger
  ./rofi
  ./taffybar
  ./weechat
  (xmonadFunc { isMinimal = isMinimal; })
  ./zathura
  ./zsh
  #more
]
