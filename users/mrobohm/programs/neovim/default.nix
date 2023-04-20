{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = "set number";
    plugins =  with pkgs.vimPlugins; [
      { plugin = context-vim; config = "let g:context_highlight_normal = 'Normal'";}
      fugitive
      nvim-notify
      { plugin = nvim-tree-lua; type = "lua"; config = builtins.readFile(./pluginConfig/tree-lua.lua); }
      vim-nix
      { plugin = vim-airline; config = "let g:airline_powerline_fonts = 1";}
      YouCompleteMe
      { plugin = vim-startify; config = "let g:startify_change_to_vcs_root = 0";}
    ];
  };
}
