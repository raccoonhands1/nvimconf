return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (parsers with maintainers)
                ensure_installed = { "lua", "vim", "javascript", "typescript", "python", "html", "css" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                -- Highlighting configuration
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- Indentation based on treesitter
                indent = {
                    enable = true
                },
            })
        end,
    },
}
