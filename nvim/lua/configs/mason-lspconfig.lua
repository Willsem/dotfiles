require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
  function(server_name)
    local settings = {
      capabilities = capabilities,
    }

    if (server_name == "lua_ls") then
      settings = require("configs.lspconfig.lua-ls")
    end

    require("lspconfig")[server_name].setup(settings)
  end,
})
