-- my own configuration
-- delete all opened buffer execpt for the buffer I am in
vim.api.nvim_set_keymap( "n", "<leader>bd", ":%bd|e#|bd#<cr>", { noremap = true })
-- user command for compiling note
-- vim.api.nvim_add_user_command('Notes', 'notes all', { nargs = 1 })
