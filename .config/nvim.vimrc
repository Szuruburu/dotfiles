set shiftwidth=3
set noexpandtab
set tabstop=3
set backspace=indent,eol,start
set ignorecase
set laststatus=2
set linebreak
set noerrorbells
set nolist
set number
set ruler
set scrolloff=20
set guifont=Monocraft\ Nerd\ Font:h9

map test :echo "test"
noremap <silent> <M-2> :call SpacesToTabs(2)<CR>
noremap <silent> <M-3> :call SpacesToTabs(3)<CR>
noremap <silent> <M-4> :call SpacesToTabs(4)<CR>

let g:python_recommended_style = 0
autocmd FileType python setlocal noexpandtab

let g:neovide_scale_factor = 1.0
let g:neovide_padding_top = 0
let g:neovide_padding_bottom = 0
let g:neovide_padding_right = 0
let g:neovide_padding_left = 0

function! SpacesToTabs(t)
	" The a: prefix is used to reference the argument t to the function
	execute "set tabstop=" . a:t
	execute "set shiftwidth=" . a:t
	set noexpandtab
	retab!
endfunction
