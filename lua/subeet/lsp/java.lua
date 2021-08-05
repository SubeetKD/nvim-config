local jdtls = require('jdtls')
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

local workspace = "/home/subeet/workspace"

local java_config = {
    cmd = {"java-lsp.sh", workspace .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
    root_dir = require('jdtls.setup').find_root(root_makers),
    init_options = {
        bundles = bundles,
    },
    on_attach = on_attach,
    settings = {
        runtime = {
            version = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-1.8.0-openjdk-amd64",
            default = true,
        },
    },
}

jdtls.start_or_attach(java_config)
