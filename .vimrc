" Vundle Section Start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'

" Markdown highlight
Plugin 'plasticboy/vim-markdown'

" instant view markdown
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" open a NERDTree automatically when vim starts up
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
Plugin 'kien/ctrlp.vim'

" syntax highlight for css and less
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
" set trigger for autocomplete
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }
" syntax hightlight for javascript
Plugin 'pangloss/vim-javascript'
" stronger autocomplete
Plugin 'marijnh/tern_for_vim'
" code style
Plugin 'scrooloose/syntastic'
" set checkers for different languages
let g:syntastic_javascript_checkers = ['eslint']

call vundle#end()
filetype plugin indent on
"Vundle Section End

" General 
" set encoding
set encoding=utf-8 
set fileencodings=ucs-bom,utf-8,cp936,GB2312,big5

" set line number
set number
set relativenumber

" highlight keywords
syntax on

" set indent
filetype plugin indent on

" the width of tab
set tabstop=4
set expandtab
set softtabstop=4

" set the scrolloff
set scrolloff=3

" search
set ic
set hlsearch
" if the single line is too long, then show part of it
set display=lastline

" Status Bar
" always show the status bar
set laststatus=2
" set the theme of statusline to solarized_dark
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" brackets automatch
set showmatch

" 80 characters restriction
set colorcolumn=81

" autocomplete command line
set wildmenu

" Binding shortcuts
inoremap jk <esc> 
nnoremap <space> :

" turn word to upper or lower case
nnoremap gu gU
nnoremap gl gu

" edit a file with sudo
cmap sw w !sudo tee >/dev/null %

" wordcount
function! ChineseCount() range
        let save = @z
        silent exec 'normal! gv"zy'
        let text = @z
        let @z = save
        silent exec 'normal! gv'
        let cc = 0
        for char in split(text, '\zs')
                if char2nr(char) >= 0x2000
                        let cc += 1
                endif
        endfor
        echo "Count of Chinese charasters is:"
        echo cc
endfunc

vnoremap <F7> :call ChineseCount()<cr>
