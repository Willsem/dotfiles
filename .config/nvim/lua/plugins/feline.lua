local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local LEFT = 1
local MIDDLE = 2
local RIGHT = 3

local colors = require("tokyonight.colors").setup({})
colors.bg = colors.bg_dark

local vi_mode_colors = {
    NORMAL = 'green',
    INSERT = 'red',
    VISUAL = 'blue',
    LINES = 'blue',
    BLOCK = 'blue',
    COMMAND = 'magenta',
}

local components = {
    active = {{}, {}, {}},
    inactive = {{}, {}, {}},
}

-- VI MODE
table.insert(components.active[LEFT], {
    provider = function()
        return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
    end,

    hl = function()
        local val = {}
        local color = vi_mode_colors[vi_mode_utils.get_vim_mode()]

        if color == nil then
            val.bg = vi_mode_utils.get_vim_color()
        else
            val.bg = color
        end

        val.fg = 'bg'
        val.style = 'bold'
        return val
    end,

    right_sep = ' '
})

-- FILE TYPE ICON
table.insert(components.active[LEFT], {
    provider = function()
        local filename = vim.fn.expand('%:t')
        local extension = vim.fn.expand('%:e')
        local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
        if icon == nil then
            icon = ''
        end
        return icon
    end,

    hl = function()
        local val = {}
        local filename = vim.fn.expand('%:t')
        local extension = vim.fn.expand('%:e')
        local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)

        if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
        else
            val.fg = 'white'
        end

        val.bg = 'bg'
        val.style = 'bold'
        return val
    end,

    right_sep = ' '
})

-- FILENAME
table.insert(components.active[LEFT], {
  provider = function()
    return vim.fn.expand("%:F")
  end,
  hl = {
    fg = 'fg_dark',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
})

-- FILE SIZE
table.insert(components.active[LEFT], {
    provider = 'file_size',
    enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
    hl = {
        fg = 'skyblue',
        bg = 'bg',
        style = 'bold'
    },
    right_sep = ' '
})

-- LSP
table.insert(components.active[MIDDLE], {
    provider = 'lsp_client_names',
    hl = {
        fg = 'yellow',
        bg = 'bg',
        style = 'bold'
    },
    right_sep = ' '
})

table.insert(components.active[MIDDLE], {
    provider = 'diagnostic_errors',
    enabled = function()
        return lsp.diagnostics_exist('Error')
    end,
    hl = {
        fg = colors.red
    }
})

table.insert(components.active[MIDDLE], {
    provider = 'diagnostic_warnings',
    enabled = function()
        return lsp.diagnostics_exist('Warning')
    end,
    hl = {
        fg = colors.yellow
    }
})

table.insert(components.active[MIDDLE], {
    provider = 'diagnostic_hints',
    enabled = function()
        return lsp.diagnostics_exist('Hint')
    end,
    hl = {
        fg = colors.cyan
    }
})

table.insert(components.active[MIDDLE], {
    provider = 'diagnostic_info',
    enabled = function()
        return lsp.diagnostics_exist('Information')
    end,
    hl = {
        fg = colors.blue
    }
})

table.insert(components.active[RIGHT], {
    provider = 'git_branch',
    icon = ' ',
    left_sep = ' ',
    hl = {
        fg = colors.magenta,
        style = 'bold'
    },
})

table.insert(components.active[RIGHT], {
    provider = 'git_diff_added',
    hl = {
        fg = colors.green
    }
})

table.insert(components.active[RIGHT], {
    provider = 'git_diff_changed',
    hl = {
        fg = colors.orange
    }
})

table.insert(components.active[RIGHT], {
    provider = 'git_diff_removed',
    hl = {
        fg = colors.red
    }
})

table.insert(components.active[RIGHT], {
  provider = 'position',
  hl = {
    fg = 'fg_dark',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
})

table.insert(components.active[RIGHT], {
  provider = 'line_percentage',
  hl = {
    fg = 'fg_dark',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
})

table.insert(components.active[RIGHT], {
    provider = 'scroll_bar',
    hl = {
        fg = colors.blue,
        style = 'bold'
    }
})

require('feline').setup({
    colors = colors,
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
})
