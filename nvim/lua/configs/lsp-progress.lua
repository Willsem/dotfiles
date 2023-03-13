require("lsp-progress").setup({
  format = function(client_messages)
    return #client_messages > 0
            and table.concat(client_messages, " ")
        or ""
  end,
})
