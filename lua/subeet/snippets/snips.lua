local snips = require("snippets")
snips.use_suggested_mappings()

local cppsnips = require("subeet.snippets.cpp")
local pythonsnips = require("subeet.snippets.python")

local cpp = cppsnips

snips.snippets = {
    _global = {
        -- Insert a basic snippet, which is a string.
        todo = "TODO(ashkan): ",
        kitty_font = [[
font_family      ${1:FiraCode Nerd Font}
bold_font        $1 Bold
italic_font      $1 Italic
bold_italic_font $1 Bold Italic]],
        uname = function()
            return vim.loop.os_uname().sysname
        end,
        date = os.date,
        note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]]
    },
    cpp = cpp,
    python = pythonsnips
}
