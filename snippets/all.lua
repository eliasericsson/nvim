return {
    s("gconv", {
        i(1, "type"), t("("), i(2, "scope"), t("): "), i(3, "description"),
    }),

    s("cron", {
        i(1, "minute"), t(" "), i(2, "hour"), t(" "), i(3, "day"), t(" "), i(4, "month"), t(" "), i(5, "weekday"), t(" "),
        i(6, "user"), t(" "), i(7, "command"),
    }),

    s("hint",
        fmt(
            [[
        {{% hint style="{1}" %}} {2} {{% endhint %}}
            ]],
            {
                c(1, { t("info"), t("success"), t("warning"), t("danger") }),
                i(2, "content"),
            }
        )
    ),

    s("cls", fmt([[
    interface {}Config {{
    }}

    class {} extends {} {{
        constructor(scope: {}, id: string, config: {}Config) {{
            super(scope, id);
            {}
        }}
    }}
    ]], {
        i(1, "Class"),
        rep(1),
        i(2, "SuperClass"),
        rep(2),
        rep(1),
        i(0)
    })),

    s("efi", fmt([[
    {}, err := {}({})
    if err != nil {{
        return {}{}
    }}
    ]], {
        i(1, "res"),
        i(2, "function"),
        i(3, "input"),
        rep(1),
        i(0)
    }))
}
