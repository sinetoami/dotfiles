"" shortcuts
"" si = smartindent; ts = tabstop; sts = softtabstop; sw = shiftwidth; sta = smarttab; et = expandtab tw = textwidth

"" GO
autocmd FileType go set si ts=4 sts=4 sw=4 sta noexpandtab

"" RUBY
autocmd FileType ruby,eruby,rdoc set si ts=2 sts=2 sw=2 sta et
autocmd BufNewFile,BufRead Gemfile setlocal filetype=Gemfile syntax=ruby
autocmd BufNewFile,BufRead *_spec.rb setlocal filetype=rspec syntax=ruby 

"" SHELL
autocmd FileType sh,bash,zsh set si ts=4 sts=4 sw=4 tw=0 sta noexpandtab 

"" VIML
autocmd FileType vim set si ts=2 sts=2 sw=2 sta et

"" MARKDOWN
let g:markdown_folding = 1
autocmd FileType markdown set si ts=2 sts=2 sw=2 sta et
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->
autocmd BufNewFile,BufRead *.md nnoremap <buffer> <silent> <leader>mkd :<C-U>setfiletype markdown<cr>

"" MISC
autocmd FileType yaml set si ts=2 sts=2 sw=2 sta et
autocmd FileType conf set si ts=2 sts=2 sw=2 sta et
autocmd FileType xdefaults setlocal commentstring=!%s
autocmd FileType antibody setlocal commentstring=#%s
autocmd BufNewFile,BufRead i3status*.conf setlocal filetype=conf
autocmd BufNewfile,BufRead .antibody.txt setlocal filetype=antibody syntax=conf
