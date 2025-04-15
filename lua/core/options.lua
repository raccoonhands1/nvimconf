local opts = {
    shiftwidth = 4,
    tabstop = 4,
    expandtab = true,
    termguicolors = true,
    number = true,
    relativenumber = true,
    smartindent = true,
    smartcase = true,
    cursorline = true,
    wrap = false,
    syntax = "on",
    virtualedit = "all"
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

local colorscheme = require("helpers.setcolorscheme")
vim.cmd.colorscheme(colorscheme)
