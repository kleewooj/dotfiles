-- NERDTree setting
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeDirArrowExpandable = '>'
vim.g.NERDTreeDirArrowCollapsible = '+'

vim.api.nvim_set_keymap( "n", "<leader>nf", ":NERDTreeCWD<cr>", { desc = '[N]erdtree [F]ile' })
vim.api.nvim_set_keymap( "n", "<leader>nb", ":NERDTreeToggle %<cr>", { desc = '[N]erdtree [B]uffer' })
vim.api.nvim_set_keymap( "n", "<leader>>", "<C-w>10>", { desc = 'Nerdtree Expand Window 10 right' })
vim.api.nvim_set_keymap( "n", "<leader><", "<C-w>10<", { desc = 'Nerdtree Expand Window 10 left' })
