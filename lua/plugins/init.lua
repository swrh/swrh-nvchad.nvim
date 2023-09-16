local config = {
  defaults = { lazy = true },
}

local plugins = {
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

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = '0.1.x',
    cmd = 'Telescope',
    init = function()
      require('core.utils').load_mappings('telescope')
    end,
    opts = function()
      return require('plugins.configs.telescope')
    end,
  }
}

require('lazy').setup(plugins, config)
