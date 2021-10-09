require("rest-nvim").setup({
    result_split_horizontal = false,
    skip_ssl_verification = false,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    jump_to_request = false,
})

vim.cmd[[
nmap <C-r> <Plug>RestNvim
]]
