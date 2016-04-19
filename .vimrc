set nocompatible                    " Make vim modern
so ~/.vim/plugins.vim               " Load vim plugins

set t_Co=256                       " Use 256 colors. Useful for terminal vim
set autowriteall                    " Automaticaly saves the files when switching
set complete=.,w,b,u                " Set outcompletion
set timeoutlen=3000                 " Set delay for commands


"-------------Visuals--------------"
colorscheme atom-dark
set guifont=Fira_Code:h15
set guioptions-=e                   " Removes GUI tabs from top toolbar
set guioptions-=r                   " Removes right hand scroll bar
set guioptions-=l                   " Removes left hand scroll bar
set guioptions-=L                   " Removes left hand scroll bar in splits
set guioptions-=R                   " Removes right hand scroll bar in splits
set go-=L                           " Removes left hand scroll bar
if has("gui_running")
    set macligatures                " We want pretty symbols when available
endif
set linespace=16
set showmode                        " always show what mode we're currently editing in
set nowrap                          " don't wrap lines
set tabstop=4                       " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4                   " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                       " expand tabs by default (overloadable per file type later)
set shiftwidth=4                    " number of spaces to use for autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
set nonumber                        " always show line numbers
set foldcolumn=2                    " fake custom left padding for each window
hi foldcolumn guibg=bg
hi vertsplit guifg=bg guibg=bg
set ignorecase                      " ignore case when searching
set smartcase                       " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                      " don't beep
set noerrorbells                    " don't beep
set autowrite                       " Save on buffer switch
set mouse=a                         " Scroll with mouse or touchpad
let mapleader = ","                 " With a map leader it's possible to do extra key combinations
let g:mapleader = "," 
" Change color of numbers column
hi LineNr guifg=#4B4E4F  
hi LineNr guibg=bg



"-------------Macros--------------"
let @a = "hello World!"



"-------------Search--------------"
set hlsearch
set incsearch



"----------------Mapping---------------"
" Visual mode mappings
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Normal mode mappings
nmap <leader>es :e ~/.vim/snippets/
nmap <leader>ev :tabedit ~/.vimrc<cr>
" Create/edit file in the current directory
nmap :ed :edit %:p:h/
" Insert a new line without going into insert mode
nmap oo o<Esc>k
nmap <leader><space> :nohlsearch<cr>
" Fast saves
nmap <leader>w :w!<cr>
" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap <c-e> :vertical res<cr>:res<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>
nmap <C-b> :NERDTreeToggle<cr>
"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>
nmap <leader>f :tag 
" Laravel framework commons
nmap <leader><leader>r :e app/Http/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader><leader>c :CtrlP<cr>app/Http/Controllers/
nmap <leader>lc :e composer.json<cr>



"-------------Plugins--------------"
"/
" Airline 
"/
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['ctrlp', 'nerdtree', 'vim-vinegar']
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file']
"let g:airline#extensions#whitespace#enabled = 1

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/ Auto paring 
"/

"/
"/ Gpeplace.vim 
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
" Familiar commands for file/symbol browsing

"/
"/ NerdTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Php-cs-fixer.vim 
"/
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ PDV documentator
"/

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>


"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" Include automaticaly namespace for a class
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Include automaticaly full namespace for a class
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


"Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :e todo.txt<cr>


" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>



" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Overrider default PHP syntax highliting
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap ,2  :call AddDependency()<cr>

"-------------Tips and tricks--------------"
" - press zz to instanstly postions cursor in the center
" - press ^[ to instantly move to the method declaration
" - press ,f to instantly find a method
" - press :tn to go the the next occurence of the method
" - press :tp to go to the previous occurence of the method
" - press :ts to select to which occurence of the method to go
" - press command + k to clean up the screen
" - press ctrl + w + o to make buffer window in full screen
" - enter :Gsearch for a global search and replace
" - enter :Ag 'pattern' for a local search 
" - enter :s/search pattern/replace pattern for a multiple replace
" - press vit to select content of the tag e.g <p> patter </p>
" - press vat to select content and tag all together
" - press % to jump to matching bracket or end of block
" - press :%s/pattern/replace/g to replace all occurences
" - press ggVG + = to autoindent the code
" - press ctrl + n for autocompletion
" - press ctrl + x + l in insert mode for a line autocompletion 
" - press cst to replace tag without deleting content
" - press cs'" to replace single quot to double quot 
" - press S to surround selected text with html tag 
" - press <leader>pf to autoformat the code to psr2
" - press <leader>cc comment line or block of code
" - press <leader>cu uncomment line or block of code 
" - press ctrl + e to expand window in split mode 
" - press <leader>d for a inserting a doc block
" - press <leader>cd to change working directory to the current one
