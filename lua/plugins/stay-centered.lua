return {
    {
        'arnamak/stay-centered.nvim',
        lazy = false,
        config = function()
            require('stay-centered').setup({
            })
            require('stay-centered').disable()
        end
    }
}
