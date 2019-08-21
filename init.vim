" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" fzf
if executable("fzf")
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
endif

" Theme plugins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

" Utility plugins
Plug 'ervandew/supertab'
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-sleuth'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-speeddating'
Plug 'itspriddle/vim-stripper'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" Syntax plugins
Plug 'w0rp/ale'
Plug 'rosstimson/bats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'saltstack/salt-vim'
Plug 'nanki/treetop.vim'
Plug 'jwalton512/vim-blade'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'Shirk/vim-gas'
Plug 'tpope/vim-git'
Plug 'jez/vim-github-hub'
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-liquid'
Plug 'plasticboy/vim-markdown'
Plug 'rsmenon/vim-mathematica'
Plug 'mustache/vim-mustache-handlebars'
Plug 'moll/vim-node'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'pld-linux/vim-syntax-vcl'
Plug 'wgwoods/vim-systemd-syntax'

call plug#end()

" General
set secure " Don't hax me bra

" Performance
set lazyredraw " Don't redraw all the time to speed up the buffer

" Editing
set backspace=indent,eol,start       " Backspace over automatically indented things
set expandtab                        " Your tabs are now spaces
set omnifunc=syntaxcomplete#Complete " Complete stuff for me
set shiftwidth=2                     " Tabs == 2 spaces
set softtabstop=2                    " Tabs == 2 spaces
set tabstop=2                        " Tabs == 2 spaces
set undofile                         " Persist undo across sessions

" Display
set background=light                   " Optimize colors for the theme
let base16colorspace=256               " 256 colors are supported
colorscheme base16-solarized-light     " Use this colorscheme
let g:airline_theme='base16_solarized' " Use it for airline too
let g:vim_json_syntax_conceal=0        " Don't screw with my JSON files
set colorcolumn=80                     " Mark column 80 so I don't code real stupid-like
set noerrorbells visualbell t_vb=      " I don't like to have seizures
set nofoldenable                       " Don't do any automatic folding because RAGEGUY
set number                             " Show line numbers
set scrolloff=5                        " Keep more context on the screen
set showmatch                          " Show matching brackets, parenthesis, etc.
set splitbelow                         " Horizontal splits should open below the current window
set splitright                         " Vertical splits should open to the right of the current window
syntax on                              " Highlight syntax

" Searching
set ignorecase                                    " Ignore case
set smartcase                                     " If ignorecase is on, ignore ignorecase if the search contains caps
set wildignore=*.o,*.obj,.git,*.rbc,*.class,.svn, " We can't edit any of this, so ignore it.
  \ */vendor/gems/*,*/coverage/*,*/public/*,
  \ */tmp/*,*/log/*,*/doc/*

" Auto-commands
au VimResized * :wincmd=                       " Resize splits when windows are resized... duh
au VimLeave * set guicursor=a:ver100-blinkoff0 " Reset cursor on nvim exit

" Shift-Command-{ and Shift-Command-} switch tabs
nnoremap <S-D-}> :tabn<CR>
nnoremap <S-D-{> :tabp<CR>
inoremap <S-D-}> <ESC>:tabn<CR>a
inoremap <S-D-{> <ESC>:tabp<CR>a

" EasyAlign mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" vim-test config
let test#strategy = "neovim"

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" fzf
noremap <c-t> :Files<CR>

" ale
let g:ale_pattern_options = {
  \'.\.bats$': {'ale_enabled': 0},
\}

let g:ale_ruby_rubocop_executable = 'bundle'

" STFU, vim-go
let g:go_version_warning = 0
