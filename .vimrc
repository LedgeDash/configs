" Indent automatically depending on filetype
filetype indent on " how does this solve the 'omnifunc is not set' issue?
set autoindent

" Turn on line numbering. Turn it off with set nonu
set number

" Set syntax on
syntax on

" Higlhight search
set hls "set hlsearch is also valid

" Wrap text instead of being on one line
"set lbr

" Change colorscheme from default to delek
colorscheme delek

" Show the filename of the file currently being edited
set laststatus=2
set statusline=%f

" Use 4 spaces for indentation and pressing the tab key generates 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" vim tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>

" tagbar toggle
nmap <F8> :TagbarToggle<CR>

" vim racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" completions to show the complete function definition (e.g. its arguments and
" return type)
let g:racer_experimental_completer = 1
" insert the parenthesis in the completion
let g:racer_insert_paren = 1

" show a horizontal cursorline. Often set temporarily by Netrw
"set cursorline

" Custom key bindings
inoremap wj <ESC>
"" Ctrl-s to save
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> <Esc>:w<CR>
"" Ctrl-wq to quit
inoremap <C-w><C-q> <Esc>:wq<CR>
nnoremap <C-w><C-q> <Esc>:wq<CR>
"" Ctrl-q to quit without saving
inoremap <C-q> <Esc>:q!<CR>
nnoremap <C-q> <Esc>:q!<CR>


""" Notes
""" Options
" `Options` are Vim's internal variables. There are 2 categories of options:
" terminal options and other (regular) options. 
" Not sure what terminal options are yet but seems that I rarely need to use them.
"
" These variables have 3 different types:
"     1. boolean
"     2. number
"     3. string
"
" We mostly interact with those options through the `set` command.
" `set` command variants fall into 3 categories:
"     1. show options: `set all`, `set termcap`
"     2. show value of options: `set {option}`
"     3. set option to a value: set {option}={value}

" See http://vimdoc.sourceforge.net/htmldoc/options.html#options
" for more details.

"" `verbose` command
" verbose can tell us where an option was last set. It's helpful for tracking
" down where in scripts an option is modified.
" Example: `verbose set shiftwidth`, `verbose set cursorline?`
" It seems that for boolean variables, we need the `?` at the end.

""" Key Mappings
"" inoremap
"" nnoremap

""" Package Manager and Installing Plugins
" Vim8 comes with a package manager. Before Vim8, people usually use Pathogen, Vundle, etc.
" For Vim8, a plugin is defined as a `*.vim` file.
" To install a plugin, place it under ~/.vim/pack/{package}/start/[*/]
" ~/.vim/pack/{package}/start/ is where vim starts scanning for plugins.
" {package} can be anything and under the {package} directory, there can be multiple vim
" plugins.
"
" In reality, all plugins are placed under ~/.vim/pack/plugins/start/*. For example, I have
" ~/.vim/pack/plugins/start/rust.vim/
" ~/.vim/pack/plugins/start/syntastic/
" ~/.vim/pack/plugins/start/tagbar/
" ~/.vim/pack/plugins/start/vim-racer/
" ...
" The actual .vim files are all under those directories somewhere.
"
" Most plugins are installed by cloning its git repo. Usually, if a package can be installed
" by Pathogen, it's safe to just git clone it into ~/.vim/pack/plugins/start/. After git
" clone it will be automatically loaded and installed when vim starts.

" vim awesome is a good source for vim plugins

" Usually, a vim plugin will have the following filesystem structure
" plugin/
"  |- autoload/
"  |- ftdetect/
"  |- ftplugin/
"  |- indent/
"  |- plugin/
"  |- syntax/
"  |- syntax_checkers/
"  |- doc/
"
" I'm not sure what each directory conventionally contains. Also don't really need to do for
" I'm not planning to write a vim plugin any time soon.


