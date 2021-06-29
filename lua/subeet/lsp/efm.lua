-- TODO: add clang formatter

-- eslint configuration
local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

-- luaformat configuration
local luaFormat = {
  formatCommand = "luafmt --stdin",
  formatStdin = true
}

-- yaml
local yaml = {
  lintCommand = "yamllint -f parsable -",
  lintStdin = true
}

-- lua linter selene
local selene = {
  lintCommand = "selene ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
}

-- setup
return {
  typescript = {eslint_d},
  javascript = {eslint_d},
  typescriptreact = {eslint_d},
  javascriptreact = {eslint_d},
  lua = {luaFormat, selene},
  yaml = {yaml}
}
