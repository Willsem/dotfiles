return {
    {
        'https://github.com/vague-theme/vague.nvim',

        opts = {
            on_highlights = function(hl, colors)
                hl.TelescopeSelectionCaret = { bg = colors.line }
                hl.TelescopeSelection = { bg = colors.line }

                hl.StatuslineNormalMode = { fg = '#d8647e' }
                hl.StatuslineInsertMode = { fg = '#7fa563' }
                hl.StatuslineVisualMode = { fg = '#8ba9c1' }
                hl.StatuslineReplaceMode = { fg = '#f5cb96' }
                hl.StatuslineCmdMode = { fg = '#bb9dbd' }
                hl.StatuslineTerminalMode = { fg = '#bb9dbd' }
                hl.StatuslineFilename = { fg = colors.comment }

                hl.StatuslineGitBranch = { fg = hl.StatuslineCmdMode.fg, gui = 'bold' }
                hl.StatuslineGitAdded = { fg = hl.StatuslineInsertMode.fg }
                hl.StatuslineGitChanged = { fg = hl.StatuslineReplaceMode.fg }
                hl.StatuslineGitRemoved = { fg = hl.StatuslineNormalMode.fg }
                hl.StatislineError = { fg = colors.error }
                hl.StatuslineWarning = { fg = colors.warning }
                hl.StatuslineHint = { fg = colors.hint }
                hl.StatuslineInfo = { fg = colors.constant }
                hl.StatuslineSeparator = { fg = colors.comment }

                hl.DashboardBlue = { fg = '#6e94b2', gui = 'bold' }
                hl.DashboardGreen = { fg = '#7fa563', gui = 'bold' }
                hl.DashboardOrange = { fg = '#f5cb96', gui = 'bold' }
                hl.DashboardMenu = { fg = colors.comment }

                hl.TabLineSel = { fg = colors.fg, gui = 'bold' }
                hl.TabLine = { fg = colors.comment }
                hl.TabLineSep = { fg = colors.comment }
            end,
        },

        config = function(_, opts)
            require('vague').setup(opts)
            vim.cmd.colorscheme('vague')
        end,
    },
}
