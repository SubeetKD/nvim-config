-- global functions.

-- making table to store all the functions to avoid minimalist.
-- add boolean key value pair indicating with plugin is installed.
__SUBEET = {}

---Prints a table in human readable manner
---@param v table to print
---@return table
P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

-- saves the file and if lua/vim then executes also
function __SUBEET.save_and_execute()
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  vim.cmd("w")
  if filetype == "vim" then
    vim.cmd("so %")
  elseif filetype == "lua" then
    vim.cmd("luafile %")
  end
end

-- -- mark the plugins which are installed.
-- function __SUBEET.mark(name_of_plugin)
--   __SUBEET[name_of_plugin] = true
-- end

-- toggle NETRW
function __SUBEET.toggle_netrw()
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  if filetype == "netrw" then
    vim.api.nvim_buf_delete(0, {force = true})
  else
    vim.cmd("Ex")
  end
end

-- function for removing trailing whitespace
function __SUBEET.remove_trailing_whitespace()
  vim.cmd("%s/\\s\\+$//g")
end
