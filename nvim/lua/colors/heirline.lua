local colors = require('vscode.colors').get_colors()

return {
    git_add = colors.vscGitAdded,
    git_del = colors.vscGitDeleted,
    git_change = colors.vscGitModified,

    git_branch = colors.vscViolet,

    scrollbar = colors.vscBlue,

    error = colors.vscRed,
    warning = colors.vscYellow,
    info = colors.vscBlue,
    hint = colors.vscBlue,

    bg = colors.vscBack,
    fg = colors.vscFront,

    fg_light = colors.vscGray,

    red = colors.vscRed,
    green = colors.vscGreen,
    cyan = colors.vscBlueGreen,
    orange = colors.vscOrange,
    purple = colors.vscViolet
}
