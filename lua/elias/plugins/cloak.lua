return {
    {
        "laytan/cloak.nvim",
        config = function()
            require("cloak").setup({
                patterns = {
                    {
                        file_pattern = ".env*",
                        cloak_pattern = "=.*",
                    },
                    {
                        file_pattern = "credentials",
                        cloak_pattern = "=.*",
                    }
                }
            })
        end
    }
}
