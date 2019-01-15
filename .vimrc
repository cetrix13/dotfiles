set nocompatible                    " Make vim modern
so ~/.vim/plugins.vim               " Load vim plugins
set autowriteall                    " Automaticaly saves the files when switching
set complete=.,w,b,u                " Set outcompletion
set timeoutlen=3000                 " Set delay for commands
set history=50

"-------------Visuals--------------"
colorscheme atom-dark
set t_Co=256                        " Use 256 colors. Useful for terminal vim
set guifont=Fira_Code:h15           " Set up font and size
set guioptions-=e                   " Removes GUI tabs from top toolbar
set guioptions-=r                   " Removes right hand scroll bar
set guioptions-=l                   " Removes left hand scroll bar
set guioptions-=L                   " Removes left hand scroll bar in splits
set nofoldenable                    " Disable folding
set guioptions-=R                   " Removes right hand scroll bar in splits
set go-=L                           " Removes left hand scroll bar
if has("gui_running")
    set macligatures                " We want pretty symbols when available
endif
set linespace=16
set noshowmode                      " hide the default mode text (e.g. -- INSERT -- below the statusline)
set showmatch                       " highlights matching brackets
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
set smartindent                     " turn on autoindenting of blocks
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
"hi LineNr guifg=#4B4E4F
"hi LineNr guibg=bg

"-------------Search--------------"
set hlsearch
set incsearch


"------------FileTypes--------------"
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.sass set filetype=css
au BufNewFile,BufRead *.scss set filetype=css
au BufNewFile,BufRead *.blade.php set filetype=html
au BufNewFile,BufRead *.json set filetype=js
au BufNewFile,BufRead *.md set filetype=markdown


"------------Macros--------------"
let @a = "hello World!"



"----------------Mapping---------------"
" Insert mode mappings
" Easy escaping to normal model
imap jj <esc>

" Visual mode mappings
vmap <leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

" Normal mode mappings
nmap <leader>es :e ~/.vim/snippets/
nmap <leader>ep :e ~/.vim/plugins.vim
nmap <leader>ev :tabedit ~/.vimrc<cr>
" Create/edit file in the current directory
nmap <leader><leader>e :e %:p:h/
" Create/edit file in the current directory
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
nmap <leader>lr :e app/Http/routes.php<cr>
nmap <leader>la :e config/app.php<cr>156Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader><leader>c :CtrlP<cr>app/Http/Controllers/
nmap <leader>lc :e composer.json<cr>
" Create split below
nmap :sp :rightbelow sp<cr>
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
" Edit todo list for project
nmap <Leader>do :e todo.txt<cr>
nmap ,2  :call AddDependency()<cr>
" Run PHPUnit tests
nmap <Leader>t :!phpunit --colors=always<cr>
nmap <Leader>m yiw:!phpunit --colors=always --filter ^R"<cr>
" Down is really the next line
nnoremap j gj
nnoremap k gk
" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" Search smarter
nnoremap / /\v
"And no shift magic on comments
nnoremap <silent> >> :call ShiftLine()<CR>|
" Delete word under cursor
nmap <leader><leader>d daw
" Replace word under cursor
nmap <leader><leader>c caw

"----------------Plugins---------------"
"/
" Airline
"/
let g:airline_powerline_fonts = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#whitespace#checks = ['indent', 'long', 'mixed-indent-file']
let g:airline#extensions#ctrlp#color_template = 'normal'
"let g:airline#extensions#whitespace#enabled = 1
let g:airline_section_z = '%l'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" Powerline (Fancy thingy at bottom stuff)
" let g:Powerline_symbols = 'fancy'


"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:18,results:18'
let ctrlp_show_hidden = 1
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/node_modules/**
set wildignore+=*.svg,*.eot,*.woff

nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>


"/
"/ Easy Motion
"/
" <Leader>f{char} to move to {char}
map  <leader><leader>f <Plug>(easymotion-bd-f)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <leader><leader>l <Plug>(easymotion-bd-jk)
nmap <leader><leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)


"/
"/ Emmet-vim
"/
let g:user_emmet_leader_key='<C-a>'
let g:user_emmet_install_global = 0
augroup setfiletypes
    autocmd!
    autocmd FileType html,css,php EmmetInstall
augroup END

"/
"/ Matching tags
"/
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'js' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1,
    \ 'php' : 1,
    \}

"/
"/ Gpeplace.vim
"/
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

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
" Remove trailling whitespace on :w
augroup removetrailingspace
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

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

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

" Include automaticaly full namespace for a class
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

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
        exec "normal i<?php namespace " . namespace . "; \<C-m>\<C-m>"
    else
        exec "normal i<?php \<C-m>"
    endif

    " Open class
    exec "normal iclass " . name . " {\<C-m>}\<C-[>O\<C-[>"

    exec "normal i\<C-M>    public function __construct()\<C-M>{\<C-M>\<C-M>}\<C-[>"
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


"-------------Tips and tricks--------------"
" - press zz to instanstly postions cursor in the center
" - press ^[ to instantly move to the method declaration
" - press ,f to instantly find a method
" - press :tn to go the the next occurence of the method
" - press :tp to go to the previous occurence of the method
" - press :ts to select to which occurence of the method to go
" - press ctrl + w + o to make buffer window in full screen
" - enter :Gsearch for a global search and replace
" - enter :Ag 'pattern' for a local search
" - enter :s/search pattern/replace pattern for a multiple replace
" - press vit to select content of the tag e.g <p> patter </p>
" - press cit to change the text between the html tags
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
" - press ctrl + ] to jump to the method declaration
" - press ctrl + a + <leader> to trigger emmet
