return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                go = { "gofumpt", "goimports" },
                terraform = { "terraform_fmt" },
                rust = { "rustfmt" },
                bash = { "shfmt" },
                sh = { "shfmt" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            },
            format_on_save = false,
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            require("conform").format({
                lsp_fallback = true,
                timeout_ms = 500,
            })
        end, { desc = "Format buffer" })
    end,
}
