--- TODO
--      1. make the custom mappings (don't call Telescope git_files).

local has_tele, telescope = pcall(require, "telescope")

if not has_tele then
	return
end

-- local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "➢ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false
      },
      vertical = {
        mirror = false
      }
    },
    -- file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 10,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {

    fzf_native = {
      override_generic_sorter = false,
      override_file_sorter = true
      -- case_mode = "smart_case"
    }

    -- fzf = {
    --   override_generic_sorter = false, -- override the generic sorter
    --   override_file_sorter = true,     -- override the file sorter
    --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    --   -- the default case_mode is "smart_case"
    -- }

  }
}

-- telescope.load_extension("fzf")
telescope.load_extension("fzy_native")
