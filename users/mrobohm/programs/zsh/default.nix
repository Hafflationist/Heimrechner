{ pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    envExtra = "unset SSH_ASKPASS";
    history = {
      ignoreDups = true;
    };
    shellAliases = {
      recompile = "sudo nixos-rebuild switch";
      rebuild = "sudo nixos-rebuild switch --flake '/etc/nixos#heimrechner'";
      conf = "cd /etc/nixos";
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
  };
}
