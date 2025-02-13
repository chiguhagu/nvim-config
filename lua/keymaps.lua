-- keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Use space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save file with Ctrl + S
keymap("n", "<C-s>", ":w<CR>", opts)

-- Quit Neovim with Ctrl + Q
keymap("n", "<C-q>", ":q<CR>", opts)

-- Move between windows easily
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

