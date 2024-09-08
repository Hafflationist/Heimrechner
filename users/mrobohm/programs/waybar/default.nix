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
        background: transparent;
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

      #temperature {
        margin-top: 8px;
        margin-left: 8px;
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #cpu {
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
        margin-bottom: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }

      #clock {
        margin-top: 8px;
        margin-left: 8px;
        margin-bottom: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 26px;
        transition: none;
        background: rgba(13, 13, 27, 0.25);
      }
    '';
    settings = [{
      height = 48;
      layer = "top";
      position = "top";
      margin = "16";
      tray = { spacing = 10; };
      modules-center = [ "hyprland/window" ];
      modules-left = [ "hyprland/workspaces" ];
      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "clock"
        "tray"
      ];
      "hyprland/workspaces" = { 
        active-only = false;
        persistent-workspaces = {
          "*" = 5;
        };
      };
      clock = {
        format = "{:%Y-%m-%d %H:%M:%S}";
        tooltip-format = "{:%Y-%m-%d %H:%M:%S}";
        interval = 1;
      };
      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };
      memory = { format = "{}% "; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
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
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
    }];
  };
}
