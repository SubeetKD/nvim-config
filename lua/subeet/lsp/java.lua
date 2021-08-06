local jdtls, has_jdtls = pcall(require, 'jdtls')

if not has_jdtls then
    return
end

local on_attach = require('subeet.lsp.on_attach')

jdtls.setup_dap()

local bundles = {
    vim.fn.glob("/home/subeet/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
}

vim.list_extend(bundles, vim.split(vim.fn.glob("/home/subeet/dev/microsoft/vscode-java-test/server/*.jar"), "\n"))

local root_makers = {
    'gradle.build',
    'pom.xml',
}


local home = os.getenv("HOME")
local workspace = home .. "/workspace"
local root_dir = require('jdtls.setup').find_root(root_makers)

local capabilities = {
    workspace = {
        configuration = true,
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true,
            }
        }
    }
}

local workspace_folder = workspace .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
    flags = {
        allow_incremental_sync = true,
    },
    capabilities = capabilities,
    on_attach = on_attach,
}

config.settings = {
    ['java.format.settings.profile'] = "GoogleStyle",
    java = {
        signatureHelp = { enabled = true };
        contentProvider = { preferred = 'fernflower' };
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*"
            }
        };
        sources = {
            organizeImports = {
                starThreshold = 9999;
                staticStarThreshold = 9999;
            };
        };
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            }
        };
        configuration = {
            runtimes = {
                {
                    name = "JavaSE-1.8",
                    path = "/usr/lib/jvm/java-1.8.0-openjdk-amd64/",
                    default = true,
                },
            }
        };
    };
}

config.cmd = {'java-lsp.sh', workspace_folder}
config.on_attach = on_attach
config.on_init = function (client, _)
    client.notify('workspace/didChangeConfiguration', {settings = config.settings})
end

local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
config.init_options = {
    bundles = bundles;
    extendedClientCapabilities = extendedClientCapabilities;
}

jdtls.start_or_attach(config)
