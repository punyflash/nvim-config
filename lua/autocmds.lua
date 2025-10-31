-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Change directory when opening a directory
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
    callback = function(data)
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
            return
        end

        vim.cmd.cd(data.file)

        require('nvim-tree.api').tree.toggle { focus = true }
    end,
})
