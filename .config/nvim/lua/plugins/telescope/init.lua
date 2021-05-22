--[[
 __          __
|  |_.-----.|  |.-----.-----.----.-----.-----.-----.
|   _|  -__||  ||  -__|__ --|  __|  _  |  _  |  -__|
|____|_____||__||_____|_____|____|_____|   __|_____|
                                       |__|
--]]


vim.cmd[[
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]
