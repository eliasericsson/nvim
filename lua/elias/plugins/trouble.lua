return {
    {
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("trouble").setup({
                auto_open = false,
                auto_close = true,
            })
        end
    }
}
