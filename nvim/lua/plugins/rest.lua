return {
  'rest-nvim/rest.nvim',

  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'json',
      callback = function(ev)
        vim.bo[ev.buf].formatprg = 'jq'
      end,
    })
  end,
}
