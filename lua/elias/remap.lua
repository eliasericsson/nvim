vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Open Netrw file explorer" })
vim.keymap.set("n", "<leader>pv", function()
    if not pcall(vim.cmd.Rexplore) then
        vim.cmd("Explore")
    end
end, { desc = "Open Netrw file explorer" })

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

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add executable permission to file
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("i", "jj", "<Esc>")

-- Undotree keymaps
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- Trouble keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", { silent = true, noremap = true })

-- Todo comments keymaps
vim.keymap.set("n", "<leader>tc", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTrouble<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tl", "<cmd>TodoLocList<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tn", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>tp", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Black keymaps
vim.keymap.set("n", "<leader>bb", "<cmd>!black %<cr>", { silent = true, noremap = true })

-- No neck pain keymaps
vim.keymap.set("n", "<leader>z", "<cmd>lua require('no-neck-pain').toggle()<cr>", { silent = true, noremap = true })

-- Faster fugitive
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nc', ']c', { noremap = true, silent = true })            -- Find next conflict
vim.api.nvim_set_keymap('n', '<leader>pc', '[c', { noremap = true, silent = true })            -- Find previous conflict
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true }) -- Push
vim.api.nvim_set_keymap('n', '<leader>gP', ':Git pull<CR>', { noremap = true, silent = true }) -- Pull

-- Octo keymaps
vim.keymap.set("n", "<leader>prl", "<cmd>Octo pr list<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>prc", "<cmd>Octo pr create<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>prv", "<cmd>Octo pr view<cr>", { silent = true, noremap = true })

-- DBUI keymaps
vim.keymap.set("n", "<leader>dad", "<cmd>DBUIToggle<cr>", { silent = true, noremap = true })

-- Commment box keymaps
vim.keymap.set("n", "<leader>bx", function()
    -- Uppercase current line
    vim.cmd("normal! gUU")
    -- Run :CBlcbox
    vim.cmd("CBlcbox")
    -- Select current and previous two lines
    vim.cmd("normal! Vkk")
    -- Prepend // to the selected lines
    vim.cmd("normal! \\<C-v>kI// <Esc>")
end, { silent = true, noremap = true })
