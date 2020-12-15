" Indent automatically depending on filetype
filetype on
" make sure flietype plugin is on so that .vim files under ftplugin/ are loaded
" See: http://vimdoc.sourceforge.net/htmldoc/filetype.html
" for more on filetype specific commands
" Check the current buffer's filetype: `set filetype?`
filetype plugin indent on " how does this solve the 'omnifunc is not set' issue?
set autoindent

" Turn on line numbering. Turn it off with set nonu
set number

" Set syntax on
syntax on

" Higlhight search
set hls "set hlsearch is also valid

" Wrap text instead of being on one line
"set lbr

" allow backspace to work over indentation, end-of-line and existing contents
" More details, see: https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" Show the filename of the file currently being edited
set laststatus=2
set statusline=%f

" Use 4 spaces for indentation and pressing the tab key generates 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" vim tabs
"nnoremap th  :tabfirst<CR>
"nnoremap tk  :tabnext<CR>
"nnoremap tj  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap td  :tabclose<CR>
"nnoremap tn  :tabnew<CR>

" vim buffers
" use buffers instead of tabs
" Actually a good argument:
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
nnoremap tk  :bnext<CR>
nnoremap tj  :bprev<CR>
nnoremap th  :bfirst<CR>
nnoremap tl  :blast<CR>
nnoremap tc  :bd<CR>
nnoremap tn  :enew<CR>

" vim windows
" :help windows

" vim airline
" For some information, see the documentation:
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" configure tabline
let g:airline#extensions#tabline#left_sep = ' | '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'
" airline themes
" good ones:
" base16_snazzy
" ayu_dark
" base16_atelierforest
" base16_atelierlakeside
" base16_bright
" base16_default
let g:airline_theme='base16_default'

" tagbar toggle
" We want Universal Ctags instead of exuberant ctags for Rust to work well.
" See: https://github.com/universal-ctags/ctags
" It needs to be built from source with Autotool
" And make sure exuberant ctags is removed
nmap <F8> :TagbarToggle<CR>

" vim racer
" In addition to the following 'jump to defintion' commands, racer also
" provides auto-completion. Use C-x C-o to trigger the omnifunc set by vim
" racer, which calls racer to suggest auto-completion options.
" This is different from the normal word, line and dictionary completion
" function that vim already has in insert mode because it calls racer for
" completion suggestion and does not rely on existing contents.
set hidden " just saves a :w before jump to definition
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" completions to show the complete function definition (e.g. its arguments and
" return type)
let g:racer_experimental_completer=1
" insert the parenthesis in the completion
let g:racer_insert_paren=1

" show a horizontal cursorline. Often set temporarily by Netrw
"set cursorline

" Custom key bindings
"inoremap wj <ESC>
"" Ctrl-s to save
"inoremap <C-s> <Esc>:w<CR>
"nnoremap <C-s> <Esc>:w<CR>
"" Ctrl-wq to quit
"inoremap <C-w><C-q> <Esc>:wq<CR>
"nnoremap <C-w><C-q> <Esc>:wq<CR>
"" Ctrl-q to quit without saving
"inoremap <C-q> <Esc>:q!<CR>
"nnoremap <C-q> <Esc>:q!<CR>

" colorscheme
" Just put a bunch of *.vim files under ~/.vim/colors
" Good ones:
" OceanicNext
" SlateDark
" Tomorrow-Night-Bright
" afterglow
colorscheme afterglow

""" Notes:
""" Plugins quirkiness
"" rust.vim
" For rust.vim's syntastic integration to work, we have ot run cargo check in a project
" first.
" rust.vim was originally placed under rust.vim/ftplugin/. However, it seems that
" vim8 doesn't load the .vim file under ftplugin. I could run functions defined in
" .vim files under autoload/, but additional mappings (e.g., key bindings) defined in
" ftplugin/ are not loaded.
" UPDATE: see below vim-racer for solution

"" vim-racer
" rust_racer.vim was originally placed under vim-racer/ftplugin/. However, it seems that
" vim8 doesn't load the .vim file under ftplugin. Renaming ftplugin/ to plugin/ solved
" the issue.
" UPDATE: renaming was the wrong fix. The right thing to do is to turn filetyle plugin on
" by `filetype plugin on`. This enables loading plugin files for specific file types.

"" tagbar
" Use Universal Ctags instead of Exuberant Ctags!


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
"
"" TODO: what about variable definitions with `let` and variable scopes?

""" Key Mappings
"" inoremap
"" nnoremap

""" Auto Completion in Insert Mode
" C-n, C-p: similar word in current file
" C-x, C-l: line completion
" C-x C-k: dictionary completion (need to `set dictionary={file}`)

""" Edit Shortcuts in Insert Mode
" C-w: erase word
" C-u: erase line

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
"
""" Ex Commands
"" | or <BAR>
" see more :help :bar
"
""" Copy and paste through the system clipboard
" For a while I suffered unstable copy and paste through the system clipboard.
" Sometimes it just doesn't work depending on which sytem I'm using and how
" (e.g., whether it's ssh or not, Ubuntu or Debian). This causes problem when I
" want to copy from a tmux pane to another tmux pane.
" This is a quite comprehensive answer to this problem:
" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
" On Ubunut, make sure to install vim-gtk3. This will install a vim binary with
" the +clipboard option enabled. Moreover, the vim-gtk3 vim binary seems to map
" yy and pp to go through the system clipboard.
" The default seems to be the following (based on my Ubuntu on Raspberry Pi4):
" 1. vim/focal,now 2:8.1.2269
" 2. vim-common/focal,now 2:8.1.2269
" 3. vim-runtime/focal,now 2:8.1.2269
" 4. vim-tiny/focal,now 2:8.1.2269
" So vim-gtk3 is definitely NOT the default.
"
" Another copy-paste bug is that vim doesn't seem to sync its clipboard until
" exit. For example, on my Ubuntu Raspberry Pi4, even though I installed
" vim-gtk3, the following happens:
" Say I have a vim instance 0 running in tmux window 0 and vim instance 1
" running in tmux window 1. The only way I can copy and paste from vim 0 to
" vim 1 is if I yank from vim0, exit and then start vim1 and then paste.
