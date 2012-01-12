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

nnoremap <leader>/ :set hlsearch!<CR>
noremap <leader>ss :call StripWhitespace()<CR>

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
