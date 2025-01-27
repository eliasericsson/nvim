require 'nvim-treesitter.configs'.setup {
    modules = {},
    ignore_install = {},

    -- A list of parser names, or "all"
    ensure_installed = { "c", "javascript", "typescript", "lua", "rust", "kotlin", "terraform", "yaml", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        additional_vim_regex_highlighting = false,

        disable = {
            "gitcommit",
            "help",
            "vimdoc",
        }
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                ["is"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                ["lh"] = "@assignment.lhs",
                ["rh"] = "@assignment.rhs",
            },
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
        }
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-n>",
            node_incremental = "<C-n>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-d>",
        },
    },
}
