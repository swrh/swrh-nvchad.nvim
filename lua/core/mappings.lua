-- n, v, i, t = mode names

local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ['<C-h>'] = { '<Left>', 'Move left' },
    ['<C-l>'] = { '<Right>', 'Move right' },
    ['<C-j>'] = { '<Down>', 'Move down' },
    ['<C-k>'] = { '<Up>', 'Move up' },
  },

  n = {
    -- switch between windows
    ['<C-h>'] = { '<C-w>h', 'Window left' },
    ['<C-l>'] = { '<C-w>l', 'Window right' },
    ['<C-j>'] = { '<C-w>j', 'Window down' },
    ['<C-k>'] = { '<C-w>k', 'Window up' },
  },

  t = {
    ['<C-x>'] = { vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), 'Escape terminal mode' },
  },

  x = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', 'Dont copy replaced text', opts = { silent = true } },
  },
}

return M
