require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "tsp_server", "typescript-language-server" }
vim.lsp.enable(servers)
