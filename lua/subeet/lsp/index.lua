local nvim_lsp = require("lspconfig")
local completion = require("completion")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- TODO(Subeet) use nvim-jdtls
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.set_log_level("debug")

local chain_complete_list = {
    default = {
        {complete_items = {"lsp", "snippet"}},
        {complete_items = {"path"}, triggered_only = {"/"}},
        {complete_items = {"buffers"}}
    },
    string = {
        {complete_items = {"path"}, triggered_only = {"/"}}
    },
    comment = {}
}

-- vim.g.completion_chain_complete_list = chain_complete_list

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- TODO(Subeet) -> lspsaga floatterminal mappings
    local opts = {noremap = true, silent = true}

    -- Find the cursor word defination and references
    buf_set_keymap("n", "<leader>vgh", "<cmd>lua require('lspsaga.provider').lsp_finder()<CR>", opts)
    -- buf_set_keymap("n", "<leader>vgD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)

    -- Lspsaga preview Defination
    buf_set_keymap("n", "<leader>vgd", "<cmd>lua require'lspsaga.provider'.preview_definiton()<CR>", opts)

    -- Lspsaga hover doc
    buf_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    buf_set_keymap("n", "<leader>vgi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

    -- Lspsaga code actions
    buf_set_keymap("n", "<leader>vca", "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", opts)
    buf_set_keymap("v", "<leader>vca", "<cmd>'<,'lua require('lspsaga.codeaction').code_action()<cr>", opts)

    -- Lspsaga signature help
    buf_set_keymap("n", "<leader>vgs", "<cmd>lua requier('lspsaga.signaturehelp').signature_help()<CR>", opts)

    --[[ buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts) ]]
    -- Lsp rename
    buf_set_keymap("n", "<leader>vrn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- Lspsaga diagnostic
    buf_set_keymap("n", "<leader>ve", "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
    buf_set_keymap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

    -- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
          :hi LspReferenceRead cterm=bold ctermbg=red guibg=Black
          :hi LspReferenceText cterm=bold ctermbg=red guibg=Black
          :hi LspReferenceWrite cterm=bold ctermbg=red guibg=Black
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]],
            false
        )
    end
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end

    completion.on_attach(
        {
            matching_strategy_list = {"exact", "substring", "fuzzy"},
            chain_complete_list = chain_complete_list
        }
    )
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"cssls", "pyls", "gopls", "html", "vimls"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = on_attach
    }
end

local servers_no_format = {"tsserver"}
for _, lsp in ipairs(servers_no_format) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            on_attach(client)
        end
    }
end

--[[ nvim_lsp.jdtls.setup {
    capablities = capablities,
    cmd = { "java", "-Declipse.application=org.eclipse.jdt.ls.core.id1", "-Dosgi.bundles.defaultStartLevel=4", "-Declipse.product=org.eclipse.jdt.ls.core.product", "-Dlog.protocol=true", "-Dlog.level=ALL", "-Xms1g", "-Xmx2G", "-jar", "vim.NIL", "-configuration", "vim.NIL", "-data", "vim.NIL", "--add-modules=ALL-SYSTEM", "--add-opens java.base/java.util=ALL-UNNAMED", "--add-opens java.base/java.lang=ALL-UNNAMED" },
    cmd_env = {
      GRADLE_HOME = "/usr/share/gradle",
      JAR = vim.NIL
    },
    filetypes = { "java" },
    handlers = {
      ["language/status"] = <function 1>,
      ["textDocument/codeAction"] = <function 2>
    },
    init_options = {
      jvm_args = {},
      workspace = "/home/subeet/workspace"
    }
    root_dir = nvim_lsp.util.root_pattern(".git")
} ]]
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    cmd = {"clangd", "--background-index", "-fallback-style=Webkit"},
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        on_attach(client)
    end
}

-- does not require snippet support, but provides some snippet completion candidates out of the box
local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
local sumneko_root_path = "/home/subeet/.local/share/nvim/lspinstall/lua-langauge-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require "lspconfig".sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    capabilities = capabilities,
    default_config = {
        cmd = {
            "efm-langserver",
            "-c",
            [["$HOME/.config/efm-langserver/config.yaml"]]
        }
    },
    filetypes = {
        -- "python", -- removes the entire file with <cmd> w <cr>
        "lua",
        "html",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact"
    },
    on_attach = on_attach
}

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            spacing = 10,
            prefix = " "
        },
        signs = false,
        update_in_insert = false,
        underline = true
    }
)
