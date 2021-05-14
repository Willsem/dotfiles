if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck
hi EndOfBuffer guifg=bg

" set list
" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»
