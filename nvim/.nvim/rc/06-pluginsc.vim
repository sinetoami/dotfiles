"" dein.vim
"" ************************************************************
let g:dein#auto_recache = 1

function! s:dein_cleanup() abort
  call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endfunction

command! DeinCleanUp call <sid>dein_cleanup()
command! DeinInstall call dein#install()
command! DeinUpdate  call dein#update()

"" vim-tmux-navigator
"" ************************************************************
let g:tmux_navigator_disable_when_zoomed = 1

"" vim-workspace
"" ************************************************************
let g:workspace_autosave_always = 1
let g:workspace_session_name = 'Session.vim'

"" vim-indentguides
"" ************************************************************
let g:indentguides_ignorelist = ['text']
let g:indentguides_spacechar = ':'
let g:indentguides_tabchar = ':'

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
\ 	      ['gitstatus', 'readonly', 'filename', 'modified', 'vimzoom'],
\   ],
\   'right':[[ 'lineinfo' ],
\            [ 'percent' ],
\            [ 'cocstatus', 'fileformat', 'fileencoding', 'filetype' ],
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
\   'cocstatus': 'coc#status',
\   'vimzoom': 'zoom#statusline'
\ },
\}

"" lightline-bufferline
"" ***********************************************************
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number       = 2
let g:lightline#bufferline#unnamed           = '[No Name]'

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

function! s:changebranch(branch)
  execute 'Git checkout ' . a:branch
  call feedkeys('i')
endfunction
command! -bang Gbranch call fzf#run({
      \ 'source': 'git branch -a --no-color | grep  -v "^\* " ',
      \ 'sink': function('s:changebranch')
      \ })

nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> fgf   :GFiles<cr>
nnoremap <silent> fgs   :GFiles?<cr>
nnoremap <silent> fgc   :Commits<cr>
nnoremap <silent> ffd   :Find<cr>
nnoremap <silent> fd!   :Find!<cr> 
nnoremap <silent> fbl   :BLines<cr>
nnoremap <silent> fhelp :Helptags<cr>

"" fzy (fzy.vim)
"" ***********************************************************
nnoremap <silent> <C-A-p> :Fzy<cr>

"" vim-gitgutter
"" ***********************************************************
set updatetime=100
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '◢'
let g:gitgutter_sign_modified_removed = '◥'
let g:gitgutter_sign_removed_first_line = '◢'

"" vim-fugitive
"" ***********************************************************
nnoremap <silent> <leader>gaa :Gwrite<cr>
nnoremap <silent> <leader>gcs :Gcommit -S -v<cr>
nnoremap <silent> <leader>gca :Gcommit -S -v --amend<cr>
nnoremap <silent> <leader>gst :Gstatus<cr>
nnoremap <silent> <leader>gdf :Gvdiff<cr>
nnoremap <silent> <leader>gbl :Gblame<cr>

"" vim-fugitive
"" ***********************************************************
function! s:checkout_new_branch()
  try
    call inputsave()
    let branch_name = input('Branch name: ')
    call inputrestore()
    execute 'Twiggy ' . branch_name
  catch
  endtry
endfunction

nnoremap <silent> <leader>gbr :Twiggy<cr>
nnoremap <silent> <leader>gcm :Twiggy master<cr>
nnoremap          <leader>gnb :call <sid>checkout_new_branch()<cr>


"" vim-commentary
"" ***********************************************************
map <silent> <A-\> :Commentary<cr>

"" auto-pairs
"" ***********************************************************
let g:AutoPairsMultilineClose = 0

"" coc.nvim
"" ***********************************************************
"" Wrap multiple cursors like VSCode {{
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
"" }}

"" Completion triggers {{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
"" }}

let g:coc_status_warning_sign = ' '
let g:coc_status_error_sign = '❌'

let g:coc_global_extensions = [
      \ 'coc-emmet', 'coc-html', 'coc-css', 
      \ 'coc-json', 'coc-tsserver', 'coc-solargraph',
      \ 'coc-snippets', 'coc-ultisnips',
      \ ]

"" Remap keys {{
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
xmap <leader>f    <Plug>(coc-format-selected)
nmap <silent> ]c  <Plug>(coc-diagnostic-next)
nmap <silent> [c  <Plug>(coc-diagnostic-prev)
nmap <silent> crn <Plug>(coc-rename)
nmap <leader>qf   <Plug>(coc-fix-current)

" multiple cursors
nmap <expr> <silent> <C-c> <SID>select_current_word()
xmap <silent> <C-c> <Plug>(coc-cursors-range)

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent> <expr> <TAB> pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <silent> <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Snippets
let g:coc_snippet_next = '<tab>'
imap <C-l> <Plug>(coc-snippets-expand)
" }}

"" ultisnips
"" ***********************************************************
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" let g:UltiSnipsExpandTrigger = '<c-l>'

"" vim-ruby
"" ***********************************************************
let g:ruby_indent_access_modifier_style = 'indent'
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:ruby_pseudo_operators = 1
let g:ruby_operators = 1

"" vim-go
"" ***********************************************************
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_metalinter_deadline = "1s"

let g:go_bin_path = $HOME . '/Workspace/go/bin'
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

"" vim-test
"" ******************************************************
let test#strategy = 'vimux'
let test#go#runner = 'richgo'
let test#go#richgo#options = '-v -cover'

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"" switch.vim
"" ******************************************************
let g:switch_mapping = '-'

"" vim-markdown (vim-markdown-composer)
"" ******************************************************
let g:markdown_syntax_conceal = 0
let g:markdown_composer_browser = 'firefox'

"" vim-json
"" ******************************************************
let g:vim_json_syntax_conceal = 0
