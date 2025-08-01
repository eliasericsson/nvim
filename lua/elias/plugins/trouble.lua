return {
    {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("trouble").setup({
                auto_open = false,
                auto_close = true,
                modes = {
                    symbols = { -- Configure symbols mode
                        win = {
                            type = "split", -- split window
                            relative = "win", -- relative to current window
                            position = "right", -- right side
                            size = 0.4, -- 40% of the window
                        },
                    },
                }
            })
        end
    }
}
