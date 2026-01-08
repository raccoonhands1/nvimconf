return {
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue", "tsx", "jsx", "xml", "php", "markdown" },
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                },
                -- per_filetype = {
                --     ["html"] = {
                --         enable_close = false
                --     }
                -- }
            })
        end,
    }
}
