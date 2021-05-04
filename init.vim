" Prepare some variable for vim-plug and smyck color scheme
let s:plugFilePath = $HOME . '/.local/share/nvim/site/autoload/plug.vim'
let s:plugFileUrl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:plugDirectory = $HOME . '/.local/share/nvim/pluged'

"let s:smyckFilePath = $HOME . '/.local/share/nvim/site/colors/smyck.vim'
"let s:smyckFileUrl = 'https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/smyck.vim'

function! DownloadFile(path, url)
	let cmd = 'curl -fLo ' . a:path . ' --create-dirs ' . a:url
	echo 'Downloading ...' . a:url
	call system(cmd)
	echo 'Downloaded'
endfunction

function! DownloadPlugIfNotExist()
	if !filereadable(s:plugFilePath)
		call DownloadFile(s:plugFilePath, s:plugFileUrl)
	endif
endfunction

"function! DownloadSmyckIfNotExist()
"	if !filereadable(s:smyckFilePath)
"		call DownloadFile(s:smyckFilePath, s:smyckFileUrl)
"	endif
"endfunction

" If vim-plug/smyck does not exist, download it
call DownloadPlugIfNotExist()
"call DownloadSmyckIfNotExist()

" Prepare vim-plug data directory
call plug#begin('~/.local/share/nvim/pluged')

" Tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

" Bracket auto close
Plug 'jiangmiao/auto-pairs'

" Ultisnips
Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'honza/vim-snippets'

" for prettify statusline
Plug 'itchyny/lightline.vim'
let g:lightline = {'colorscheme': 'seoul256',}

" for prettify parentheses
Plug 'kien/rainbow_parentheses.vim'

" for golang
"Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()

let mapleader=";"
"colorscheme smyck

" configs of ultisnips
let g:UltiSnipsExpandTrigger = '<leader>a'
let g:UltiSnipsJumpForwardTrigger = '<leader>j'
let g:UltiSnipsBackwardTrigger = '<leader>k'

" configuration of rainbow_parentheses
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
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" customize nerdtree toggle key
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" filetype detect and load difference plugin for different filetype
filetype on
filetype plugin on

set autoindent
set smartindent
set nowrap

set history=500
set hls
set ignorecase
set number

" expand tabs to blankspace and 4spaces as tab"
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set list
set listchars=eol:¬,space:·,tab:¦ ,trail: 
set laststatus=2
syntax on
