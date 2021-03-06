set nocompatible	"Be Improved

call plug#begin(expand('~/.config/nvim/plugged'))
"" Paquetes todos mecos de plug
Plug 'scrooloose/nerdtree' " Para tener un árbol de directorios
Plug 'tpope/vim-fugitive' " Un status de Git para saber que hice
Plug 'vim-airline/vim-airline' " Una barrita de abajo con colores fresas
Plug 'vim-airline/vim-airline-themes' " Colores fresas para la barrita de abajo
Plug 'airblade/vim-gitgutter' " Cosas pa' git
Plug 'bronson/vim-trailing-whitespace' " Para quitar espacios de más
Plug 'Raimondi/delimitMate' " Tampoco se que hace pero aquí lo dejo
Plug 'majutsushi/tagbar' " Para ver las funciones prronas que haga
Plug 'Yggdroot/indentLine' " Para que se vean puntitos al picarle a tab
Plug 'sheerun/vim-polyglot' " Chingos de lenguajes
Plug 'ryanoasis/vim-devicons' " Iconitos fresas

" Underline similar words
Plug 'itchyny/vim-cursorword'

" Linters
Plug 'w0rp/ale' " Linternas sexys que usan LSP

"Plugins para C/C++
Plug 'octol/vim-cpp-enhanced-highlight' " Para que C & C++ se vean bien preciosos

"Selector de colores
Plug 'KabbAmine/vCoolor.vim' " Selector de colores en zenity

" Wiki para tener apuntes perrones
Plug 'jakykong/vim-zim'

"Vim A.L.E
    "Enable A.L.E
let g:ale_completion_enabled = 0
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 2
    " C options for A.L.E
let g:ale_c_parse_makefile = 1


"TODO highlight
Plug 'Dimercel/todo-vim'
nmap <F5> :TODOToggle<CR>

" Visualmarks
Plug 'MattesGroeger/vim-bookmarks'

" Visualmarks Options
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" Ejecutar comandos de manera asíncrona en la terminal de Vim
Plug 'skywind3000/asyncrun.vim'

" Pantalla de inicio para Vim
Plug 'mhinz/vim-startify'
" Título Personalizado
let g:startify_custom_header = [
            \ ' ____   ____             __        .__         ',
            \ ' \   \ /   /____   _____/  |____  _|__| _____  ',
            \ '  \   Y   _/ __ \ /    \   __\  \/ |  |/     \  ',
            \ '   \     /\  ___/|   |  |  |  \   /|  |  Y Y  \ ',
            \ '    \___/  \___  |___|  |__|   \_/ |__|__|_|  / ',
            \ '               \/     \/                    \/<  ',
            \]

" Resaltado de sintaxis en NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" ------RUST-----

"Rust binaries path
let PATH="$HOME/.cargo/bin:$PATH"
let RUST_SRC_PATH="~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src:$RUST_SRC_PATH"
" Rust
" Rust.vim
Plug 'rust-lang/rust.vim'

" Vim Racer
Plug 'racer-rust/vim-racer'

" vim-racer options
set hidden
let g:racer_cmd = "/home/omar/.cargo/bin/racer"

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
let g:ycm_rust_src_path = '~/.rust/src'


" rust

autocmd FileType *.rs setlocal tabstop=4 expandtab shiftwidth=4 smarttab
autocmd BufReadPost *.rs setlocal filetype=rust

au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"Rust-vim Options
let g:rustc_path = '/home/omar/.cargo/bin/rustc'
let g:rust_recommended_style = 1

"A.L.E Rust Settings
"Various settings for Rust
let g:ale_linters = {
            \ 'rust': [ 'rls' ],
            \ }
let g:ale_rust_rls_executable = '/home/omar/.cargo/bin/rls'
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_cargo_use_clippy = 1

" -----END OF RUST----------

" Remarcar las palabras clave TODO, FIXME y otras predefinidas.
Plug 'sakshamgupta05/vim-todo-highlight'


" Paréntesis bonitos
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Vim Markdown Composer
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release
        else
            !cargo build --release --no-default-features --features json-rpc
        endif
    endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips'
endif

Plug 'honza/vim-snippets'

""Colores para que se vea bien chingón vim
Plug 'tomasr/molokai'
Plug 'liuchengxu/space-vim-theme'
Plug 'srcery-colors/srcery-vim'
""Lenguajes culeros

" Essential Languages
Plug 'WolfgangMehner/vim-plugins'
Plug 'ludwig/split-manpage.vim'

call plug#end()

filetype plugin indent on

" Encodings

set encoding=UTF-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set ttyfast

" Arreglar el indent de backspace
set backspace=indent,eol,start

" Tabulaciones bonitas
set tabstop=4
set shiftwidth=4
set expandtab

"" Map leader to
let mapleader=','

"Buffers ocultos
set hidden

""Motor de búsqueda
set hlsearch
set incsearch
set ignorecase
set smartcase

""Evitar los cagaderos de vim
set nobackup
set noswapfile

set fileformats=unix,dos,mac

"" cosas pa doblar el código y no ver todo
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" Comandos perrones para el doblado manual
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"***************************************************
"Opciones visuales para que vim no se vea culero
"***************************************************
syntax on
set number
set numberwidth=1
set mouse=a
set mousemodel=popup
set t_Co=256
set colorcolumn=80

" El tema que wausar c:
set background=dark
colorscheme srcery
hi Comment cterm=italic
" indicadores de indent por si tengo que programar en la caca de python
let g:indentLine_enabled = 1
let g:indentLine_char = '·'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '·'
"" barrita de abajo toda chingona
set laststatus=2

"" Noc que hace esto
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'ouo'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"*****************************************************************************
"" Abreviaciones chidas para no cagarla con los comandos
"*****************************************************************************
"" neta, te hacen un parote con el bloq mayus puesto
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Config del arbolito que sale con <F3>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


"*****************************************************************************
"" Funciones chingonas para que se formatien bien chido los archivos
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=80
  endfunction
endif


"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


"*****************************************************************************
"" Mappeado de teclas because yes
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Mapeado de sesiones
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" directorio de trabajo
nnoremap <leader>. :lcd %:p:h<CR>

"" Abrir donde se quedó alv
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" no me acuerdo que hace esto
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/.config/nvim/ultisnips/UltiSnips"

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Quitar la visualbell para que no me sangren los ojos
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut porque todos quieren clipboard aquí
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"*****************************************************************************
"" Configuraciones especiales para lenguajes más feos que un refri por detrás
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=8 shiftwidth=8 expandtab
autocmd FileType cpp setlocal tabstop=8 shiftwidth=8 expandtab

" Kiasko Python
autocmd FileType py setlocal tabstop=4 shiftwidth=4 expandtab

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1


"*****************************************************************************
"" Variables para que vim juncie bien perrón
"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

