{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs # wichtig für coc
    haskell-language-server
    rnix-lsp
  ];
  home.file.".config/nvim/coc-settings.json".source = ./pluginConfig/coc-settings.json;
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = "
      set number
      set tabstop=4
      set shiftwidth=4
      set expandtab
      nnoremap <C-c> :bp\\|bd #<CR>
    ";
    plugins =  with pkgs.vimPlugins; [
      # Die Leiste oben:
      { plugin = barbecue-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/barbecue.lua); }
      { plugin = bufferline-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/bufferline.lua); }
      { plugin = coc-java; type = "lua"; }
      { plugin = coc-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/coc.lua); }
      { plugin = context-vim; config = builtins.readFile(./pluginConfig/context.vim); }
      fugitive
      { plugin = gitsigns-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/gitsigns.lua); }
      { plugin = neoscroll-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/neoscroll.lua); }
      # Färbung
      { plugin = nightfox-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/nightfox-nvim.lua); }
      # GUI-Erneuerung
      { plugin = noice-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/noice.lua); }
      nui-nvim
      { plugin = nvim-lspconfig; type = "lua"; config = builtins.readFile(./pluginConfig/lspconfig.lua); }
      #{ plugin = nvim-navbuddy; type = "lua"; config = builtins.readFile(./pluginConfig/navbuddy.lua); }
      nvim-navic
      { plugin = nvim-notify; type = "lua"; config = builtins.readFile(./pluginConfig/notify.lua); }
      # Register (Zwischenablage)
      { plugin = nvim-peekup; type = "lua"; config = builtins.readFile(./pluginConfig/peekup.lua); }
      { plugin = nvim-scrollbar; type = "lua"; config = builtins.readFile(./pluginConfig/scrollbar.lua); }
      { plugin = nvim-tree-lua; type = "lua"; config = builtins.readFile(./pluginConfig/tree.lua); }
      nvim-treesitter.withAllGrammars
      suda-vim
      { plugin = telescope-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/telescope.lua); }
      vim-nix
      { plugin = feline-nvim; type = "lua"; config = builtins.readFile(./pluginConfig/airline.lua); }
      #YouCompleteMe
      { plugin = vim-startify; config = builtins.readFile(./pluginConfig/startify.vim); }
    ];
  };
}
