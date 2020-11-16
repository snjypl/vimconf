call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'psf/black'
Plug 'junegunn/fzf.vim'
" Plug 'chuling/equinusocio-material.vim'
call plug#end()
runtime basic.vim 
runtime conf.d/coc.vim
runtime conf.d/plugin.vim

