let g:lightline = {
    \ 'colorscheme': 'palenight',
    \ 'active': {
    \     'left': [
    \         [ 'mode', 'paste' ],
    \         [ 'readonly', 'filename', 'modified' ]
    \     ],
    \     'right': [
    \         [ 'lsp_hint', 'lsp_info', 'lsp_warning', 'lsp_error' ],
    \         [ 'lineinfo' ],
    \         [ 'percent' ],
    \         [ 'fileformat', 'fileencoding', 'filetype' ]
    \     ],
    \ },
    \ 'component_function': {
    \     'lsp_error': 'LspCountErrors',
    \     'lsp_warning': 'LspCountWarnings',
    \     'lsp_info': 'LspCountInformations',
    \     'lsp_hint': 'LspCountHints',
    \ },
    \ 'component_type': {
    \     'lsp_error': 'error',
    \     'lsp_warning': 'warning',
    \     'lsp_info': 'middle',
    \     'lsp_hint': 'middle',
    \ },
\ }

let g:lightline.separator = { 'left': ' ', 'right': ' ' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }

function! LspCountComponent(type) abort
    let l:count = luaeval('vim.lsp.diagnostic.get_count(0, _A)', a:type)
    if l:count == 0
        return ''
    endif
    return printf('%s:%d', a:type[0], l:count)
endfunction

function! LspCountErrors() abort
    return LspCountComponent('Error')
endfunction

function! LspCountWarnings() abort
    return LspCountComponent('Warning')
endfunction

function! LspCountInformations() abort
    return LspCountComponent('Information')
endfunction

function! LspCountHints() abort
    return LspCountComponent('Hint')
endfunction

lua <<EOF
EOF
