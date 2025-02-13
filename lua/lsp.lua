-- lsp.lua

local lspconfig = require("lspconfig")

-- Enable language servers

local servers = { "lua_ls" }

for _, server in ipairs(servers) do
    lspconfig[server].setup({})
end

