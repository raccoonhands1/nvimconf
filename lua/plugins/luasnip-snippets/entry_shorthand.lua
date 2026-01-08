local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local entry_snippet_v_1 = {
    s("main", {
        t({ "#include <iostream>", "using namespace std;", "", "int main() {", "    cout << " }),
        i(1, "\"Hello, World!\\n\""),
        t({ ";", "    return 0;", "}" }),
    })
}

local entry_snippet_v_2 = {
    s("main", {
        t("if __name__ == \"__main\":")
    })
}

ls.add_snippets("c", entry_snippet_v_1)
ls.add_snippets("cs", entry_snippet_v_1)
ls.add_snippets("cpp", entry_snippet_v_1)

ls.add_snippets("python", entry_snippet_v_2)
