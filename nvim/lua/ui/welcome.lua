-- [[    ▄                       ▀▀ ▄           ]],
-- [[    ████▄ ▄█▀█▄ ▄███▄▀█▄ ██▀██ ███▄███▄    ]],
-- [[    ██ ██ ██▄█▀ ██ ██ ██▄██ ██ ██ ██ ██    ]],
-- [[   ▄██ ▀█▄▀█▄▄▄▄▀███▀  ▀█▀ ▄██▄██ ██ ▀█    ]],
-- [[                                         _.oo.]],
-- [[                 _.u[[/;:,.         .odMMMMMM']],
-- [[              .o888UU[[[/;:-.  .o@P^    MMM^  ]],
-- [[             oN88888UU[[[/;::-.        dP^    ]],
-- [[            dNMMNN888UU[[[/;:--.   .o@P^      ]],
-- [[           ,MMMMMMN888UU[[/;::-. o@^          ]],
-- [[           NNMMMNN888UU[[[/~.o@P^             ]],
-- [[           888888888UU[[[/o@^-..              ]],
-- [[          oI8888UU[[[/o@P^:--..               ]],
-- [[       .@^  YUU[[[/o@^;::---..                ]],
-- [[     oMP     ^/o@P^;:::---..                  ]],
-- [[  .dMMM    .o@^ ^;::---...                    ]],
-- [[ dMMMMMMM@^`       `^^^^                      ]],
-- [[YMMMUP^                                       ]],
-- [[ ^^                                           ]],
local function generate_lines()
    local v = vim.version()

    local maxVersionLen = 10
    local versionLen = 2 + (v.major >= 10 and 2 or 1) + 1 + (v.minor >= 10 and 2 or 1) + 1 + (v.patch >= 10 and 2 or 1)
    local needSpacesVersionString = maxVersionLen - versionLen

    local versionString = string.rep(' ', needSpacesVersionString / 2)
        .. string.format(' %d.%d.%d', v.major, v.minor, v.patch)
        .. string.rep(' ', needSpacesVersionString / 2 + needSpacesVersionString % 2)

    local lines = {
        [[                                         _.oo.]],
        [[                 _.u[[/;:,.         .odMMMMMM']],
        [[              .o888UU[[[/;:-.  .o@P^    MMM^  ]],
        [[             oN88888UU[[[/;::-.        dP^    ]],
        [[            dNMMNN888UU[[[/;:--.   .o@P^      ]],
        [[      ▄    ,MMMMMMN888UU[[/;::▀▀ ▄@^          ]],
        [[      ████▄N▄█▀█▄N▄███▄▀█▄/██▀██^███▄███▄     ]],
        [[      ██ ██8██▄█▀8██U██[██▄██-██ ██ ██ ██     ]],
        [[     ▄██ ▀█▄▀█▄▄▄▄▀███▀@P▀█▀-▄██▄██ ██ ▀█     ]],
        [[       .@^  YUU[[[/o@^;::---..                ]],
        [[     oMP     ^/o@P^;:::---..                  ]],
        [[  .dMMM    .o@^ ^;::---...                    ]],
        [[ dMMMMMMM@^`       `^^^^                      ]],
        [[YMMMUP^                                       ]],
        [[ ^^                                           ]],
        [[                                              ]],
        string.format(
            [[ ╭─────────────── %s ───────────────╮ ]],
            versionString
        ),
        [[ │                                          │ ]],
        [[ │   [n]ew file   [e]xplorer  [f]ind files  │ ]],
        [[ │  find [w]ords   [r]ecent    [s]ettings   │ ]],
        [[ │                  [q]uit                  │ ]],
        [[ │                                          │ ]],
        [[ ╰──────────────────────────────────────────╯ ]],
    }

    local colors = {
        { hl = 'DashboardOrange', line = 0, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 1, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 2, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 3, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 4, start_col = 0, end_col = 46 },

        { hl = 'DashboardGreen', line = 5, start_col = 0, end_col = 13 },
        { hl = 'DashboardOrange', line = 5, start_col = 13, end_col = 32 },
        { hl = 'DashboardBlue', line = 5, start_col = 32, end_col = 42 },
        { hl = 'DashboardOrange', line = 5, start_col = 42, end_col = 54 },

        { hl = 'DashboardGreen', line = 6, start_col = 0, end_col = 21 },
        { hl = 'DashboardOrange', line = 6, start_col = 21, end_col = 22 },
        { hl = 'DashboardGreen', line = 6, start_col = 22, end_col = 37 },
        { hl = 'DashboardOrange', line = 6, start_col = 37, end_col = 38 },
        { hl = 'DashboardGreen', line = 6, start_col = 38, end_col = 53 },
        { hl = 'DashboardBlue', line = 6, start_col = 53, end_col = 62 },
        { hl = 'DashboardOrange', line = 6, start_col = 62, end_col = 63 },
        { hl = 'DashboardBlue', line = 6, start_col = 63, end_col = 78 },
        { hl = 'DashboardOrange', line = 6, start_col = 78, end_col = 79 },
        { hl = 'DashboardBlue', line = 6, start_col = 79, end_col = 108 },

        { hl = 'DashboardGreen', line = 7, start_col = 0, end_col = 19 },
        { hl = 'DashboardOrange', line = 7, start_col = 19, end_col = 20 },
        { hl = 'DashboardGreen', line = 7, start_col = 20, end_col = 35 },
        { hl = 'DashboardOrange', line = 7, start_col = 35, end_col = 36 },
        { hl = 'DashboardGreen', line = 7, start_col = 36, end_col = 42 },
        { hl = 'DashboardOrange', line = 7, start_col = 42, end_col = 43 },
        { hl = 'DashboardGreen', line = 7, start_col = 43, end_col = 49 },
        { hl = 'DashboardOrange', line = 7, start_col = 49, end_col = 50 },
        { hl = 'DashboardBlue', line = 7, start_col = 50, end_col = 65 },
        { hl = 'DashboardOrange', line = 7, start_col = 65, end_col = 66 },
        { hl = 'DashboardBlue', line = 7, start_col = 66, end_col = 98 },

        { hl = 'DashboardGreen', line = 8, start_col = 0, end_col = 57 },
        { hl = 'DashboardOrange', line = 8, start_col = 57, end_col = 59 },
        { hl = 'DashboardBlue', line = 8, start_col = 59, end_col = 68 },
        { hl = 'DashboardOrange', line = 8, start_col = 68, end_col = 69 },
        { hl = 'DashboardBlue', line = 8, start_col = 69, end_col = 106 },

        { hl = 'DashboardOrange', line = 9, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 10, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 11, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 12, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 13, start_col = 0, end_col = 46 },
        { hl = 'DashboardOrange', line = 14, start_col = 0, end_col = 46 },

        { hl = 'DashboardMenu', line = 16, start_col = 0, end_col = 111 },
        { hl = 'DashboardMenu', line = 17, start_col = 0, end_col = 50 },
        { hl = 'DashboardMenu', line = 18, start_col = 0, end_col = 50 },
        { hl = 'DashboardMenu', line = 19, start_col = 0, end_col = 50 },
        { hl = 'DashboardMenu', line = 20, start_col = 0, end_col = 50 },
        { hl = 'DashboardMenu', line = 21, start_col = 0, end_col = 50 },
        { hl = 'DashboardMenu', line = 22, start_col = 0, end_col = 134 },
    }

    return lines, colors
end

local function center_lines(lines, colors)
    local win_width = vim.api.nvim_win_get_width(0)
    for i, line in pairs(lines) do
        local text_width = vim.fn.strchars(line)
        local padding = math.floor((win_width - text_width) / 2)
        lines[i] = string.rep(' ', padding) .. line

        for j, color in pairs(colors) do
            if color.line == i - 1 then
                color.start_col = color.start_col + padding
                color.end_col = color.end_col + padding
                colors[j] = color
            end
        end
    end

    local win_height = vim.api.nvim_win_get_height(0)
    local lines_before = math.floor((win_height - #lines) / 2)
    for i = 1, lines_before do
        table.insert(lines, i, '')
    end

    for i, color in pairs(colors) do
        color.line = color.line + lines_before
        colors[i] = color
    end

    local lines_after = lines_before + (win_height - #lines) % 2
    for _ = 1, lines_after do
        table.insert(lines, '')
    end

    return lines, colors
end

local function setup_mappings(buf)
    -- [n]ew file   [e]xplorer  [f]ind files  │ ]],
    -- find [w]ords  [r]ecent    [s]ettings   │ ]],
    --               [q]uit                   │ ]],

    vim.keymap.set('n', 'n', function()
        vim.cmd('enew')
    end, { buffer = buf })

    local utils = require('utils')
    vim.keymap.set('n', 'e', utils.open_explorer, { buffer = buf })

    local telescope_builtin = require('telescope.builtin')
    vim.keymap.set('n', 'f', telescope_builtin.find_files, { buffer = buf })
    vim.keymap.set('n', 'w', telescope_builtin.live_grep, { buffer = buf })
    vim.keymap.set('n', 'r', telescope_builtin.oldfiles, { buffer = buf, desc = 'Recent files' })

    vim.keymap.set('n', 's', function()
        vim.cmd('edit $MYVIMRC')
    end, { buffer = buf, desc = 'Open settings' })

    vim.keymap.set('n', 'q', function()
        vim.cmd('quit')
    end, { buffer = buf, desc = 'Quit' })
end

local function dashboard()
    if vim.fn.argc() > 0 then
        return
    end

    local buf = vim.api.nvim_create_buf(false, true)
    local ns_id = vim.api.nvim_create_namespace('color_namespace')

    local lines, colors = generate_lines()
    lines, colors = center_lines(lines, colors)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    for _, color in pairs(colors) do
        vim.api.nvim_buf_set_extmark(buf, ns_id, color.line, color.start_col, {
            end_col = color.end_col,
            hl_group = color.hl,
        })
    end

    vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
    vim.api.nvim_set_option_value('filetype', 'dashboard', { buf = buf })

    vim.api.nvim_win_set_buf(0, buf)
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.list = false

    setup_mappings(buf)
    vim.opt_local.statusline = '%!v:lua.Statusline.dashboard()'
end

vim.api.nvim_create_autocmd('VimEnter', {
    callback = dashboard,
    once = false,
})
