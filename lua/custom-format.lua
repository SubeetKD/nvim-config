-- require('format').setup({
--   cpp = {
--     astyle = function ()
--       returns {
--         exe = 'astyle',
--         args = { "--stdin", vim.api.nvim_buf_get_name(0)},
--         stdin = true
--       }
--     end
--   },
-- })
require('format').setup({
    javascript = {
        prettier = function()
            return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote' },
                stdin = true
            }
        end
    },
    lua = {
        luafmt = function()
            return {
                exe = "luafmt",
                args = { "--indent-count", 2, "--stdin"},
                stdin = true
            }
        end
    },
    cpp = {
        cpp = function()
            return {
                exe = "clang-format",
                args = { "-style='{IndentWidth: 4 }'" },
                stdin = true
            }
        end
    }
})
