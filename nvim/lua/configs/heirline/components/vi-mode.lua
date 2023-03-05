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
    mode_names = {
      ["n"]     = "NORMAL",
      ["no"]    = "O-PEND",
      ["nov"]   = "O-PEND",
      ["noV"]   = "O-PEND",
      ["no\22"] = "O-PEND",
      ["niI"]   = "NORMAL",
      ["niR"]   = "NORMAL",
      ["niV"]   = "NORMAL",
      ["nt"]    = "NORMAL",
      ["ntT"]   = "NORMAL",
      ["v"]     = "VISUAL",
      ["vs"]    = "VISUAL",
      ["V"]     = "V-LINE",
      ["Vs"]    = "V-LINE",
      ["\22"]   = "V-BOX ",
      ["\22s"]  = "V-BOX ",
      ["s"]     = "SELECT",
      ["S"]     = "S-LINE",
      ["\19"]   = "S-BOX ",
      ["i"]     = "INSERT",
      ["ic"]    = "INSERT",
      ["ix"]    = "INSERT",
      ["R"]     = "REPLAC",
      ["Rc"]    = "REPLAC",
      ["Rx"]    = "REPLAC",
      ["Rv"]    = "V-REPL",
      ["Rvc"]   = "V-REPL",
      ["Rvx"]   = "V-REPL",
      ["c"]     = "COMMAN",
      ["cv"]    = "EX    ",
      ["ce"]    = "EX    ",
      ["r"]     = "REPLAC",
      ["rm"]    = "MORE  ",
      ["r?"]    = "CONFIR",
      ["!"]     = "SHELL ",
      ["t"]     = "TERM  ",
    },
  },
  provider = function(self)
    return self.mode_names[self.mode]
  end,
  hl = { fg = "fg", bg = "bg" },
  update = {
    "ModeChanged",
  },
}
