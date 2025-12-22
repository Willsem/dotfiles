if vim.g.vscode then
    require('core.options')
else
    require('core')
    require('ui')
end
