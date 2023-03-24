local whichkey = require("which-key")
local mappings = require("core.mappings")

vim.o.timeout = true
vim.o.timeoutlen = 500

for _, group in ipairs(mappings.groups) do
    whichkey.register({[group.prefix] = {name = group.name}}, {})
end

for mode, maps in pairs(mappings.mappings) do
    for key, mapping in pairs(maps) do
        whichkey.register({[key] = {{mapping.cmd, mapping.desc}}}, {mode = mode})
    end
end

whichkey.setup({
    key_labels = {["<leader>"] = "SPACE"},
    icons = {breadcrumb = "»", separator = "", group = "+"},
    window = {
        border = "single",
        position = "bottom",
        margin = {2, 2, 2, 4},
        padding = {2, 2, 2, 2},
        winblend = 0
    }
})
