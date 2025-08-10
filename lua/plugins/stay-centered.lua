-- wizard magic done in this file...
return {
    {
        'arnamak/stay-centered.nvim',
        lazy = false,
        config = function()
            require('stay-centered').setup({
                -- your config options here
            })
            -- Disable it after setup
            require('stay-centered').disable()
        end
    }
}
