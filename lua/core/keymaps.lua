local map = require("helpers.keys").map

-- autocenter cursor toggle
vim.keymap.set({ 'n', 'v' }, '<leader>zz', require('stay-centered').toggle, { desc = 'Toggle stay-centered.nvim' })

-- LSP keymaps to add to your keymaps.lua file
local keymap = require("helpers.keys").map

-- LSP actions
keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition")
keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to Declaration")
keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation")
keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to Type Definition")
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", "Find References")
keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help")
keymap("n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol")
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", "Format Code")
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions")

-- Diagnostics
keymap("n", "<leader>dl", "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics")
keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic")
keymap("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic")
keymap("n", "<leader>ds", "<cmd>lua vim.diagnostic.setloclist()<cr>", "Diagnostics List")

-- LSP management
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
keymap("n", "<leader>lm", "<cmd>Mason<cr>", "Mason")

vim.keymap.set('n', '<leader>ct', ':colorscheme tokyonight<CR>', { desc = 'ColorScheme TokyoNight' })


_G.nvim_tree_state = {
    expanded = false
}

function _G.expand_collapse()
    if _G.nvim_tree_state.expanded then
        require("nvim-tree.api").tree.collapse_all()
    else
        require("nvim-tree.api").tree.expand_all()
    end
    _G.nvim_tree_state.expanded = not _G.nvim_tree_state.expanded
end

_G.toggle_tree_expand_collapse = toggle_tree_expand_collapse


-- File explorer keymap
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle File Explorer' })
vim.keymap.set('n', '<Esc>', ':NvimTreeClose<CR>', { desc = 'close file explorer' })
vim.keymap.set('n', '<leader>E', ':lua _G.expand_collapse()<CR>', { noremap = true, silent = true })

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Help Tags' })

-- i set L D U R to be one key right because it feels awkward otherwise
-- Down
vim.keymap.set({ 'n', 'v' }, 'l', 'k', { desc = 'Move down' })
-- Up
vim.keymap.set({ 'n', 'v' }, 'k', 'j', { desc = 'Move up' })
-- Right
vim.keymap.set({ 'n', 'v' }, ';', 'l', { desc = 'Move right' })
-- Left
vim.keymap.set({ 'n', 'v' }, 'j', 'h', { desc = 'Move left' })


-- Down (C-w l becomes C-w j)
vim.keymap.set('n', '<C-l>', '<C-w>k', { desc = 'Move to window below' })
-- Up (C-w k becomes C-w k)
vim.keymap.set('n', '<C-k>', '<C-w>j', { desc = 'Move to window above' })
-- Right (C-w ; becomes C-w l)
vim.keymap.set('n', '<C-;>', '<C-w>l', { desc = 'Move to window right' })
-- Left (C-w j becomes C-w h)
vim.keymap.set('n', '<C-j>', '<C-w>h', { desc = 'Move to window left' })

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>")

-- Quick access to some common actions
map("n", "<leader>fw", "<cmd>w<cr>", "Write")
map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
map("n", "<leader>dw", "<cmd>close<cr>", "Window")

-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Easier access to beginning and end of lines
map("n", "<M-j>", "^", "Go to beginning of line")
map("n", "<M-;>", "$", "Go to end of line")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>db", buffers.delete_this, "Current buffer")
map("n", "<leader>do", buffers.delete_others, "Other buffers")
map("n", "<leader>da", buffers.delete_all, "All buffers")

-- Navigate buffers
map("n", "<S-;>", ":bnext<CR>")
map("n", "<S-j>", ":bprevious<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")
