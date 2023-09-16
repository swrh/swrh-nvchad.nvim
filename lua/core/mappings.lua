-- n, v, i, t = mode names

local M = {}

local opts

M.general = {
  i = {
    -- navigate within insert mode
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-l>'] = { '<Right>', 'Move right' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },

    ['jk'] = { '<ESC>', 'Escape insert mode', opts = { nowait = true } },
  },

  n = {
    -- switch between windows
    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<C-j>'] = { '<C-w>j', 'Window down' },
    ['<C-k>'] = { '<C-w>k', 'Window up' },

    -- create windows
    ['<C-\\>'] = { '<Cmd>split<CR>', 'Create a horizontal window' },
    ['<C-|>'] = { '<Cmd>vsplit<CR>', 'Create a vertical window' },

    -- resize windows
    ['<C-=>'] = { '<C-w>=', 'Make all windows (almost) equally high and wide' },
    ['<C-_>'] = { '<C-w>-', 'Decrease current window height' },
    ['<C-+>'] = { '<C-w>+', 'Increase current window height' },
    ['<C-<>'] = { '<C-w><', 'Decrease current window width' },
    ['<C->>'] = { '<C-w>>', 'Increase current window width' },
    ['<C-q>'] = { '<Cmd>q<CR>', 'Quit' },

    -- toggling
    ['<Leader>tl'] = { '<Cmd>set list!<CR>', 'Toggle list' },
    ['<Leader>tp'] = { '<Cmd>set paste!<CR>', 'Toggle paste' },
    ['<Leader>ts'] = { '<Cmd>set spell!<CR>', 'Toggle spell' },

    -- quicklist
    ['<C-n>'] = { '<Cmd>cnext<CR>', 'QuickList next' },
    ['<C-p>'] = { '<Cmd>cprevious<CR>', 'QuickList previous' },
  },

  t = {
    ['<C-x>'] = { vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), 'Escape terminal mode' },
  },

  x = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', 'Don\'t copy replaced text', opts = { silent = true } },
  },
}

return M