local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find project files" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Grep string" })
vim.keymap.set('n', '<leader>pf', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fd', "<cmd>Telescope find_files find_command=fd,-t=d<CR>",
    { desc = "Find directory in project" })
