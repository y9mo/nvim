
set nocompatible              " be iMproved, required
filetype off                  " required

let s:editor_root=expand("~/.config/nvim")
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin(s:editor_root . '/bundle')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plugin 'Shougo/neopairs.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-buftabline'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plugin 'godlygeek/tabular'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'junegunn/goyo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zchee/deoplete-go'
Plugin 'zchee/deoplete-jedi'
Plugin 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }


call vundle#end()            " required
filetype plugin indent on    " required

" Leader
" =============================================================================
let mapleader = ","

" Few mappings
" =============================================================================
vmap <Tab> >
vmap <S-Tab> <

xnoremap >  >gv
xnoremap <  <gv

" Close quickfix easily
nnoremap <leader>a :cclose<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>


" Splitting Behaviour
" =============================================================================
set splitbelow                  " Split horizontal windows below to the current windows
set splitright                  " Split vertical windows right to the current windows

" Vim look & feel
" =============================================================================
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

colorscheme nofrils-dark
"deep-space nova antares badwolf Tomorrow-Night Tomorrow-Night-Bright gruvbox luna-term maui

"
" Settings
"
set noerrorbells                " No beeps
set novisualbell
set t_vb=

set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
" set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set hidden

set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set ttyfast
" set ttyscroll=3               " noop on linux ?
set lazyredraw                  " Wait to redraw
" speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=300
set re=1
" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

set autoindent
set complete-=i
set showmatch
set smarttab
set et
set tabstop=4
set shiftwidth=4
set expandtab
set nrformats-=octal
set shiftround
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=10


set cursorline
set showbreak=↪

" Enable folding
"  set foldmethod=indent
"  set foldlevel=99

set list
set listchars=tab:>-,trail:·,eol:¬

" =============================================================================
" File Type settings
" =============================================================================
au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

augroup filetypedetect
au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4
" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd BufEnter *.go colorscheme nofrils-dark

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" toml settings
au BufRead,BufNewFile MAINTAINERS set ft=toml

" spell check for git commits
autocmd FileType gitcommit setlocal spell


" Nerdtree
" ============================================================================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline
" =============================================================================
"let g:airline_theme='solarized'
set noshowmode
set laststatus=2
"let g:airline_detect_modified=1
"let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
let g:airline_powerline_symbols='unicode'
"let g:airline_theme='gruvbox'
"let g:airline#extensions#syntastic#enabled=1
"let g:airline#extensions#tavline#enabled=1
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"autocmd BufRead * :IndentLinesEnable

" indentline config
"let g:indentLine_showSecondIndentLevel=1
"set conceallevel=1
"let g:indentLine_conceallevel=2
"let g:indentLine_enabled=1
"let g:indentLine_char = '¦'
"
let g:airline#extensions#tabline#enabled = 1

" Deoplete configuration
" =============================================================================
let g:deoplete#enable_at_startup = 1
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
" let g:deoplete#auto_complete_start_length = 3

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

" Syntastic configuraton
" =============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*', '*build*', '*LOCAL*', '*BASE', '*REMOTE*']

let g:syntastic_python_checkers = ['flake8', 'pylint']

" Tagbar configuration
" =============================================================================
nmap <F8> :TagbarToggle<CR>

" Fugitive
" =============================================================================
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" Ultisnips configuration
" =============================================================================
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Livedown configuration
" =============================================================================
" should markdown preview get shown automatically upon opening markdown buffer
"let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
"let g:livedown_open = 1

" the port on which Livedown server will run
"let g:livedown_port = 1337

" the browser to use
"let g:livedown_browser = "brave"
"nmap gm :LivedownToggle<CR>

" Golang Setup
" ============================================================================
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
