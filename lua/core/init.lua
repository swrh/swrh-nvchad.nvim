-- lua/core/init.lua

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.mouse = 'a'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.ruler = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autowrite = true
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = 'tab:>.,trail:.,eol:$'

vim.g.mapleader = ' '

-- add binaries installed by mason.nvim to path
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin' .. ':' .. vim.env.PATH
