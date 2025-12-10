return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            -- Set up keymaps directly instead of lazy loading
            vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end, { desc = "harpoon file" })
            vim.keymap.set("n", "<leader>a", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon quick menu" })
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "harpoon to file 3" })
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "harpoon to file 4" })
            vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "harpoon to file 5" })
            vim.keymap.set("n", "<leader>j", function() harpoon:list():prev() end, { desc = "nav to prev marker" })
            vim.keymap.set("n", "<leader>;", function() harpoon:list():next() end, { desc = "nav to next marker" })
            vim.keymap.set("n", "<leader>=", function()
                local term = harpoon:term(9)
                vim.defer_fn(function()
                    term:send("ls -La")
                end, 100)
            end, { desc = "Open term 9 and send ls command" })
        end,
    },
}
