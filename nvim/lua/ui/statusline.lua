Statusline = {}

local icons = require('nvim-web-devicons')

local align = '%='
local left_separator = '%#StatuslineSeparator#  %#Statusline#'
local right_separator = '%#StatuslineSeparator#  %#Statusline#'
local left_border = ' '
local right_border = ' '

local modes = {
    ['n'] = '',
    ['no'] = '',
    ['v'] = '',
    ['V'] = '',
    [''] = '',
    ['s'] = '',
    ['S'] = '',
    [''] = '',
    ['i'] = '',
    ['ic'] = '',
    ['R'] = '',
    ['Rv'] = '',
    ['c'] = '',
    ['cv'] = '',
    ['ce'] = '',
    ['r'] = '',
    ['rm'] = '',
    ['r?'] = '',
    ['!'] = '',
    ['t'] = '',
}

local function mode_component()
    local current_mode = vim.api.nvim_get_mode().mode

    local mode = string.format('%s ', modes[current_mode])

    local color = '%#StatuslineNormalMode#'
    if current_mode == 'n' then
        color = '%#StatuslineNormalMode#'
    elseif current_mode == 'i' or current_mode == 'ic' then
        color = '%#StatuslineInsertMode#'
    elseif current_mode == 'v' or current_mode == 'V' or current_mode == '' then
        color = '%#StatuslineVisualMode#'
    elseif current_mode == 'R' then
        color = '%#StatuslineReplaceMode#'
    elseif current_mode == 'c' then
        color = '%#StatuslineCmdMode#'
    elseif current_mode == 't' then
        color = '%#StatuslineTerminalMode#'
    end

    return table.concat({ '%#Statusline#', color, mode, '%#Statusline#' })
end

local function git_component()
    local signs = vim.b.gitsigns_status_dict or { head = '', added = 0, changed = 0, removed = 0 }

    if signs.head == '' then
        return ''
    end

    local changes = ''
    if signs.added ~= nil and signs.added ~= 0 then
        changes = changes .. string.format('%%#StatuslineGitAdded#+%s', signs.added)
    end
    if signs.changed ~= nil and signs.changed ~= 0 then
        changes = changes .. string.format('%%#StatuslineGitChanged#~%s', signs.changed)
    end
    if signs.removed ~= nil and signs.removed ~= 0 then
        changes = changes .. string.format('%%#StatuslineGitRemoved#-%s', signs.removed)
    end

    local result = string.format('%%#StatuslineGitBranch# %s', signs.head)
    if changes ~= '' then
        result = result .. ' ' .. changes
    end

    if result == '' then
        return ''
    end

    return left_separator .. result .. '%#Statusline#'
end

local function lsp_component()
    local count = {
        error = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })),
        warning = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })),
        info = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })),
        hint = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })),
    }

    local result = ''

    if count['error'] ~= 0 then
        result = result .. '%#StatislineError# ' .. count['error']
    end
    if count['warning'] ~= 0 then
        if result ~= '' then
            result = result .. ' '
        end
        result = result .. '%#StatuslineWarning# ' .. count['warning']
    end
    if count['hint'] ~= 0 then
        if result ~= '' then
            result = result .. ' '
        end
        result = result .. '%#StatuslineHint# ' .. count['hint']
    end
    if count['info'] ~= 0 then
        if result ~= '' then
            result = result .. ' '
        end
        result = result .. '%#StatuslineInfo# ' .. count['info']
    end

    if result == '' then
        return ''
    end

    return left_separator .. result .. '%#Statusline#'
end

local function filepath_component()
    local filepath = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.:h')
    if filepath == '.' then
        filepath = ''
    end

    if filepath ~= '' then
        filepath = string.format('%%<%s/', filepath)
    end
    local filename = vim.fn.expand('%:t')

    return table.concat({ '%#StatuslineFilename#', filepath, filename, ' %m', '%#Statusline#' })
end

local function filetype_component()
    local buf = vim.api.nvim_get_current_buf()

    local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
    local icon, icon_hl = icons.get_icon(name, filetype, { default = true })

    return table.concat({ '%#', icon_hl, '#', icon, ' ', filetype, '%#Statusline#', right_separator })
end

local function cursor_position_component()
    return '%l:%c %P'
end

function Statusline.active()
    return table.concat({
        left_border,
        mode_component(),
        git_component(),
        lsp_component(),
        align,
        filepath_component(),
        align,
        filetype_component(),
        cursor_position_component(),
        right_border,
    })
end

function Statusline.dashboard()
    return table.concat({})
end

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    callback = function()
        vim.opt_local.statusline = '%!v:lua.Statusline.active()'
    end,
})
