local conditions = require("heirline.conditions")

return {
    condition = conditions.is_git_repo,

    init = function(self) self.branch = vim.b.gitsigns_status_dict.head end,

    hl = {fg = "git_branch", bg = "bg", bold = true},

    provider = function(self) return " " .. self.branch end
}
