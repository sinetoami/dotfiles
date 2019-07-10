"" Use the system clipboard:
"" very usefull if you use Tmux and desire yank and copy text
"" between panes and windows.
if has('unnamedplus')
  set clipboard+=unnamed,unnamedplus
endif
noremap YY "+y<cr>
noremap XX "+x<xr>
noremap <leader>p "+gP<cr>
""

noremap  <Down>  <nop>
noremap  <Up>    <nop>
noremap  <Left>  <nop>
noremap  <Right> <nop>
vnoremap <Down>  <nop>
vnoremap <Up>    <nop>
vnoremap <Left>  <nop>
vnoremap <Right> <nop>

"" keys around buffers
map 	   <silent> <A-w> :bdel<cr>
nnoremap <silent> <A-a> :bprev<cr>
nnoremap <silent> <A-s> :bnext<cr>

"" splits
nnoremap <silent> <leader>hs :split<cr>
nnoremap <silent> <leader>vs :vsplit<cr>

"" exiting and saving
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Qall qall
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev X x
cnoreabbrev Q q

"" undo and redo on Insert mode
inoremap <C-u> <C-o>u
inoremap <C-r> <C-o><C-R>

"" select all
map <C-a> <ESC>ggVG<cr>

"" shifting
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

"" folding
" toggle current fold and recursively current fold
nnoremap <bslash> za
nnoremap <leader>\ zA

" open (Alt+'/') and close (Alt+'-') all folds
nnoremap <A-/> zR
nnoremap <A--> zM

" close all folds except the one under the cursor 
nnoremap <leader>/ zMzv

"" disable :nohlsearch (:noh)
nnoremap <silent> ° :nohlsearch<cr>

"" toggle paste mode
set pastetoggle=<F2>

"" expand path - http://vimcasts.org/e/14
" of current file
cnoremap <C-P> <C-R>=expand("%:p:h") . "/"<cr>
nnoremap .. :execute 'echo expand("%:p:h") . "/"'<cr>

" full path
cnoremap <C-A-P> <C-R>=expand('%:p')<cr>
nnoremap .% :execute 'echo expand("%:p")'<cr>

"" long line formatter
nnoremap <silent> <leader>fmt :execute '%!fmt %'<cr>
vnoremap <C-A-f> gq

"" sourcing file
nnoremap <C-s> :source %<cr>

"" cycle numbering
nnoremap <silent> <leader>cn :CycleNumbering<cr>
