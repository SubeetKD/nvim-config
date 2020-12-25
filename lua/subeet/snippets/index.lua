local snip = require("snippets")

-- snippets per language
local java_snips = require("subeet.snippets.java")
local cpp_snips = require("subeet.snippets.cpp")

snip.snippets = {
    _global = {
        todo = "TODO(Subeet): --> ",
        uname = function()
            return vim.loop.os_uname.sysname
        end,
        date = os.date
    },
    java = java_snips,
    cpp = cpp_snips
}
