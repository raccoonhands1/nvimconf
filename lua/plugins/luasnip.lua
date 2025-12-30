return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local ls = require("luasnip")
        require("plugins.luasnip-snippets.headers")
        require("plugins.luasnip-snippets.comments")
        require("plugins.luasnip-snippets.fns")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        -- ============================================================================
        -- HELPER FUNCTIONS
        -- ============================================================================

        local function get_date()
            return os.date("%Y-%m-%d")
        end

        -- ============================================================================
        -- ALL FILETYPES
        -- ============================================================================

        ls.add_snippets("all", {
            s("mk", { t("%%%%") }),
        })

        -- ============================================================================
        -- C++ LANGUAGE
        -- ============================================================================

        ls.add_snippets("cpp", {
        })

        -- ============================================================================
        -- C / C++ SHARED
        -- ============================================================================

        local c_cpp_snippets = {
            s("guard", {
                t("#ifndef "), i(1, "HEADER_H"),
                t({ "", "#define " }), f(function(args) return args[1][1] end, { 1 }),
                t({ "", "" }), i(2, "// header content"),
                t({ "", "", "#endif // " }), f(function(args) return args[1][1] end, { 1 }),
            }),

            s("func", {
                i(1, "void"), t(" "), i(2, "function_name"), t("("), i(3, ""), t(") {"),
                t({ "", "    " }), i(0, ""),
                t({ "", "}" }),
            }),
        }

        ls.add_snippets("c", c_cpp_snippets)
        ls.add_snippets("cpp", c_cpp_snippets)

        -- Configure luasnip
        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        -- Ctrl+l to expand snippet or jump forward (down/next in jkl; layout)
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true })

        -- Ctrl+k to jump backward (up/previous in jkl; layout)
        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true })
    end,
}
