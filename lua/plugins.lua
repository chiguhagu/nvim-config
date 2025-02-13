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
})

