" Basic stuff
set autoindent
set smartindent
set tabstop=3
set shiftwidth=3
set termguicolors
set nu rnu
"setlocal spell
"set spelllang=en_us,ro_ro
set nocompatible
filetype off
syntax enable

" Plugins (Download Vundle)
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc("~/.config/nvim/bundle/install/all/plugins/")
Plugin 'VundleVim/Vundle.vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
Plugin 'catppuccin/nvim', {'name': 'catppuccin'}
call vundle#end()            " required
filetype plugin indent on    " required
let g:UltiSnipsExpandTrigger="<c-j>"
let g:lightline = {'colorscheme': 'catppuccin'}

lua << EOF
local catppuccin = require("catppuccin")
-- configure it
catppuccin.setup({
transparent_background = true,
term_colors=true,
styles = {
	comments  = "italic",
	functions = "italic",
	keywords  = "italic",
	strings   = "NONE",
	variables = "italic",
	}})
EOF
colorscheme catppuccin
