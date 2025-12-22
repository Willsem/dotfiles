strings = {}

function strings.trim(s)
    return s:match('^%s*(.*)'):match('(.-)%s*$')
end

return strings
