return {
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    float = {
                        enable = true,
                        open_win_config = function()
                            local screen_w = vim.api.nvim_get_option("columns")
                            local screen_h = vim.api.nvim_get_option("lines")
                            local window_w = screen_w * 0.6
                            local window_h = screen_h * 0.6
                            local window_w_int = math.floor(window_w)
                            local window_h_int = math.floor(window_h)
                            local center_x = (screen_w - window_w) / 2
                            local center_y = ((screen_h - window_h) / 2) - 1
                            return {
                                border = "rounded",
                                relative = "editor",
                                row = center_y,
                                col = center_x,
                                width = window_w_int,
                                height = window_h_int,
                            }
                        end,
                    },
                },
                renderer = {
                    group_empty = true,
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")
                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end
                    api.config.mappings.default_on_attach(bufnr)
                    vim.keymap.set("n", "<S-m>", function()
                        local win_height = vim.api.nvim_win_get_height(0)
                        local top_line = vim.fn.line("w0")
                        local center_line = top_line + math.floor(win_height / 2)
                        vim.api.nvim_win_set_cursor(0, { center_line, 0 })
                    end, opts("Jump to center of visible window"))
                end,

            })
        end,
    },
}
