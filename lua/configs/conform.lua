local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" }, -- .jsx
    typescriptreact = { "prettier" }, -- .tsx
    css = { "prettier" },
    html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 300,
    lsp_fallback = true,
  },
}

return options
