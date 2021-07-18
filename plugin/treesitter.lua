local has_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')

if not has_treesitter then
    return
end

--- TODO Setup more treesitter module like (argumet swapper, node based selection, comment of string based on treesitter)

treesitter.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    }
}
