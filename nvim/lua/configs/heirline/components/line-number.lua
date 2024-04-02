local alignment = require('configs.heirline.components.alignment')

return {
  {
    provider = '%l:%c',
    hl = {
      bg = 'bg',
      fg = 'fg',
    },
  },
  alignment.separator,
}
