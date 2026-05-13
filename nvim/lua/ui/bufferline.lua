BufferLine = {}

local icons = require('nvim-web-devicons')

function BufferLine.click(minwid, clicks, button, modifiers)
    if vim.api.nvim_buf_is_valid(minwid) then
        vim.api.nvim_set_current_buf(minwid)
    end
end

function BufferLine.close(minwid, clicks, button, modifiers)
    if vim.api.nvim_buf_is_valid(minwid) then
        vim.api.nvim_buf_delete(minwid, { force = false })
    end
end

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
            local modified = vim.api.nvim_get_option_value('modified', { buf = buf })

            if names[name] > 1 then
                name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':h:t') .. '/' .. name
            end

            if modified then
                name = name .. ' ●'
            end

            local icon, icon_hl = icons.get_icon(name, filetype, { default = true })
            local segment
            local close_segment
            if buf == current then
                segment = '%#TabLineSel#▎%#' .. icon_hl .. '#' .. icon .. ' %#TabLineSel#' .. name .. ' '
                close_segment = '%#TabLineCloseSel#%#TabLine# '
            else
                segment = '%#TabLineSep#▎%#' .. icon_hl .. '#' .. icon .. ' %#TabLine#' .. name .. ' '
                close_segment = '%#TabLineClose#%#TabLine# '
            end

            line = line .. '%' .. buf .. '@v:lua.BufferLine.click@' .. segment .. '%X'

            line = line .. '%' .. buf .. '@v:lua.BufferLine.close@' .. close_segment .. '%X'
        end
    end

    return line .. '%#TabLineFill#'
end

vim.opt.tabline = '%!v:lua.BufferLine.show()'
