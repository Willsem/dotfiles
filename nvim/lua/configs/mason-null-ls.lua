require('mason-null-ls').setup({
  automatic_setup = true,
  handlers = {
    function(source_name, methods)
      require('mason-null-ls.automatic_setup')(source_name, methods)
    end,
  },
})
