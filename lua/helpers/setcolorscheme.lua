local M = {}

local default_theme = "tokyonight-day"
local config_file = vim.fn.stdpath("data") .. "/colorscheme.txt"

-- Read saved colorscheme
function M.load()
    local file = io.open(config_file, "r")
    if file then
        local saved_theme = file:read("*line")
        file:close()
        return saved_theme or default_theme
    end
    return default_theme
end

-- Save current colorscheme to file
function M.save_current()
    local current = vim.g.colors_name
    if current then
        local file = io.open(config_file, "w")
        if file then
            file:write(current)
            file:close()
        end
    end
end

-- Setup autocommand to save colorscheme on exit
function M.setup()
    -- Load saved colorscheme on startup
    local saved_colorscheme = M.load()
    vim.cmd.colorscheme(saved_colorscheme)
    
    -- Save colorscheme when exiting
    vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
            M.save_current()
        end,
    })
end

return M
