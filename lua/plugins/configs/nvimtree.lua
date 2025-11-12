-- File explorer replacement for neo-tree
-- https://github.com/nvim-tree/nvim-tree.lua

return {
    'nvim-tree/nvim-tree.lua',
    event = 'VimEnter',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { '\\', ':NvimTreeToggle<CR>', desc = 'NvimTree reveal', silent = true },
    },
    opts = {
        filters = { dotfiles = false, custom = { '.git' } },
        hijack_cursor = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        view = {
            signcolumn = 'no',
            float = {
                enable = false, -- disables floating window if you were using it
            },
        },
        renderer = {
            root_folder_label = false,
            highlight_git = true,
            indent_markers = { enable = true },
            icons = {
                glyphs = {
                    default = '󰈚',
                    folder = {
                        default = '',
                        empty = '',
                        empty_open = '',
                        open = '',
                        symlink = '',
                    },
                    git = { unmerged = '' },
                },
            },
        },
    },
}
