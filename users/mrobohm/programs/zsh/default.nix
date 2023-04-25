{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    #syntaxHighlighting.enable = true;
    #autosuggestions.enable = true;
    shellAliases = {
      ll = "ls -alF";
      recompile = "sudo nixos-rebuild switch";
      conf = "cd /etc/nixos/users/mrobohm";
      schnitt = "cd /mnt/schnitt";
    };
    plugins = [ 
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "zsh-vi-mode";
        file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        src = pkgs.zsh-vi-mode;
      }
    ];
    #oh-my-zsh = {
    #  enable = true;
    #  plugins = [ "powerlevel10k" ];
    #};
  };
}
