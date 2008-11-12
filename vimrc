"
" Vim Options
"
set backup
set directory=$HOME/.vim/tmp
set backupdir=$HOME/.vim/backups
helptags $HOME/.vim/doc

set bs=2
set foldmethod=syntax
set foldlevelstart=1  " On startup, close all but the top-level fold.
set nocompatible
set nohlsearch
set noincsearch
set nowrap
set ruler
set scrolloff=1

set autoindent
" set smartindent
set smarttab
set shiftwidth=4
set tabstop=4

" Status line shit.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LINES=%L]
set laststatus=2

" Enable Status Line Menu
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F1> :emenu <C-Z>

filetype indent plugin on
syntax on

" Turn off bracket highlighting
" let loaded_matchparen = 1

" Ruby/Rails stuff
augroup railsfiletypes
	" Clear old autocmds in group
	autocmd! 
	" autoindent with two spaces, always expand tabs
	" autocmd FileType eruby set ai ts=4 sw=4 noexpandtab
	" autocmd FileType ruby,yaml set ai sw=2 sts=2 expandtab
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 expandtab
augroup END

" CakePHP syntax highlighting
augroup cakephpfiletypes
	autocmd!
	au! BufRead,BufNewFile *.thtml set filetype=php
augroup END

" Template Toolkit
augroup templatetoolkitfiletypes
	autocmd!
	au! BufRead,BufNewFile,BufWinEnter *.tt2 set filetype=tt2
augroup END


"
" Key Bindings
"
" Tab commands
nmap <C-t> :tabnew<CR>
" nmap <C-x> :tabclose<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>

" Buffer commands
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>


" Specific options for Vim.app
if has("gui_running")
	set background=light
	set mousehide  " Hide mouse after pressing key.
	set mouse=a    " Mouse in all modes.
	let Tlist_Show_Menu=1  " Enable taglist menu in Vim.app
else
	set background=dark
endif


"
" Plugin Stuff
"
" Project
let g:proj_flags="imsStT"
let g:proj_window_width=35
let g:proj_window_increment=40
nmap <silent> <F2> <Plug>ToggleProject
nmap <silent> <F3> :Project<CR>

" rails.vim
let g:rails_menu=2

" TagList
nnoremap <silent> <F12> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen=1
" let Tlist_Close_On_Select=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=35
let Tlist_Enable_Fold_Column=0
let Tlist_Inc_Winwidth=0  " Don't auto-resize the vim window.
