"---------------------------------------------------------------------------
" Svens .vimrc
   if &compatible
       set nocompatible
   endif

 "---------------------------------------------------------------------------
"---------------------------------------------------------------------------
"Mappings
"
 if (!has('nvim') || $DISPLAY != '') && has('clipboard')
   xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
 endif

"---------------------------------------------------------------------------
" Insert mode keymappings:
" <C-t>: insert tab.
 inoremap <C-t>  <C-v><TAB>
" Enable undo <C-w> and <C-u>.
"inoremap <C-w>  <C-g>u<C-w>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
 inoremap <C-u>  <C-g>u<C-u>

	"---------------------------------------------------------------------------
" Command-line mode keymappings:
" <C-a>, A: move to head.
 cnoremap <C-a>          <Home>
" <C-b>: previous char.
 cnoremap <C-b>          <Left>
" <C-d>: delete char.
 cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
 cnoremap <C-e>          <End>
" <C-f>: next char.
 cnoremap <C-f>          <Right>
" <C-n>: next history.
 cnoremap <C-n>          <Down>
" <C-p>: previous history.
 cnoremap <C-p>          <Up>
" <C-y>: paste.
 cnoremap <C-y>          <C-r>*
" <C-g>: Exit.
 cnoremap <C-g> <C-c>	
"---------------------------------------------------------------------------

" Don't use Ex mode, use Q for formatting
noremap Q gq
"---------------------------------------------------------------------------


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

