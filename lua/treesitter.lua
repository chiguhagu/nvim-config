-- treesitter.lua

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "terraform",
        "hcl",
    },
    highlight = { enable = true },
    indent = { enable = true },
})

