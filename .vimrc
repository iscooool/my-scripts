set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set number
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8
set autoindent
set sw=4
set ts=4
" set text width to 80
set tw=80
set colorcolumn=80
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set expandtab
let mapleader = ","
nnoremap <c-u> viwlU
" open vimrc and save vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" map c-[ to esc
noremap <c-[> <esc>

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>




call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_working_path_mode = 'rw'
Plugin 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               
let Tlist_WinWidt =28                  
let Tlist_Exit_OnlyWindow=1           
let Tlist_Use_Right_Window=1         
let Tlist_Use_Left_Windo =1             
Plugin 'bling/vim-airline'
let g:airline_theme="molokai" 
"let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

Plugin 'vim-airline/vim-airline-themes'
Plugin 'Solarized'
Plugin 'easymotion/vim-easymotion'
map <Leader><Leader> <Plug>(easymotion-prefix)
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeChDirMode = 2
map <c-n> :NERDTreeToggle<CR>
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
" When using tmux as 256color, use following lines to fix mapping problem.
if $TERM == 'screen-256color'
    map <esc>[[19~ <f8>
endif
nnoremap <f8> :TagbarToggle<CR>

let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
