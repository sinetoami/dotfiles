let dein_exists = expand('~/.cache/dein/repos/github.com/Shougo/dein.vim/autoload/dein.vim')
if !filereadable(dein_exists)
  if !executable("git")
    echoerr "You have to install curl or first install dein.vim yourself."
    execute "q!"
  endif
 
  silent !mkdir -p ~/.cache/dein/repos/github.com/Shougo/dein.vim >/dev/null 2>&1
  silent !git clone https://github.com/Shougo/dein.vim ~/.cache/dein/repos/github.com/Shougo/dein.vim 

  autocmd VimEnter * call dein#install()
endif
unlet dein_exists

"" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

"" Required:
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	
	"" Required:
	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	"" ************************************************************
	"" START - Add or remove your plugins:
  "" LOCAL PLUGINS
  call dein#local('~/.config/nvim/bundle', {}, ['vim-*', '*.vim', '*'])

	" GIT
	call dein#add('tpope/vim-fugitive')
	call dein#add('airblade/vim-gitgutter')
	
	" INTERFACE 
	call dein#add('wsdjeg/dein-ui.vim')
	call dein#add('itchyny/lightline.vim') 
	call dein#add('mengelbrecht/lightline-bufferline')
	call dein#add('sinetoami/lightline-hunks')

	" NAVIGATION
	call dein#add('christoomey/vim-tmux-navigator')
	call dein#add('junegunn/fzf', { 'path': '~/.fzf', 'build': '~/.fzf/install --all' })
	call dein#add('junegunn/fzf.vim')
	call dein#add('tpope/vim-eunuch')

	" WRITING CODE
	call dein#add('tpope/vim-commentary')

	" SYNTAX
	call dein#add('sheerun/vim-polyglot')
	call dein#add('vim-ruby/vim-ruby')
	"call dein#add('fatih/vim-go')
	
	" OTHER STUFFS

	"" END   - Add or remove your plugins
	"" ************************************************************
	"" Required:
	call dein#end()
	call dein#save_state()
endif
