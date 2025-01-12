local cmp = require("cmp")

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                cmp.confirm({ select = true }) -- Automatically confirm the selected suggestion
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Auto-select the first suggestion on Enter
    }
})
