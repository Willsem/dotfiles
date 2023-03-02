return {
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim", "packer_plugins", "bit" } },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
        },
      },
    },
  },
}
