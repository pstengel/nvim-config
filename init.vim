" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Theme plugins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

" Utility plugins
Plug 'kien/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-speeddating'
Plug 'itspriddle/vim-stripper'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" Syntax plugins
Plug 'rosstimson/bats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'saltstack/salt-vim'
Plug 'nanki/treetop.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-endwise'
Plug 'Shirk/vim-gas'
Plug 'tpope/vim-git'
Plug 'fatih/vim-go'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-liquid'
Plug 'plasticboy/vim-markdown'
Plug 'rsmenon/vim-mathematica'
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
set bs=2                             " Backspace over automatically indented things
set expandtab                        " Your tabs are now spaces
set omnifunc=syntaxcomplete#Complete " Complete stuff for me
set shiftwidth=2                     " Tabs == 2 spaces
set softtabstop=2                    " Tabs == 2 spaces
set tabstop=2                        " Tabs == 2 spaces
set undofile                         " Persist undo across sessions

" Display
colorscheme base16-chalk                                " Use this colorscheme
let         g:airline_theme='base16_chalk'              " Use it for airline too
let         g:vim_json_syntax_conceal=0                 " Don't screw with my JSON files
set         background=dark                             " I use a dark background, so optimize for that
set         colorcolumn=80                              " Mark column 80 so I don't code real stupid-like
set         noerrorbells visualbell t_vb=               " I don't like to have seizures
set         nofoldenable                                " Don't do any automatic folding because RAGEGUY
set         number                                      " Show line numbers
set         scrolloff=5                                 " Keep more context on the screen
set         showmatch                                   " Show matching brackets, parenthesis, etc.
set         splitbelow                                  " Horizontal splits should open below the current window
set         splitright                                  " Vertical splits should open to the right of the current window
syntax      on                                          " Highlight syntax

" Searching
set ignorecase                                    " Ignore case
set smartcase                                     " If ignorecase is on, ignore ignorecase if the search contains caps
set wildignore=*.o,*.obj,.git,*.rbc,*.class,.svn, " We can't edit any of this, so ignore it.
  \ */vendor/gems/*,*/coverage/*,*/public/*,
  \ */tmp/*,*/log/*,*/doc/*

" Auto-commands
au VimResized * :wincmd=                       " Resize splits when windows are resized... duh
au VimLeave * set guicursor=a:ver100-blinkoff0 " Reset cursor on nvim exit

" Ctrl-T brings up fuzzy file browser
let g:ctrlp_map='<c-t>'

" Shift-Command-{ and Shift-Command-} switch tabs
nnoremap <D-}> :tabn<CR>
nnoremap <D-{> :tabp<CR>
inoremap <D-}> <ESC>:tabn<CR>a
inoremap <D-{> <ESC>:tabp<CR>a

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
