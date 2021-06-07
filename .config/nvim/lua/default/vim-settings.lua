--[[
        __                               __   __   __
.--.--.|__|.--------.______.-----.-----.|  |_|  |_|__|.-----.-----.-----.
|  |  ||  ||        |______|__ --|  -__||   _|   _|  ||     |  _  |__ --|
 \___/ |__||__|__|__|      |_____|_____||____|____|__||__|__|___  |_____|
                                                            |_____|
--]]

vim.cmd[[
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
]]
