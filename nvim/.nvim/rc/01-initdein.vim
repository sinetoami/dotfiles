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
  " LOCAL PLUGINS
  call dein#local('~/.config/nvim/bundle', {}, ['vim-*', '*.vim', '*'])

	" GIT
	call dein#add('tpope/vim-fugitive')
	call dein#add('airblade/vim-gitgutter')
  call dein#add('junegunn/gv.vim')
  call dein#add('sodapopcan/vim-twiggy')

	" INTERFACE
	call dein#add('itchyny/lightline.vim')
	call dein#add('mengelbrecht/lightline-bufferline')
	call dein#add('sinetoami/lightline-hunks')
  call dein#add('sinetoami/dimfocus.vim')

  " GENERAL USE
  call dein#add('duggiefresh/vim-easydir')
	call dein#add('tpope/vim-eunuch')
  call dein#add('tpope/vim-scriptease')
  call dein#add('thaerkh/vim-workspace')
  call dein#add('simeji/winresizer')
	call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('wesQ3/vim-windowswap')
  call dein#add('dhruvasagar/vim-zoom')

	" SEARCH ENGINES
	call dein#add('junegunn/fzf', { 'path': '~/.fzf', 'build': '~/.fzf/install --all' })
	call dein#add('junegunn/fzf.vim')
  call dein#add('sinetoami/fzy.nvim')

	" WRITING CODE
  call dein#add('neoclide/coc.nvim', { 'merge':0, 'rev': 'release' })
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tmhedberg/matchit')
  call dein#add('tpope/vim-endwise')
	call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('matze/vim-move')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-line')
  call dein#add('thinca/vim-textobj-between')
  call dein#add('AndrewRadev/switch.vim')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('terryma/vim-multiple-cursors')

  " CODE TOOLS
  call dein#add('benmills/vimux')
  call dein#add('janko/vim-test')
  call dein#add('KabbAmine/zeavim.vim')

  " GOLANG
  call dein#add('fatih/vim-go')
  call dein#add('sebdah/vim-delve')
  call dein#add('benmills/vimux-golang')
  
  " RUBY
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/gem-ctags')
  call dein#add('tpope/vim-bundler')
  call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('hmarr/vim-gemfile')

  " SYNTAX
  call dein#add('tpope/vim-markdown')
  call dein#add('cespare/vim-toml')
  call dein#add('elzr/vim-json')

  " OTHER STUFFS
  call dein#add('sinetoami/sinokai.vim', { 'rev': 'my-personal-rev' })
  call dein#add('godlygeek/tabular')

  " END   - Add or remove your plugins
	"" ************************************************************
	"" Required:
	call dein#end()
	call dein#save_state()
endif
