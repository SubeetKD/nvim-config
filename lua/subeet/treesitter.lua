local myTreeSitter = require('nvim-treesitter.configs')
local myIcons = require('nvim-web-devicons')

myTreeSitter.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
    },
    indent = {
        enable = false,
    }
}

myIcons.setup {
    default = true;
}
