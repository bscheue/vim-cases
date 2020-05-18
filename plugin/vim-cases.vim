" vim-cases-windows - toggle Vim's windows
"
" Maintainer: bscheue <bscheuer@andrew.cmu.edu>
" Website:  https://github.com/bscheue/vim-cases
"
" Use this command to get help on vim-cases:
"
"     :help vim-cases


if exists("g:loaded_cases") || &compatible
   finish
endif
let g:loaded_cases = 1

let s:save_cpo = &cpo
set cpo&vim

" camel case
nnoremap <silent> <Plug>CasesCamelForward-n :<c-u>call search('\<\<bar>\u', 'W')<CR>
nnoremap <silent> <Plug>CasesCamelBackward-n :<c-u>call search('\<\<bar>\u', 'bW')<CR>
onoremap <silent> <Plug>CasesCamelForward-o :<c-u>call search('\<\<bar>\u', 'W')<CR>
onoremap <silent> <Plug>CasesCamelBackward-o :<c-u>call search('\<\<bar>\u', 'bW')<CR>

" TODO add function # prefix
xnoremap <silent> <Plug>CasesCamelForward-x <ESC>:<c-u>call cases#ExtendVisual('\<\<bar>\u', '')<CR>
xnoremap <silent> <Plug>CasesCamelBackward-x <ESC>:<c-u>call cases#ExtendVisual('\<\<bar>\u', 'b')<CR>

xnoremap <silent> <Plug>CasesCamelObj-x :<c-u>call cases#CamelWord()<CR>
onoremap <silent> <Plug>CasesCamelObj-o :<c-u>normal vic<CR>

" snake case
nnoremap <silent> <Plug>CasesSnakeForward-n :<c-u>call search('\<\<bar>_\zs\a', 'W')<CR>
nnoremap <silent> <Plug>CasesSnakeBackward-n :<c-u>call search('\<\<bar>_\zs\a', 'bW')<CR>
onoremap <silent> <Plug>CasesSnakeForward-o :<c-u>call search('\<\<bar>_\zs\a', 'W')<CR>
onoremap <silent> <Plug>CasesSnakeBackward-o :<c-u>call search('\<\<bar>_\zs\a', 'bW')<CR>

xnoremap <silent> <Plug>CasesSnakeForward-x <ESC>:<c-u>call cases#ExtendVisual('\<\<bar>_\zs\a', '')<CR>
xnoremap <silent> <Plug>CasesSnakeBackward-x <ESC>:<c-u>call cases#ExtendVisual('\<\<bar>_\zs\a', 'b')<CR>

xnoremap <silent> <Plug>CasesSnakeInnerObj-x :<c-u>call cases#SnakeWordExclusive()<CR>
xnoremap <silent> <Plug>CasesSnakeOuterObj-x :<c-u>call cases#SnakeWordInclusive()<CR>

let &cpo = s:save_cpo
