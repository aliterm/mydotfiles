
"Install Vim-Plug
" if has('nvim')
"     if empty(glob('"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'))
" 	silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
" 		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     endif
" else
"     if empty(glob('~/.vim/autoload/plug.vim'))
" 	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
" 		    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"     endif
" endif

if !has('nvim')
  set ttymouse=xterm2
endif

call plug#begin('~/.vim/plugged')

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'kien/ctrlp.vim'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-obsession'
"Plug 'kyazdani42/nvim-web-devicons'
" Plug 'dhruvasagar/vim-zoom'
Plug 'ryanoasis/vim-devicons'
Plug 'rking/ag.vim'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
"
" Plug 'kyazdani42/nvim-tree.lua', { 'commit': 'afc86a9' }
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
" Plug 'vim-syntastic/syntastic'
" Plug 'tpope/vim-fugitive'
" Plug 'terryma/vim-multiple-cursors'
Plug 'slim-template/vim-slim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mileszs/ack.vim'
Plug 'rakr/vim-one'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'ap/vim-css-color'
Plug 'pangloss/vim-javascript'
" Plug 'wakatime/vim-wakatime'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-repeat'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
" Plug 'thaerkh/vim-workspace'
" Plug 'dmerejkowsky/vim-ale'
" Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()

let g:ale_disable_lsp = 1

set nocompatible
filetype plugin indent on
syntax enable
colorscheme one
set noshowmode
set autoindent
set smartindent
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap
set mouse=a
set incsearch
set hlsearch
set ignorecase
set wildmenu
set backspace=indent,eol,start
set writebackup
" set binary
set bomb
set clipboard+=unnamedplus
set completeopt=menuone,noselect,preview
set conceallevel=0
set cursorcolumn
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set foldlevel=0
set foldmethod=manual
set formatoptions+=l
set gdefault
set guioptions-=e
set hidden
set laststatus=2
set lazyredraw
set linebreak
set linespace=0
"set list
"set listchars=tab:»·,trail:·,nbsp:·
set noautoread
set noerrorbells
set nostartofline
set novisualbell
set regexpengine=1
"set relativenumber
set report=0
set ruler
set scrolloff=5
set shortmess=atToOc
set showcmd
set showmatch
" set showmode
set showtabline=2
set sidescrolloff=10
set smartcase
set splitbelow
set splitright
set t_Co=256
set ttimeoutlen=50
set undofile
set updatetime=300
set wildmenu
set wildmode=full

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,__pycache__,node_modules

autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"augroup numbertoggle
"    autocmd!
"    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

hi CursorLine term=bold cterm=bold guibg=Grey40
set background=dark

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
aug netrw_close
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Set tombol omnifunc biar bisa pake CTRL+SPACE
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
	    \ "\<lt>C-n>" :
	    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
	    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
	    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="one"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if exists('$TMUX')
    augroup TmuxYank
	autocmd!
	autocmd TextYankPost * if v:event.operator ==# 'y' | call system('tmux set-buffer ' . shellescape(@0)) | endif
    augroup END
endif

nnoremap <Leader>w :set wrap<CR>
nnoremap <Leader>W :set nowrap<CR>
nnoremap <Leader>g :NERDTreeToggle<CR>
nnoremap <Leader>G :NERDTreeFind %<CR>

let g:syntastic_enable_signs=1
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haml','scss','sass'] }
let g:syntastic_ruby_checkers = ['rubocop']

"Gvim Configuration
function! ToggleGUICruft()
    if &guioptions=='i'
	exec('set guioptions=imTrL')
    else
	exec('set guioptions=i')
    endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i
set guifont=Fira\ Code\ Retina\ 10

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

let g:one_allow_italics = 1 " I love italic for comments

" set t_ZH=^[[3m
" set t_ZR=^[[23m
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
nmap <F8> :TagbarToggle<CR>

" CoC {{{
" ----------------------------------------------------------------------------
" Enable if want to install the extensions
let g:coc_node_path = '/usr/bin/node'
let g:coc_global_extensions = [
	    \ 'coc-yank', 'coc-vimlsp', 'coc-ultisnips', 'coc-snippets',
	    \ 'coc-lists', 'coc-highlight', 'coc-git', 'coc-emmet',
	    \ 'coc-yaml', 'coc-tsserver', 'coc-svg', 'coc-solargraph',
	    \ 'coc-rls', 'coc-python', 'coc-phpls', 'coc-json', 'coc-java',
	    \ 'coc-html', 'coc-css']


if executable('intelephense')
    augroup LspPHPIntelephense
	au!
	au User lsp_setup call lsp#register_server({
		    \ 'name': 'intelephense',
		    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
		    \ 'whitelist': ['php'],
		    \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
		    \ 'workspace_config': {
		    \   'intelephense': {
		    \     'files': {
		    \       'maxSize': 1000000,
		    \       'associations': ['*.php', '*.phtml'],
		    \       'exclude': [],
		    \     },
		    \     'completion': {
		    \       'insertUseDeclaration': v:true,
		    \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
		    \       'triggerParameterHints': v:true,
		    \       'maxItems': 100,
		    \     },
		    \     'format': {
		    \       'enable': v:true
		    \     },
		    \   },
		    \ }
		    \})
    augroup END
endif

"let g:coc_force_debug = 1
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
	execute 'h '.expand('<cword>')
    else
	call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ----------------------------------------------------------------------------
" }}}
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
nmap <C-P> :FZF<CR>
nnoremap <leader>v <cmd>CHADopen<cr>

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_name = 'Session.vim'
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html', 'md', 'txt'] " enabled extensions with default colors
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico'] " enabled exact matches with default colors
let g:NERDTreeHighlightCursorline = 0

packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" let g:ale_linters_explicit = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'php': ['hackfmt'],
\   'ruby': ['rubocop'],
\}

let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😕'

nnoremap <Leader>b :ls<CR>:b<Space>
" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
let g:indentLine_enabled = 1
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_fileTypeExclude = ['json','markdown']
