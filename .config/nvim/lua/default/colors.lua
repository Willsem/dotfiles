vim.g.tokyonight_style = "storm"

vim.cmd[[
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

colorscheme tokyonight
]]
