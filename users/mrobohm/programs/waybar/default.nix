{ pkgs, ... }:

{
  home.packages = with pkgs; [
  ];
  programs.waybar = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
    
      # ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}
    style = ''

      window#waybar {
        background: rgba(13, 13, 27, 0.03125);
        border-bottom: none;
        border-radius: 32px;
      }

      window {
        border-radius: 12px;
        margin: 1px 8px;
      }

      * {
        font-family: "FiraCode";
        background: rgba(255, 255, 255, 0.0);
        font-size: 18px;
        margin: 1px 8px;
        padding: 1px 8px;
        border-radius: 12px;
      }

      .modules-left {
        background: rgba(13, 13, 27, 0.25);
        border-radius: 32px;
        margin: 2px 8px;
        padding: 1px 8px;
      }
      .modules-center {
        background: rgba(13, 13, 27, 0.25);
        border-radius: 32px;
        margin: 2px 8px;
        padding: 1px 8px;
      }

      #workspaces * {
        margin: 4px;
        padding: 1px 3px;
        border-radius: 32px;
      }
      #workspaces button {
        background: rgba(32, 32, 32, 0.5);
      }
      #workspaces button.active {
        background: rgba(197, 14, 210, 0.5);
      }
      #workspaces button.hover {
        background: rgba(0, 0, 255, 0.5);
      }

      
      #network {
        margin-top: 8px;
        margin-left: 8px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #pulseaudio {
        margin-top: 8px;
        margin-left: 8px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #memory {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 0px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px 0px 0px 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #cpu {
        margin-top: 8px;
        margin-left: 2px;
        margin-right: 2px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 0px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #temperature {
        margin-top: 8px;
        margin-left: 0px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 0px 26px 26px 0px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #clock {
        margin-top: 8px;
        margin-left: 8px;
        margin-bottom: 8px;
        margin-right: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #tray {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 0px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #tray menu {
        background: rgba(13, 13, 27, 0.25);
      }
    '';
    settings = [{
      height = 69;
      layer = "top";
      position = "top";
      margin = "16";
      tray = { spacing = 10; };
      modules-left = [
        "custom/nixos-logo"
        "hyprland/workspaces"
      ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "pulseaudio"
        "network"
        "memory"
        "cpu"
        "temperature"
        "clock"
        "tray"
      ];
      "custom/nixos-logo" = {
        format = "<span foreground=\"violet\" size=\"x-large\">  </span>";
      };
      "hyprland/workspaces" = { 
        persistent-workspaces = {
          "*" = 5;
        };
        active-only = false;
        format = "{id} {windows}";
        format-window-separator = " ";
        window-rewrite-default = "";
        window-rewrite = {
          "title<.*vim>" = "";
          "class<Spotify>" = "";
          "class<kitty>" = "";
          "class<librewolf>" = "";
          "class<discord>" = "";
          "class<.*telegram.*>" = "";
          "class<steam>" = "󰓓";
          "class<thunderbird>" = "";
          "class<Bitwarden>" = "󰟵";
          "class<libreoffice.*>" = "󰦑";
        };
      };
      clock = {
        format = "{:%Y-%m-%d %H:%M:%S}";
        tooltip-format = "{:%Y-%m-%d %H:%M:%S}";
        interval = 1;
      };
      cpu = {
        interval = 1;
        # format = "{usage}% ";
        format = "{icon}  ";
        format-icons = [
          "<span foreground=\"#00FF00\">▁</span>"
          "<span foreground=\"#22DD00\">▂</span>"
          "<span foreground=\"#44BB00\">▃</span>"
          "<span foreground=\"#779900\">▄</span>"
          "<span foreground=\"#997700\">▅</span>"
          "<span foreground=\"#BB4400\">▆</span>"
          "<span foreground=\"#DD2200\">▇</span>"
          "<span foreground=\"#FF0000\">█</span>"
        ];
        tooltip = false;
      };
      memory = { format = "{}%  "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Keine Verbindung ⚠";
        format-ethernet = "{ipaddr} 󰈀  {bandwidthUpBits}   {bandwidthDownBits}  ";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon}  {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      temperature = {
        hwmon-path = "/sys/devices/pci0000:00/0000:00:03.1/0000:06:00.0/0000:07:00.0/0000:08:00.0/hwmon/hwmon4/temp1_input";
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };
}
