" Szuruburu vimrc
" Last Update March 6 2019

set nocompatible
set fillchars+=vert:│

syntax on

" Vundle begins here; turn off filetype temporarily
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" ------------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'leafgarland/typescript-vim'
" Plugin 'Valloric/YouCompleteMe'
" JavaScript JSX React
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'

Plugin 'janko-m/vim-test'
Plugin 'alfredodeza/coveragepy.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'yonchu/accelerated-smooth-scroll'

" Color schemes
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'atelierbram/vim-colors_atelier-schemes'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

set term=screen-256color
colorscheme PaperColor

set autoindent
set shiftwidth=4
set noexpandtab
set tabstop=4
set bg=dark
set backspace=indent,eol,start
set ignorecase
set incsearch
set laststatus=2
set linebreak
set nobackup
set noerrorbells
set nolist
set noswapfile
set novb
set nowrap
set number
set numberwidth=5
set ruler
set scrolloff=8
set showmatch
set shortmess=I
set showcmd
set showmode
set sidescroll=1
set sidescrolloff=7
set smartcase
set undolevels=1000
set nrformats-=octal
set vb

" highlight ColorColumn ctermbg=black
set colorcolumn=

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
  \      'extends' : 'jsx',
    \  },
    \}


let g:vim_jsx_pretty_colorful_config = 1

let g:syntastic_python_flake8_args = "--ignore=E501 --max-complexity 10"

"CtrlP
let g:ctrlp_map = '<c-p>'

"Airline
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

let test#python#runner = 'pytest'

"Gvim mods
set encoding=utf-8
set hidden
set history=100
set mouse=a
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=Lo

" NERDtree settings
" ==================
" Autostart NERDtree on Vim startup
autocmd VimEnter * NERDTree

" Auto-close NERDtree on file opne
let NERDTreeQuitOnOpen = 1

"nerd-commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Show bookmarks on Vim startup
let NERDTreeShowBookmarks=1

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"NERDTree
map <C-n> :NERDTreeToggle<CR><C-w>=


" Quick write session with F2
map <F2> :mksession! ~/vim_session <cr>
" And load session with F3
map <F3> :source ~/vim_session <cr>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Emulate Enter key
nmap <S-d> o<Esc>

" Save with Ctrl+S
nmap <C-s> :w<CR>
imap <C-s> <Esc><Esc>:w<CR>i

" Tabs navigation
nmap <silent> <M-u> :tabn<CR>
nmap <silent> <M-y> :tabp<CR>
nmap <M-q> <C-w>q
nmap <M-S-q> :qa!<CR>

nmap <silent> <leader>T : TestFile<CR>
nmap <silent> <leader>a : TestSuite<CR>
nmap <silent> <leader>l : TestLast<CR>
nmap <silent> <leader>v : TestVisit<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

nmap <M-h> b
imap <M-h> <Esc><Esc>b
nmap <M-l> w
imap <M-l> <Esc><Esc>w

nmap <M-j> j
imap <M-j> <Esc><Esc>j
nmap <M-k> k
imap <M-k> <Esc><Esc>k

" Remove all trailing whitespace by pressing F4
noremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ for\ Powerline\ Medium\ 16
		colorscheme iceberg
	endif
endif

" Map alt sequences for terminal via Esc
" source: http://stackoverflow.com/a/10216459/15690
" NOTE: <Esc>O is used for special keys (e.g.)
" NOTE: drawback (with imap) - triggers timeout for Esc: use jk/kj, or press
" it twice,
" NOTE: Alt-<NR> mapped in tmux. TODO: change this?!
if ! has('nvim') && ! has('gui_running')
	fun! MySetupAltMapping(c)
		exec "set <A-".a:c.">=\e".a:c
	endfun

	for [c, n] in items({'a':'z', 'A':'N', 'P':'Z', '0':'9'})
		while 1
			call MySetupAltMapping(c)
			if c >= n
				break
			endif
			let c = nr2char(1+char2nr(c))
		endw
	endfor
	for c in [',', '.', '-', '#', '+', '<']
		call MySetupAltMapping(c)
	endfor
endif
