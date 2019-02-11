call plug#begin()

" Good looking bottom :)
Plug 'vim-airline/vim-airline'
" Themes
Plug 'vim-airline/vim-airline-themes'
" Lucius theme
Plug 'jonathanfilip/vim-lucius'
" Commenting and uncommenting stuff
Plug 'tomtom/tcomment_vim'
" Fuzzu finder for vim (CTRL+P)
Plug 'kien/ctrlp.vim'
" Easy motion for easy motion
Plug 'Lokaltog/vim-easymotion'
" Automatically save changes to disk
Plug '907th/vim-auto-save'
" Silver searcher
Plug 'rking/ag.vim'
" Line movings
Plug 't9md/vim-textmanip'
" Git diff
Plug 'airblade/vim-gitgutter'
" History
Plug 'sjl/gundo.vim'
" Stedier moving
Plug 'vim-scripts/camelcasemotion'
" Tabulations
Plug 'godlygeek/tabular'
" Repeater required by Easyclip
Plug 'tpope/vim-repeat'
" Better clipboard
Plug 'svermeulen/vim-easyclip'
" Copy path
Plug 'omohokcoj/copypath.vim'
" Trailing whitespace highlight
Plug 'bronson/vim-trailing-whitespace'
" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Send command to tmux
Plug 'brauner/vimtux'
" Restore cursor position
Plug 'vim-scripts/lastpos.vim'
" Netrw improved
Plug 'tpope/vim-vinegar'
" Languageserver client
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
" Fuzzy finder (Languageserver requirement)
Plug 'junegunn/fzf'

" Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Syntax highlight
Plug 'slim-template/vim-slim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'elixir-lang/vim-elixir'
Plug 'ElmCast/elm-vim'
Plug 'posva/vim-vue'

call plug#end()

colorscheme lucius
let g:airline_theme='lucius'
let g:lucius_style = 'dark'
let g:lucius_no_term_bg = 1

let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['solargraph', 'stdio'],
      \ }

" LanguageClient bindings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>

set autoindent " Auto indention should be on
set clipboard=unnamed,unnamedplus

filetype plugin indent on " Enable filetype-specific indenting and plugins
syntax on                 " Enable syntax highlighting
syntax enable             " Syntax highlighting and theme

" autoindent with two spaces, always expand tabs
autocmd FileType * set ai sw=2 sts=2 et

" Lovely linenumbers
set number

" Searching
set incsearch
set ignorecase
set smartcase

" Autocomplete
set pumheight=20

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

autocmd BufWritePost * GitGutter
nnoremap <Leader>c :GitGutterUndoHunk<cr>

let g:vue_disable_pre_processors = 1
autocmd FileType vue syntax sync fromstart

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
" Do not show mapping message
let g:ag_mapping_message = 0

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
set backupdir^=~/.vim/backup/
set backup

" Save your swp files to a less annoying place than the current directory.
set directory=~/.vim/swap/

" undofile - This allows you to use undos after exiting and restarting
set undodir=~/.vim/undo/
set undofile

" Disable sound
set noerrorbells visualbell t_vb=

if has('nvim')
  set viminfo+=n~/.config/nvim/viminfo
else
  set viminfo+=n~/.vim/viminfo
endif

" remove search heightlight on esc
nnoremap <silent><esc><esc> :noh<return>

" netrw settings
let g:netrw_liststyle = 3

" Open nertw on vim load
autocmd VimEnter * if !argc() | Explore | endif
