let s:save_cpo = &cpo
set cpo&vim

" from https://vi.stackexchange.com/questions/18137/determine-if-the-cursor-is-on-the-first-last-character-of-word/18139#18139
function! s:EndOfWord() abort
  return strcharpart(getline('.'), virtcol('.')-1, 3) =~# '^\w\>'
endfunction

function! s:StartOfWord() abort
  return col('.') == 1 || strcharpart(getline('.')[col('.') - 2:], 0, 1) =~ " "
endfunction

function! cases#ExtendVisual(find, dir)
  call search(a:find, a:dir . 'W')
  let mark = match(a:dir, 'b') == -1 ? "`<" : "`>"
  execute "normal vo" . mark . "o"
endfunction

function! cases#CamelWord()
  if !s:EndOfWord()
    call search('\>\|\u', 'W')
  endif
  if !s:EndOfWord()
    normal h
  endif
  normal v
  call search('\<\|\u', 'bW')
  normal o
endfunction

function! cases#SnakeWordExclusive()
  if !s:EndOfWord()
    call search('\>\|_', 'cW')
  endif
  if !s:EndOfWord()
    normal h
  endif
  normal v
  call search('\(_\|\<\)\zs', 'bcW')
  normal o
endfunction

function! cases#SnakeWordInclusive()
  if !s:EndOfWord()
    call search('\>\|_', 'cW')
  endif
  if !s:EndOfWord()
    normal h
  endif
  normal v
  call search('\<\|_', 'bW')
  " normally includes the _ on the left but not the right
  " but if at beginning of word, include the _ on the right
  if s:StartOfWord()
    normal ol
  else
    normal o
  endif
endfunction

let &cpo = s:save_cpo
