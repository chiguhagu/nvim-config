-- treesitter.lua

require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua" }, -- Adjust as needed
    highlight = { enable = true },
    indent = { enable = true },
})

