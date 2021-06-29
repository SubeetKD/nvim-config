-- TODO: Make it better

require "nvim-treesitter.configs".setup {
  -- ensure_installed = { 'c', 'cpp', 'java', 'lua', 'javascript', 'python' },
  ensure_installed = 'all',

  highlight = {
    enable = true,
    use_languagetree = false,
    disable = {"json"},
  },

  incremental_selection = {
    enable = true,
    keymaps = { -- mappings for incremental selection (visual mappings)
      init_selection = '<M-w>',    -- maps in normal mode to init the node/scope selection
      node_incremental = '<M-w>',  -- increment to the upper named parent
      scope_incremental = '<M-e>', -- increment to the upper scope (as defined in locals.scm)
      node_decremental = '<M-C-w>',  -- decrement to the previous node
    },
  },

  textobjects = {

    -- don't know how to do this
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },

    -- mappings for swapping arguments
    swap = {
      enable = true,
      swap_next = {
        ['<M-t>s'] = "@parameter.inner",
      },
      swap_previous = {
        ['<M-t>S'] = "@parameter.inner",
      },

    },
  },

  context_commentstring = {
    enable = true,
    config = {
      -- TODO: Figure this out or wait for Conni to do it for me
      -- just like the rest of my open source work.
      c   = '// %s',
      lua = '-- %s',
    },
  },

  autotag = {
    enable = true,
    filetypes = { "html", "xml"},
  }

}
