"================Vim Plug=======================+
call plug#begin('~/.nvim/plugged')
Plug 'https://github.com/justinmk/vim-sneak' "movement plugin, s + 2 chracters
Plug 'reedes/vim-colors-pencil' "for airline theme
Plug 'junegunn/seoul256.vim' "best light theme
Plug 'junegunn/vim-easy-align' "really nice aligning
Plug 'https://github.com/tpope/vim-fugitive.git' "cool git plugin
Plug 'https://github.com/scrooloose/nerdtree.git' "File tree for browsing files in a prettier manor
Plug 'https://github.com/tpope/vim-repeat.git' "plugins repeat too
Plug 'terryma/vim-multiple-cursors' "multiple cursors like sublimetext
Plug 'vim-airline/vim-airline' " fancy status bar
Plug 'https://github.com/mbbill/undotree.git' "cool undo tree
Plug 'https://github.com/Shougo/unite.vim' "fuzzy search
Plug 'ervandew/supertab' "makes omnicompleation tab instead of the awful c-x c-o for omnicompleation
Plug 'neomake/neomake' " syntax checking and linting 
"c/c++ plugins
Plug 'octol/vim-cpp-enhanced-highlight' "better syntax hilighting
Plug 'majutsushi/tagbar'
"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim' "autocomplete with includes
"Racket
Plug 'wlangstroth/vim-racket'
"Rust
Plug 'rust-lang/rust.vim' "Rust language support
"Rust auto complete
Plug 'ebfe/vim-racer'
"fsharp
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
"Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {
      \ 'for': 'typescript',
      \ 'do':  'make',
      \}
call plug#end()
"+==============usability==============+
if $SHELL =~ 'fish'
  set shell='/bin/sh'
endif
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
set smarttab
"can make windows size zero
set winminheight=0
"====================Keybinds==================+
"alternitive to escape
imap jj <Esc>
"make control b bd
nnoremap <C-b> :bd<CR>

"remap leader to space
let mapleader = " "

"move between windows with ctrl + hjkl
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
"window control
nmap <silent> <C-s> :split<CR>
nmap <silent> <C-v> :vsplit<CR>
"+=================general changes=============+
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

"Fix problems with permissions
set backupdir=~/.config/nvim/backup
"+===============PLUGINS=================+
"+================Vim Easy Align==============+
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"+================Fugitive===================+
nnoremap <leader>c :Gcommit<CR>
nnoremap <leader>d :Gvdiff<CR>
nnoremap <leader>s :Gstatus<CR>
nnoremap <leader>p :Gpush<CR>
"+==========Vim Multiple Cursors=============+

"+===============Vim Clang===============+

"===============Deoplete===============+
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"+===============Nerdtree=============+
"close vim if nerdtree is the last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"space o toggle nerdtre
map <Leader>o :NERDTreeToggle<CR>
"+===========Tagbar============+"
nnoremap <Leader>t :TagbarToggle<CR>
"+==========Undo Tree=========+
nnoremap <Leader>u :UndotreeToggle<CR>
"+===============airline==============+
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='pencil'
"turn off this awful feature that is awful
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
"+========go-vim==========+
"+===========Unite==========+
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>
"+=====Super Tab======+
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"+=======Vim Sneak=====+
let g:sneak#streak = 1
"+========neomake======+
call neomake#configure#automake('w')
"leder e to see errors
nnoremap <leader>e :lwindow<CR>
"+=====ts vim====+
