-- Manage plugins using Lazy.nvim
require("lazy").setup({
    -- LSP configuration for Neovim
    "neovim/nvim-lspconfig",

    -- Autocompletion framework
    "hrsh7th/nvim-cmp",

    -- Syntax highlighting and code parsing
    "nvim-treesitter/nvim-treesitter",

    -- Fuzzy finder and file search tool
    "nvim-telescope/telescope.nvim",

    -- Git integration (shows changes in the sign column)
    "lewis6991/gitsigns.nvim",

    -- Mason for managing LSP servers, DAP, Linters, and Formatters
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason LSPConfig for automatic configuration of installed LSP servers
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" },    -- Automatically install specified LSP servers
            })
        end,
    },

    -- Browse the file system and other tree like structures
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_befavior = "open_current",
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = false,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = {
                        ".git",
                        ".DS_Store",
                        ".history",
                    },
                },
            },
        },
    },

    -- UI Components Library for NeoVim
    {
        "MunifTanjim/nui.nvim",
    },

    -- All the lua functions I don't want to write twice
    {
        "nvim-lua/plenary.nvim",
    },

    -- Provides Nerd Font icons (glyphs) for use by Neovim plugins
    {
        "nvim-tree/nvim-web-devicons",
    },
})

