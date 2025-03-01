return {
    {
        'saghen/blink.cmp',
        dependencies = {
            { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        },
        version = 'v0.*',
        opts = {
            keymap = {
                preset = 'default',
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            signature = { enabled = true },
            snippets = {
                preset = 'luasnip',
                expand = function(snippet)
                    require("luasnip").lsp_expand(snippet)
                end,
                active = function(filter)
                    if filter and filter.direction then
                        return require("luasnip").jumpable(filter.direction)
                    end
                    return require("luasnip").in_snippet()
                end,
                jump = function(direction)
                    require("luasnip").jump(direction)
                end,
            },
            completion = {
                menu = {
                    auto_show = true,
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 1 },
                        }
                    }
                },
                documentation = { auto_show = true, auto_show_delay_ms = 100, },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    },
}
