return {
    {
        "Kurama622/profile.nvim",
        config = function()
            local comp = require("profile.components")

            vim.api.nvim_set_hl(0, "ProfileDeepRed", { fg = "#400000" })
            vim.api.nvim_set_hl(0, "ProfileDeepBlue", { fg = "#0016a6" })
            vim.api.nvim_set_hl(0, "ProfileBlue", { fg = "#4287f5" })
            vim.api.nvim_set_hl(0, "ProfileRed", { fg = "#f54b42" })
            vim.api.nvim_set_hl(0, "ProfileGreen", { fg = "#30cf00" })
            vim.api.nvim_set_hl(0, "ProfileOrange", { fg = "#cf6700" })
            vim.api.nvim_set_hl(0, "ProfileYellow", { fg = "#f5a142" })
            require("profile").setup({
                avatar_opts = {
                    force_blank = false,
                },
                user = "raccoonhands1",
                -- git_contributions = {
                --     start_week = 1,
                --     end_week = 53,
                --     empty_char = "o",
                --     full_char = { "▄", "▅", "▆", "▇", "█" },
                --     cache_path = "/tmp/profile.nvim/",
                --     cache_duration = 24 * 60 * 60,
                -- },
                hide = {
                    statusline = true,
                    tabline = true,
                },
                cursor_pos = { 16, 68 },
                format = function()
                    -- First render the pixel face art in blue
                    local face_art = {
                        [[                                                                       ]],
                        [[                                                                       ]],
                        [[             ⠤⣤⣤⣤⣄⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⠤⠤⠴⠶⠶⠶⠶        ]],
                        [[            ⢠⣤⣤⡄⣤⣤⣤⠄⣀⠉⣉⣙⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠘⣉⢡⣤⡤⠐⣶⡆⢶⠀⣶⣶⡦         ]],
                        [[            ⣄⢻⣿⣧⠻⠇⠋⠀⠋⠀⢘⣿⢳⣦⣌⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠞⣡⣴⣧⠻⣄⢸⣿⣿⡟⢁⡻⣸⣿⡿⠁         ]],
                        [[            ⠈⠃⠙⢿⣧⣙⠶⣿⣿⡷⢘⣡⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣷⣝⡳⠶⠶⠾⣛⣵⡿⠋⠀⠀         ]],
                        [[            ⠀⠀⠀⠀⠉⠻⣿⣶⠂⠘⠛⠛⠛⢛⡛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠀⠉⠒⠛⠀⠀⠀⠀⠀         ]],
                        [[        ⠀⠀    ⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ]],
                        [[        ⠀⠀⠀⠀    ⠀⠀⣿⡇⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ]],
                        -- [[   ⠀⠀⠀⠀⠀⠀    ⣿⡇⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ]],
                        -- [[   ⠀⠀⠀⠀⠀⠀    ⢻⡁⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                         ]],

                    }

                    -- Render the face in blue
                    for _, line in ipairs(face_art) do
                        comp:text_component_render({ comp:text_component(line, "center", "ProfileBlue") })
                    end
                    local vim_logo = {
                        [[       ████ ██████           █████      ██                     ]],
                        [[      ███████████             █████                             ]],
                        [[      █████████ ███████████████████ ███   ███████████   ]],
                        [[     █████████  ███    █████████████ █████ ██████████████   ]],
                        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                        [[                                                                       ]],
                    }

                    -- Render the vim logo in red at the same position
                    for _, line in ipairs(vim_logo) do
                        comp:text_component_render({ comp:text_component(line, "center", "ProfileRed") })
                    end

                    comp:separator_render()
                    comp:text_component_render({
                        comp:text_component("if you think i cant see you", "center", "ProfileRed"),
                    })
                    -- Rest of your format function remains the same
                    comp:separator_render()

                    comp:text_component_render({
                        comp:text_component("think again", "center", "ProfileBlue"),
                    })
                    -- comp:git_contributions_render("ProfileGreen")
                end,
            })
            vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })

            local user_mappings = {
                n = {
                    ["5"] = "<cmd>FzfLua oldfiles<cr>",
                    ["4"] = "<cmd>FzfLua files<cr>",
                    ["3"] = "<cmd>FzfLua files cwd=$HOME/.config/nvim<cr>",
                    ["/"] = "<cmd>FzfLua live_grep<cr>",
                    ["2"] = "<cmd>enew<cr>",
                    ["1"] = "<cmd>Lazy<cr>",
                },
            }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "profile",
                callback = function()
                    for mode, mapping in pairs(user_mappings) do
                        for key, cmd in pairs(mapping) do
                            vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true, silent = true })
                        end
                    end
                end,
            })
        end,
    },
}
