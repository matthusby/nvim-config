if &compatible
	set nocompatible
endif

set runtimepath^=~/.config/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/dein')) " Plugin Root
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('slashmili/alchemist.vim')
call dein#add('rbgrouleff/bclose.vim')
call dein#add('vim-scripts/buftabs')
call dein#add('kien/ctrlp.vim')
call dein#add('scrooloose/nerdtree')

call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('bling/vim-airline')
call dein#add('scrooloose/syntastic')
call dein#add('flazz/vim-colorschemes')
call dein#add('airblade/vim-gitgutter')
call dein#add('elixir-lang/vim-elixir')
call dein#add('mxw/vim-jsx')

call dein#add('ElmCast/elm-vim')

call dein#end()

filetype plugin indent on
let mapleader = "\<Space>" 		" Map space as leader
set encoding=utf-8
"------  Visual Options  ------
syntax on		" Highlighting on
set number		" Line numbers
set nowrap		" Noped out of wrapping
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

"------  Generic Behavior  ------
set list			" Show whitespace
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set hidden			" Hide buffers instead of closing them
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab " Don't expand tabs to spaces
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'some_bad_symbolic_links',
	\ }
"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Wtf is Ex Mode anyways?
nnoremap Q <nop>

"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_

"------  Window Navigation  ------
" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" ,q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" ,Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Clear search highlights when pressing ,b
nnoremap <silent> <leader>b :nohlsearch<CR>

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using ,n
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Close if only NERDTree open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

colorscheme Tomorrow-Night

"------ SASS Filetype Settings  ------
"au BufNewFile,BufReadPost *.css,*.scss,*.sass set shiftwidth=4 noexpandtab
au FileType sass setl sw=4 sts=4 noexpandtab
"------  Elixir Filetype Settings  ------
"au BufNewFile,BufReadPost,BufRead *.ex,*.exs,*.eex set shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
"au BufRead,BufNewFile *.ex,*.exs,*.eex set shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab

" Hides toolbar and scrollbars and File menu
"set guioptions=egt
set guifont=Monaco:h14

" Highlights the current line background
set cursorline
set cursorcolumn

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Cmd+t = new tab
nnoremap <silent> <D-t> :tabnew<CR>

" Cmd+w = close tab (this should happen by default)
nnoremap <silent> <D-w> :tabclose<CR>

" OS X probably has ctags in a weird place
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:deoplete#enable_at_startup = 1

let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
