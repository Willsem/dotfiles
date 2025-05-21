vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  callback = function(ev)
    vim.bo[ev.buf].formatprg = 'jq'
  end,
})
