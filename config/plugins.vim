"---------- Plugins auto install --------------------------
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')  " Location ~/.config/nvim/init.vim
let g:vim_bootstrap_langs = "c,html,javascript,lua,typescript"
let g:vim_bootstrap_editor = "vim"				" nvim or vim
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

"---------------------- Plugins ------------

call plug#begin(expand('~/.config/nvim/plugged'))

"--------- Autocomplete -----------

Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'

Plug 'mhartington/formatter.nvim'
"---- File managment
"
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'norcalli/snippets.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'mbbill/undotree'

" Plug 'wincent/corpus'

"--------- Git Plugins ----------

" Plug 'voldikss/vim-floaterm'

"---- utility plugins

Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'
" Plug 'jiangmiao/auto-pairs'
" Plug 'vimwiki/vimwiki'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

"========== Syntax highlight -------

" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'SubeetKD/glow.nvim', {'branch': 'Escaping-spaces-in-file-name','do': ':GlowInstall'}
Plug 'mboughaba/i3config.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

"================ Color Schemes ======================="

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'NieTiger/halcyon-neovim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'chriskempson/base16-vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

call plug#end()
