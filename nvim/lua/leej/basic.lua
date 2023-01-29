vim.o.nocompatible = true
vim.o.mouse = 'a'
vim.o.history = 700
vim.o.hlsearch = true
vim.o.nowrap = true
vim.o.showmode = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
-- vim.o.cpo = vim.o.cpo + '$'
-- vim.o.shortmess = vim.o.shortmess + 'c'
vim.o.updatetime = 50
vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

vim.o.completeopt = 'menuone,noselect'
vim.wo.signcolumn = 'no'

vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.cmd [[set noswapfile]]
vim.cmd [[set laststatus=3]]

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
-- airline color and buffer tap fix
-- vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"
