vim.opt.list = true
vim.opt.listchars = {
    tab = '-->',
    space = '·',
    nbsp = '␣',
    trail = '•',
    precedes = '«',
    extends = '»',
    eol = '↴',
}

require'indent_blankline'.setup {
    space_char_blankline = ' ',
    show_current_context = true,
}
