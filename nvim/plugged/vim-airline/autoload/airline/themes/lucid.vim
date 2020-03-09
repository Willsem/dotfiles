" Based on the airline theme distinguished, used a structural starting point

let s:gray        = [245, '#534d5e']
let s:darkgray    = [245, '#1d1f21']
let s:turquoise   = [143, '#3fc997']
let s:pink        = [131, '#db0088']
let s:steel       = [ 67, '#83a8d1']
let s:sap         = [166, '#fde9a2']
let s:outerfg     = [ 16, '#807992']
let s:outerfgi    = [ 16, '#312642']

" Backgrounds
let s:outerbg  = [ 16, 'NONE']
let s:innerbg  = [234, 'NONE']

" Normal mode
let s:N1 = [s:outerfg[1], s:outerbg[1], s:outerfg[0], s:gray[0]]
let s:N3 = [s:gray[1]   , s:innerbg[1], s:gray[0]   , s:innerbg[0]]

" Normal mode - modified
let s:NM1 = [s:darkgray[1], s:sap[1], s:darkgray[0], s:sap[0]]
let s:NM3 = [s:sap[1]  , s:outerbg[1], s:sap[0], s:darkgray[0]]

" Insert mode
let s:I1 = [s:darkgray[1], s:turquoise[1], s:outerfg[0], s:turquoise[0]]
let s:I3 = [s:turquoise[1]  , s:innerbg[1], s:turquoise[0], s:innerbg[0]]

" Visual mode
let s:V1 = [s:darkgray[1], s:pink[1], s:outerfg[0], s:pink[0]]
let s:V3 = [s:pink[1]    , s:innerbg[1], s:pink[0], s:innerbg[0]]

" Replace mode
let s:R1 = [s:darkgray[1], s:steel[1], s:outerfg[0], s:steel[0]]
let s:R3 = [s:steel[1], s:innerbg[1], s:steel[0], s:innerbg[0]]

" Inactive pane
let s:IA = [s:darkgray[1], s:outerbg[1], s:innerbg[0], s:innerbg[0]]
let s:IAc = [s:gray[1], s:outerbg[1], s:outerbg[0], s:outerbg[0]]

let g:airline#themes#lucid#palette = {}
let g:airline#themes#lucid#palette.accents = {
    \ 'red': ['#d70000', '', 160, '', '']}

let g:airline#themes#lucid#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:IAc,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#lucid#palette.inactive_modified = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:IA,
    \ 'airline_c': s:NM3,
    \ 'airline_x': s:IA,
    \ 'airline_y': s:IA,
    \ 'airline_z': s:IA}

let g:airline#themes#lucid#palette.normal = {
    \ 'airline_a': s:N1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:N3}


let g:airline#themes#lucid#palette.normal_modified = {
    \ 'airline_a': s:NM1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:NM3}

let g:airline#themes#lucid#palette.insert = {
    \ 'airline_a': s:I1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:I3}
let g:airline#themes#lucid#palette.insert_modified = {}

let g:airline#themes#lucid#palette.replace = {
    \ 'airline_a': s:R1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:R3}
let g:airline#themes#lucid#palette.replace_modified = {}

let g:airline#themes#lucid#palette.visual = {
    \ 'airline_a': s:V1,
    \ 'airline_b': s:N3,
    \ 'airline_c': s:N3,
    \ 'airline_x': s:N3,
    \ 'airline_y': s:N3,
    \ 'airline_z': s:V3}
let g:airline#themes#lucid#palette.visual_modified = {}

let g:airline#themes#lucid#palette.normal.airline_warning = s:NM1

let g:airline#themes#lucid#palette.normal_modified.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.insert.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.insert_modified.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.visual.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.visual_modified.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.replace.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

let g:airline#themes#lucid#palette.replace_modified.airline_warning =
    \ g:airline#themes#lucid#palette.normal.airline_warning

