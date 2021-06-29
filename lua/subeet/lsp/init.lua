--- Lsp configuration.
--
-- Languages supported :
--   1. C++,C
--   2. css
--   3. Html
--   4. javascript, typescript.
--   5. Java
--   6. lua, vimscript
--
--   Server installation:  Manual.
--
--   Completion plugin: nvim-compe
--
--   Language specific plugin: nvim-jdtls
---

-- all the imports
local has_lsp, lspconfig = pcall(require, "lspconfig")
local _, lspconfig_util = pcall(require, "lspconfig.util")
local custom_attach = require("subeet.lsp.custom_attach").custom_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()

if not has_lsp then
  return
end

------------------------------------------------------------------------------------------
------------------------------- Some basic configuration ---------------------------------
------------------------------------------------------------------------------------------

-- require the handlers.
require("subeet.lsp.handlers")

-- completion plugin
require("subeet.lsp.compe")

-- enable snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TODO: all the important options
local custom_on_init = function(client)
  -- print('Language Server Protocol started!')

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end

--------------------------------------------------------------------------------------------
------------------------------- Language server setup --------------------------------------
--------------------------------------------------------------------------------------------

-- -- bash language server.
-- lspconfig.bashls.setup({
--   capabilities = capabilities,
--   on_attach = custom_attach,
--   on_init = custom_on_init,
--   cmd = { "haskell-language-server-wrapper", "--lsp" },
--   filetypes = { "haskell", "lhaskell" },
--   root_dir = lspconfig_util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", "xmonad.hs"),
--   settings = {
--     languageServerHaskell = {
--       formattingProvider = "ormolu",
--     },
--   },
-- })

-- python language server
-- Installation Instruction: install pip
--
-- `pip install 'python-language-server[all]`
--
lspconfig.pyls.setup({
  capabilities = capabilities,
  on_attach = custom_attach,
  on_init = custom_on_init,
})

-- javascript language servers
lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_init = custom_on_init,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    custom_attach(client)
  end,
})

lspconfig.html.setup({
  capabilities = capabilities,
  on_attach = custom_attach,
  on_init = custom_on_init,
})


lspconfig.vimls.setup({
  capabilities = capabilities,
  on_attach = custom_attach,
  on_init = custom_on_init,
})

-- -- haskell language server (uses slack)
-- lspconfig.hls.setup({
--   capabilities = capabilities,
--   on_attach = custom_attach,
--   on_init = custom_on_init,
-- })

-- setup clangd
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
  },
  capabilities = capabilities,
  on_init = custom_on_init,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    custom_attach(client)
  end,
})

-- css language server
lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = custom_attach,
  on_init = custom_on_init,
})

-- lua language server

-- find a better way to do this
local sumneko_root_path = vim.fn.getenv("HOME") .. "/Desktop/lua-language-server"
require("lspconfig").sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = custom_attach,
  on_init = custom_on_init,
  cmd = {
    sumneko_root_path .. "/bin/Linux/lua-language-server",
    "-E",
    sumneko_root_path .. "/main.lua",
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "use", "__SUBEET" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          -- ["/usr/share/awesome/lib"] = true,                         -- make the current laptop slow
        },
        -- maxPreload = 2000,
        -- preloadFileSize = 1000,
      },
    },
  },
})

-- setup efm language server
lspconfig.efm.setup {
  init_options = {
    documentFormatting = true,
    codeAction = true,
  },
  settings = {
    languages = require "subeet.lsp.efm"
  },
  filetypes = {
    "javascript",
    "typescript",
    "lua",
    "yaml",
  }
}

-- java setup

require('subeet.lsp.luasnips')

