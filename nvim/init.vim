call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'ervandew/supertab'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips', { 'for': 'tex' }
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'fatih/vim-go'
Plug 'cseelus/vim-colors-lucid'
Plug 'tpope/vim-dadbod'
Plug 'OrangeT/vim-csharp'
Plug 'tikhomirov/vim-glsl'
Plug 'neovimhaskell/haskell-vim'
Plug 'Yggdroot/indentLine'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
Plug 'bfrg/vim-cpp-modern'
Plug 'luochen1990/rainbow', { 'for': 'lisp' }
Plug 'ayu-theme/ayu-vim'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"
highlight Comment cterm=italic gui=italic

set autoindent                  " Сохранение отступа при переносе
set expandtab                   " Перевод таба в пробелы
set smarttab                    " tabstop при нажатии на таб
set shiftround
set shiftwidth=4
set tabstop=4                   " Размер таба = 4 пробела
set smartindent                 " Умные отступы

set number                      " Нумерация строк
set cursorline                  " Подстветка строки

set backspace=indent,eol,start  " Удаление бекспейсом
set mouse=a                     " Поддержка курсора
set mousemodel=popup            " Не выгружать буфер

set noshowmode

set ignorecase                  " Игнорировать регистр при поиске
set hlsearch                    " Подсветка поиска
set incsearch
set showmatch

set scrolloff=5                 " Отступ при прокрутке

set fillchars+=vert:│

" Сохранение номера строки
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '│'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '│'

" VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal=''

" Invsible characters
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»

" NERD Tree
map <C-n> :NERDTreeToggle<CR>
map <F5> :NERDTreeRefresh<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" TagBar
nmap <F8> :TagbarToggle<CR>

" Snips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ["."]

" Indents for C++
function! QtCppIndent()
  let labelpat='signals:\|slots:\|public:\|protected:\|private:\|Q_OBJECT'
  let declpat='\(;\|{\|}\)\_s*.'
  if match(getline(v:lnum),labelpat) != -1
    return 0
  endif
  if match(getline(v:lnum),'^\s*}') != -1
    return cindent(v:lnum)
  endif
  let pos=getpos('.')
  call setpos('.',[0,v:lnum,1,0])
  call search(declpat,'beW',v:lnum>10?v:lnum-10:0)
  let prevlnum = line('.')
  call search(declpat,'eW',v:lnum<=line('$')-10?v:lnum+10:0)
  let nextlnum = line('.')
  call setpos('.',pos)
  if match(getline(prevlnum),labelpat)==-1
    return cindent(v:lnum)
  elseif nextlnum != v:lnum && prevlnum != prevnonblank(v:lnum-1)
    return cindent(v:lnum)
  endif
  return &shiftwidth
endfunc
set indentexpr=QtCppIndent()

" Haskell
let g:haskell_indent_if = 3
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 4

" IndentLine
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

"Rainbow
let g:rainbow_active = 1

let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
