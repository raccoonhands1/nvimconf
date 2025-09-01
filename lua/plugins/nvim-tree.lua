return {
    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local function my_on_attach(bufnr)
                local api = require "nvim-tree.api"
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                
                -- default mappings
                api.config.mappings.default_on_attach(bufnr)
                
                -- custom mappings
                vim.keymap.set("n", "<S-m>", function()
                    local win_height = vim.api.nvim_win_get_height(0)
                    local top_line = vim.fn.line("w0")
                    local center_line = top_line + math.floor(win_height / 2)
                    vim.api.nvim_win_set_cursor(0, { center_line, 0 })
                end, opts("Jump to center of visible window"))
            end

            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                filesystem_watchers = {
                    enable = true,
                },
                actions = {
                    use_system_clipboard = true,
                    change_dir = {
                        enable = true,
                        global = false,
                        restrict_above_cwd = false,
                    },
                    expand_all = {
                        max_folder_discovery = 300,
                        exclude = {},
                    },
                    file_popup = {
                        open_win_config = {
                            col = 1,
                            row = 1,
                            relative = "cursor",
                            border = "shadow",
                            style = "minimal",
                        },
                    },
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                            picker = "default",
                            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                            exclude = {
                                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                                buftype = { "nofile", "terminal", "help" },
                            },
                        },
                    },
                    remove_file = {
                        close_window = true,
                    },
                },
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
                on_attach = my_on_attach,

            })
        end,
    },
}
