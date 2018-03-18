" =============================================================================
"                            .vimrc by Mdeca
" =============================================================================
"
"
" =============================================================================
"                                   Vundle 
" =============================================================================


" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme) 
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add your bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tibabit/vim-templates'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'


" Installing bundles...
if iCanHazVundle == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

call vundle#end() 
filetype plugin indent on " load filetype plugins/indent settings

colorscheme wombat256
syntax on                      " enable syntax highlighting
 
" Setting up Vundle - the vim plugin bundler end

" -----------------------------------------------------------------------------
" Brief help
" 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" -----------------------------------------------------------------------------


" =============================================================================
" =============================================================================
"
"
" =============================================================================
"                             Vim settings
" =============================================================================


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Disable backup and swap files 
set nobackup
set nowritebackup
set noswapfile

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Remap Tab to ESC
inoremap <Tab> <Esc>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
"" set relativenumber

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Run python script from vim
filetype on
autocmd FileType python nnoremap <buffer> <F5> :exec '!clear; python' shellescape(@%, 1)<cr>

" Load template
au BufNewFile *.py 0r ~/Templates/pythonheader.template

 
" =============================================================================
" =============================================================================
"
"
" =============================================================================
"                            Plugin shortcuts
" =============================================================================


" Nerdtree ----------------------------
"
" Open Nerdtree on vim startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Set key for nerdtree
map <F3> :NERDTreeToggle<CR>


" Python folding ----------------------
"
set nofoldenable


" Jedi-vim ----------------------------
" 
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>


" NeoComplCache ------------------------------
"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'


" Syntastic ------------------------------
"
" show list of errors and warnings on the current file
nmap <leader>b :Errors<CR>
" check also when just opened the file
"" let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
"" let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous 
" setting)
"" let g:syntastic_error_symbol = '✗'
"" let g:syntastic_warning_symbol = '⚠'
"" let g:syntastic_style_error_symbol = '✗'
"" let g:syntastic_style_warning_symbol = '⚠'
" update ----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 

" CtrlP -------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP' 

" Tagbar ------------------------------
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


" =============================================================================
" =============================================================================
