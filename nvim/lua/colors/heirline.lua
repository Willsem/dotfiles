local colors = require('catppuccin.palettes').get_palette('frappe')

return {
  fg = colors.text,
  bg = colors.surface0,

  git_branch = colors.mauve,
  git_add = colors.green,
  git_change = colors.yellow,
  git_del = colors.red,

  mode_normal = colors.red,
  mode_insert = colors.green,
  mode_visual = colors.sapphire,
  mode_cmd = colors.mauve,
  mode_select = colors.yellow,
  mode_replace = colors.peach,
  mode_terminal = colors.mauve,

  scrollbar = colors.blue,

  treesitter = colors.teal,
}
