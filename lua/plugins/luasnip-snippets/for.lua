local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local for_snippet_v_1 = {
    s("for", {
        t("for (int "), i(1, "i"), t("{"), i(2, "0"), t("}; "),
        f(function(args) return args[1][1] end, { 1 }), t(" < "), i(3, "n"), t("; "),
        f(function(args) return args[1][1] end, { 1 }), t("++) {"),
        t({ "", "    " }), i(4, ""),
        t({ "", "}" }),
    })
}

local for_snippet_v_2 = {
    s("for", {
        t("for (int "), i(1, "i"), t(" = "), i(2, "0"), t("; "),
        f(function(args) return args[1][1] end, { 1 }), t(" < "), i(3, "n"), t("; "),
        f(function(args) return args[1][1] end, { 1 }), t("++) {"),
        t({ "", "    " }), i(4, ""),
        t({ "", "}" }),
    })
}

ls.add_snippets("cpp", for_snippet_v_1)

ls.add_snippets("c", for_snippet_v_2)
