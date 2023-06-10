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
  ./taffybar
  ./neofetch
  ./neovim
  ./ranger
  ./rofi
  ./weechat
  ./xmonad
  ./zathura
  ./zsh
  #more
]
