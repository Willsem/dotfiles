BufferLine = {}

local icons = require('nvim-web-devicons')

local function is_listed_buffer(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value('buflisted', { buf = buf })
end

local function statusline_escape(value)
    return value:gsub('%%', '%%%%')
end

local function buffer_name(buf)
    local full_name = vim.api.nvim_buf_get_name(buf)
    local name = vim.fn.fnamemodify(full_name, ':t')

    if name == '' then
        return '[No Name]'
    end

    return name
end

local function marker_width(count)
    if count <= 0 then
        return 0
    end

    return vim.fn.strdisplaywidth('‹ ' .. count .. ' ')
end

local function visible_width(items, first, last)
    local width = 0

    for index = first, last do
        width = width + items[index].width
    end

    return width + marker_width(first - 1) + marker_width(#items - last)
end

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
    local names = {}
    local items = {}
    local current_index = 1

    for _, buf in ipairs(buffers) do
        if is_listed_buffer(buf) then
            local name = buffer_name(buf)

            if names[name] == nil then
                names[name] = 0
            end

            names[name] = names[name] + 1
        end
    end

    for _, buf in ipairs(buffers) do
        if is_listed_buffer(buf) then
            local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
            local name = buffer_name(buf)
            local modified = vim.api.nvim_get_option_value('modified', { buf = buf })

            if names[name] > 1 then
                local parent = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':h:t')
                name = parent .. '/' .. name
            end

            if modified then
                name = name .. ' ●'
            end

            local icon, icon_hl = icons.get_icon(name, filetype, { default = true })
            local segment_hl = 'TabLine'
            local separator_hl = 'TabLineSep'
            local close_hl = 'TabLineClose'

            if buf == current then
                current_index = #items + 1
                segment_hl = 'TabLineSel'
                separator_hl = 'TabLineSel'
                close_hl = 'TabLineCloseSel'
            end

            local segment = '%#' .. separator_hl .. '#▎%#' .. icon_hl .. '#' .. icon
                .. ' %#' .. segment_hl .. '#' .. statusline_escape(name) .. ' '
            local close_segment = '%#' .. close_hl .. '#%#TabLine# '
            local text = '%' .. buf .. '@v:lua.BufferLine.click@' .. segment .. '%X'
                .. '%' .. buf .. '@v:lua.BufferLine.close@' .. close_segment .. '%X'

            table.insert(items, {
                buf = buf,
                text = text,
                width = vim.fn.strdisplaywidth('▎' .. icon .. ' ' .. name .. '  '),
            })
        end
    end

    if #items == 0 then
        return '%#TabLineFill#'
    end

    local first = current_index
    local last = current_index
    local prefer_left = true

    while first > 1 or last < #items do
        local expanded = false
        local attempts = prefer_left and { 'left', 'right' } or { 'right', 'left' }

        for _, side in ipairs(attempts) do
            local next_first = first
            local next_last = last

            if side == 'left' and first > 1 then
                next_first = first - 1
            elseif side == 'right' and last < #items then
                next_last = last + 1
            end

            if
                (next_first ~= first or next_last ~= last)
                and visible_width(items, next_first, next_last) <= vim.o.columns
            then
                first = next_first
                last = next_last
                expanded = true
                prefer_left = not prefer_left
                break
            end
        end

        if not expanded then
            break
        end
    end

    local line = ''

    if first > 1 then
        line = line
            .. '%'
            .. items[first - 1].buf
            .. '@v:lua.BufferLine.click@%#TabLine#‹ '
            .. (first - 1)
            .. ' %X'
    end

    for index = first, last do
        line = line .. items[index].text
    end

    if last < #items then
        line = line
            .. '%'
            .. items[last + 1].buf
            .. '@v:lua.BufferLine.click@%#TabLine# '
            .. (#items - last)
            .. ' ›%X'
    end

    return line .. '%#TabLineFill#'
end

vim.opt.tabline = '%!v:lua.BufferLine.show()'
