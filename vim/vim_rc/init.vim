if has('nvim') 
 
endif

"---------------------------------------------------------------------------
"Automatically install missing plugins on startup
"---------------------------------------------------------------------------

autocmd VimEnter *
	\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\|   PlugInstall --sync | q
	\| endif
"---------------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')
Plug 'valloric/youcompleteme'
Plug 'easymotion/vim-easymotion'
Plug 'universal-ctags/ctags'
Plug 'junegunn/vim-easy-align'
Plug 'othree/html5.vim'
Plug 'phpvim/phpcd.vim'

"---------------------------------------------------------------------------
" Make sure you use single quotes
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
"---------------------------------------------------------------------------
" Any valid git URL is allowed
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin' , { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline', {'do' : '.install --all' } | Plug 'vim-airline/vim-airline-themes'
"		Plug 'edkolev/tmuxline.vim'
"		Plug 'bling/vim-bufferline'

"---------------------------------------------------------------------------
call plug#end()
"---------------------------------------------------------------------------

" Plug options:
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |
"---------------------------------------------------------------------------

"source $XDG_CONFIG_HOME/nvim/vim_rc/init.vim
source $XDG_CONFIG_HOME/nvim/vim_rc/autocmd.vim
source $XDG_CONFIG_HOME/nvim/vim_rc/mappings.vim
source $XDG_CONFIG_HOME/nvim/vim_rc/options.vim
source $XDG_CONFIG_HOME/nvim/vim_rc/functions.vim


"---------------------------------------------------------------------------

