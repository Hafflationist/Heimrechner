{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
    wl-clipboard
    tesseract
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        gaps_out = "16";
        gaps_in = "16";
      };
      decoration = {
        rounding = 32;
        shadow_range = 8;
        blur = {
          size = 16;
          passes = 2;
        };
      };
      windowrulev2 = [
        "float, class:(Rofi)"
        "stayfocused, class:(Rofi)"
        "bordersize 0, class:(Rofi)"
        "dimaround 1, class:(Rofi)"
      ];
      layerrule = [
        "blur,waybar"
      ];
      "$mod" = "SUPER";
      input = {
        kb_layout = "de";
      };
      bind =
        [
          "$mod, O, exec, rofi -no-lazy-grab -show combi -modi combi,drun,window -combi-modes \"window,drun\" -theme /etc/nixos/users/mrobohm/programs/rofi/launcher/style -drun-icon-theme \"candy-icons\""
          "$mod, V, exec, rofi -modi \"Zwischenablage:greenclip print\" -show \"Zwischenablage\""
          "$mod, R, exec, rofi -show calc -modi calc -no-show-match -no-sort -calc-command \"echo -n '{result}' | wl-copy\""
          "$mod, T, exec, hyprshot --raw -m region | tesseract - - | wl-copy"
          "$mod, Q, killactive"
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"
          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, J, movewindow, d"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, L, movewindow, r"
          "$mod, RETURN, exec, kitty"
          "$mod, F, fullscreen"
          "$mod, P, exec, hyprshot -m region"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
              ]
            )
            10)
        );
      exec = [ "hyprpaper" "waybar" ];
    };
    extraConfig = ''
        general {
          col.inactive_border = 0x00000000;
          col.active_border = 0x80ffffff;
        }
    '';
  };
}
