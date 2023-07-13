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
in
[
  ./git
  ./kitty
  ./librewolf
  ./neofetch
  ./neovim
  ./ranger
  ./rofi
  ./taffybar
  ./weechat
  ./xmonad
  ./zathura
  ./zsh
  #more
]
