vim.cmd('let g:neo_tree_remove_legacy_commands = 1')

require('neo-tree').setup({
  close_if_last_window = true,
  default_component_configs = {
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
    },
    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
    indent = {
      with_markers = false,
      with_expanders = true,
      expander_collapsed = '',
      expander_expanded = '',
    },
  },
  window = {
    width = 30,
    mappings = {
      ['<space>'] = false,
      ['o'] = 'open',
      ['H'] = 'prev_source',
      ['L'] = 'next_source',
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    window = {
      mappings = {
        ['h'] = 'toggle_hidden',
      },
    },
  },
})
