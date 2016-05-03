"================Vim Plug=======================+
call plug#begin('~/.nvim/plugged')
Plug 'reedes/vim-colors-pencil' "for airline theme
Plug 'junegunn/seoul256.vim' "best light theme
Plug 'junegunn/vim-easy-align' "really nice aligning
Plug 'https://github.com/tpope/vim-fugitive.git' "cool git plugin
Plug 'https://github.com/scrooloose/nerdtree.git' "File tree for browsing files in a prettier manor
Plug 'https://github.com/tpope/vim-repeat.git' "plugins repeat too
Plug 'https://github.com/terryma/vim-multiple-cursors.git' "multiple cursors like sublimetext
Plug 'vim-airline/vim-airline' " fancy status bar
Plug 'https://github.com/mbbill/undotree.git' "cool undo tree
Plug 'https://github.com/Shougo/unite.vim' "fuzzy search
Plug 'ervandew/supertab' "makes tab instead of the awful c-x c-o for omnicompleation
"c/c++ plugins
Plug 'octol/vim-cpp-enhanced-highlight' "better syntax hilighting
Plug 'a.vim' "alternate between header files easially :A, :AS to split and switch
Plug 'justmao945/vim-clang'
Plug 'majutsushi/tagbar'
"Autocomplete - for languages without their own system 
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
"Racket
Plug 'wlangstroth/vim-racket'
"Rust
Plug 'rust-lang/rust.vim' "Rust language support
"Plug 'racer-rust/vim-racer' "Rust auto complete
Plug 'ebfe/vim-racer'
"scheme/HTML
Plug 'kien/rainbow_parentheses.vim'
"fsharp
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
call plug#end()
"+==============stop the trainwreck==============+

"this section stops the trainwreck that is default Vim no longer needed in neovim
"set nocompatible
"make buffers not annoying
set hidden
"enable syntax highlighting
syntax enable
"set default coloscheme to not terrible
colorscheme seoul256-light
set background=light "changes to light
let g:seoul256_background = 256
colo seoul256 "make it lighter
"tab width = 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
"spaces if fsharp
autocmd BufRead,BufNewFile *.fsi,*.fs :set expandtab

set smarttab
"can make windows size zero
set winminheight=0

"====================Keybinds==================+
"this makes me not have to use esc yay
imap jj <Esc>
"make control b bd
nnoremap <C-b> :bd<CR>
"make it scroll more
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"remap leader to `
let mapleader = "`"

"move between windows with control+hjkl
"nmap <silent> <C-k> :wincmd k<CR>
"nmap <silent> <C-j> :wincmd j<CR>
"nmap <silent> <C-h> :wincmd h<CR>
"nmap <silent> <C-l> :wincmd l<CR>
"window control
nmap <silent> <Leader>s :split<CR>
nmap <silent> <Leader>v :vsplit<CR>

"easy save
nmap <C-s> :w<CR>

"+=================general changes=============+
"change timeout of leader key
set ttimeout
set ttimeoutlen=50

"excessively longer history
set history=1000

"show other things in complete menu
set wildmenu
set wildmode=list:longest
set wildignore=".o,*.obj,*~,*.png,*.jpg,*.gif,*DS_STORE*,tmp/**,*.bmp

"ignore case sensitivity while searching
set ignorecase
set smartcase

"highlight search matches
set hlsearch

"change how many lines the curser shows when scrolling down
set scrolloff=6
set sidescrolloff=10
set sidescroll=1

"limited line numbering
set ruler

set number "show line numbers
set backspace=indent,eol,start

"+=============Scripts===========+
autocmd BufRead,BufNewFile *.txt,*.tex,*.md setlocal spell "turns on spellcheck for certain file types
"+===============PLUGINS=================+
"+================Vim Easy Align==============+
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"+================Fugitive===================+
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
"+==========Vim Multiple Cursors=============+

"+===============Vim Clang===============+
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++14'
"===============Deoplete===============+
"autocmd BufRead,BufNewFile ! *.{cpp,c,h,rs,rkt,fs,fsi,txt,md,tex} let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 0
"+===============Nerdtree=============+
"close vim if nerdtree is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"space o toggle nerdtre
map <Leader>1 :NERDTreeToggle<CR>
"+==========Rainbow Parenthesis=======+"
au VimEnter *.rkt,*.xml,*.html,*.clj RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBrnnoremap <C-k> aces
  "the colors for it
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'gray'],
    \ ['Blue',   'DarkGreen'],
    \ ['Darkcyan',    'Purple'],
    \ ['green',     'DarkOrchid3'],
    \ ['black',         'DarkBlue'],
    \ ]

"+===========Tagbar============+"
nnoremap <Leader>2 :TagbarToggle<CR>
"+==========Undo Tree=========+
nnoremap <Leader>3 :UndotreeToggle<CR>
"+===============airline==============+
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='pencil'
"turn off this awful feature
let g:airline#extensions#whitespace#enabled = 0
"+==============Vim Racer========+
set hidden
let g:racer_cmd = "/usr/bin/racer"
let $RUST_SRC_PATH="/usr/src/rust/src"
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}
"+===========Unite==========+
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>
"+=====Super Tab======+
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"Fix problems with permissions
set backupdir=~/.config/nvim/backup
