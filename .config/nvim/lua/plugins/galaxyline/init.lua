--[[
              __                     __ __
.-----.---.-.|  |.---.-.--.--.--.--.|  |__|.-----.-----.
|  _  |  _  ||  ||  _  |_   _|  |  ||  |  ||     |  -__|
|___  |___._||__||___._|__.__|___  ||__|__||__|__|_____|
|_____|                      |_____|
--]]

local gl = require('galaxyline')

local colors = {
    bg              = '#24283b',

    giticon         = '#FF8800',
    gitbg           = '#5C2C2E',
    gittext         = '#C5C5C5',

    diagerror       = '#F44747',
    diagwarn        = '#FF8800',
    diaghint        = '#4FC1FF',
    diaginfo        = '#FFCC66',

    lspicon         = '#68AF00',
    lspbg           = '#304B2E',
    lsptext         = '#C5C5C5',

    typeicon        = '#FF8800',
    typebg          = '#5C2C2E',
    typetext        = '#C5C5C5',

    statsicon       = '#9CDCFE',
    statsbg         = '#5080A0',
    statstext       = '#000000',

    lineokfg        = '#000000',
    lineokbg        = '#5080A0',
    linelongfg      = '#990000',
    linelongwarnfg  = '#664400',
    linelongbg      = '#5080A0',

    shortbg         = '#DCDCAA',
    shorttext       = '#000000',

    shortrightbg    = '#3F3F3F',
    shortrighttext  = '#7C4C4E',

    red             = '#D16969',
    yellow          = '#DCDCAA',
    magenta         = '#D16D9E',
    green           = '#9DCF64',
    orange          = '#FF8800',
    purple          = '#C586C0',
    blue            = '#569CD6',
    cyan            = '#4EC9B0'
}

local lineLengthWarning = 80
local lineLengthError = 120
local leftbracket = ""
local rightbracket = ""
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'tagbar'}
local gls = gl.section
local condition = require('galaxyline.condition')
-- }}}1

-- Left {{{1
local c = 1

-- Edit mode {{{2
gls.left[c] = {
    ViModeSpace = {
        provider = function() return " " end,
        highlight = {colors.giticon, colors.bg}
    }
}

c = c+1
gls.left[c] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {
                n = colors.blue,
                i = colors.red,
                v = colors.purple,
                [''] = colors.purple,
                V = colors.purple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!'] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
            return ""
        end,
        separator = " ",
        separator_highlight = {colors.red, colors.bg},
        highlight = {colors.red, colors.bg}
    }
}

print(vim.fn.getbufvar(0, 'ts'))
vim.fn.getbufvar(0, 'ts')
-- }}}2

-- Git info {{{2

-- Git Branch Name {{{3
c = c+1
gls.left[c] = {
    GitStart = {
        provider = function() return leftbracket end,
        condition = condition.check_git_workspace,
        highlight = {colors.giticon, colors.bg}
    }
}
c = c+1
gls.left[c] = {
    GitIcon = {
        provider = function()
            return ' '
        end,
        condition = condition.check_git_workspace,
        separator = '',
        separator_highlight = {'NONE', colors.giticon},
        highlight = {colors.gitbg, colors.giticon}
    }
}
c = c+1
gls.left[c] = {
    GitMid = {
        provider = function() return rightbracket .. ' ' end,
        condition = condition.check_git_workspace,
        highlight = {colors.giticon, colors.gitbg}
    }
}

c = c+1
gls.left[c] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.gitbg},
        highlight = {colors.gittext, colors.gitbg}
    }
}
-- }}}3
-- Git Changes {{{3
c = c+1
gls.left[c] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.check_git_workspace,
        -- icon = '  ',
        icon = '  ',
        highlight = {colors.green, colors.gitbg}
    }
}
c = c+1
gls.left[c] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.check_git_workspace,
        -- icon = '  ',
        icon = ' 柳',
        highlight = {colors.blue, colors.gitbg}
    }
}

c = c+1
gls.left[c] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.check_git_workspace,
        -- icon = '  ',
        icon = '  ',
        highlight = {colors.red, colors.gitbg}
    }
}

