set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Required Vundle plugin
Plugin 'gmarik/Vundle.vim'

"NerdTree
Plugin 'scrooloose/nerdtree.git'

"Check syntax on each save
Plugin 'scrooloose/syntastic'

"Check PEP8
Plugin 'nvie/vim-flake8'

"Identify python indents
Plugin 'vim-scripts/indentpython.vim'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"Python Autocomplete
Plugin 'Valloric/YouCompleteMe'

"SuperSearch by pressing CTRL+P
Plugin 'kien/ctrlp.vim'

"Perform basic git commands
Plugin 'tpope/vim-fugitive'

"Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"Use VIM bindings within VIM and tmux
Plugin 'christoomey/vim-tmux-navigator'

"All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"Select colour scheme based on vim mode
colorscheme zenburn
set guifont=Monaco:h14
if has('gui_running')
	  set background=dark
	    colorscheme solarized
    else
	      colorscheme zenburn
      endif

"Switch between dark and light theme by pressing F5
call togglebg#map("<F5>")

"Make Nerdtree hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

let python_highlight_all=1
syntax on
set nu

"PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

"Full stack development web indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

"Flag any extraneous whitespace
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8

"Ensures autocomplete window goes away
let g:ycm_autoclose_preview_window_after_completion=1

"Defines a shortcut for GOTO definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"Maps nerd tree to CTRL-N
map <silent> <C-n> :NERDTreeFocus<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

