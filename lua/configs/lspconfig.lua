-- File: ~/.config/nvim/lua/configs/lspconfig.lua

require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Gunakan opsi on_attach standar bawaan NvChad tanpa campuran nvim-navic
local lsp_opts = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Daftar LSP aktif Anda (sesuaikan dengan yang biasa Anda gunakan)
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "intelephense" }

-- Jalankan konfigurasi loop standar
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, lsp_opts)
end

-- Konfigurasi khusus Dart (jika Anda menggunakannya)
vim.lsp.config("dartls", vim.tbl_deep_extend("force", lsp_opts, {
  cmd = { "dart", "language-server", "--protocol=lsp" },
}))
table.insert(servers, "dartls")

-- Aktifkan semua server
vim.lsp.enable(servers)