c = c+1
gls.left[c] = {
    EndGit = {
        provider = function() return rightbracket end,
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = {colors.gitbg, colors.bg},
        highlight = {colors.gitbg, colors.bg}
    }
}
-- }}}3

-- }}}2

-- Lsp Section {{{2

-- Lsp Client {{{3
c = c+1
gls.left[c] = {
    LspStart = {
        provider = function() return leftbracket end,
        highlight = {colors.lspicon, colors.bg}
    }
}

c = c+1
gls.left[c] = {
    LspIcon = {
        provider = function()
            local name = ""

            if gl.lspclient ~= nil then
                name = gl.lspclient()
            end

            return '' .. name
        end,
        highlight = {colors.lspbg, colors.lspicon}
    }
}

c = c+1
gls.left[c] = {
    LspMid = {
        provider = function() return rightbracket .. ' ' end,
        highlight = {colors.lspicon, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    ShowLspClient = {
        provider = 'GetLspClient',
        highlight = {colors.textbg, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    LspSpace4 = {
        provider = function() return ' ' end,
        highlight = {colors.lspicon, colors.lspbg}
,    }
}
-- }}}
-- Diagnostics {{{3
c = c+1
gls.left[c] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        separator_highlight = {colors.gitbg, colors.bg},
        highlight = {colors.diagerror, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.diagwarn, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.diaghint, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.diaginfo, colors.lspbg}
    }
}

c = c+1
gls.left[c] = {
    LspSectionEnd = {
        provider = function() return rightbracket .. " " end,
        highlight = {colors.lspbg, colors.bg}
    }
}

-- }}}3

-- }}}2

-- }}}1

