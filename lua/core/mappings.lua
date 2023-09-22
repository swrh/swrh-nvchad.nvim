-- n, v, i, t = mode names

local M = {}

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

    -- shortcuts
    ['<Leader>ww'] = { '<Cmd>wa<CR>', ':wa' },
    ['<Leader>wq'] = { '<Cmd>wqa<CR>', ':wqa' },
  },

  t = {
    ['<C-x>'] = { vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true), 'Escape terminal mode' },
  },

  v = {
    -- move
    ['<M-k>'] = { ":move '<-2<CR>gv=gv", 'Move line up' },
    ['<M-j>'] = { ":move '>+1<CR>gv=gv", 'Move line down' },

    -- filters
    ['<Leader>xs'] = { '!sort<CR>gv', 'sort' },
    ['<Leader>xu'] = { '!uniq<CR>gv', 'uniq' },
  },

  x = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ['p'] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Don't copy replaced text", opts = { silent = true } },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation
    [']c'] = {
      function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          require('gitsigns').next_hunk()
        end)
        return '<Ignore>'
      end,
      'Jump to next hunk',
      opts = { expr = true },
    },

    ['[c'] = {
      function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          require('gitsigns').prev_hunk()
        end)
        return '<Ignore>'
      end,
      'Jump to prev hunk',
      opts = { expr = true },
    },

    -- Actions
    ['<Leader>hs'] = {
      function()
        require('gitsigns').stage_hunk()
      end,
      'Git stage hunk',
    },

    ['<Leader>hr'] = {
      function()
        require('gitsigns').reset_hunk()
      end,
      'Git reset hunk',
    },

    ['<Leader>hp'] = {
      function()
        require('gitsigns').preview_hunk()
      end,
      'Git preview hunk',
    },

    ['<Leader>hu'] = {
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      'Git undo stage hunk',
    },

    ['<Leader>hR'] = {
      function()
        require('gitsigns').reset_buffer()
      end,
      'Git reset buffer',
    },

    ['<Leader>hS'] = {
      function()
        require('gitsigns').stage_buffer()
      end,
      'Git stage buffer',
    },

    ['<Leader>hd'] = {
      function()
        require('gitsigns').diffthis()
      end,
      'Git diff .',
    },

    ['<Leader>hD'] = {
      function()
        require('gitsigns').diffthis('~')
      end,
      'Git diff ~',
    },

    ['<Leader>hb'] = {
      function()
        require('gitsigns').blame_line()
      end,
      'Git blame line',
    },

    ['<Leader>hB'] = {
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      'Git blame line full',
    },

    ['<Leader>td'] = {
      function()
        require('gitsigns').toggle_deleted()
      end,
      'Toggle Git deleted',
    },

    ['<Leader>tb'] = {
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      'Toggle Git blame',
    },
  },

  v = {
    ['<Leader>hs'] = {
      function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      'Git stage hunk',
    },

    ['<Leader>hr'] = {
      function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      'Git reset hunk',
    },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ['<Leader>wk'] = { '<Cmd>WhichKey<CR>', 'Which-key all keymaps' },
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

    ['<Leader>ls'] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      'LSP signature help',
    },

    ['<Leader>D'] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      'LSP definition type',
    },

    ['<Leader>ca'] = {
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

    ['<Leader>fd'] = {
      function()
        vim.diagnostic.open_float({ border = 'rounded' })
      end,
      'Floating diagnostic',
    },

    ['<Leader>fm'] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      'LSP formatting',
    },

    ['[d'] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = 'rounded' } })
      end,
      'Goto prev',
    },

    [']d'] = {
      function()
        vim.diagnostic.goto_next({ float = { border = 'rounded' } })
      end,
      'Goto next',
    },

    ['<Leader>q'] = {
      function()
        vim.diagnostic.setloclist()
      end,
      'Diagnostic setloclist',
    },

    ['<Leader>wa'] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      'Add workspace folder',
    },

    ['<Leader>wr'] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      'Remove workspace folder',
    },

    ['<Leader>wl'] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      'List workspace folders',
    },
  },

  v = {
    ['<Leader>ca'] = {
      function()
        vim.lsp.buf.code_action()
      end,
      'LSP code action',
    },
  },
}

M.comment = {
  plugin = true,

  n = {
    ['<leader>/'] = {
      function()
        require('Comment.api').toggle.linewise.current()
      end,
      'Toggle comment',
    },
  },

  v = {
    ['<leader>/'] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      'Toggle comment',
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ['<Leader>ff'] = { '<Cmd>Telescope find_files<CR>', 'Find files' },
    ['<Leader>fa'] = { '<Cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', 'Find all' },
    ['<Leader>fw'] = { '<Cmd>Telescope live_grep<CR>', 'Live grep' },
    ['<Leader>fb'] = { '<Cmd>Telescope buffers<CR>', 'Find buffers' },
    ['<Leader>fh'] = { '<Cmd>Telescope help_tags<CR>', 'Help page' },
    ['<Leader>fo'] = { '<Cmd>Telescope oldfiles<CR>', 'Find oldfiles' },
    ['<Leader>fz'] = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'Find in current buffer' },
    ['<Leader>fk'] = { '<Cmd>Telescope marks<CR>', 'Find bookmarks' },

    -- git
    ['<Leader>gc'] = { '<Cmd>Telescope git_commits<CR>', 'Git commits' },
    ['<Leader>gs'] = { '<Cmd>Telescope git_status<CR>', 'Git status' },
  },
}

M.leap_nvim = {
  n = {
    ['gl'] = {
      function()
        local target_windows = require('leap.util').get_enterable_windows()
        table.insert(target_windows, vim.fn.win_getid())
        require('leap').leap({ target_windows = target_windows })
      end,
      'Leap to',
    },
  },

  v = {
    ['gh'] = { '<Plug>(leap-backward-to)', 'Leap backward to' },
    ['gl'] = { '<Plug>(leap-forward-to)', 'Leap forward to' },
  },
}

M.undotree = {
  n = {
    ['<Leader>tu'] = { '<Cmd>UndotreeToggle<CR>', 'Toggle undotree' },
  },
}

return M
