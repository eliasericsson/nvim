local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({
    -- GitHub Copilot
    "github/copilot.vim",

    -- Plenary, a utility library
    "nvim-lua/plenary.nvim",

    -- Telescope, a fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    },

    -- Commentary, a better commenting plugin
    "tpope/vim-commentary",

    -- Git integration
    "tpope/vim-fugitive",

    -- Catpuccin, a pastel color scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    },

    -- Colorizer, a color highlighter
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- CMP, a completion plugin with snippets support and more
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-emoji",
            "quangnguyen30192/cmp-nvim-ultisnips",
            "octaltree/cmp-look",
            "f3fora/cmp-spell",
        },
    },

    -- Autopairs, a plugin to automatically close pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },

    -- Treesitter, a better syntax highlighter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    },


    -- Treesitter text objects, like vim-surround
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    },


    -- Rainbow colored parentheses
    {
        "HiPhish/nvim-ts-rainbow2",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                rainbow = {
                    enable = true,
                    disable = { "jsx", "cpp" },
                    query = "rainbow-parens",
                    strategy = require("ts-rainbow").strategy.global,
                },
            })
        end,
    },

    -- Lualine, a statusline written in lua
    {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                },
            })
        end,
    },

    -- Trouble, a pretty list for LSP diagnostics
    {
        "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("trouble").setup({
                auto_open = false,
                auto_close = true,
            })
        end,
    },

    -- Harpoon, a bookmark manager
    "theprimeagen/harpoon",

    -- Undotree, a visual undo history
    "mbbill/undotree",

    -- Git graph
    {
        "junegunn/gv.vim",
        requires = { "tpope/vim-fugitive" },
    },

    -- Dadbod, a database explorer
    "tpope/vim-dadbod",

    -- Dadbod UI, a UI for dadbod
    {
        "kristijanhusak/vim-dadbod-ui",
        requires = { "tpope/vim-dadbod" },
    },

    -- LSP Zero, a lightweight LSP client
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },
        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
            config = function()
                -- Here is where you configure the autocompletion settings.
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_cmp()

                -- And you can configure cmp even more, if you want to.
                local cmp = require('cmp')
                local cmp_action = lsp_zero.cmp_action()

                cmp.setup({
                    formatting = lsp_zero.cmp_format(),
                    mapping = cmp.mapping.preset.insert({
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                    })
                })
            end
        },
        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
            config = function()
                -- This is where all the LSP shenanigans will live
                local lsp_zero = require('lsp-zero')
                lsp_zero.extend_lspconfig()

                lsp_zero.on_attach(function(client, bufnr)
                    -- see :help lsp-zero-keybindings
                    -- to learn the available actions
                    lsp_zero.default_keymaps({ buffer = bufnr })
                end)

                require('mason-lspconfig').setup({
                    ensure_installed = {},
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            -- (Optional) Configure lua language server for neovim
                            local lua_opts = lsp_zero.nvim_lua_ls()
                            require('lspconfig').lua_ls.setup(lua_opts)
                        end,
                    }
                })
            end
        }
    },

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },

    -- Indentation guides
    "lukas-reineke/indent-blankline.nvim",

    -- LSP signature as you type
    "ray-x/lsp_signature.nvim",

    -- Black python formatter
    {
        "psf/black",
        ft = "python",
        cmd = { "Black" },
    },

    -- Fenced Markdown Code Blocks
    {
        "AckslD/nvim-FeMaco.lua",
        config = 'require("FeMaco").setup()'
    },

    -- No Neck Pain, a plugin to avoid neck pain by centering the buffer
    "shortcuts/no-neck-pain.nvim",

    -- Ansible-vim, syntax highlighting for Ansible file
    "pearofducks/ansible-vim",

    -- Colorful Winsep, a plugin to colorize the window separator
    {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require("colorful-winsep").setup()
        end,
    },

    -- Gitsigns, a plugin to show git diff in the gutter
    "lewis6991/gitsigns.nvim",

    -- Oil, browse files like buffers
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("oil").setup({
                devicons = {
                    override = {
                        ["class"] = "",
                        ["config"] = "",
                        ["css"] = "",
                        ["csv"] = "",
                        ["db"] = "",
                        ["dockerfile"] = "",
                        ["env"] = "",
                        ["git"] = "",
                        ["go"] = "",
                        ["html"] = "",
                        ["ini"] = "",
                        ["java"] = "",
                        ["js"] = "",
                        ["json"] = "",
                        ["jsx"] = "",
                        ["lua"] = "",
                        ["md"] = "",
                        ["php"] = "",
                        ["py"] = "",
                        ["rb"] = "",
                        ["rs"] = "",
                        ["sh"] = "",
                        ["sql"] = "",
                        ["toml"] = "",
                        ["ts"] = "ﯤ",
                        ["tsx"] = "",
                        ["vim"] = "",
                        ["vue"] = "﵂",
                        ["yaml"] = "",
                    },
                },
            })
        end,
    }
})