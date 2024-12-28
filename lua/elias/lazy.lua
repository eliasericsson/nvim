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
        { import = "elias.plugins" }
    },
    change_detection = {
        enabled = false,
        notify = false, -- get a notification when changes are detected
    }
})

--     -- LSP Zero, a lightweight LSP client
--     {
--         {
--             'VonHeikemen/lsp-zero.nvim',
--             branch = 'v3.x',
--             lazy = true,
--             config = false,
--             init = function()
--                 -- Disable automatic setup, we are doing it manually
--                 vim.g.lsp_zero_extend_cmp = 0
--                 vim.g.lsp_zero_extend_lspconfig = 0
--             end,
--         },

--         -- Mason, a plugin to manage LSP and autocompletion
--         {
--             'williamboman/mason.nvim',
--             lazy = false,
--             config = true
--         },

--         -- LuaSnip, a snippet engine
--         {
--             'L3MON4D3/LuaSnip',
--             build = "make install_jsregexp"
--         },

--         -- CMP, a completion plugin with snippets support and more
--         {
--             'hrsh7th/nvim-cmp',
--             event = 'InsertEnter',

--             requires = {
--                 -- LSP Completion source:
--                 "hrsh7th/cmp-nvim-lsp",

--                 -- Useful completion sources:
--                 "hrsh7th/cmp-nvim-lua",
--                 "hrsh7th/cmp-nvim-signature-help",
--                 "hrsh7th/cmp-vsnip",
--                 "hrsh7th/cmp-path",
--                 "hrsh7th/cmp-buffer",
--                 "hrsh7th/cmp-calc",
--                 "hrsh7th/cmp-emoji",
--                 "quangnguyen30192/cmp-nvim-ultisnips",
--                 "octaltree/cmp-look",
--                 "f3fora/cmp-spell",
--             },

--             dependencies = {
--                 { 'L3MON4D3/LuaSnip' },
--             },

--             config = function()
--                 print("Configuring cmp")
--                 -- Here is where you configure the autocompletion settings.
--                 local lsp_zero = require('lsp-zero')
--                 lsp_zero.extend_cmp()

--                 -- And you can configure cmp even more, if you want to.
--                 local cmp = require('cmp')
--                 local cmp_action = lsp_zero.cmp_action()

--                 cmp.setup({
--                     formatting = lsp_zero.cmp_format(),
--                     mapping = cmp.mapping.preset.insert({
--                         ['<C-Tab>'] = cmp.mapping.complete(),
--                         ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--                         ['<C-d>'] = cmp.mapping.scroll_docs(4),
--                         ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--                         ['<C-b>'] = cmp_action.luasnip_jump_backward(),
--                     }),
--                     sources = {
--                         { name = "nvim_lsp" },
--                         { name = "nvim_lua" },
--                         { name = "buffer" },
--                         { name = "path" },
--                         { name = "vsnip" },
--                         { name = "calc" },
--                         { name = "emoji" },
--                         { name = "ultisnips" },
--                         { name = "look" },
--                         { name = "spell" },
--                     },
--                 })
--             end
--         },

--         -- LSP
--         {
--             'neovim/nvim-lspconfig',
--             cmd = { 'LspInfo', 'LspInstall', 'LspStart' },

--             event = { 'BufReadPre', 'BufNewFile' },

--             dependencies = {
--                 { 'hrsh7th/cmp-nvim-lsp' },
--                 { 'towolf/vim-helm',                  ft = 'helm' },
--                 { 'williamboman/mason-lspconfig.nvim' },
--                 { 'saghen/blink.cmp' },
--             },

--             opts = {
--                 servers = {
--                     lua_ls = {},
--                     rust_analyzer = {},
--                     gopls = {},
--                     nil_ls = {},
--                     yamlls = {},
--                     terraformls = {},
--                     ts_ls = {},
--                     bicep = {},
--                     ruff = {},
--                     eslint = {},
--                     taplo = {},
--                 }
--             },
--             config = function(_, opts)
--                 -- This is where all the LSP shenanigans will live
--                 -- local lsp_zero = require('lsp-zero')
--                 local lspconfig = require('lspconfig')
--                 for server, config in pairs(opts.servers) do
--                     config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
--                     lspconfig[server].setup(config)
--                 end
--             end
--         }
--     },