-- Right {{{1
c = 1

-- Type {{{2
c = c+1
gls.right[c] = { TypeStart = { provider = function() return leftbracket end, highlight = {colors.typeicon, colors.bg} } }
c = c+1
gls.right[c] = {
    TypeIcon = {
        provider = function()
            return ''
        end,
        highlight = {colors.typebg, colors.typeicon}
    }
}
c = c+1
gls.right[c] = { TypeMid = { provider = function() return rightbracket .. ' ' end, highlight = {colors.typeicon, colors.typebg} } }

c = c+1
gls.right[c] = {
    FileName = {
        provider = 'FileName',
        separator_highlight = {'NONE', colors.typebg},
        highlight = {colors.typetext, colors.typebg}
    }
}

-- c = c+1
-- gls.right[c] = {
    -- FileName = {
        -- provider = file_readonly(),
        -- highlight = {colors.typetext, colors.typebg}
    -- }
-- }

c = c+1
gls.right[c] = {
    FileSize = {
        provider = 'FileSize',
        separator = ' ',
        separator_highlight = {colors.typeicon, colors.typebg},
        highlight = {colors.typetext, colors.typebg}
    }
}

c = c+1
gls.right[c] = { FileIcon = { provider = 'FileIcon', highlight = {colors.typeicon, colors.typebg} } }

c = c+1
gls.right[c] = {
    BufferType = {
        provider = 'FileTypeName',
        highlight = {colors.typetext, colors.typebg}
    }
}

c = c+1
gls.right[c] = {
    FileFormat = {
        provider = 'FileFormat',
        separator = ' ⏎ ',
        separator_highlight = {colors.typeicon, colors.typebg},
        highlight = {colors.typetext, colors.typebg}
    }
}

c = c+1
gls.right[c] = {
    FileEncode = {
        provider = 'FileEncode',
        separator = ' ',
        separator_highlight = {colors.typeicon, colors.typebg},
        highlight = {colors.typetext, colors.typebg}
    }
}
c = c+1
gls.right[c] = { TypeSectionEnd = { provider = function() return rightbracket end, highlight = {colors.typebg, colors.bg} } }

c = c+1
gls.right[c] = { Space = { provider = function() return ' ' end, highlight = {colors.typebg, colors.bg} } }

-- }}}2

-- File Position Section {{{2
c = c+1
gls.right[c] = { StatsSectionStart = { provider = function() return leftbracket end, highlight = {colors.statsicon, colors.bg} } }
c = c+1
gls.right[c] = {
    StatsIcon = {
        provider = function()
            return '⅑'
        end,
        highlight = {colors.statsbg, colors.statsicon}
    }
}
c = c+1
gls.right[c] = { StatsMid = { provider = function() return rightbracket .. ' ' end, highlight = {colors.statsicon, colors.statsbg} } }

c = c+1
gls.right[c] = {
    PerCent = {
        provider = 'LinePercent',
        highlight = {colors.statstext, colors.statsbg}
    }
}

c = c+1
gls.right[c] = {
    VerticalPosAndSize = {
        provider = function()
            return string.format("%4i/%4i ", vim.fn.line('.'), vim.fn.line('$'))
        end,
        separator = '⇕ ',
        separator_highlight = {colors.statsicon, colors.statsbg},
        highlight = {colors.statstext, colors.statsbg}
    }
}

c = c+1
gls.right[c] = {
    CursorColumn = {
        provider = function()
            if (vim.fn.col('.') > lineLengthWarning)
            then
                if (vim.fn.col('.') > lineLengthError)
                then
                    vim.cmd('highlight LinePosHighlight guifg=' .. colors.linelongfg .. ' guibg=' .. colors.linelongbg)
                else
                    vim.cmd('highlight LinePosHighlight guifg=' .. colors.linelongwarnfg .. ' guibg=' .. colors.linelongbg)
                end
            else
                vim.cmd('highlight LinePosHighlight guifg=' .. colors.lineokfg .. ' guibg=' .. colors.lineokbg)
            end
            return " " .. string.format("%3i", vim.fn.col('.'))
        end,
        separator = '⇔ ',
        separator_highlight = {colors.statsicon, colors.statsbg},
        highlight = 'LinePosHighlight'
    }
}

c = c+1
gls.right[c] = {
    LineLength = {
        provider = function()
            if (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthWarning)
            then
                if (vim.fn.strwidth(vim.fn.getline('.')) > lineLengthError)
                then
                    vim.cmd('highlight LineLenHighlight guifg=' .. colors.linelongfg .. ' guibg=' .. colors.linelongbg)
                else
                    vim.cmd('highlight LineLenHighlight guifg=' .. colors.linelongwarnfg .. ' guibg=' .. colors.linelongbg)
                end
            else
                vim.cmd('highlight LineLenHighlight guifg=' .. colors.lineokfg .. ' guibg=' .. colors.lineokbg)
            end

            return "/" .. string.format("%3i", string.len(vim.fn.getline('.'))) .. " "
        end,
        highlight = 'LineLenHighlight'
    }
}

c = c+1
gls.right[c] = {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {colors.statsicon, colors.statsbg},
        highlight = {colors.statstext, colors.statsbg}
    }
}

c = c+1
gls.right[c] = { StatsSpcSectionEnd = { provider = function() return rightbracket .. " " end, highlight = {colors.statsbg, colors.bg} } }

-- }}}2

-- }}}1

-- Left Short {{{1
c = 1
gls.short_line_left[c] = { ShortSectionStart = { provider = function() return leftbracket  end, highlight = {colors.shortbg, colors.bg} } }

c = c+1
gls.short_line_left[c] = { ShortSectionSpace = { provider = function() return " "  end, highlight = {colors.shorttext, colors.shortbg} } }

c = c+1
gls.short_line_left[c] = {
    LeftShortName = {
        provider = 'FileTypeName',
        highlight = {colors.shorttext, colors.shortbg},
    }
}

c = c+1
gls.short_line_left[c] = { ShortSectionMid = { provider = function() return " " end, highlight = {colors.shortbg, colors.shortbg} } }

c = c+1
gls.short_line_left[c] = {
    LeftShortFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        separator_highlight = {colors.shorttext, colors.shortbg},
        highlight = {colors.shorttext, colors.shortbg},
    }
}

c = c+1
gls.short_line_left[c] = {
    ShortSectionEnd = {
        provider = function() return rightbracket end,
        highlight = {colors.shortbg, colors.bg}
    }
}

-- }}}1

-- Right Short {{{1
c = 1
gls.short_line_right[c] = {
    BufferIcon = {
        provider = 'BufferIcon',
        separator_highlight = {colors.shorttext, colors.bg},
        highlight = {colors.shortrighttext, colors.bg}
    }
}
-- }}}1
