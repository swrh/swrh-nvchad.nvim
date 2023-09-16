local config = {
  defaults = { lazy = true },
}

local plugins = {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },

  {
    'folke/which-key.nvim',
    keys = { '<Leader>', '<C-r>', '"', '\'', '`', 'c', 'v', 'g' },
    init = function()
      require('core.utils').load_mappings('whichkey')
    end,
    cmd = 'WhichKey',
    config = function(_, opts)
      require('which-key').setup(opts)
    end,
  },
}

require('lazy').setup(plugins, config)
