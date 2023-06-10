{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = "
      set number
      set tabstop=4
      set shiftwidth=4
      set expandtab
    ";
    plugins =  with pkgs.vimPlugins; [
      #coc-nvim
      { plugin = context-vim; config = "let g:context_highlight_normal = 'Normal'";}
      fugitive
      { plugin = nightfox-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/nightfox-nvim.lua); }
      nui-nvim
      { plugin = nvim-lspconfig; type = "lua"; config = builtins.readFile(./pluginConfig/lspconfig.lua); }
      { plugin = nvim-navbuddy; type = "lua"; config = builtins.readFile(./pluginConfig/nvim-navbuddy.lua); }
      nvim-navic
      nvim-notify
      { plugin = nvim-peekup; type = "lua"; config = builtins.readFile(./pluginConfig/peekup.lua); }
      { plugin = nvim-tree-lua; type = "lua"; config = builtins.readFile(./pluginConfig/tree-lua.lua); }
      suda-vim
      { plugin = telescope-nvim; type= "lua"; config = builtins.readFile(./pluginConfig/telescope.lua); }
      vim-nix
      { plugin = vim-airline; config = "let g:airline_powerline_fonts = 1";}
      YouCompleteMe
      { plugin = vim-startify; config = "let g:startify_change_to_vcs_root = 0";}
    ];
  };
}
