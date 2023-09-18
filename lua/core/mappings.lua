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
    ['<C-_>'] = { '<C-w>-', 'Decrease current window height' },
    ['<C-=>'] = { '<C-w>+', 'Increase current window height' },
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

    -- move
    ['<M-k>'] = { '<Cmd>move -2<CR>', 'Move line up' },
    ['<M-j>'] = { '<Cmd>move +1<CR>', 'Move line down' },
  },

  t = {
    ['<C-x>'] = { vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), 'Escape terminal mode' },
  },

  v = {
    -- move
    ['<M-k>'] = { ":move '<-2<CR>gv=gv", 'Move line up' },
    ['<M-j>'] = { ":move '>+1<CR>gv=gv", 'Move line down' },
  },

  x = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', 'Don\'t copy replaced text', opts = { silent = true } },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ['<leader>wk'] = {
      function()
        vim.cmd 'WhichKey'
      end,
      'Which-key all keymaps',
    },
  },
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ['gD'] = {
      function()
        vim.lsp.buf.declaration()
      end,
      'LSP declaration',
    },

    ['gd'] = {
      function()
        vim.lsp.buf.definition()
      end,
      'LSP definition',
    },

    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      'LSP hover',
    },

    ['gi'] = {
      function()
        vim.lsp.buf.implementation()
      end,
      'LSP implementation',
    },

    ['<leader>ls'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      'LSP signature help',
    },

    ['<leader>D'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      'LSP definition type',
    },

    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      'LSP code action',
    },

    ['gr'] = {
      function()
        vim.lsp.buf.references()
      end,
      'LSP references',
    },

    ['<leader>f'] = {
      function()
        vim.diagnostic.open_float { border = 'rounded' }
      end,
      'Floating diagnostic',
    },

    ['[d'] = {
      function()
        vim.diagnostic.goto_prev { float = { border = 'rounded' } }
      end,
      'Goto prev',
    },

    [']d'] = {
      function()
        vim.diagnostic.goto_next { float = { border = 'rounded' } }
      end,
      'Goto next',
    },

    ['<leader>q'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      'Diagnostic setloclist',
    },

    ['<leader>wa'] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      'Add workspace folder',
    },

    ['<leader>wr'] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      'Remove workspace folder',
    },

    ['<leader>wl'] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      'List workspace folders',
    },
  },

  v = {
    ['<leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      'LSP code action',
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ['<leader>ff'] = { '<cmd> Telescope find_files <CR>', 'Find files' },
    ['<leader>fa'] = { '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', 'Find all' },
    ['<leader>fw'] = { '<cmd> Telescope live_grep <CR>', 'Live grep' },
    ['<leader>fb'] = { '<cmd> Telescope buffers <CR>', 'Find buffers' },
    ['<leader>fh'] = { '<cmd> Telescope help_tags <CR>', 'Help page' },
    ['<leader>fo'] = { '<cmd> Telescope oldfiles <CR>', 'Find oldfiles' },
    ['<leader>fz'] = { '<cmd> Telescope current_buffer_fuzzy_find <CR>', 'Find in current buffer' },

    -- git
    ['<leader>cm'] = { '<cmd> Telescope git_commits <CR>', 'Git commits' },
    ['<leader>gt'] = { '<cmd> Telescope git_status <CR>', 'Git status' },

    -- pick a hidden term
    ['<leader>pt'] = { '<cmd> Telescope terms <CR>', 'Pick hidden term' },

    ['<leader>ma'] = { '<cmd> Telescope marks <CR>', 'telescope bookmarks' },
  },
}

return M
