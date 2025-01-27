local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "Comment" } },
            },
        },
    },
})

ls.setup({
    snip_env = {
        s = function(...)
            local snip = ls.s(...)
            table.insert(getfenv(2).ls_file_snippets, snip)
        end,
        parse = function(...)
            local snip = ls.parser.parse_snippet(...)
            table.insert(getfenv(2).ls_file_snippets, snip)
        end,
    }
})

require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
require("luasnip.loaders.from_vscode").lazy_load()

