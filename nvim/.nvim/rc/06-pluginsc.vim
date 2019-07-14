"" dein.vim
"" ************************************************************
function! s:dein_cleanup() abort
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endfunction

command! DeinCleanUp call <sid>dein_cleanup()

"" vim-tmux-navigator
"" ************************************************************
let g:tmux_navigator_disable_when_zoomed = 1

"" dimfocus.vim
"" ************************************************************
let g:dimfocus#fg = ['#727072', 248]
let g:dimfocus#bg = ['#383539', 235]

"" lightline
"" ************************************************************
let g:lightline = {
\ 'colorscheme': 'sinokai',
\ 'active': {
\   'left':[['mode', 'paste' ],
\ 	      ['gitstatus', 'readonly', 'filename', 'modified'],
\   ],
\   'right':[[ 'lineinfo' ],
\            [ 'percent' ],
\            [ 'fileformat', 'fileencoding', 'filetype' ],
\   ],
\ },
\ 'component': {
\   'lineinfo': '並%3l:%-2v',
\   'readonly': '%{&readonly?"RO":""}',
\ },
\ 'tabline': {
\   'left': [[ 'buffers' ]],
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers',
\ },
\ 'component_type': {
\   'buffers': 'tabsel',
\ },
\ 'component_function': {
\   'gitstatus': 'lightline#hunks#composer',
\ },
\}

"" lightline-bufferline
"" ***********************************************************
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

"" lightline-hunks
"" ***********************************************************
let g:lightline#hunks#branch_symbol = '⎇  '

"" lightline-dimfocus
"" ***********************************************************
let s:lgray = ['#929192', 255]
let s:mgray = ['#221f22', 232]
let s:dgray = ['#19181A', 232]
let s:green = ['#a9dc76', 148]

let g:lightline#dimfocus#blur = 
\{
\ 'tabline': {
\   'left': [ [s:lgray[0], s:dgray[0], s:lgray[1], s:dgray[1]] ],
\   'tabsel': [ [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1], 'bold'] ],
\ },
\ 'normal': {
\   'left': [ 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1], 'bold'], 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1]], 
\   ],
\   'right': [ 
\     [s:lgray[0], s:mgray[0], s:mgray[1], s:mgray[1], 'bold'], 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1]], 
\     [s:lgray[0], s:dgray[0], s:lgray[1], s:dgray[1]] 
\    ],
\ },
\}

"" fzf.vim
"" ***********************************************************
let g:fzf_layout = { 'up': '~45%' }

" set ripgrep to default engine
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --smart-case --glob "!*.git"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep(
            \'rg --column --line-number --no-heading --hidden --color=always --smart-case --glob "!*.git" '
            \.shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') 
            \: fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0) 
endif

nnoremap <silent> <C-p>      :Files<cr>
nnoremap <silent> <C-b>      :Buffers<cr>
nnoremap <silent> <leader>fd :Find<cr> 
nnoremap <silent> <leader>f! :Find!<cr> 

"" fzy (fzy.vim)
"" ***********************************************************
nnoremap <silent> <C-A-p> :Fzy<cr>

"" winresize.vim
"" ******************************************************
nnoremap <silent> <S-A-Left>  :WinResizeLeft<cr>
nnoremap <silent> <S-A-Right> :WinResizeRight<cr>
nnoremap <silent> <S-A-Up>    :WinResizeTop<cr>
nnoremap <silent> <S-A-Down>  :WinResizeBottom<cr>

"" vim-gitgutter
"" ***********************************************************
set updatetime=100
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_sign_added = '┃' "'✚'
let g:gitgutter_sign_modified = '┃' "'✹'
let g:gitgutter_sign_removed = '◢' "'✖'
let g:gitgutter_sign_modified_removed = '◥' "'✖'
let g:gitgutter_sign_removed_first_line = '◢' "'✖'

"" vim-fugitive
"" ***********************************************************
function! s:checkout_new_branch()
  try
    call inputsave()
    let branch_name = input('Branch name: ')
    call inputrestore()
    execute 'Gcheckout -b ' . branch_name
  catch
  endtry
endfunction

" NOTE ABOUT Gbranch: shortcuts
" co - get checkout on branch under the cursor
" d  - delete a branch under the cursor
" D  - force delete a branch under the cursor
nnoremap <silent> <leader>gaa :Gwrite<cr>
nnoremap <silent> <leader>gcs :Gcommit -S -v<cr>
nnoremap <silent> <leader>gca :Gcommit -S -v --amend<cr>
nnoremap <silent> <leader>gst :Gstatus<cr>
nnoremap <silent> <leader>gdf :Gvdiff<cr>
nnoremap <silent> <leader>gbl :Gblame<cr>
nnoremap <silent> <leader>gbr :Gbranch --list -v<cr>
nnoremap <silent> <leader>gbu :Gbranch --remote -v<cr>
nnoremap <silent> <leader>gcm :Gcheckout master<cr>
nnoremap          <leader>gnb :call <sid>checkout_new_branch()<cr>

"" vim-commentary
"" ***********************************************************
map <silent> <A-\> :Commentary<cr>

"" vim-ruby
"" ***********************************************************
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:ruby_pseudo_operators = 1
let g:ruby_operators = 1

"" vim-go
"" ***********************************************************
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
