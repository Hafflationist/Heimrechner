{isMinimal}: let
  more = {pkgs, ...}: {
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
in [
  ./btop
  # ./eww
  ./discord
  ./firefox
  ./git
  ./hyprland
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
  ./waybar
  ./weechat
  (xmonadFunc {isMinimal = isMinimal;})
  ./zathura
  ./zsh
  #more
]
