set nocompatible              " be iMproved, required, must come first
filetype off                  " required
syntax on

set autoindent
set backspace=indent,eol,start    " Intuitive backspacing.
set backupdir=~/.vim/tmp,/tmp     " Keep backups to specific directories
set directory=~/.vim/tmp,/tmp     " Keep backups to specific directories
set expandtab                     " Use spaces instead of tabs
set hidden                        " Handle multiple buffers better.
set hlsearch                      " Highlight matches.
set ignorecase                    " Case-insensitive searching.
set incsearch                     " Highlight matches as you type.
set laststatus=2                  " Show the status line all the time
set nobackup                      " Don't make a backup before overwriting a file.
set nowrap
set nowritebackup                 " And again.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set shiftwidth=2                  " And again, related.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set smarttab                      " in insert mode, tab goes to correct indent on newline
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set tabstop=2                     " Global tab width.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set wildmenu                      " Enhanced command line completion.
set textwidth=80                  " Set width to 80
set fo+=t                         " Wrap words after 80 chars when formatting
set wildmode=list:longest         " Complete files like a shell.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kana/vim-fakeclip'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'takac/vim-hardtime'
Plugin 'ngmy/vim-rubocop'
Plugin 'benmills/vimux'
Plugin 'junegunn/fzf.vim'
Plugin 'pgr0ss/vimux-ruby-test'
Plugin 'AndrewRadev/splitjoin.vim' " splitting/joining blocks
call vundle#end()            " required
filetype plugin indent on     " required for Vundle
" End of Vundle stuff

let mapleader = "," " Set leader to comma
set modelines=0

" Tab mappings.
map <leader>w :w!<cr>
map <leader>e :e! $MYVIMRC<cr>

" Line insertions without jumping to insert-mode
nmap <C-O> O<Esc>

"hotkey for NERDtree
nmap <silent> <c-n> :NERDTreeToggle<CR>
"open current buffer in NERDTree
map <leader>nf :NERDTreeFind<cr>

au FileType go nmap <leader>t <Plug>(go-test)
au FileType go setl sw=4 ts=4 sts=4 noet
au BufRead,BufNewFile *.go set noet ts=4 sts=4 sw=4
" Map copy/paste functionality
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
" Move cursor down or up a single row
nmap j gj
nmap k gk
" Jump between files quickly
map <leader>, <C-^>
map <leader>j :bn<cr>
map <leader>l :bp<cr>

" stop highlighting
map <leader>a :noh<cr>
" unset default rubocop mapping
let g:vimrubocop_keymap = 0

" fzf fuzzy find
let g:fzf_files_options =
  \ '--reverse ' .
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
nnoremap <C-p> :Files<CR>
" Use ; to fuzzy find open buffers
nnoremap ; :Buffers<CR>

set wildignore+=*/.git/*tmp/
" allow escape from insert mode by typing kj 
imap kj <Esc>

"allows 256 colors for purty colorschemes
let &t_Co=256 
" turn hard mode on by default
let g:hardtime_default_on = 1
" ignore hardtime in NERDTree
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
" ignore hardtime in quickfix menu
let g:hardtime_ignore_quickfix = 1
" allow kj in hardtime
let g:hardtime_allow_different_key = 1
" allow up to 3 bad movement keys before triggering hardtime
let g:hardtime_maxcount = 3
"allow scrolling in iTerm
set mouse=a
" Window Resizing
syntax enable
colorscheme molokai
if bufwinnr(1)
  map - <C-W>-
  map _ <C-W>-
  map = <C-W>+
  map + <C-W>+
endif

set number relativenumber

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Re-make ctags for current directory
map <LocalLeader>rt :!ctags -R --exclude=".git\|log\|tmp\|db\|pkg" --extra=+f <CR>

" Vimux ruby test shortcuts
map <leader>rf :RunRubyFocusedTest<CR>
map <leader>rc :RunRubyFocusedContext<CR>
map <leader>ra :RunAllRubyTests<CR>

" Easilyi source this file from vim
map <leader>s :source $MYVIMRC<CR>

" look in current directory first for ctags
set tags=./tags;/
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" show text after 80 chars with gray background
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END
