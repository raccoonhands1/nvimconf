return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
        keys = {
            { "<leader>A", function() require("harpoon"):list():add() end,     desc = "harpoon file", },
            {
                "<leader>a",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "harpoon quick menu",
            },
            { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
            { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
            { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
            { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
            { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
            { "<leader>j", function() require("harpoon"):list():prev() end,    desc = "nav to prev marker", },
            { "<leader>;", function() require("harpoon"):list():next() end,    desc = "nav to next marker", },
            {
                "<leader>=",
                function()
                    local harpoon = require("harpoon")
                    local term = harpoon:term(9)
                    vim.defer_fn(function()
                        term:send("ls -La")
                    end, 100)
                end,
                desc = "Open term 9 and send ls command"
            },
        },
    },
}
