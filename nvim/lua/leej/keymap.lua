vim.api.nvim_set_keymap( "n", "<leader>ev", ":edit $MYVIMRC<cr>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>et", ":edit $HOME/.tmux.conf<cr>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>sv", ":source $MYVIMRC<cr>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader><cr>", ":noh<cr>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>N", ":bn<cr>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>P", ":bp<cr>", { noremap = true })

vim.api.nvim_set_keymap( "n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", { noremap = true })

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- useful remap from Primeagen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Moving cursor through multiple windows
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
-- Display the current file with the full path
vim.api.nvim_set_keymap( "n", "<leader>F", "1<C-g>", { desc = 'display current buffer [F]ull path' })
