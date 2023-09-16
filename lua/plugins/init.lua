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
}

require('lazy').setup(plugins, config)
