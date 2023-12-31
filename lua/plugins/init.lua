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
    init = function()
      require('core.utils').lazy_load('nvim-treesitter')
    end,
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    opts = function()
      return require('plugins.configs.treesitter')
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    ft = { 'gitcommit', 'diff' },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ 'BufRead' }, {
        group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
        callback = function()
          vim.fn.system('git -C ' .. '"' .. vim.fn.expand('%:p:h') .. '"' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
            vim.schedule(function()
              require('lazy').load({ plugins = { 'gitsigns.nvim' } })
            end)
          end
        end,
      })
    end,
    opts = function()
      return {
        on_attach = function(bufnr)
          require('core.utils').load_mappings('gitsigns', { buffer = bufnr })
        end,
      }
    end,
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end,
  },

  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
    opts = function()
      return require('plugins.configs.mason')
    end,
    config = function(_, opts)
      require('mason').setup(opts)
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = function()
      require('plugins.configs.lspconfig')
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    opts = function()
      return require('plugins.configs.null-ls')
    end,
    config = function(_, opts)
      require('null-ls').setup(opts)
    end,
  },

  {
    'numToStr/Comment.nvim',
    init = function()
      require('core.utils').load_mappings('comment')
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
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
  },

  {
    'kevinhwang91/nvim-bqf',
    event = 'VeryLazy',
  },

  {
    'ggandor/leap.nvim',
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
