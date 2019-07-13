"" shortcuts
"" si = smartindent; ts = tabstop; sts = softtabstop; sw = shiftwidth; sta = smarttab; et = expandtab tw = textwidth

"" RUBY
autocmd FileType ruby,eruby,rdoc set si ts=2 sts=2 sw=2 sta et
autocmd BufNewFile,BufRead Gemfile setlocal filetype=Gemfile syntax=ruby
autocmd BufNewFile,BufRead *_spec.rb setlocal filetype=rspec syntax=ruby 

"" GO
autocmd FileType go set si ts=4 sts=4 sw=4 sta noexpandtab

"" SHELL
autocmd FileType sh,bash,zsh set si ts=4 sts=4 sw=4 sta noexpandtab tw=0

"" VIML
autocmd FileType vim set si ts=2 sts=2 sw=2 sta et

"" MISC
autocmd FileType yaml,markdown set si ts=2 sts=2 sw=2 sta et
autocmd FileType conf set si ts=2 sts=2 sw=2 sta et
autocmd FileType xdefaults setlocal commentstring=!%s
autocmd BufNewFile,BufRead *.mkd setlocal filetype=markdown
autocmd BufNewFile,BufRead i3status*.conf setlocal filetype=conf
