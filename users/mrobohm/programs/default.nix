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
  ./taffybar
  ./neofetch
  ./neovim
  ./ranger
  ./rofi
  ./xmonad
  ./zathura
  ./zsh
  #more
]
