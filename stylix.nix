{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = {
      base00 = "#282828";
      base01 = "#ca1444";
      base02 = "#789aba";
      base03 = "#b3879f";
      base04 = "#c50ed2";
      base05 = "#cb6fa1";
      base06 = "#fb6e93";
      base07 = "#cf98c1";
      base08 = "#98218e";
      base09 = "#cb515d";
      base0A = "#5a87b1";
      base0B = "#9c61ab";
      base0C = "#9a77b1";
      base0D = "#f2a297";
      base0E = "#f4436f";
      base0F = "#ebdbb2";
    };
    cursor = {
      size = 24;
      package = pkgs.graphite-cursors;
      name = "graphite-dark";
    };
    image = ./users/mrobohm/services/hyprpaper/hintergrund.png;
  };
}
