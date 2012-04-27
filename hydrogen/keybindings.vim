" ---------------------------------------------------------------------------
" Keymappings
" ---------------------------------------------------------------------------
let mapleader = ","
let g:sparkupExecuteMapping = '<leader>e'

" Source the .vimrc and .gvimrc at once
nmap <silent> <leader>sv :so $MYVIMRC<CR> :so $MYGVIMRC<CR>

map <leader><space> zf
map <leader><S-space> zo
map <leader>n :e.<CR>
map <leader>= <c-W>=
map <leader><leader> <c-W><c-W>
map <leader>C :call OpenConfig()<CR>
map K <nop>
map H 0
map L $
map T <C-v>
imap <S-space> <Esc>

" remove windows character returns
map <Leader>m :%s/^M//<CR>

nnoremap <leader>/ :set hlsearch!<CR>
noremap <leader>ss :call StripWhitespace()<CR>

" better j/k overwrapped lines
nnoremap j gj
nnoremap k gk

" delete char without yank 
noremap x "_x
noremap X "_X

" reslect visual block after indent
vnoremap < <gv
vnoremap > >gv

" keep search results in the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" https://twitter.com/#!/stevelosh/status/189427334259015683"
nnoremap <leader><leader>r :syntax sync fromstart<cr>:redraw!<cr>

nnoremap <silent> ss :split<CR>
nnoremap <silent> vv :vsplit<CR>

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" source: http://mislav.uniqpath.com/2011/12/vim-revisited/

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
                                                                               
