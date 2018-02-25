set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'godlygeek/tabular'
Plugin 'leafgarland/typescript-vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nelstrom/vim-markdown-folding'

call vundle#end()
filetype plugin indent on

syntax on

" Enable markdown fold
let g:markdown_folding=1

" Show statusline for vim-airline
set laststatus=2

" Syntastic remaps E to Errors, but I want it to stay for Explorer
command E Explore

" Switch between relativenumber and number by pressing F3
nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Ruby autocomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" TSLime keymaps
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pep8']
let g:syntastic_python_flake8_config_file='.flake8'

" Enable autoPEP8 by <F8> click
noremap <F8> :PymodeLintAuto<CR>

" Let backspace behave as usual
set backspace=2

" Set relativenumber as default
set relativenumber

" Indentation for different type of files
" by default, the indent is 2 spaces. 
set expandtab
set shiftwidth=2
set tabstop=2

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for python/js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype jade setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Split line in normal mode
:nnoremap <NL> i<CR><ESC>

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme = 'wombat'
let g:airline_symbols.space = "\ua0"
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
let g:airline_powerline_fonts = 1
