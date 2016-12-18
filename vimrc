set autoread
set nocompatible " be iMproved
" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Good looking bottom :)
Plugin 'vim-airline/vim-airline'
" Themes
Plugin 'vim-airline/vim-airline-themes'
" Git tools
Plugin 'tpope/vim-fugitive'
" Dependency managment
Plugin 'gmarik/vundle'
" Rails :/
Plugin 'tpope/vim-rails'
" Ruby tests
Plugin 'skalnik/vim-vroom'
" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'
" Lucius theme
Plugin 'jonathanfilip/vim-lucius'
" Vim Ruby
Plugin 'vim-ruby/vim-ruby'
" Surround your code :)
Plugin 'tpope/vim-surround'
" Slim syntax
Plugin 'slim-template/vim-slim'
" HTML
Plugin 'othree/html5.vim'
" CoffeeScript syntax
Plugin 'kchmck/vim-coffee-script'
" Fuzzu finder for vim (CTRL+P)
Plugin 'kien/ctrlp.vim'
" Easy motion for easy motion
Plugin 'Lokaltog/vim-easymotion'
" File explorer
Plugin 'scrooloose/nerdtree'
" Automatically save changes to disk
Plugin '907th/vim-auto-save'
" Code search engine
Plugin 'rking/ag.vim'
" Block ending
Plugin 'rhysd/endwize.vim'
" Easier html building
Plugin 'mattn/emmet-vim'
" Line movings
Plugin 't9md/vim-textmanip'
" Javascript
Plugin 'jelera/vim-javascript-syntax'
" Git diff
Plugin 'airblade/vim-gitgutter'
" Awesome syntax checker
Plugin 'scrooloose/syntastic'
" History
Plugin 'sjl/gundo.vim'
" Multicursor
Plugin 'terryma/vim-multiple-cursors'
" Autoformater
Plugin 'Chiel92/vim-autoformat'
" AutoComplete
Plugin 'Shougo/neocomplete.vim'
" Stedier moving
Plugin 'vim-scripts/camelcasemotion'
" Tabulations
Plugin 'godlygeek/tabular'
" Local editor settings
Plugin 'embear/vim-localvimrc'
" Repeater required by Easyclip
Plugin 'tpope/vim-repeat'
" Better clipboard
Plugin 'svermeulen/vim-easyclip'
" ES6
Plugin 'isRuslan/vim-es6'
" Elixir syntax highlight
Plugin 'elixir-lang/vim-elixir'
" Copy path
Plugin 'omohokcoj/copypath.vim'
" Trailing whitespace highlight
Plugin 'bronson/vim-trailing-whitespace'
" Tmux integration
Plugin 'christoomey/vim-tmux-navigator'

colorscheme lucius
let g:airline_theme='lucius'
let g:lucius_style = 'dark'
let g:lucius_no_term_bg = 1

set guifont=Roboto\ Mono\ for\ Powerline:h15
set tags=./tags; " Set tags directory
let g:ycm_collect_identifiers_from_tags_files = 1
let g:neocomplete#enable_at_startup = 1

set autoindent " Auto indention should be on
set clipboard=unnamed,unnamedplus

syntax on                 " Enable syntax highlighting
syntax enable             " Syntax highlighting and theme
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType * set ai sw=2 sts=2 et
augroup END

autocmd BufNewFile,BufRead *.html.erb.deface   set syntax=eruby

" Return to last edit position when opening files
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Endwize
inoremap <silent><CR> <CR><C-r>=endwize#crend()<CR>

" Lovely linenumbers
set nu

" Searching
" set hlsearch
set incsearch
set ignorecase
set smartcase

" rotate yanks (easyclip)
nmap [y <plug>EasyClipRotateYanksForward
nmap ]y <plug>EasyClipRotateYanksBackward

" Load local vimrc without confirmation
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

map <leader>e :NERDTree<cr>
map <leader>] :CtrlPMRU<cr>
map <leader>= :Autoformat<cr>

let g:airline_powerline_fonts=1
set laststatus=2

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  let g:auto_save = 0
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  let g:auto_save = 1
endfunction

" Move line with Ctrl
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" Split words by camelcase
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](doc|tmp|node_modules)',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }

" ctrlp .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Sane ag command
let g:ag_prg='ag --nocolor --nogroup --column'
" Ruby Doc command
let g:ruby_doc_command='open'

" easy-motion keys
" nmap . <Plug>(easymotion-s2)
nmap , <Plug>(easymotion-s2)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Gundo key
nnoremap <F5> :GundoToggle<CR>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>

" Highlight active column
" set cuc cul

" Speed
let loaded_matchparen=1
let html_no_rendering=1
set noshowmatch

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn

" BACKUP / TMP FILES
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

" Gvim humanizer
set guioptions-=m " Removes actionbar
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set ttyfast
set lazyredraw

" Disable sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
