local g = vim.g
local opt = vim.opt

g.noshowmode = true
g.nohlsearch = true                -- Does not highlight searched words

opt.autoindent = true              -- Save the indend after the newline
opt.number = true                  -- Lines number
opt.expandtab = true               -- Translate tabls into the spaces
opt.smarttab = true                -- Tabstop when presses tab button
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4                    -- Tab size equals 4 spaces as default
opt.smartindent = true             -- Smart indents
opt.ruler = true
opt.cursorline = true              -- Highlight current line
opt.backspace = 'indent,eol,start' -- Delete symbols by backspace
opt.mouse = 'a'                    -- Mouse support
opt.mousemodel = 'popup'           -- Does not unload buffer
opt.ignorecase = true              -- Ignore case for the search
opt.incsearch = true
opt.showmatch = true
opt.scrolloff = 5                  -- Margin for the scrolling
opt.fillchars:append('vert:│')
opt.linebreak = true               -- Space-based hyphenation
opt.colorcolumn = '99'             -- Line that shows the limit of the line
opt.showtabline = 2

-- Save the line number after closing the file
vim.cmd[[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
]]
