local tele = require("telescope.builtin")

-- TODO
-- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/init.lua

local M = {}

function M.edit_nvim()
    tele.find_files {
        prompt_title = "<== Dotfiles ==>",
        shorten_path = true,
        cwd = "~/.local/src/nvim-config",
        width = .25,
        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.65
        }
    }
end

function M.builtin()
    tele.builtin()
end

function M.git_files()
    tele.git_files {
        prompt_title = "<== Git Files ==>",
        shorten_path = false,
        -- cwd = "~/.local/src/nvim-config",
        width = .45,
        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.55
        }
    }
end

function M.buffers()
    tele.buffers {
        prompt_title = "<== Buffers ==>",
        shorten_path = true,
        width = .45,
        layout_strategy = "horizontal",
        layout_config = {
            preview_width = .55
        }
    }
end

function M.live_grep()
    tele.live_grep {
        width = .25,
        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.65
        }
    }
end

return M
