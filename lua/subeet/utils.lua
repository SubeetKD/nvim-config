-- setting up nonicons
local icons = require "nvim-nonicons"
icons.get("file")

-- setting up lspkind (icons in the completion menu)
require("lspkind").init(
  {
    with_text = true,
    symbol_map = {
      Text = "",
      Method = "ƒ",
      Function = "",
      Constructor = "",
      Variable = "",
      Class = "",
      Interface = "ﰮ",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "了",
      Keyword = "",
      Snippet = "﬌",
      Color = "",
      File = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = ""
    }
  }
)

-- colorizer.nvim   : preview of the colors
local function colorizer_setup()
  local has_colorizer, colorizer = pcall(require, "colorizer")
  if not has_colorizer then
    return
  end
  colorizer.setup({
    "*",
    html = { mode = 'background' }
  }, {mode = 'foreground'})
end
colorizer_setup()

-- lsp_colors       : for adding lsp colors
local function lsp_colors_setup()
  local has_lsp_colors, lsp_colors = pcall(require, "lsp_colors")
  if not has_lsp_colors then
    return
  end
  lsp_colors.setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
  })
end
lsp_colors_setup()

-- vim wiki settings
-- TODO: See the index of the diary.
vim.g.vimwiki_list = {
  {
    path = '~/coding/vimwiki_new',
    syntax = 'markdown',
    ext = '.md',
  },
}
