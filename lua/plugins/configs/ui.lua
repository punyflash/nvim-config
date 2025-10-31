return {
    { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        'gmr458/vscode_modern_theme.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require('vscode_modern').setup {
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true,
            }

            vim.cmd.colorscheme 'vscode_modern'
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim' },
        config = function()
            local git_blame = require('gitblame')
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                },
                sections = {
                    lualine_c = {
                        { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
                    },
                },
                inactive_sections = {
                    lualine_c = {
                        { 'filename', path = 1 },
                    },
                },
                extensions = {
                    'nvim-tree',
                    'toggleterm',
                    'lazy',
                    'mason',
                },
            }
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                separator_style = 'thin',
                diagnostics = 'nvim_lsp',
                color_icons = true,
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'Files',
                        highlight = 'Directory',
                        text_align = 'center',
                        separator = true,
                    },
                },
            },
        },
    },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            'rcarriga/nvim-notify',
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
}
