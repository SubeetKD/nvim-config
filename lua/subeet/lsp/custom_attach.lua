local M = {}

-- TODO: better mappings
M.custom_attach = function(client, bufnr)

  -- get filetype
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  -- Utility function for setting mapping and options
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  local function mapper(mode, keymap, command)
    buf_set_keymap(mode, keymap, "<cmd>" .. command .. "<cr>", opts)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- hover document
  mapper ("n", "K", "lua vim.lsp.buf.hover()")

  -- lsp references
  mapper("n", '<leader>vlr', "Telescope lsp_references<cr>")

  -- lsp rename
  mapper('n', '<leader>vrn', 'lua vim.lsp.buf.rename()')

  --- go to definition
  mapper("n", '<leader>vgd', 'lua vim.lsp.buf.goto_definition()')

  -- set formatting command
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- send the diagnostics to the quickfix list
  buf_set_keymap("n", "<leader>lq", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

  if filetype == "java" then

    -- code action
    buf_set_keymap("n", "<leader>vca", "<cmd>lua require'jdtls'.code_action()<cr>", opts)
    buf_set_keymap("v", "<leader>vca", "<esc><cmd>lua require'jdtls'.code_action(true)<cr>", opts)

    -- TODO: add the refactoring mapping for java.
    buf_set_keymap('n', "<leader>vr", "<cmd>lua require('jdtls').code_action(false, 'refactor')<cr>",opts)

    buf_set_keymap("n", "<leader>voi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    buf_set_keymap("n", "<leader>vtc", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    buf_set_keymap("n", "<leader>vtn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    buf_set_keymap("v", "<leader>vev", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    buf_set_keymap("n", "<leader>vev", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    buf_set_keymap("v", "<leader>vem", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    require "jdtls.setup".add_commands()
    -- require "jdtls".setup_dap()      currently not installed dap.
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document
          autocmd!
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
      false
    )
  end

  -- lsp-signature setup (better to do here)
  require("lsp_signature").on_attach({
    bind = true,
  })

  -- setup commands
  vim.api.nvim_exec(
    [[
      command! Format lua vim.lsp.buf.formatting_sync()
    ]],
    false
  )

end

return M
