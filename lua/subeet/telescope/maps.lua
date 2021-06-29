-- mappings for telescope.
local tele = require "telescope.builtin"
local themes = require "telescope.themes"
-- editing config.
local M = {}

function M.edit_neovim()
  tele.find_files {
    prompt_title = ">> Config <<",
    shorten_path = false,
    cwd = "$HOME/.config/nvim",
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.65
    }
  }
end

-- find files

function M.find_file()
  tele.find_files {
    shorten_path = true
  }
end

function M.git_files()
  tele.git_files {
    shorten_path = true,
    layout_strategy = "horizontal",
    layout_config = {
      preview_width = 0.55,
    }
  }
end


function M.builtin()
  local opts =
    themes.get_dropdown {
    windblend = 10,
    border = true,
    previewer = false,
    shorten_path = false
  }
  tele.builtin(opts)
end

function M.buffers()
  local opts =
    themes.get_dropdown {
    windblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
    show_all_buffers = true,
  }
  tele.buffers(opts)
end


return M
