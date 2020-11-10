local tele = require('telescope.builtin')
local themes = require('telescope.themes')

local M = {}

function M.edit_dotfile()
    tele.git_files{
        shorten_path = true,
        cwd = "~/.local/src/dot_file/config/nvim",
        prompt = " %% Dotfile %% ",
        height = 20,

        layout_strategy = 'horizontal',
        layout_options = {
            preview_width = 0.9,
        }
    }
end

-- find files error if uncommented find_command
function M.find_files()
    tele.find_files{
        -- shorten_path = true,
        -- find_command = "fdfind"
    }
end

function M.buffer()
    tele.buffers()
end

function M.live_grep()
    tele.live_grep()
end
return M
