local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local builtin = require("el.builtin")
local extensions = require("el.extensions")
local sections = require("el.sections")
local subscribe = require("el.subscribe")
local lsp_statusline = require("el.plugins.lsp_status")

local git_icon =
    subscribe.buf_autocmd(
    "el_file_icon",
    "BufRead",
    function(_, bufnr)
        local icon = extensions.file_icon(_, bufnr)
        if icon then
            return icon .. " "
        end

        return ""
    end
)

local git_branch =
    subscribe.buf_autocmd(
    "el_git_branch",
    "BufEnter",
    function(window, buffer)
        local branch = extensions.git_branch(window, buffer)
        if branch then
            return " " .. extensions.git_icon() .. " " .. branch
        end
    end
)

local git_changes =
    subscribe.buf_autocmd(
    "el_git_changes",
    "BufWritePost",
    function(window, buffer)
        return extensions.git_changes(window, buffer)
    end
)

require("el").setup {
    generator = function(_, _)
        return {
            " // ",
            extensions.gen_mode {
                format_string = " %s "
            },
            git_branch,
            " ",
            sections.split,
            git_icon,
            sections.maximum_width(builtin.responsive_file(140, 90), 0.30),
            sections.collapse_builtin {
                " ",
                builtin.modified_flag
            },
            sections.split,
            lsp_statusline.current_function,
            lsp_statusline.server_progress,
            git_changes,
            "[",
            builtin.line_with_width(3),
            ":",
            builtin.column_with_width(2),
            "]",
            sections.collapse_builtin {
                "[",
                builtin.help_list,
                builtin.readonly_list,
                "]"
            },
            builtin.filetype
        }
    end
}
-- local generator = function()
--   local segments = {}

--   table.insert(segments, "[ GOD MODE ]")

--   -- Option 2, just a function that returns a string.
--   table.insert(
--     segments,
--     extensions.gen_mode {
--       format_string = " %s "
--     }
--   )

--   -- mode returns the current mode.
--   -- ...
--   table.insert(
--     segments,
--     subscribe.buf_autocmd(
--       "el_git_status",
--       "BufWritePost",
--       function(window, buffer)
--         return extensions.git_changes(window, buffer)
--       end
--     )
--   )
--   table.insert(
--     segments,
--     subscribe.buf_autocmd(
--       "el_git_branch",
--       "BufEnter",
--       function(window, buffer)
--         return extensions.git_branch(window, buffer)
--       end
--     )
--   )
--   table.insert(
--     segments,
--     subscribe.buf_autocmd(
--       "el_file_icon",
--       "BufRead",
--       function(_, buffer)
--         return extensions.file_icon(_, buffer)
--       end
--     )
--   )

--   return segments
-- end

-- require("el").setup({generator = generator})

-- require("indent_guides").options = {
--     indent_levels = 30,
--     indent_guide_size = 1,
--     indent_start_level = 1,
--     indent_space_guides = true,
--     indent_tab_guides = true,
--     indent_pretty_guides = true,
--     indent_soft_pattern = "\\s",
--     exclude_filetypes = {"help"}
--     -- even_colors = { fg color , bg color };
--     -- odd_colors = { fg color , bg color };
-- }
