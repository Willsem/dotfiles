return {
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = { vim.fn.expand('$VIMRUNTIME/lua') },
      },
    },
  },
}
