return {
    {
        "Kurama622/profile.nvim",
        config = function()
            local comp = require("profile.components")

            local LOAD_SESSION = '`'
            local LAZY = '1'
            local ENEW = '2'
            local NVIM = '3'
            local FILES = '4'
            local OLD_FILES = '5'
            local LIVE_GREP = '/'
            local COLORSCHEMES = '0'

            vim.api.nvim_set_hl(0, "ProfileDeepRed", { fg = "#400000" })
            vim.api.nvim_set_hl(0, "ProfileDeepBlue", { fg = "#0016a6" })
            vim.api.nvim_set_hl(0, "ProfileBlue", { fg = "#4287f5" })
            vim.api.nvim_set_hl(0, "ProfileRed", { fg = "#f54b42" })
            vim.api.nvim_set_hl(0, "ProfileGreen", { fg = "#30cf00" })
            vim.api.nvim_set_hl(0, "ProfileOrange", { fg = "#cf6700" })
            vim.api.nvim_set_hl(0, "ProfileYellow", { fg = "#f5a142" })
            vim.api.nvim_set_hl(0, "ProfileThemeBg", { fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "sp") })
            vim.api.nvim_set_hl(0, "ProfileLightBlue", { fg = "#03d3fc" })
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
                    --
                    -- --                     ["5"] = "<cmd>FzfLua oldfiles<cr>",
                    -- ["4"] = "<cmd>FzfLua files<cr>",
                    -- ["3"] = "<cmd>FzfLua files cwd=$HOME/.config/nvim<cr>",
                    -- ["/"] = "<cmd>FzfLua live_grep<cr>",
                    -- ["2"] = "<cmd>enew<cr>",
                    -- ["1"] = "<cmd>Lazy<cr>",
                    --

                    local function_map = string.format(
                        "%s * load session | %s * lazy | %s * enew | %s * nvim | %s * files | %s * oldfiles | %s * live grep | %s * colorschemes",
                        LOAD_SESSION, LAZY, ENEW, NVIM, FILES, OLD_FILES, LIVE_GREP, COLORSCHEMES)


                    comp:text_component_render({
                        comp:text_component(function_map, "center", "ProfileRed")
                    })
                    local face_art = {
                        [[                                                                       ]],
                        [[                                                                       ]],
                        [[                                                                       ]],
                        [[                                                                       ]],
                        [[             ⠤⣤⣤⣤⣄⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⠤⠤⠴⠶⠶⠶⠶        ]],
                        [[            ⢠⣤⣤⡄⣤⣤⣤⠄⣀⠉⣉⣙⠒⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠘⣉⢡⣤⡤⠐⣶⡆⢶⠀⣶⣶⡦         ]],
                        [[            ⣄⢻⣿⣧⠻⠇⠋⠀⠋⠀⢘⣿⢳⣦⣌⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠞⣡⣴⣧⠻⣄⢸⣿⣿⡟⢁⡻⣸⣿⡿⠁         ]],
                        [[            ⠈⠃⠙⢿⣧⣙⠶⣿⣿⡷⢘⣡⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣷⣝⡳⠶⠶⠾⣛⣵⡿⠋⠀⠀         ]],
                        [[            ⠀⠀⠀⠀⠉⠻⣿⣶⠂⠘⠛⠛⠛⢛⡛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠀⠉⠒⠛⠀⠀⠀⠀⠀         ]],
                        [[        ⠀⠀    ⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ]],
                        [[        ⠀⠀⠀⠀    ⠀⠀⣿⡇⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ]]
                        -- [[   ⠀⠀⠀⠀⠀⠀    ⣿⡇⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀              ]],
                        -- [[   ⠀⠀⠀⠀⠀⠀    ⢻⡁⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                         ]],

                    }


                    -- local face_art = {
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣥⡀⠀⢠⣤⣤⣤⣤⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠘⢎⣿⣿⣿⣿⣿⡆⠈⠀⣿⣆⠀⠏⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣷⡀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⡀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣧⠊⠸⣿⣿⣿⣿⣿⡄⠀⢿⡿⠀⠈⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣷⠁⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⠀⠀⠱⡀⠀⢤⣤⣄⣀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢂⢹⣿⣿⣿⣿⣿⣦⡈⢿⠠⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠓⠀⠀⠈⠉⠉⠁⠋⠉⠛⠙⠿⢿⢸⢇⠀⡀⠱⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢂⢻⣿⣿⣿⣿⣿⣧⠀⠁⢇⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠓⠀⠐⠀⢃⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⢿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠠⠄⠂⠁⠀⠀⠀⣤⣀⠀⠈⠀⠀⠈⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠀⠈⠛⠿⣿⣿⣿⣿⣷⡄⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠀⠀⠀⠀⠀⡀⢀⡠⢀⣿⣿⣇⠀⠀⢳⡀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠉⠙⠙⠻⠇⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠈⠀⠀⠉⠀⠼⠿⠿⢿⠄⠀⠀⠁⠀⠘⣹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣷⡐⢄⠢⢄⠀⠀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠂⠀⠀⠀⠀⢠⣤⡄⠀⣠⡄⠀⡀⠀⠐⠀⠀⠀⡄⠨⠀⠋⣿⣿⣿⣿⣿⣿⣿⣿⡿⠱⣹⠟⣫⣭⣭⣿⣿⣿⣆⠙⠦⠙⠦⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠈⠀⠀⠀⣠⢀⣿⡇⣸⣿⣿⡰⣤⣶⠃⠀⠀⠀⠃⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⡿⢀⣴⣿⠞⠉⠀⠀⠀⠀⠀⠉⠓⠀⠀⠀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⡀⠀⠀⠀⠀⠀⣼⣿⠸⢸⣧⣿⣿⣿⣷⣿⡏⠀⢀⠀⠀⢿⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⡾⠋⠁⠀⠀⠀⠠⠀⠀⣀⠀⠀⠀⠀⠈⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢧⠀⠀⠀⠀⠀⠉⠻⠀⢸⣿⣿⣿⣿⣿⣿⠃⡰⠃⠀⣆⠸⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⡇⣯⠈⠀⠀⠄⠤⣀⠤⢠⣿⣷⡀⠀⠀⠀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⡀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⡟⠰⠁⠀⣱⣿⠀⣿⠀⢻⣿⣿⣿⣿⣿⣿⣿⢧⠸⣿⣷⠀⡀⠐⠀⠠⢿⣿⡿⠆⠀⠀⠀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠸⣷⡄⠀⠀⠀⠀⠀⣶⣄⠙⠿⣿⣿⡇⢀⢀⣼⣿⣿⠀⣿⠀⢸⣿⣿⣿⣿⣿⣿⣿⣾⠰⣿⡿⣸⣯⠀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ]],
                    --     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠘⣿⡀⠀⠀⠀⠀⢹⣿⣦⢀⠘⠟⠁⠀⣾⣿⣿⢇⠀⠇⠂⣸⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣿⣿⣏⣾⠯⠀⠀⠀⠀⠀⢂⠀⠀⠀⠀⠀       ]],
                    --
                    -- }

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
                    -- comp:text_component_render({
                    --     comp:text_component(":(){ :|:& };:", "center", "ProfileRed"),
                    -- })
                    --
                    comp:text_component_render({
                        comp:text_component("yes i have a girlfriend", "center", "ProfileBlue"),
                    })

                    --
                    -- Rest of your format function remains the same
                    comp:separator_render()

                    -- comp:text_component_render({
                    --     comp:text_component("hasn't it been a long time since you've had a flying dream?",
                    --         "center", "ProfileBlue"),
                    -- })

                    comp:text_component_render({
                        comp:text_component("yes she goes to a different school",
                            "center", "ProfileBlue"),
                    })

                    comp:separator_render()

                    comp:text_component_render({
                        comp:text_component("no you would not know her and you cant talk to her", "center", "ProfileRed"),
                    })

                    comp:text_component_render({
                        comp:text_component("because i said so", "center", "ProfileRed"),
                    })
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()
                    comp:separator_render()

                    comp:text_component_render({
                        comp:text_component("www.icodeeverything.com", "center", "ProfileThemeBg"),
                    })

                    -- comp:git_contributions_render("ProfileGreen")
                end,
            })
            vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })

            local user_mappings = {
                n = {
                    [LOAD_SESSION] = "<cmd>SessionRestore<cr>",
                    [OLD_FILES] = "<cmd>FzfLua oldfiles<cr>",
                    [FILES] = "<cmd>FzfLua files<cr>",
                    [NVIM] = "<cmd>FzfLua files cwd=$HOME/.config/nvim<cr>",
                    [LIVE_GREP] = "<cmd>FzfLua live_grep<cr>",
                    [ENEW] = "<cmd>enew<cr>",
                    [LAZY] = "<cmd>Lazy<cr>",
                    [COLORSCHEMES] = "<cmd>Telescope colorscheme<cr>"
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
