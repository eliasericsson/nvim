-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Commentary, a better commenting plugin
    use 'tpope/vim-commentary'

    -- Telescope, a fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Catpuccin, a pastel color scheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Rose Pine, a color scheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Hexokinase, preview colors in real time
    use {
        'rrethy/vim-hexokinase',
        run = 'make hexokinase',
        config = function()
            vim.g.Hexokinase_highlighters = { 'virtual' }
            vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
            vim.g.Hexokinase_optOutPatterns = 'full_hex,rgb,rgba,hsl,hsla'
        end
    }

    -- Colortils, a color manipulation plugin
    use {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function() require("colortils").setup {} end
    }

    -- CMP, a completion plugin with snippets support and more
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips',
            'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-emoji'
        }
    }

    -- Autopairs, a plugin to automatically close pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Treesitter, a better syntax highlighter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- Treesitter text objects, like vim-surround
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- Rainbow colored parentheses
    use({
        "HiPhish/nvim-ts-rainbow2",
        requires = "nvim-treesitter/nvim-treesitter",
        after = "nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                rainbow = {
                    enable = true,
                    disable = {"jsx", "cpp"},
                    query = 'rainbow-parens',
                    strategy = require('ts-rainbow').strategy.global,
                },
            })
        end,
    }
    )

    -- Lualine, a statusline written in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'catppuccin',
                }
            }
        end
    }

    -- Trouble, a pretty list for LSP diagnostics
    use {
        "folke/trouble.nvim",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Harpoon, a bookmark manager
    use('theprimeagen/harpoon')

    -- Undotree, a visual undo history
    use('mbbill/undotree')

    -- Git integration
    use('tpope/vim-fugitive')

    -- Git Graph
    use {
        'junegunn/gv.vim',
        requires = { 'tpope/vim-fugitive' },
    }

    -- DadBod, a database client
    use('tpope/vim-dadbod')
    use {
        'kristijanhusak/vim-dadbod-ui',
        requires = {
            { 'tpope/vim-dadbod' },
        }
    }

    -- GitHub Copilot
    use('github/copilot.vim')

    -- LSP Zero, a lightweight LSP client
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            --{'saadparwaiz1/cmp_luasnip'},
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'SirVer/ultisnips' },
        }
    }

    -- Markdown Preview
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    }

    -- Indentation guides
    use {
        "lukas-reineke/indent-blankline.nvim",
    }

    -- LSP signature as you type
    use {
        'ray-x/lsp_signature.nvim',
    }

    -- Black python formatter
    use {
        'psf/black', cmd = { "Black" }
    }

    -- Fenced Markdown Code Blocks
    use {
        'AckslD/nvim-FeMaco.lua',
        config = 'require("femaco").setup()',
    }

    -- No Neck Pain, a plugin to avoid neck pain by centering the buffer
    use {
        'shortcuts/no-neck-pain.nvim',
        tag = "*",
    }

    -- Ansible-vim, syntax highlighting for Ansible file
    use {
        'pearofducks/ansible-vim',
    }

    -- Colorful Winsep, a plugin to colorize the window separator
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require('colorful-winsep').setup()
        end
    }

    -- Gitsigns, a plugin to show git diff in the gutter
    use 'lewis6991/gitsigns.nvim'
end)
