"---------------------------------------------------------------------------


"---------------------------------------------------------------------------
" Fenster Group:
" {{{
"augroup windowmanagment
"   autocmd!
"   
"   autocmd WinEnter <afile>
"augroup END
" }}}
"---------------------------------------------------------------------------
" Fenster Group:
" {{{
" }}}
"---------------------------------------------------------------------------
" Fenster Group:
" {{{
" }}}
"---------------------------------------------------------------------------
" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

" For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

"---------------------------------------------------------------------------
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis

                 \ | wincmd p | diffthis
endif
"---------------------------------------------------------------------------

