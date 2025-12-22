local M = {}

function M.open_explorer()
    local reveal_file = vim.fn.expand('%:p')
    if reveal_file == '' then
        reveal_file = vim.fn.getcwd()
    else
        local f = io.open(reveal_file, 'r')
        if f then
            f.close(f)
        else
            reveal_file = vim.fn.getcwd()
        end
    end

    require('neo-tree.command').execute({
        action = 'focus',
        source = 'filesystem',
        position = 'float',
        reveal_file = reveal_file,
        reveal_force_cwd = true,
    })
end

return M
