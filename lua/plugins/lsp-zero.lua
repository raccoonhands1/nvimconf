return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = 'minimal',
                    border = 'rounded',
                    source = 'always',
                    header = '',
                    prefix = '',
                },
            })
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })

                -- Add your custom keymaps here if you prefer not to modify keymaps.lua
                local opts = { buffer = bufnr }
                local keymap = vim.keymap.set
                keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
                keymap('n', '<leader>5', vim.diagnostic.open_float, { desc = 'Show error under cursor' })
                keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
                keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
            end)

            -- Configure Mason to automatically install LSP servers
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',      -- TypeScript/JavaScript (kept for fallback)
                    'lua_ls',     -- Lua
                    'gopls',      -- Go
                    'omnisharp',  -- C#
                },
                handlers = {
                    lsp_zero.default_setup,
                    -- Skip ts_ls setup since typescript-tools.nvim handles it
                    ts_ls = function() end,
                },
            })

            -- Godot LSP setup (doesn't use Mason)
            local lspconfig = require('lspconfig')

            -- GDScript setup for Godot
            lspconfig.gdscript.setup({
                capabilities = lsp_zero.get_capabilities(),
                flags = {
                    debounce_text_changes = 150,
                },
                filetypes = { "gd", "gdscript", "gdscript3" },
            })

            -- OmniSharp setup for C# (including Godot C# projects)
            lspconfig.omnisharp.setup({
                capabilities = lsp_zero.get_capabilities(),
                cmd = { "omnisharp" },
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
            })

            -- Setup nvim-cmp for autocompletion
            local cmp = require('cmp')
            local cmp_action = lsp_zero.cmp_action()

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    }
}
