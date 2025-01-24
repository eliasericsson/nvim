local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {
        -- { "folke/tokyonight.nvim",  config = function() vim.cmd("colorscheme tokyonight") end },
        { "ellisonleao/gruvbox.nvim", config = function() vim.cmd("colorscheme gruvbox") end },
        "HiPhish/rainbow-delimiters.nvim",     -- Rainbow colored parentheses
        "LudoPinelli/comment-box.nvim",        -- Comment box, a plugin to create comment boxes
        "github/copilot.vim",                  -- GitHub Copilot
        "grafana/vim-alloy",                   -- Grafana Alloy
        "lewis6991/gitsigns.nvim",             -- Gitsigns, a plugin to show git diff in the gutter
        "lukas-reineke/indent-blankline.nvim", -- Indentation guides
        "mbbill/undotree",                     -- Undotree, a visual undo history
        "nvim-lua/plenary.nvim",               -- Plenary, a utility library
        "nvim-tree/nvim-web-devicons",         -- Web Dev Icons, a plugin to show icons
        "pearofducks/ansible-vim",             -- Ansible-vim, syntax highlighting for Ansible file
        "ray-x/lsp_signature.nvim",            -- LSP signature as you type
        "theprimeagen/harpoon",                -- Harpoon, a bookmark manager
        "tpope/vim-commentary",                -- Commentary, a better commenting plugin
        "tpope/vim-fugitive",                  -- Git integration
        "molleweide/LuaSnip-snippets.nvim",    -- LuaSnip snippets
        { import = "elias.plugins" }
    },
    change_detection = {
        enabled = false,
        notify = false, -- get a notification when changes are detected
    }
})
