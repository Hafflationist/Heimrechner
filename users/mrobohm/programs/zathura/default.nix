{ config, pkgs, home-manager, inputs, ... }:
{
  programs.zathura = {
    enable = true;
    options = { 
    #  font = config.fonts.defaultFont.serif.font;
      window-title-basename = true;
      statusbar-home-tilde = true;
      # To hide statusbar (use ctrl+n to show it)
      guioptions = "none";
    };
    extraConfig = "
      set recolor true
      set recolor-lightcolor \#1a1d2b
      set recolor-lightcolor rgba(26,29,43,0) 
      set default-bg rgba(26,29,43,0.75)
      set recolor-keephue
      set selection-clipboard clipboard";
    #  builtins.readFile (config.scheme { templateRepo = inputs.base16-zathura; target = "recolor"; })
    #  +
    #  # TODO: replace hardcoded /home/sencho/downloads
    #  # And save to downloads/pdf
    #  ''
    #    map @ exec "cp $FILE /home/sencho/downloads"
    #  ''
    #  # (builtins.trace home-manager.users.sencho.xdg.userDirs.download ''
    #  #   map @ exec "cp $FILE ${home-manager.users.sencho.xdg.userDirs.download}"
    #  # '')
    #;
  };
}
