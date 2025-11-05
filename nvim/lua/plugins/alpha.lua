return {
  'goolord/alpha-nvim',

  config = function()
    local dashboard = require('alpha.themes.dashboard')
    local colors = require('colors.alpha')

    vim.api.nvim_set_hl(0, 'DashboardLogoBlue', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'DashboardLogoGreen', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'DashboardLogoPlanet', { fg = colors.planet })

    local stats = require('lazy').stats()
    local v = vim.version()

    local maxVersionLen = 10
    local versionLen = 2 + (v.major >= 10 and 2 or 1) + 1 + (v.minor >= 10 and 2 or 1) + 1 + (v.patch >= 10 and 2 or 1)
    local needSpacesVersionString = maxVersionLen - versionLen
    local versionString = string.rep(' ', needSpacesVersionString / 2)
      .. string.format(' %d.%d.%d', v.major, v.minor, v.patch)
      .. string.rep(' ', needSpacesVersionString / 2 + needSpacesVersionString % 2)

    local maxPluginsLoadedLen = 13
    local pluginsLoadedLen = 2 + (stats.count >= 100 and 3 or (stats.count >= 10 and 2 or 1)) + 8
    local needSpacesPluginsLoaded = maxPluginsLoadedLen - pluginsLoadedLen
    local pluginsLoadedString = string.rep(' ', needSpacesPluginsLoaded / 2)
      .. string.format(' %d plugins', stats.count)
      .. string.rep(' ', needSpacesPluginsLoaded / 2 + needSpacesPluginsLoaded % 2)

    dashboard.section.header.val = {
      [[                                         _.oo.]],
      [[                 _.u[[/;:,.         .odMMMMMM']],
      [[              .o888UU[[[/;:-.  .o@P^    MMM^  ]],
      [[             oN88888UU[[[/;::-.        dP^    ]],
      [[            dNMMNN888UU[[[/;:--.   .o@P^      ]],
      [[        ▐ ▄ ▄▄▄ .MN888UU▌[▐·▪:-• ▌@▄ ·.       ]],
      [[       •█▌▐█▀▄.▀·▪888UU▪█·█▌██@·██ ▐███▪      ]],
      [[       ▐█▐▐▌▐▀▀▪▄8▄█▀▄[▐█▐█•▐█·▐█ ▌▐▌▐█·      ]],
      [[       ██▐█▌▐█▄▄▌▐█▌.▐▌@███-▐█▌██ ██▌▐█▌      ]],
      [[       ▀▀^█▪Y▀▀▀[[▀█▄▀▪.:▀--▀▀▀▀▀  █▪▀▀▀      ]],
      [[     oMP     ^/o@P^;:::---..                  ]],
      [[  .dMMM    .o@^ ^;::---...                    ]],
      [[ dMMMMMMM@^`       `^^^^                      ]],
      [[YMMMUP^                                       ]],
      [[ ^^                                           ]],
      [[                                              ]],
      string.format('        ╭─        %s        ─╮        ', versionString),
      string.format('        ╰─       %s      ─╯        ', pluginsLoadedString),
    }

    dashboard.section.header.opts.hl = {
      { { 'DashboardLogoPlanet', 0, 46 } },
      { { 'DashboardLogoPlanet', 0, 46 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      {
        { 'DashboardLogoGreen', 0, 25 },
        { 'DashboardLogoPlanet', 26, 34 },
        { 'DashboardLogoBlue', 34, 37 },
        { 'DashboardLogoPlanet', 37, 38 },
        { 'DashboardLogoBlue', 38, 40 },
        { 'DashboardLogoPlanet', 41, 42 },
        { 'DashboardLogoBlue', 43, 44 },
        { 'DashboardLogoPlanet', 45, 48 },
        { 'DashboardLogoBlue', 48, 53 },
        { 'DashboardLogoPlanet', 54, 56 },
        { 'DashboardLogoBlue', 56, 69 },
      },
      {
        { 'DashboardLogoGreen', 0, 35 },
        { 'DashboardLogoPlanet', 36, 42 },
        { 'DashboardLogoBlue', 42, 60 },
        { 'DashboardLogoPlanet', 61, 63 },
        { 'DashboardLogoBlue', 63, 92 },
      },
      {
        { 'DashboardLogoGreen', 0, 35 },
        { 'DashboardLogoPlanet', 36, 38 },
        { 'DashboardLogoGreen', 38, 50 },
        { 'DashboardLogoPlanet', 50, 51 },
        { 'DashboardLogoBlue', 51, 103 },
      },
      {
        { 'DashboardLogoGreen', 0, 52 },
        { 'DashboardLogoPlanet', 52, 54 },
        { 'DashboardLogoBlue', 54, 61 },
        { 'DashboardLogoPlanet', 62, 64 },
        { 'DashboardLogoBlue', 64, 103 },
      },
      {
        { 'DashboardLogoGreen', 0, 11 },
        { 'DashboardLogoPlanet', 12, 14 },
        { 'DashboardLogoGreen', 14, 18 },
        { 'DashboardLogoPlanet', 19, 21 },
        { 'DashboardLogoGreen', 21, 30 },
        { 'DashboardLogoPlanet', 30, 32 },
        { 'DashboardLogoGreen', 32, 45 },
        { 'DashboardLogoBlue', 46, 50 },
        { 'DashboardLogoPlanet', 51, 54 },
        { 'DashboardLogoBlue', 54, 91 },
      },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoPlanet', 0, 45 } },
      { { 'DashboardLogoBlue', 0, 53 } },
      { { 'DashboardLogoBlue', 0, 53 } },
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC f o', '󰈚  Recent Files', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC f f', '  Find File', ':Telescope find_files<CR>'),
      dashboard.button('SPC f w', '  Find Word', ':Telescope live_grep<CR>'),
      dashboard.button('q', '  Quit nvim', ':qa<CR>'),
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        dashboard.section.footer.val = string.format(' startup time: %d ms', stats.startuptime)
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    require('alpha').setup(dashboard.config)
  end,
}
