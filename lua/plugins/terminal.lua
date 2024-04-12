return {
    'akinsho/toggleterm.nvim',
    opts = {
        open_mapping = '<C-\\>',
        size = function(term)
            if term.direction == 'horizontal' then
                return 15
            elseif term.direction == 'vertical' then
                return vim.o.columns * 0.1
            end
        end,
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)
    end
}