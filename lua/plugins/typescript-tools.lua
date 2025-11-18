return {
    "pmizio/typescript-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig",
        "VonHeikemen/lsp-zero.nvim"
    },
    opts = {
        on_attach = function(client, bufnr)
            -- Disable ts_ls to avoid conflicts
            vim.cmd("LspStop ts_ls")
            
            local opts = { buffer = bufnr }
            local keymap = vim.keymap.set
            
            -- LSP keymaps (same as your existing ones)
            keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
            keymap('n', '<leader>5', vim.diagnostic.open_float, { desc = 'Show error under cursor' })
            keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
            keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
            
            -- TypeScript specific commands
            keymap('n', '<leader>tso', '<cmd>TSToolsOrganizeImports<cr>', { desc = 'Organize Imports' })
            keymap('n', '<leader>tsr', '<cmd>TSToolsRenameFile<cr>', { desc = 'Rename File' })
            keymap('n', '<leader>tsi', '<cmd>TSToolsAddMissingImports<cr>', { desc = 'Add Missing Imports' })
            keymap('n', '<leader>tsu', '<cmd>TSToolsRemoveUnusedImports<cr>', { desc = 'Remove Unused Imports' })
        end,
        settings = {
            separate_diagnostic_server = true,
            publish_diagnostic_on = "insert_leave",
            expose_as_code_action = {},
            tsserver_path = nil,
            tsserver_plugins = {},
            tsserver_max_memory = "auto",
            tsserver_format_options = {},
            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeCompletionsForModuleExports = true,
                quotePreference = "auto",
                updateImportsOnFileMove = { enabled = "always" },
            },
            tsserver_locale = "en",
            complete_function_calls = false,
            include_completions_with_insert_text = true,
            code_lens = "off",
            disable_member_code_lens = true,
            jsx_close_tag = {
                enable = false,
                filetypes = { "javascriptreact", "typescriptreact" },
            }
        },
    },
}