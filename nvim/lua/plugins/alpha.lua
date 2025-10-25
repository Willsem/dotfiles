return {
  'goolord/alpha-nvim',

  config = function()
    local dashboard = require('alpha.themes.dashboard')
    local colors = require('colors.alpha')

    vim.api.nvim_set_hl(0, 'DashboardLogoBlue', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'DashboardLogoGreen', { fg = colors.green })
    vim.api.nvim_set_hl(0, 'DashboardLogoPlanet', { fg = colors.planet })

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
        { 'DashboardLogoPlanet', 45, 50 },
        { 'DashboardLogoBlue', 51, 53 },
        { 'DashboardLogoPlanet', 54, 56 },
        { 'DashboardLogoBlue', 56, 58 },
        { 'DashboardLogoPlanet', 59, 69 },
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
    }

    local stats = require('lazy').stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local v = vim.version()
    dashboard.section.footer.val =
      string.format(' %d.%d.%d  󰂖 %d plugins loaded in %d ms', v.major, v.minor, v.patch, stats.count, ms)

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('SPC f o', '󰈚  Recent Files', ':Telescope oldfiles<CR>'),
      dashboard.button('SPC f f', '  Find File', ':Telescope find_files<CR>'),
      dashboard.button('SPC f w', '  Find Word', ':Telescope live_grep<CR>'),
      dashboard.button('q', '󰗼  Quit NVIM', ':qa<CR>'),
    }

    require('alpha').setup(dashboard.config)
  end,
}
