 
"---------------------------------------------------------------------------
 function! vimrc#toggle_option(option_name) abort
        execute 'setlocal' a:option_name.'!'
        execute 'setlocal' a:option_name.'?'
 endfunction

"---------------------------------------------------------------------------
 function! vimrc#on_filetype() abort
    if execute('filetype') =~# 'OFF'
        " Lazy loading
        silent! filetype plugin indent on
        syntax enable
        filetype detect
    endif
 endfunction

