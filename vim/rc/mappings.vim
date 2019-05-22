"---------------------------------------------------------------------------
" Svens .vimrc
"Mappings
"{{{
   if &compatible
       set nocompatible
   endif
"}}}
"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
"  Clipborad:
"  {{{
 if (!has('nvim') || $DISPLAY != '') && has('clipboard')
   xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
 endif
" }}}
"---------------------------------------------------------------------------
" Normal Mode:
"{{{
map <C-w><TAB>:NERDTreeToggle<CR> 

"map <C-w><TAB>:NERDTreeToogle 
" }}}
"---------------------------------------------------------------------------
" Insert mode keymappings:
"{{{

" <C-t>: insert tab.
 inoremap <C-t>  <C-v><TAB>
" Enable undo <C-w> and <C-u>.
"inoremap <C-w>  <C-g>u<C-w>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
 inoremap <C-u>  <C-g>u<C-u>
"}}}
"---------------------------------------------------------------------------
" Command-line mode keymappings:
" {{{
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
" }}}
"---------------------------------------------------------------------------
" Ex Mode:
" {{{
" Don't use Ex mode, use Q for formatting
noremap Q gq
"}}}
"---------------------------------------------------------------------------

