call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips', { 'for': 'tex' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-dadbod'
Plug 'bfrg/vim-cpp-modern'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ghifarit53/tokyonight-vim'
Plug 'Yggdroot/indentLine'
call plug#end()

set autoindent                  " Сохранение отступа при переносе
set expandtab                   " Перевод таба в пробелы
set smarttab                    " tabstop при нажатии на таб
set shiftround
set shiftwidth=4
set tabstop=4                   " Размер таба = 4 пробела
set smartindent                 " Умные отступы

set number                      " Нумерация строк
set ruler
set cursorline                  " Подстветка строки

set backspace=indent,eol,start  " Удаление бекспейсом
set mouse=a                     " Поддержка курсора
set mousemodel=popup            " Не выгружать буфер

set noshowmode

set ignorecase                  " Игнорировать регистр при поиске
set nohlsearch                    " Подсветка поиска
set incsearch
set showmatch

set scrolloff=5                 " Отступ при прокрутке

set fillchars+=vert:│

set linebreak " Перенос по пробелу

" Сохранение номера строки
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' '

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ' '

" VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal=""

" Invsible characters
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»
highlight NonText guifg=#333333
highlight SpecialKey guifg=#333333 guibg=#ff0000

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
let g:indentLine_setColors = 1

"Rainbow
let g:rainbow_active = 1

" OmniSharp
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_server_stdio_quickload = 1
let g:OmniSharp_proc_debug = 1
let g:OmniSharp_loglevel = 'debug'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1

let g:lightline = {'colorscheme' : 'tokyonight'}
colorscheme tokyonight
hi EndOfBuffer guifg = bg

nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>

autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF
local nvim_lsp = require 'nvim_lsp'

nvim_lsp.ccls.setup {
    filetypes = { "c", "cc", "cpp" },
    on_attach = require'completion'.on_attach,
    init_options = {
        highlight = {
            lsRanges = true;
        }
    }
}

nvim_lsp.cmake.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.pyls.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.texlab.setup {
    on_attach = require'completion'.on_attach
}

nvim_lsp.omnisharp.setup {
    on_attach = require'completion'.on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)

require'nvim-web-devicons'.setup()
EOF
