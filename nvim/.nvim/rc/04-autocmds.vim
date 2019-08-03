if has('autocmd')
  "" remember cursor position {{{
  augroup RememberCursorPosition
    autocmd!
    autocmd BufReadPost * 
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END
  "" }}}

  "" Auto execute zR command {{{
  " Prevent za command to close all folders
  augroup AutoOpenFolders
    autocmd!
    autocmd BufEnter * execute "normal! zR"
  augroup END
  "" }}}

  "" Text Wrapper {{{
  augroup TextFileTypeWrapper
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
    if !exists('*s:setupWrapping')
      function s:setupWrapping()
        set wrap
        set wrapmargin=1
      endfunction
    endif
  augroup END
  "" }}}
 
  "" Match syntax parens for all filetypes {{{
  augroup GlobalSyntax
    autocmd!
    autocmd VimEnter,WinEnter * syntax match Brackets /[(){}\[\]]/
  augroup END
  "" }}}

  "" FZF {{{
  augroup FixFzf
    autocmd!
    "" In Neovim FZF have a inconsistence to load the fzf statusline. Actually 
    "" don't really load the predefined statusline, but load the INSERT mode 
    "" statusline instead of.
    "" See: https://github.com/junegunn/fzf/issues/1143

    "" I realized when I reaload the init.vim or 01-initdein.vim files the fzf
    "" statusline works fine. 
    "" autocmd VimEnter * :source ~/.config/nvim/init.vim
    "" autocmd VimEnter * :source ~/.config/nvim/rc/01-initdein.vim

    "" But this causes some weird behaviors like:
    "" Bug1: The ft autocheck stops to work. Any file it's open without syntax.
    "" Bug2: The dimfocus.vim plugin stops to work.
    
    "" FixTry1:
    "" Call the dein#recache_runtimepath() function works for a while. But 
    "" stops to work after a update.
    "" autocmd VimEnter * call dein#recache_runtimepath()
   
    " No line number when FZF is active
    autocmd FileType fzf set nonumber norelativenumber
  augroup END

  "" Override fzf statusline
  augroup fzf_statusline
    autocmd! User FzfStatusLine call <sid>fzf_statusline()
    function! s:fzf_statusline()
      highlight default fzf1 gui=bold guifg=#E12672 guibg=#565656
      highlight default fzf2 gui=bold guifg=#BCDDBD guibg=#565656
      highlight default fzf3 gui=bold guifg=#D9D9D9 guibg=#565656
      setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction
  augroup END
  "" }}}

  "" RUBY {{{
  augroup ruby
    autocmd!
    """" extract from p0deje/vim-ruby-interpolation
    autocmd FileType ruby let g:surround_{char2nr('#')} = "#{\r}"
    autocmd FileType ruby execute 'inoremap <silent><buffer> # #<Esc>:call <SID>InsertInterpolation()<Cr>a'
    function! s:InsertInterpolation()
      let before = getline('.')[col('^'):col('.')]
      let after  = getline('.')[col('.'):col('$')]
      " check that we're in double-quotes string
      if before =~# '"' && after =~# '"'
        execute "normal! a{}\<Esc>h"
      endif
    endfunction
    """"
  augroup END
  "" }}}
  
  "" GOLANG {{{
  " build_go_files is a custom function that builds or compiles the test file.
  " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  augroup go
    autocmd!
    " :GoBuild and :GoTestCompile
    autocmd FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

    " :GoTest
    autocmd FileType go nmap <leader>te  <Plug>(go-test)

    " :GoRun
    autocmd FileType go nmap <leader>ru  <Plug>(go-run)

    " :GoFmt
    autocmd FileType go nmap <silent> <C-f> :<C-u>GoFmt<cr>

    " :GoImport
    autocmd FileType go nmap <C-i> :GoImport<space>

    " :GoDoc
    autocmd FileType go nmap <Leader>do <Plug>(go-doc)
    autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
    autocmd FileType go nmap <Leader>db <Plug>(go-doc-browser)

    " :GoCoverageToggle
    autocmd FileType go nmap <Leader>co <Plug>(go-coverage-toggle)

    " :GoConverageBrowser
    autocmd FileType go nmap <leader>cb <Plug>(go-coverage-browser)

    " :GoInfo
    autocmd FileType go nmap <Leader>in <Plug>(go-info)

    " :GoMetaLinter
    autocmd FileType go nmap <silent> <Leader>ml <Plug>(go-metalinter)

    " :GoDef
    autocmd FileType go nmap gf <Plug>(go-def)

    " :GoDecls and :GoDeclsDir
    autocmd FileType go nmap <C-g> :GoDecls<cr>
    autocmd FileType go nmap <leader>dr :GoDeclsDir<cr>
    autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
    autocmd FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>

    " :GoAlternate  commands :A, :AV, :AS and :AT
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    " vim-delve - golang debugger
    autocmd FileType go nmap <silent> <leader>tbp :DlvToggleBreakpoint<cr>
    autocmd FileType go nmap <silent> <leader>dbu :DlvDebug<cr>
    autocmd FileType go nmap <silent> <leader>dte :DlvTest<cr>
  augroup END 
  "" }}}
endif
