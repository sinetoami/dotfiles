if has('vim_starting')
	" Be iMproved
	set nocompatible
endif

for filename in globpath(expand("~/.config/nvim"), "rc/*.vim", 0, 1) 
  execute 'source ' . filename
endfor
