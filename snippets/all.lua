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
        {{% hint style="{1}" %}}
        {2}
        {{% endhint %}}
            ]],
            {
                c(1, { t("info"), t("success"), t("warning"), t("danger") }),
                i(2, "content"),
            }
        )
    ),
}
