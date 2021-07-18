local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')

if not has_treesitter then
    return
end

local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}

--- TODO Setup more treesitter module like (argumet swapper, node based selection, comment of string based on treesitter)

treesitter.setup {
    ensure_installed =  "all",
    highlight = {
        enable = true
    }
}
