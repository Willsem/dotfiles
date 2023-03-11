return {
  init = function(self)
    self.mode = vim.api.nvim_get_mode().mode
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = "redrawstatus",
      })
      self.once = true
    end
  end,
  static = {
    mode_colors = {
      n = "red" ,
      i = "green",
      v = "cyan",
      V =  "cyan",
      ["\22"] =  "cyan",
      c =  "orange",
      s =  "purple",
      S =  "purple",
      ["\19"] =  "purple",
      R =  "orange",
      r =  "orange",
      ["!"] =  "red",
      t =  "red",
    }
  },
  provider = "█",
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = self.mode_colors[mode] }
  end,
  update = {
    "ModeChanged",
  },
}
