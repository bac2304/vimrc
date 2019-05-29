" Auto load / install plugin manager

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" VimPlug
call plug#begin('~/.vim/plugged')


" Syntastic
" https://github.com/scrooloose/syntastic
Plug 'scrooloose/syntastic'


" Languages
Plug 'pearofducks/ansible-vim'

 " features
Plug 'scrooloose/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

call plug#end()
" Required:

filetype plugin indent on

"--------------------------------------------------------------------------------

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufWritePre * :%s/\s\+$//e

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

set noswapfile
set noswapfile
set showcmd
set cmdheight=2
set number
set relativenumber
set wildmenu
set wildmode=full
set ruler
set cursorline
set display=uhex

set tabstop=2 shiftwidth=2 expandtab


filetype on
syntax enable
set background=dark


if has("autocmd")
" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"zz" | endif
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
endif

"--------------------------------------------------------------------
