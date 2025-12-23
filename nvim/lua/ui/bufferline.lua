BufferLine = {}

local icons = require('nvim-web-devicons')

function BufferLine.show()
    local buffers = vim.api.nvim_list_bufs()
    local current = vim.api.nvim_get_current_buf()
    local line = ''
    local names = {}

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
            local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
            if names[name] == nil then
                names[name] = 0
            end
            names[name] = names[name] + 1
        end
    end

    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
            local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
            local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')

            if names[name] > 1 then
                name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':h:t') .. '/' .. name
            end

            local icon, icon_hl = icons.get_icon(name, filetype, { default = true })
            if buf == current then
                line = line .. '%#TabLineSel#▎%#' .. icon_hl .. '#' .. icon .. ' %#TabLineSel#' .. name .. ' '
            else
                line = line .. '%#TabLineSep#▎%#' .. icon_hl .. '#' .. icon .. ' %#TabLine#' .. name .. ' '
            end
        end
    end

    return line .. '%#TabLineFill#'
end

vim.opt.tabline = '%!v:lua.BufferLine.show()'
