require("formatter").setup(
    {
        logging = false,
        filetype = {
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                        stdin = true
                    }
                end
            },
            rust = {
                -- Rustfmt
                function()
                    return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            },
            cpp = {
                function()
                    return {
                        exe = "clang-format",
                        args = {"-style='{IndentWidth: 4 }'"},
                        stdin = true
                    }
                end
            }
        }
    }
)
