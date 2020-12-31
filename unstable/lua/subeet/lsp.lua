local nvim_lsp = require("lspconfig")
local completion = require("completion")

local chain_complete_list = {
    default = {
        {complete_items = {"lsp", "snippet"}},
        {complete_items = {"path"}, triggered_only = {"/"}},
        {complete_items = {"buffers"}}
    },
    string = {
        {complete_items = {"path"}, triggered_only = {"/"}}
    },
    comment = {
        {complete_items = {"path"}, triggered_only = {"/"}},
        {complete_items = {"snippet"}},
        {complete_items = {"buffers"}}
    }
}

local custom_attach = function(client)
    print("'" .. client.name .. "' language server attached")
    completion.on_attach(
        {
            matching_strategy_list = {"exact", "substring", "fuzzy"},
            chain_complete_list = chain_complete_list
        }
    )
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
        on_attach = function(client)
            -- renaming variable doesn't work may be due to this?
            -- client.resolved_capabilities.document_formatting = false
            custom_attach(client)
        end
    }
)

nvim_lsp.tsserver.setup {
    on_attach = custom_attach
}

-- Vim language server
nvim_lsp.vimls.setup(
    {
        on_attach = custom_attach
    }
)

-- Vim language server
nvim_lsp.pyright.setup(
    {
        on_attach = custom_attach
    }
)

-- Bash language server
nvim_lsp.bashls.setup(
    {
        on_attach = custom_attach
    }
)

-- Lua language server
nvim_lsp.sumneko_lua.setup(
    {
        settings = {
            Lua = {
                diagnostics = {
                    enable = true,
                    globals = {"vim"}
                }
            }
        },
        on_attach = custom_attach
    }
)

-- Json Language server
nvim_lsp.jsonls.setup(
    {
        on_attach = custom_attach
    }
)

-- HTML Language server
nvim_lsp.html.setup(
    {
        on_attach = custom_attach
    }
)

nvim_lsp.yamlls.setup {
    on_attach = custom_attach
}

-- having trouble to set up efm langserver so using diagnostic-langserver
-- for the moment.

local luafmt = require("subeet.formatters.lua")
local cppfmt = require("subeet.formatters.cpp")
local prettier = require("subeet.formatters.prettier")
local eslint = require("subeet.formatters.prettier")

-- guy talking about formating in neovim subreddit
-- nvim_lsp.efm.setup {
--     on_attach = custom_attach,
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             lua = {luafmt},
--             cpp = {cppfmt},
--             html = {prettier},
--             typescript = {prettier, eslint},
--             javascript = {prettier, eslint},
--             typescriptreact = {prettier, eslint},
--             javascriptreact = {prettier, eslint},
--             yaml = {prettier},
--             json = {prettier},
--             scss = {prettier},
--             css = {prettier},
--             markdown = {prettier}
--         }
--     }
-- }

nvim_lsp.efm.setup {
    on_attach = custom_attach,
    init_options = {documentFormatting = true},
    default_config = {
        cmd = {
            "efm-langserver",
            "-c",
            [["$HOME/.config/efm-langserver/config.yaml"]]
        }
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "lua",
        "cpp"
    }
}
