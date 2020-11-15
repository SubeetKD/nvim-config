local tree_sitter = require('nvim-treesitter.configs')

tree_sitter.setup{
    ensure_installed = {"cpp","lua","python","c","yaml","json","html"},
    highlight = {
        enable = true,
    },
    refactor = {
        highlight_definations = { enable = true },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "vrn",
            },
        },
    },
    indent = {
        enable = true,
    },
}
