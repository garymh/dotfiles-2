" Custom functions

function! Toggle_writer_mode()
  execute ":Goyo"
  execute ":Limelight!!"
endfunction

function! Writer_checks_on()
  execute ":DittoOn"
endfunction

function! Writer_checks_off()
  execute ":DittoOff"
endfunction

function! TrimGuideDisplay()
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '\c<cr>$', '', '')
  let g:leaderGuide#displayname =
        \ substitute(g:leaderGuide#displayname, '^<Plug>', '', '')
endfunction

" Stolen from https://github.com/saaguero/dotvim
function! LoadUltiSnips()
  let l:curpos = getcurpos()
  " execute plug#load('ultisnips')
  call cursor(l:curpos[1], l:curpos[2])
  call UltiSnips#ExpandSnippet()
  return ""
endfunction

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

function! GinaStatus()
  return g:airline_symbols.branch.' '.gina#component#repo#branch()
endfunction
