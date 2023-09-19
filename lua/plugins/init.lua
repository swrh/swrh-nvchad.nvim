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
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = function()
      return require('plugins.configs.treesitter')
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
    opts = function()
      return require('plugins.configs.mason')
    end,
    config = function(_, opts)
      require('mason').setup(opts)

      vim.api.nvim_create_user_command('MasonInstallAll', function()
        vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      require('plugins.configs.lspconfig')
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    lazy = false,
    opts = function()
      return require('plugins.configs.null-ls')
    end,
    config = function(_, opts)
      require('null-ls').setup(opts)
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
  },

  {
    'ggandor/leap.nvim',
    keys = { 'gt', 'gh', 'gl' },
  },

  {
    'folke/which-key.nvim',
    keys = { '<Leader>', '<C-r>', '"', "'", '`', 'c', 'v', 'g' },
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
