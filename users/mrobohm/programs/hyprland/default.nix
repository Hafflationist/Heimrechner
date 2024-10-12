{ pkgs, ... }:

let german-hyprshot = pkgs.hyprshot.overrideAttrs (prev: {

      src = pkgs.fetchFromGitHub {
          owner = "Hafflationist";
          repo = "hyprshot";
          rev = "10f057106c19dcf32a53fcd498517446ef800a81";
          hash = "sha256-Q9a5AHJawsF8vP7xMzVjA2K/N8Y+3svI/VDE1AaFxv4=";
        };
    });
in
{
  home.packages = with pkgs; [
    german-hyprshot
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
        drop_shadow = false;
        blur = {
          size = 16;
          passes = 3;
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
        "blur,swaync-control-center"
        "blur,swaync-notification-window"
        "ignorezero,swaync-notification-window"
        "ignorealpha 0.09,swaync-notification-window"
        "ignorezero,waybar"
      ];
      "$mod" = "SUPER";
      input = {
        kb_layout = "de";
      };
      bindm = [
          "$mod, mouse:272, movewindow"
      ];
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
          "$mod SHIFT, F, togglefloating"
          "$mod, P, exec, hyprshot -m region"
          "$mod, N, exec, swaync-client -t"
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
      exec-once = [
        "hyprctl setcursor graphite-dark 24"
      ];
      plugins = {
        hyprtrails = {
          color = "#80c50ed2";
        };
      };
    };
    extraConfig = ''
        general {
          col.inactive_border = 0x00000000;
          col.active_border = 0x80ffffff;
        }
    '';
  };
}
