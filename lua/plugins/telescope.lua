   -- Fuzzy finder
return {
   {
     "nvim-telescope/telescope.nvim",
     dependencies = { "nvim-lua/plenary.nvim" },
     config = function()
       local telescope = require("telescope")
       local actions = require("telescope.actions")
       
       telescope.setup({
         defaults = {
           mappings = {
             i = {
               ["<M-j>"] = actions.move_selection_worse,
               ["<M-k>"] = actions.move_selection_next,
               ["<M-l>"] = actions.move_selection_previous,
               ["<M-;>"] = actions.move_selection_better,
             },
           },
         },
       })
     end,
   },
}

