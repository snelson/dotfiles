" load in bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" leader
let mapleader = ","

" Make backspace key delete when in insert mode
set backspace=2

" Use Vim settings, rather then Vi settings
set nocompatible

" No tmp files
set nobackup
set nowritebackup
set noswapfile

" enable syntax highlighting
syntax on
colorscheme solarized

" softtabs 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

" don't wrap lines
set nowrap

" Smart tab completion that will that will either insert
" a tab character or autocomplete
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" display relative line numbers
set relativenumber

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" NERDTree configuration
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize = 50

" mappings
map <Leader>n :NERDTreeToggle<CR>

" Edit file in directory of current buffer
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Automatically reload vimrc when it changes
" http://www.bestofvim.com/tip/auto-reload-your-vimrc/
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost .vimrc,vimrc source $MYVIMRC
augroup END
