local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("print", {
        t("cout << "), i(1, ""), t([[ << '\n';]]),
    }),
    s("sprint", {
        t("std::cout << "), i(1, ""), t([[ << '\n';]]),
    })
})

ls.add_snippets("c", {
    s("print", {
        t("printf(\""), i(1, "%s"), t("\\n\", "), i(2, "variable"), t(");"),
    }),
})


ls.add_snippets("python", {
    s("print", {
        t("print("), i(1, ""), t(")"),
    })
})
