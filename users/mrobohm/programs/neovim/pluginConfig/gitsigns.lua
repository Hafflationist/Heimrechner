require('gitsigns').setup {
    signs                        = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 300,
        ignore_whitespace = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm                         = {
        enable = false
    },
    on_attach                    = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set('n', '<space>gp', gs.prev_hunk)
        vim.keymap.set('n', '<space>gh', gs.preview_hunk)
        vim.keymap.set('n', '<space>gn', gs.next_hunk)
        vim.keymap.set('n', '<space>gs', gs.stage_hunk)
        vim.keymap.set('n', '<space>gr', gs.reset_hunk)
        vim.keymap.set('v', '<space>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        vim.keymap.set('v', '<space>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        vim.keymap.set('n', '<space>gS', gs.stage_buffer)
        vim.keymap.set('n', '<space>hu', gs.undo_stage_hunk)
        vim.keymap.set('n', '<space>gR', gs.reset_buffer)
        vim.keymap.set('n', '<space>hb', function() gs.blame_line { full = true } end)
        vim.keymap.set('n', '<space>tb', gs.toggle_current_line_blame)
        vim.keymap.set('n', '<space>hd', gs.diffthis)
        vim.keymap.set('n', '<space>hD', function() gs.diffthis('~') end)
        vim.keymap.set('n', '<space>td', gs.toggle_deleted)
    end
}
