local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local comment_snippet_v_1 = {
    s("comm", {
        t("/*"), i(1, ""), t("*/")
    })
}

local api_snippet_v_1 = {
    s("api", {
        t("/**"),
        t({ "", " * @brief " }), i(1, ""),
        t({ "", " * @params " }), i(2, ""),
        t({ "", " * @returns " }), i(3, ""),
        t({ "", " */" }),
    })
}

ls.add_snippets("go", comment_snippet_v_1)
ls.add_snippets("c", comment_snippet_v_1)
ls.add_snippets("cs", comment_snippet_v_1)
ls.add_snippets("cpp", comment_snippet_v_1)
ls.add_snippets("css", comment_snippet_v_1)
ls.add_snippets("dart", comment_snippet_v_1)
ls.add_snippets("kotlin", comment_snippet_v_1)
ls.add_snippets("typescript", comment_snippet_v_1)
ls.add_snippets("javascript", comment_snippet_v_1)

ls.add_snippets("go", api_snippet_v_1)
ls.add_snippets("c", api_snippet_v_1)
ls.add_snippets("cs", api_snippet_v_1)
ls.add_snippets("cpp", api_snippet_v_1)
ls.add_snippets("css", api_snippet_v_1)
ls.add_snippets("dart", api_snippet_v_1)
ls.add_snippets("kotlin", api_snippet_v_1)
ls.add_snippets("typescript", api_snippet_v_1)
ls.add_snippets("javascript", api_snippet_v_1)
