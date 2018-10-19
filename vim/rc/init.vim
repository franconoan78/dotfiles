"---------------------------------------------------------------------------
    " Svens .vimrc
    if &compatible
        set nocompatible
    endif


    "---------------------------------------------------------------------------
    "Automatically install missing plugins on startup
    "---------------------------------------------------------------------------

    autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
    "---------------------------------------------------------------------------
    "---------------------------------------------------------------------------
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    "---------------------------------------------------------------------------
    call plug#begin('~/.local/share/nvim/plugged')
        " Make sure you use single quotes
        " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
        "Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
    "---------------------------------------------------------------------------
    " Any valid git URL is allowed
    "Plug 'https://github.com/junegunn/vim-github-dashboard.git'
    " Multiple Plug commands can be written in a single line using | separators
    "Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'Xuyuanp/nerdtree-git-plugin' , { 'on':  'NERDTreeToggle' }



 Plug 'vim-airline/vim-airline', {'do' : '.install --all' } | Plug 'vim-airline/vim-airline-themes'
	Plug 'edkolev/tmuxline.vim'
	Plug 'bling/vim-bufferline'

 call plug#end()


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

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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
"Extra key bindings for PlugDiff
"(suggested by @sodapopcan)

"    J / K to scroll the preview window
"    CTRL-N / CTRL-P to move between the commits
"    CTRL-J / CTRL-K to move between the commits and synchronize the preview window

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction

function! s:setup_extra_keys()
  nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-k> <c-p>o
endfunction

augroup PlugDiffExtra
  autocmd!
  autocmd FileType vim-plug call s:setup_extra_keys()
augroup END
"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
" H to open help docs

function! s:plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' doc
    endfor
  endif
endfunction

augroup PlugHelp
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> H :call <sid>plug_doc()<cr>
augroup END

"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
"Browse help files and README.md

"Requires fzf.

function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
"gx to open GitHub URLs on browser

"Press gx to open the GitHub URL for a plugin or a commit with the default browser.

function! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
    \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')

  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#BrowseX(url, 0)
endfunction

 augroup PlugGx
   autocmd!
   autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
 augroup END
"---------------------------------------------------------------------------
