local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
    execute 'PackerCompile'
    execute 'PackerInstall'
end

vim.cmd [[packadd packer.nvim]]

-- TODO
-- 1. Clean up of plugins

return require('packer').startup(function()
    -- for packer itself
    use {'wbthomason/packer.nvim', opt=true}

    -- essential utility
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                  disable_filetype = { "TelescopePrompt" , "vim" },
              })
          end
      }
    use 'tpope/vim-fugitive'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }

    -- LSP setup
    use 'neovim/nvim-lspconfig'
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('lspkind').init({
                -- enables text annotations
                --
                -- default: true
                with_text = true,

                -- default symbol map
                -- can be either 'default' or
                -- 'codicons' for codicon preset (requires vscode-codicons font installed)
                --
                -- default: 'default'
                preset = 'codicons',

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = '',
                    Method = 'ƒ',
                    Function = '',
                    Constructor = '',
                    Variable = '',
                    Class = '',
                    Interface = 'ﰮ',
                    Module = '',
                    Property = '',
                    Unit = '',
                    Value = '',
                    Enum = '了',
                    Keyword = '',
                    Snippet = '﬌',
                    Color = '',
                    File = '',
                    Folder = '',
                    EnumMember = '',
                    Constant = '',
                    Struct = ''
                },
            })
        end
    }

    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require "lsp_signature".setup({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                handler_opts = {
                    border = "single"
                }
            })
        end
    }

    -- Installer for lsp
    use {
        'kabouzeid/nvim-lspinstall',
    }

    -- completion
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require'compe'.setup {
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                resolve_timeout = 800;
                incomplete_delay = 400;
                max_abbr_width = 100;
                max_kind_width = 100;
                max_menu_width = 100;
                documentation = {
                    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
                    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                    max_width = 120,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1,
                };

                source = {
                    orgmode = true;
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    vsnip = false;
                    ultisnips = false;
                    luasnip = true;
                };
            }
        end
    }

    -- snippet
    use {
        'L3MON4D3/LuaSnip',
        config = function ()
            -- currently nothing, will add later (maybe source other file)
        end
    }

    -- java specific
    use 'mfussenegger/nvim-jdtls'

    -- debugger
    use 'mfussenegger/nvim-dap'

    -- telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- colorscheme
    use {
        'tjdevries/gruvbuddy.nvim',
        requires = {
            'tjdevries/colorbuddy.vim',
        },
        config = function()
            require('colorbuddy').colorscheme('gruvbuddy')
        end
    }

    -- Basic lsp colors
    use { 
        'folke/lsp-colors.nvim',
        -- Lua
        require("lsp-colors").setup({
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
        })
    }

    -- statusline
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'subeet.colorscheme.evilline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
