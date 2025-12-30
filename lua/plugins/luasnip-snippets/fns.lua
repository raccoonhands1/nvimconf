local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local react_component_js = {
    s("react", {
        t("import React from 'react'"),
        t({ "", "" }),
        t({ "", "export function " }), i(1, "Component"), t("() {"),
        t({ "", "    return (" }),
        t({ "", "        <>" }),
        t({ "", "            " }), i(2, ""),
        t({ "", "        </>" }),
        t({ "", "    )" }),
        t({ "", "}" }),
        t({ "", "" }),
    })
}

local react_component_js_params = {
    s("reactparams", {
        t("import React from 'react'"),
        t({ "", "" }),
        t({ "", "export function " }), i(1, "Component"), t("({ "), i(2, "props"), t(" }) {"),
        t({ "", "    return (" }),
        t({ "", "        <>" }),
        t({ "", "            " }), i(3, ""),
        t({ "", "        </>" }),
        t({ "", "    )" }),
        t({ "", "}" }),
        t({ "", "" }),
    })
}

local react_component_ts = {
    s("react", {
        t("import React from 'react'"),
        t({ "", "" }),
        t({ "", "export function " }), i(1, "Component"), t("() {"),
        t({ "", "    return (" }),
        t({ "", "        <>" }),
        t({ "", "            " }), i(2, ""),
        t({ "", "        </>" }),
        t({ "", "    )" }),
        t({ "", "}" }),
        t({ "", "" }),
    })
}

local react_component_ts_params = {
    s("reactparams", {
        t("interface "), i(1, "Component"), t("Props {"),
        t({ "", "    " }), i(2, ""),
        t({ "", "}" }),
        t({ "", "" }),
        t({ "", "import React from 'react'" }),
        t({ "", "" }),
        t({ "", "export function " }), f(function(args) return args[1][1] end, { 1 }), t("({ "), i(3, "props"), t(" }: "),
        f(
            function(args) return args[1][1] end, { 1 }), t("Props) {"),
        t({ "", "    return (" }),
        t({ "", "        <>" }),
        t({ "", "            " }), i(4, ""),
        t({ "", "        </>" }),
        t({ "", "    )" }),
        t({ "", "}" }),
        t({ "", "" }),
    })
}

ls.add_snippets("javascript", react_component_js)
ls.add_snippets("javascript", react_component_js_params)
ls.add_snippets("javascriptreact", react_component_js)
ls.add_snippets("javascriptreact", react_component_js_params)

ls.add_snippets("typescript", react_component_ts)
ls.add_snippets("typescriptreact", react_component_ts)
ls.add_snippets("typescriptreact", react_component_ts_params)

local js_ts_snippets = {
    s("funccomment", {
        t("/**"),
        t({ "", " * @summary " }), i(1, "Description"),
        t({ "", " * @param {" }), i(2, "type"), t("} "), i(3, "paramName"), t(" - "), i(4,
        "parameter description"),
        t({ "", " * @returns {" }), i(5, "type"), t("} "), i(6, "return description"),
        t({ "", " * @example", " * " }), i(7, "example usage"),
        t({ "", " */" }),
    }),

    s("reactfc", {
        t("interface "), i(1, "ComponentName"), t("Props {"),
        t({ "", "  " }), i(2, ""),
        t({ "", "}" }),
        t({ "", "", "export const " }), f(function(args) return args[1][1] end, { 1 }), t(": React.FC<"), f(
        function(args) return args[1][1] end, { 1 }), t("Props> = (props) => {"),
        t({ "", "  " }), i(3, "return <></>"),
        t({ "", "}" }),
    }),
}

ls.add_snippets("javascript", js_ts_snippets)
ls.add_snippets("typescript", js_ts_snippets)
ls.add_snippets("javascriptreact", js_ts_snippets)
ls.add_snippets("typescriptreact", js_ts_snippets)
