return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

        require("neo-tree").setup({
            close_if_last_window = false,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            sort_case_insensitive = false,
            sort_function = nil,
            default_component_configs = {
                container = {
                    enable_character_fade = true
                },
                indent = {
                    indent_size = 2,
                    padding = 1,
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    highlight = "NeoTreeIndentMarker",
                    with_expanders = nil,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰜌",
                    folder_empty_open = "󰜌", 
                    default = "*",
                    highlight = "NeoTreeFileIcon"
                },
                modified = {
                    symbol = "[+]",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        added     = "", 
                        modified  = "", 
                        deleted   = "✖",
                        renamed   = "󰁕",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    }
                },
                file_size = {
                    enabled = true,
                    required_width = 64,
                },
                type = {
                    enabled = true,
                    required_width = 122,
                },
                last_modified = {
                    enabled = true,
                    required_width = 88,
                },
                created = {
                    enabled = true,
                    required_width = 110,
                },
                symlink_target = {
                    enabled = false,
                },
            },
            commands = {
                -- Custom command to jump to center of window (matching your nvim-tree setup)
                center_cursor = function(state)
                    local win_height = vim.api.nvim_win_get_height(0)
                    local top_line = vim.fn.line("w0")
                    local center_line = top_line + math.floor(win_height / 2)
                    vim.api.nvim_win_set_cursor(0, { center_line, 0 })
                end,
            },
            window = {
                position = "float",
                width = function()
                    local screen_w = vim.api.nvim_get_option("columns")
                    return math.floor(screen_w * 0.6)
                end,
                height = function()
                    local screen_h = vim.api.nvim_get_option("lines")
                    return math.floor(screen_h * 0.6)
                end,
                popup = {
                    position = { col = "50%", row = "50%" },
                    size = function(state)
                        local screen_w = vim.api.nvim_get_option("columns")
                        local screen_h = vim.api.nvim_get_option("lines")
                        return {
                            width = math.floor(screen_w * 0.6),
                            height = math.floor(screen_h * 0.6),
                        }
                    end
                },
                mappings = {
                    ["<space>"] = {
                        "toggle_node",
                        nowait = false,
                    },
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["<esc>"] = "cancel",
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                    -- Custom navigation to match your keymaps: l=up, k=down, j=left, ;=right
                    ["l"] = "prev_sibling",
                    ["k"] = "next_sibling",
                    ["j"] = "close_node",
                    [";"] = "open",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    ["t"] = "open_tabnew",
                    ["w"] = "open_with_window_picker",
                    ["C"] = "close_node",
                    ["z"] = "close_all_nodes",
                    ["a"] = {
                        "add",
                        config = {
                            show_path = "none"
                        }
                    },
                    ["A"] = "add_directory",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["c"] = "copy",
                    ["m"] = "move",
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                    ["i"] = "show_file_details",
                    ["<S-m>"] = "center_cursor",
                }
            },
            nesting_rules = {},
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_hidden = true,
                    hide_by_name = {
                        --"node_modules"
                    },
                    hide_by_pattern = {
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = {
                        --".gitignored",
                    },
                    never_show = {
                        --".DS_Store",
                        --"thumbs.db"
                    },
                    never_show_by_pattern = {
                        --".null-ls_*",
                    },
                },
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                group_empty_dirs = true,
                hijack_netrw_behavior = "open_default",
                use_libuv_file_watcher = true,
                window = {
                    mappings = {
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                        ["H"] = "toggle_hidden",
                        ["/"] = "fuzzy_finder",
                        ["D"] = "fuzzy_finder_directory",
                        ["#"] = "fuzzy_sorter",
                        ["f"] = "filter_on_submit",
                        ["<c-x>"] = "clear_filter",
                        ["[g"] = "prev_git_modified",
                        ["]g"] = "next_git_modified",
                        ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["og"] = { "order_by_git_status", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    },
                    fuzzy_finder_mappings = {
                        ["<down>"] = "move_cursor_down",
                        ["<C-n>"] = "move_cursor_down",
                        ["<up>"] = "move_cursor_up",
                        ["<C-p>"] = "move_cursor_up",
                    },
                },
                commands = {}
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                group_empty_dirs = true,
                show_unloaded = true,
                window = {
                    mappings = {
                        ["bd"] = "buffer_delete",
                        ["<bs>"] = "navigate_up",
                        ["."] = "set_root",
                        ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    }
                },
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["A"]  = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                        ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    }
                }
            }
        })

        vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
}