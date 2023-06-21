call plug#begin(stdpath('data') . '/plugged')

" Plug 'chuling/equinusocio-material.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'bfredl/nvim-ipy'
Plug 'bfredl/nvim-ipy'
Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kkoomen/vim-doge'
Plug 'lepture/vim-jinja'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'projekt0n/github-nvim-theme', { 'commit': '715c554' }
" Plug 'projekt0n/github-nvim-theme'
Plug 'psf/black'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'towolf/vim-helm'
call plug#end()
runtime conf.d/ntree.vim
runtime basic.vim 
runtime conf.d/coc.vim
runtime conf.d/plugin.vim
runtime conf.d/theme.vim
lua require('init')
