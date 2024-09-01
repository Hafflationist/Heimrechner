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
      }

      window {
        border-radius: 12px;
        margin: 1px 8px;
      }

      * {
        font-family: "FiraMono Nerd Font";
        background: rgba(255, 255, 255, 0.1);
        font-size: 18px;
        margin: 1px 8px;
        padding: 1px 8px;
        border-radius: 12px;
      }

      #workspaces * {
        background: transparent;
        margin: 4px;
        padding: 1px 4px;
        border-radius: 16px;
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
    '';
    settings = [{
      height = 48;
      layer = "top";
      position = "top";
      margin = "8";
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
