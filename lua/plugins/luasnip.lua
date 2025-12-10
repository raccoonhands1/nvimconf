return {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        -- Get current date
        local function get_date()
            return os.date("%Y-%m-%d")
        end

        -- Function comment template
        ls.add_snippets("all", {
            s("funccomment", {
                t("/**"),
                t({"", " * @summary "}), i(1, "Description"),
                t({"", " * @param {"}), i(2, "type"), t("} "), i(3, "paramName"), t(" - "), i(4, "parameter description"),
                t({"", " * @returns {"}), i(5, "type"), t("} "), i(6, "return description"),
                t({"", " * @example", " * "}), i(7, "example usage"),
                t({"", " */"}),
            }),
        })

        -- TypeScript header comment
        ls.add_snippets("all", {
            s("tsheader", {
                t("/**"),
                t({"", " * @description "}), i(1, "Brief description"),
                t({"", " * ", " * "}), i(2, "Detailed explanation"),
                t({"", " * ", " * @author Clayton"}),
                t({"", " * @date "}), f(get_date, {}),
                t({"", " * ", " * @see {@link "}), i(3, "url"), t("} "), i(4, "for more info"),
                t({"", " */"}),
            }),
        })

        -- React FC component
        ls.add_snippets("all", {
            s("reactfc", {
                t("interface "), i(1, "ComponentName"), t("Props {"),
                t({"", "  "}), i(2, "// props here"),
                t({"", "}"}),
                t({"", "", "const "}), f(function(args) return args[1][1] end, {1}), t(": React.FC<"), f(function(args) return args[1][1] end, {1}), t("Props> = (props) => {"),
                t({"", "  "}), i(3, "return <div></div>;"),
                t({"", "};"}),
                t({"", "", "export default "}), f(function(args) return args[1][1] end, {1}), t(";"),
            }),
        })

        -- Configure luasnip
        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })

        -- Jump forward/backward in snippet
        vim.keymap.set({"i", "s"}, "<C-j>", function()
            if ls.jumpable(1) then
                ls.jump(1)
            end
        end, { desc = "Jump to next snippet node" })

        vim.keymap.set({"i", "s"}, "<C-k>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { desc = "Jump to previous snippet node" })
    end,
}
