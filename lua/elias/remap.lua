vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>W", "<cmd>wq<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("i", "jj", "<Esc>")

-- Undotree keymaps
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- Trouble keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", { silent = true, noremap = true })

-- Black keymaps
vim.keymap.set("n", "<leader>bb", "<cmd>!black %<cr>", { silent = true, noremap = true })

-- No neck pain keymaps
vim.keymap.set("n", "<leader>z", "<cmd>lua require('no-neck-pain').toggle()<cr>", { silent = true, noremap = true })

-- Faster fugitive
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nc', ']c', { noremap = true, silent = true }) -- Find next conflict
vim.api.nvim_set_keymap('n', '<leader>pc', '[c', { noremap = true, silent = true }) -- Find previous conflict

-- DBUI keymaps
vim.keymap.set("n", "<leader>dad", "<cmd>DBUIToggle<cr>", { silent = true, noremap = true })
