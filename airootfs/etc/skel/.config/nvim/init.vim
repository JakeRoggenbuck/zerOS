call plug#begin('~/.vim/plugged')
" Code
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'jakeroggenbuck/vim-snow-script-syntax'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'lervag/vimtex'

" Python
Plug 'nvie/vim-flake8'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Organization
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Themes
Plug 'morhetz/gruvbox'
"Plug 'baskerville/bubblegum'
"Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'roosta/srcery'
"Plug 'joshdick/onedark.vim'
"Plug 'ajh17/spacegray.vim'

" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'

" Navigation UI
Plug 'justinmk/vim-sneak'
Plug 't9md/vim-choosewin'

" Misc
"Plug 'jakeroggenbuck/vim-character-creator'
"Plug 'jakeroggenbuck/vim-selection-test'

call plug#end()

let mapleader =","
set number
" Spelling
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>[s [sz=
map <leader>]s ]sz=
" Set splitting
set splitbelow splitright
" Tab stop
set ts=4 sw=4
set encoding=UTF-8
set history=1000
set undolevels=1000
colorscheme iceberg
set viminfo+=n~/.config/nvim/viminfo
" Notes
let g:notes_directories = ['~/Library/vim-notes']
" Tab airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" Sneaking
let g:sneak#label = 1
" Window selection
let g:choosewin_overlay_enable = 1
" Rainbow parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

let g:vimtex_view_general_viewer = "zathura"

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Git Gutter updatetime
set updatetime=200

" Choose window
nmap <leader>-  <Plug>(choosewin)

" Lint python using black
nmap <leader>l :execute ":!command black '" . expand('%:p') . "'"<CR>

" Pusho
nmap <leader>ps :!command git push origin $(git symbolic-ref --short HEAD)<CR>

" Lint using flake8
autocmd FileType python map <leader>lm :call flake8#Flake8()<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set hlsearch!<cr>

" Change current directory to the directory of the file in buffer
nmap <silent> <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <Leader>fu :CtrlPFunky<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:notes_list_bullets = ['•', '◦', '▸', '▹', '▪', '▫']

" Git files/ files
nmap <leader>gf :GFiles<CR>
nmap <leader>f :Files<CR>
" Git status
nmap <leader>gs :G<CR>

" Merge conflicts
nmap <leader>gdj :diffget //3<CR>
nmap <leader>gdf :diffget //2<CR>

" Move lines
nnoremap <leader>H :m-2<cr>==
nnoremap <leader>J :m+<cr>==
xnoremap <leader>K :m-2<cr>gv=gv
xnoremap <leader>L :m'>+<cr>gv=gv

" New buffer
nnoremap <leader>B :enew<cr>

" Change buffers
nnoremap <leader><Tab> :bnext<cr>
nnoremap <leader><S-Tab> :bprevious<cr>
" Cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" Split window
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

" Move windows like window manager
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" Commit
nmap <leader>gc :Gcommit

nnoremap <C-p> :GFiles<CR>

set nocompatible
filetype plugin on
syntax on
