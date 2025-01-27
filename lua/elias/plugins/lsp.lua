return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "Afourcat/treesitter-terraform-doc.nvim",
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } }
                    },
                },
            },
        },
        opts = {
            servers = {
                lua_ls = {},
                rust_analyzer = {},
                gopls = {},
                nil_ls = {},
                yamlls = {},
                terraformls = {
                    on_attach = function ()
                        require("treesitter-terraform-doc").setup({
                            -- The vim user command that will trigger the plugin.
                            command_name       = "OpenDoc",

                            -- The command that will take the url as a parameter.
                            url_opener_command = "!open",

                            -- If true, the cursor will jump to the anchor in the documentation.
                            jump_argument      = true,
                        })
                        vim.keymap.set("n", "gh", vim.cmd.OpenDoc, { desc = "Get help from the Terraform Documentation"})
                    end
                },
                ts_ls = {},
                bicep = {},
                ruff = {},
                eslint = {},
                taplo = {},
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
    }
}
