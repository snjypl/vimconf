call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'psf/black'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'kkoomen/vim-doge'
Plug 'bfredl/nvim-ipy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bfredl/nvim-ipy'

" Plug 'chuling/equinusocio-material.vim'
call plug#end()
runtime basic.vim 
runtime conf.d/coc.vim
runtime conf.d/plugin.vim

