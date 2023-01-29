-- harpoon setup
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>aa", mark.add_file,{desc = 'Harpoon add file to the list' })
vim.keymap.set("n", "<leader>tt", ui.toggle_quick_menu,{desc = 'Harpoon toggle menu' })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end,{desc = 'Harpoon 1st nav_file' })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end,{desc = 'Harpoon 2st nav_file' })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end,{desc = 'Harpoon 3st nav_file' })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end,{desc = 'Harpoon 4st nav_file' })
