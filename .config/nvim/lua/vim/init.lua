local g = vim.g
local opt = vim.opt

g.noshowmode = true
g.nohlsearch = true                -- Does not highlight searched words
g.termguicolors = true

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
opt.mouse = 'a'                    -- Mouse support
opt.mousemodel = 'popup'           -- Does not unload buffer
opt.ignorecase = true              -- Ignore case for the search
opt.incsearch = true
opt.showmatch = true
opt.scrolloff = 5                  -- Margin for the scrolling
opt.linebreak = true               -- Space-based hyphenation
opt.colorcolumn = '99'             -- Line that shows the limit of the line
opt.showtabline = 2

-- Save the line number after closing the file
vim.api.nvim_create_autocmd(
    'BufReadPost', {
        pattern = { '*' },
        command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]
    }
)
