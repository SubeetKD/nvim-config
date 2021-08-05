-- keymaps
local on_attach = function(client, bufnr)

    local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

  local opts = { noremap=true, silent=true }

    local function set_keymap(key, action)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', key,'<cmd>' .. action .. '<cr>',  opts)
    end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  -- for code action
  if filetype ~= "java" then
      set_keymap('<leader>vca', 'lua vim.lsp.buf.code_action()')
  end

  -- for hover
  set_keymap('K', 'lua vim.lsp.buf.hover()')

  -- for defination
  set_keymap('gd', 'lua vim.lsp.buf.definition()')

  -- rename
  set_keymap('<leader>rn', 'lua vim.lsp.buf.rename()')

  -- references
  set_keymap('<leader>vr', 'lua vim.lsp.buf.references()')

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    set_keymap("<space>f", "lua vim.lsp.buf.formatting()")
  elseif client.resolved_capabilities.document_range_formatting then
    set_keymap("<space>f", "lua vim.lsp.buf.range_formatting()")
  end

  -- java specific config
  if filetype == "java" then
      require('jdtls').setup_dap({
          hotcodereplace = 'auto'
      })

      -- add commands
      require('jdtls.setup').add_commands()
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

return {
    on_attach = on_attach
}
