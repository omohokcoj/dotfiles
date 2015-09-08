set autoread
set nocompatible " be iMproved
" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Dependencies of snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"

" Good looking bottom :)
Bundle 'bling/vim-airline'
" Git tools
Bundle 'tpope/vim-fugitive'
" Dependency managment
Bundle 'gmarik/vundle'
" Rails :/
Bundle 'tpope/vim-rails'
" Snippets for our use :)
" Bundle 'garbas/vim-snipmate'
" Commenting and uncommenting stuff
Bundle 'tomtom/tcomment_vim'
" Beutiful solarized theme
Bundle 'altercation/vim-colors-solarized'
" Molokai theme
Bundle 'tomasr/molokai'
" Vim Ruby
Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Tabs impletions
Bundle 'ervandew/supertab'
" Slim syntax 
Bundle 'slim-template/vim-slim'
" HTML
Bundle 'othree/html5.vim'
" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'
" Fuzzu finder for vim (CTRL+P)
Bundle 'kien/ctrlp.vim'
" Ruby Tests
Bundle 'skalnik/vim-vroom'
" Easy motion for easy motion
Bundle 'Lokaltog/vim-easymotion'
" Running tests in tmux session
Bundle 'tpope/vim-dispatch'
" Gist
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
" File renaming
Bundle 'danro/rename.vim'
" File explorer
Bundle 'scrooloose/nerdtree'
" You got it :)
Bundle 'vim-scripts/vim-auto-save'
" Run terminal in vim
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
" Code search engine
Bundle 'rking/ag.vim'
" Block ending
Bundle 'tpope/vim-endwise'
" Easier html building 
Bundle 'mattn/emmet-vim'
" Ctags 
Bundle 'szw/vim-tags'
" Line movings
Bundle 'matze/vim-move'
" Javascript
Bundle 'pangloss/vim-javascript'
" Git diff
Bundle 'airblade/vim-gitgutter'
" Awesome syntax checker
Bundle 'scrooloose/syntastic'
" History
Bundle 'sjl/gundo.vim'

set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on
set clipboard=unnamed,unnamedplus
filetype plugin indent on

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END
" ================

" Syntax highlighting and theme

syntax enable

" Configs to make Molokai look great
set background=dark
let g:molokai_original=1
let g:rehash256=1
set t_Co=256
"colorscheme molokai

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
set nu

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

let g:vroom_map_keys = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1

map <leader>e :NERDTree<cr>

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set laststatus=2

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:vim_tags_auto_generate = 1
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"

" Move line with Ctrl
let g:move_key_modifier = 'C'

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Sane ag command
let g:agprg='ag --nocolor --nogroup --column --ignore tmp --ignore log --ignore *.log --ignore coverage'

nnoremap D "dD
vnoremap D "dD
nnoremap d "dd
vnoremap d "dd
nnoremap X "xX
vnoremap X "xX
nnoremap x "xx
vnoremap x "xx
nnoremap C "cC
vnoremap C "cC
nnoremap c "cc
vnoremap c "cc
nnoremap S "sS
vnoremap S "sS
nnoremap s "ss
vnoremap s "ss

" easy-motion keys
nmap . <Plug>(easymotion-s2)
nmap , <Plug>(easymotion-t2)

" Gundo key
nnoremap <F5> :GundoToggle<CR>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" highlight the current line
set cursorline
" Highlight active column
set cuc cul"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,temp/**,log/**,*.log,bower_components
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap/
set directory+=~/.vim/swap/
set directory+=~/tmp/
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo/
	set undodir+=~/.vim/undo/
	set undofile
endif

" Ruby hash syntax conversion
nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
