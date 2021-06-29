local borders = {
  { "┌", "NormalFloat" },
  { "─", "NormalFloat" },
  { "┐", "NormalFloat" },
  { "│", "NormalFloat" },
  { "┘", "NormalFloat" },
  { "─", "NormalFloat" },
  { "└", "NormalFloat" },
  { "│", "NormalFloat" },
}

-- -- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 10,
    prefix = "■",
  },
  signs = true,
  update_in_insert = true,
})

-- add border to hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = borders,
})

-- TODO(subeet)
-- better formatting handler, check if local prettierc is present then use that
-- else use default config.


-- TODO: Better handle for lsp rename (steal it from tj config)
