local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[      ,--._______,-.                      ]],
    [[    ,','  ,    .  ,_`-.                   ]],
    [[   / /  ,' , _` ``. |  )       `-..       ]],
    [[  (,';'""`/ '"`-._ ` \/ ______    \\      ]],
    [[    : ,o.-`- ,o.  )\` -'      `---.))     ]],
    [[    : , d8b ^-.   '|   `.      `    `.    ]],
    [[    |/ __:_     `. |  ,  `       `    \   ]],
    [[    | ( ,-.`-.    ;'  ;   `       :    ;  ]],
    [[    | |  ,   `.      /     ;      :    \  ]],
    [[    ;-'`:::._,`.__),'             :     ; ]],
    [[   / ,  `-   `--                  ;     | ]],
    [[  /  \                   `       ,      | ]],
    [[ (    `     :              :    ,\      | ]],
    [[  \   `.    :     :        :  ,'  \    :  ]],
    [[   \    `|-- `     \ ,'    ,-'     :-.-'; ]],
    [[   :     |`--.______;     |        :    : ]],
    [[    :    /           |    |         |   \ ]],
    [[    |    ;           ;    ;        /     ;]],
    [[  _/--' |           :`-- /         \_:_:_|]],
    [[,',','  |           |___ \                ]],
    [[`^._,--'           / , , .)               ]],
    [[                   `-._,-'   _            ]],
    [[          ___  ___ ___ _  __(_)_ _        ]],
    [[         / _ \/ -_) _ \ |/ / /  ' \       ]],
    [[        /_//_/\__/\___/___/_/_/_/_/       ]]
}

local plugins = #vim.tbl_keys(require("lazy").plugins())
local v = vim.version()
dashboard.section.footer.val = string.format("󰂖 %d   %d.%d.%d",
                                             plugins, v.major, v.minor, v.patch)

dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("SPC f o", "󰈚  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("SPC f w", "󰈭  Find Word", ":Telescope live_grep<CR>"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>")
}

require("alpha").setup(dashboard.config)
