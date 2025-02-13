-- Set the path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- Clone lazy.nvim if not installed
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load Neovim basic settings
require("options")      -- Editor options configuration
require("keymaps")      -- Key mappings
require("plugins")      -- Plugin management
require("lsp")          -- LSP configuration
require("treesitter")   -- Syntax highlighting
require("cmp")          -- Code completion
require("telescope")    -- File search tool

