-- options.lua
local options = {
    number = true,          -- Show line numbers
    relativenumber = true,  -- Show relative line numbers
    tabstop = 4,            -- Number of spaces for a tab
    shiftwidth = 4,         -- Number of spaces for auto-indentation
    expandtab = true,       -- Convert tabs to spaces
    smartindent = true,     -- Enable smart indentation
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

