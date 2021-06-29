local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local function plugins()
  use("wbthomason/packer.nvim")

  ------      LSP PLUGINS     -------

  use("neovim/nvim-lspconfig")                            -- config plugins
  use("mfussenegger/nvim-jdtls")                          -- java plugin

  use("onsails/lspkind-nvim")                             -- icon in the completion
  use("hrsh7th/nvim-compe")                               -- completion plugin

  use('ray-x/lsp_signature.nvim')                         -- open signature help when writing functions

  use("L3MON4D3/LuaSnip")

  ------      Testing plugin ------------
  use"vim-test/vim-test"
  -- use'mhartington/formatter.nvim'
  use"mfussenegger/nvim-dap"

  -----      COLORSCHEME        ----------------

  use"tjdevries/colorbuddy.vim"
  use"tjdevries/gruvbuddy.nvim"
  -- use"joshdick/onedark.vim"
  use"folke/tokyonight.nvim"

  use {
    "hoob3rt/lualine.nvim",
    requires = {'kyazdani42/nvim-web-devicons'},
  }

  ------------------ File management -----------------

  use {
    "kyazdani42/nvim-tree.lua",
    reeuires = {
      "kyazdani42/nvim-web-devicons"
    }
  }

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },
  })

  -- use { 'camspiers/snap', rocks = {'fzy'}}

  --------        TPOPE              ---------
  use "tpope/vim-fugitive"
  use "tpope/vim-commentary"
  use "tpope/vim-surround"

  ------        TREESITTER AND MODULES      ----
  use{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }          -- treesitter plugin
  use('nvim-treesitter/nvim-treesitter-textobjects')                    -- treesitter textobjects

  -- rainbow parenthesis.
  use({
    "p00f/nvim-ts-rainbow",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })

  -- auto pairs
  use({
    "windwp/nvim-ts-autotag",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })

  -- context commentstring
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
  })

  ---------------- GIT PLUGINS --------------------------------

  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use("f-person/git-blame.nvim")

  ------        UTILITY     -----

  use("yamatsum/nvim-web-nonicons")
  use("folke/lsp-colors.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("mbbill/undotree")
  use("mboughaba/i3config.vim")
  use "vimwiki/vimwiki"
  use("jbyuki/venn.nvim")

  -- Lua
  use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
          require("todo-comments").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }


  use {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
  }
end

return require("packer").startup(plugins)
