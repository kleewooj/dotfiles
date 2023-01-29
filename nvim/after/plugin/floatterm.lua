-- floaterm setting
vim.g.floaterm_position = 'bottom' 
vim.cmd [[let g:floaterm_width=1.0]]
vim.cmd [[let g:floaterm_height=0.4]]
vim.api.nvim_set_keymap( "t", "<ESC>", "<C-\\><C-n>", { desc = 'set to normal mode from terminal mode' })
-- vim.api.nvim_set_keymap( "n", "<leader>fc", ":FloatermNew --height=0.4 --width=1.0<cr>", { desc = '[F]loatingterm [C]reate' })
vim.api.nvim_set_keymap( "n", "<leader>fc", ":FloatermNew<cr>", { desc = '[F]loatingterm [C]reate' })
vim.api.nvim_set_keymap( "n", "<leader>ft", ":FloatermToggle<cr>", { desc = '[F]loatingterm [T]oggle' })
vim.api.nvim_set_keymap( "n", "<leader>fn", ":FloatermNext<cr>", { desc = '[F]loatingterm [N]ext' })
vim.api.nvim_set_keymap( "n", "<leader>fp", ":FloatermPrev<cr>", { desc = '[F]loatingterm [P]revious' })
-- notetaking
vim.api.nvim_set_keymap( "n", "<leader>nt", ":FloatermNew! notes all<cr>", { desc = '[N]ote[T]aking' })
