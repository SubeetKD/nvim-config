local tele = require("telescope.builtin")
local themes = require("telescope.themes")

local M = {}

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {},
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true
  }
}
function M.edit_dotfile()
  require("telescope.builtin").find_files {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.local/src/nvim-config",
    width = .25,
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65
    }
  }
end

-- find files error if uncommented find_command
function M.find_files()
  tele.find_files {}
end

function M.buffer()
  tele.buffers()
end

function M.live_grep()
  tele.live_grep()
end
return M
