local dashboard = require("alpha.themes.dashboard") --[[
    [[                     `. ___                                  ]] ,
                  [[                    __,' __`.                _..----....____ ]],
                  [[        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-']],
                  [[  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'    ]],
                  [[,'________________                          \`-._`-','       ]],
                  [[ `._              ```````````------...___   '-.._'-:         ]],
                  [[    ```--.._      ,.                     ````--...__\-.      ]],
                  [[            `.--. `-`                       ____    |  |`    ]],
                  [[              `. `.                       ,'`````.  ;  ;`    ]],
                  [[                `._`.        __________   `.      \'__/`     ]],
                  [[                   `-:._____/______/___/____`.     \  `      ]],
                  [[                               |       `._    `.    \        ]],
                  [[                               `._________`-.   `.   `.___   ]],
                  [[                                                  `------'`  ]]
-- ]]

dashboard.section.header.val = {
    [[                     `. ___                                  ]],
    [[                    __,' __`.                _..----....____ ]],
    [[        __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-']],
    [[  _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'    ]],
    [[,'________________                          \`-._`-','       ]],
    [[ `._              ```````````------...___   '-.._'-:         ]],
    [[    ```--.._      ,.                     ````--...__\-.      ]],
    [[            `.--. `-`     N E O V I M       ____    |  |`    ]],
    [[              `. `.                       ,'`````.  ;  ;`    ]],
    [[                `._`.        __________   `.      \'__/`     ]],
    [[                   `-:._____/______/___/____`.     \  `      ]],
    [[                               |       `._    `.    \        ]],
    [[                               `._________`-.   `.   `.___   ]],
    [[                                                  `------'`  ]]
}

local stats = require('lazy').stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
local v = vim.version()
dashboard.section.footer.val = string.format(
                                   " %d.%d.%d  󰂖 %d plugins loaded in %d ms",
                                   v.major, v.minor, v.patch, stats.count, ms)

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("SPC f o", "󰈚  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("SPC f w", "󰈭  Find Word", ":Telescope live_grep<CR>"),
    dashboard.button("q", "󰗼  Quit NVIM", ":qa<CR>")
}

require("alpha").setup(dashboard.config)
