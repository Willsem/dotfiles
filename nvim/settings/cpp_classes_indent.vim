function! QtCppIndent()
    let labelpat='signals:\|slots:\|public:\|protected:\|private:\|Q_OBJECT'
    let declpat='\(;\|{\|}\)\_s*.'
    if match(getline(v:lnum),labelpat) != -1
        return 0
    endif
    if match(getline(v:lnum),'^\s*}') != -1
        return cindent(v:lnum)
    endif
    let pos=getpos('.')
    call setpos('.',[0,v:lnum,1,0])
    call search(declpat,'beW',v:lnum>10?v:lnum-10:0)
    let prevlnum = line('.')
    call search(declpat,'eW',v:lnum<=line('$')-10?v:lnum+10:0)
    let nextlnum = line('.')
    call setpos('.',pos)
    if match(getline(prevlnum),labelpat)==-1
        return cindent(v:lnum)
    elseif nextlnum != v:lnum && prevlnum != prevnonblank(v:lnum-1)
        return cindent(v:lnum)
    endif
    return &shiftwidth
endfunc
set indentexpr=QtCppIndent()
