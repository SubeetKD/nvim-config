local nvim_lsp = require("lspconfig")
local completion = require("completion")

local chain_complete_list = {
    default = {
        {complete_items = {'lsp','snippet'}},
        {complete_items = {'path'}, triggered_only = {"/"}},
        {complete_items = {'buffers'}},
    },
    string = {
        {complete_items = {'path'}, triggered_only = {"/"}},
    }, comment = { {complete_items = {'path'}, triggered_only = {"/"}},
        {complete_items = {'snippet'}},
        {complete_items = {'buffers'}},
    }
}

local custom_attach = function(client)
    print("'" .. client.name .. "' language server attached")
    completion.on_attach({
        matching_strategy_list = {'exact','fuzzy'},
        chain_complete_list = chain_complete_list,
    })
end

local minimal_custom_attach = function(client)
    print("'" .. client.name .. "' language server attached")
    completion.on_attach(client)
end

-- Java Language Server
nvim_lsp.jdtls.setup(
    {
        root_dir = nvim_lsp.util.root_pattern(".git", "pom.xml", "build.xml"),
        on_attach = custom_attach
    }
)

nvim_lsp.clangd.setup(
    {
        on_attach = custom_attach
    }
)

-- Vim language server
nvim_lsp.vimls.setup({
    on_attach = minimal_custom_attach
})

-- Vim language server
nvim_lsp.pyls.setup({
    on_attach = custom_attach
})

-- Bash language server
nvim_lsp.bashls.setup({
    on_attach = minimal_custom_attach
})

-- Lua language server
nvim_lsp.sumneko_lua.setup({
settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
      }
    },
    on_attach = minimal_custom_attach })

-- Json Language server
nvim_lsp.jsonls.setup({
    on_attach = minimal_custom_attach
    })

-- HTML Language server
nvim_lsp.html.setup({
    on_attach = minimal_custom_attach
    })

-- efm languageserver doesn't work
-- require"lspconfig".efm.setup {
--     on_attach = minimal_custom_attach,
--     init_options = {documentFormatting = true},
--     settings = {
--       -- Require formatter configuration files to load
--       rootMarkers = {
--         ".lua-format",
--         ".eslintrc.cjs",
--         ".eslintrc",
--         ".eslintrc.json",
--         ".eslintrc.js",
--         ".prettierrc",
--         ".prettierrc.js",
--         ".prettierrc.json",
--         ".prettierrc.yml",
--         ".prettierrc.yaml",
--         ".prettier.config.js",
--         ".prettier.config.cjs",
--       },
--       -- languages = {lua = {{formatCommand = "lua-format -i", formatStdin = true}}},
--     },
--     filetypes = {"lua", "typescript", "typescriptreact", "javascript", "html", "json"},
--   }



