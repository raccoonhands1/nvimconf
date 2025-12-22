local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_date()
    return os.date("%Y-%m-%d")
end

local header_snippet_v_1 = {
    s("header", {
        t("/**"),
        t({ "", " * @author raccoonhands" }),
        t({ "", " * @date " }), f(get_date, {}),
        t({ "", " * @brief " }), i(1, "Brief description"),
        t({ "", " */" }),
    }),
}

local header_snippet_v_2 = {
    s("header", {
        t("\"\"\""),
        t({ "", " * @author raccoonhands" }),
        t({ "", " * @date " }), f(get_date, {}),
        t({ "", " * @brief " }), i(1, "Brief description"),
        t({ "", "\"\"\"" }),
    }),
}

local bash_header = {
    s("header", {
        t("# !/bin/bash"),
        t({ "", "# @author raccoonhands" }),
        t({ "", "# @date " }), f(get_date, {}),
    }),
}

ls.add_snippets("go", header_snippet_v_1)
ls.add_snippets("c", header_snippet_v_1)
ls.add_snippets("cs", header_snippet_v_1)
ls.add_snippets("cpp", header_snippet_v_1)
ls.add_snippets("css", header_snippet_v_1)
ls.add_snippets("dart", header_snippet_v_1)
ls.add_snippets("kotlin", header_snippet_v_1)
ls.add_snippets("typescript", header_snippet_v_1)
ls.add_snippets("javascript", header_snippet_v_1)

ls.add_snippets("python", header_snippet_v_2)

ls.add_snippets("sh", bash_header)
ls.add_snippets("bash", bash_header)
