set autoread
set nocompatible " be iMproved
" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Dependency managment
Plugin 'VundleVim/Vundle.vim'
" Good looking bottom :)
Plugin 'vim-airline/vim-airline'
" Themes
Plugin 'vim-airline/vim-airline-themes'
" Lucius theme
Plugin 'jonathanfilip/vim-lucius'
" Commenting and uncommenting stuff
Plugin 'tomtom/tcomment_vim'
" Fuzzu finder for vim (CTRL+P)
Plugin 'kien/ctrlp.vim'
" Easy motion for easy motion
Plugin 'Lokaltog/vim-easymotion'
" Automatically save changes to disk
Plugin '907th/vim-auto-save'
" Silver searcher
Plugin 'rking/ag.vim'
" Line movings
Plugin 't9md/vim-textmanip'
" Git diff
Plugin 'airblade/vim-gitgutter'
" History
Plugin 'sjl/gundo.vim'
" Autocomplete
Plugin 'Shougo/neocomplete.vim'
" Stedier moving
Plugin 'vim-scripts/camelcasemotion'
" Tabulations
Plugin 'godlygeek/tabular'
" Repeater required by Easyclip
Plugin 'tpope/vim-repeat'
" Better clipboard
Plugin 'svermeulen/vim-easyclip'
" Copy path
Plugin 'omohokcoj/copypath.vim'
" Trailing whitespace highlight
Plugin 'bronson/vim-trailing-whitespace'
" Tmux integration
Plugin 'christoomey/vim-tmux-navigator'
" Send command to tmux
Plugin 'brauner/vimtux'
" Restore cursor position
Plugin 'farmergreg/vim-lastplace'

" Syntax highlight
Plugin 'vim-ruby/vim-ruby'
Plugin 'slim-template/vim-slim'
Plugin 'othree/html5.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'

colorscheme lucius
let g:airline_theme='lucius'
let g:lucius_style = 'dark'
let g:lucius_no_term_bg = 1

let g:neocomplete#enable_at_startup = 1

let g:alchemist#elixir_erlang_src = $HOME."/Documents"

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

" Lovely linenumbers
set nu

" Searching
set incsearch
set ignorecase
set smartcase

" To display the status line always
set laststatus=2

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" send to tmux panel
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux

map <leader>e :Explore<cr>
map <leader>] :CtrlPMRU<cr>

let g:airline_powerline_fonts=1

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = { 'dir':  '\v[\/](doc|tmp|node_modules)' }

" ctrlp .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Sane ag command
let g:ag_prg='ag --nocolor --nogroup --column'

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

" easy-motion keys
" nmap . <Plug>(easymotion-s2)
nmap , <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

set tags=./tags; " Set tags directory

" BACKUP / TMP FILES
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
set directory=./.vim-swap/
set directory+=~/.vim/swap/
set directory+=~/tmp/
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
set undodir=./.vim-undo/
set undodir+=~/.vim/undo/
set undofile

" Gvim humanizer
set guioptions-=m " Removes actionbar
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set guifont=Roboto\ Mono\ for\ Powerline:h15

" Disable sound
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
