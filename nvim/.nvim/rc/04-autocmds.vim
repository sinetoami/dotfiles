if has('autocmd')
  "" remember cursor position
  augroup RememberCursorPosition
    autocmd!
    autocmd BufReadPost * 
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END

  "" Auto execute zR command 
  " Prevent za command to close all folders
  augroup AutoOpenFolders
    autocmd!
    autocmd BufEnter * execute "normal! zR"
  augroup END

  augroup TextFileTypeWrapper
    autocmd!
    autocmd BufRead,BufNewFile *.txt,*.md,*.markdown call s:setupWrapping()
    if !exists('*s:setupWrapping')
      function s:setupWrapping()
        set wrap
        set wrapmargin=1
      endfunction
    endif
  augroup END
  
  augroup GlobalSyntax
    autocmd!
    autocmd VimEnter,WinEnter * syntax match Brackets /[(){}\[\]]/
  augroup END

  augroup FixFZFStatusline
    autocmd!
    "" A workaround to '[re]load' fzf statusline on NeoVim.
    " The fzf statusline don't actually works in my case until now. So I realized
    " when the 'init.vim' was resourced the fzf statusline works fine. I think thats
    " because Neovim cannot start external processess. But IDK.
    " see: https://github.com/junegunn/fzf/issues/1143
    " Workaroud1: au VimEnter * :source ~/.config/nvim/init.vim
    " Bug1: dimfocus.vim stop working when this workaround is active
    " Fix1: call dein#recache_runtimepath()
    autocmd VimEnter * :call dein#recache_runtimepath()
    
    " No line number when FZF is active
    autocmd FileType fzf set nonumber norelativenumber
    " Override statusline
    autocmd! User FzfStatusLine call <SID>fzf_statusline()
    function! s:fzf_statusline()
      highlight default fzf1 gui=bold guifg=#E12672 guibg=#565656
      highlight default fzf2 gui=bold guifg=#BCDDBD guibg=#565656
      highlight default fzf3 gui=bold guifg=#D9D9D9 guibg=#565656
      setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
    endfunction

  augroup END
endif
