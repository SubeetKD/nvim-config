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
    use {'wbthomason/packer.nvim', opt=true}

    -- LSP and completion
    use { 'neovim/nvim-lspconfig'}
    use { 'nvim-lua/completion-nvim'}
    use { 'anott03/nvim-lspinstall'}
    use { 'glepnir/lspsaga.nvim'}
    use { 'kosayoda/nvim-lightbulb'}

    -- Helper Plugins
    use { 'junegunn/fzf', run = vim.fn['fzf#install()']  }  -- for fzf-checkout}
    use { 'nvim-lua/popup.nvim' } -- telescope ...
    use { 'nvim-lua/plenary.nvim'} -- telescope ...
    use { 'mboughaba/i3config.vim'} -- i3config

    -- snippets and commenter
    use { 'norcalli/snippets.nvim'}
    use { 'b3nj5m1n/kommentary'}
    use { 'nvim-telescope/telescope.nvim'}

    -- Git config
    -- use { 'TimUntersberger/neogit'}
    use { 'f-person/git-blame.nvim'}
    use { 'lewis6991/gitsigns.nvim'}
    use { 'tpope/vim-fugitive'}
    use { 'stsewd/fzf-checkout.vim'}

    -- note and utility
    use { 'alvan/vim-closetag'}
    use { 'vimwiki/vimwiki'}
    use { 'romainl/vim-cool'}

    -- Visual improvements
    use { 'junegunn/goyo.vim'}
    use { 'Yggdroot/indentLine'}
    use { 'norcalli/nvim-colorizer.lua'}
    -- use { 'glacambre/firenvim', run = vim.fn['firenvim#install'](0) }
  
    -- Statusline and file tree
    use { 'glepnir/galaxyline.nvim' ,branch = 'main'}
    use { 'kyazdani42/nvim-web-devicons'}
    use { 'kyazdani42/nvim-tree.lua'}
    use { 'ryanoasis/vim-devicons'}
  
    -- Colorscheme Messy 
  
    -- gitsign compatible (don't know)
    use { 'mhartington/oceanic-next'}
    use { 'ayu-theme/ayu-vim'}
    use { 'dracula/vim', as = 'dracula' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'Th3Whit3Wolf/one-nvim'}
    use { 'chriskempson/base16-vim'}
  
    -- Not compatible
    use { 'patstockwell/vim-monokai-tasty'}
    use { 'sickill/vim-monokai'}
    use { 'tomasr/molokai'}
    use { 'joshdick/onedark.vim'}
    use { 'gruvbox-community/gruvbox'}
    use { 'tjdevries/colorbuddy.vim'}
    use { 'tjdevries/gruvbuddy.nvim'}
    use { 'tomasiser/vim-code-dark'}
    use { 'glepnir/zephyr-nvim'}
    -- use { 'npxbr/gruvbox.nvim'}
end)
