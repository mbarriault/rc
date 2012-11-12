" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

au BufNewFile,BufRead *.c,*.h,*.m,*.cpp,*.d,*.java set cindent

set encoding=utf-8
let python_highlight_all=1
syntax on
filetype indent on
set autoindent
"set foldmethod=indent

set nocompatible
set incsearch
set wrapscan
set ignorecase
set nowrap
set number
"set cursorcolumn
"set cursorline
set title
set mouse=a
set copyindent
set preserveindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set guioptions-=T
set guioptions-=m
set showtabline=2
set foldmethod=syntax
set hlsearch
set cursorcolumn
set cursorline

map zl :tabnext<CR>
map zh :tabprev<CR>
map zn :tabnew<CR>
map ZH <C-w>h
map ZJ <C-w>j
map ZK <C-w>k
map ZL <C-w>l
map ZN :split<CR>
map ZM :vsplit<CR>
map U <C-r>

function! Mosh_Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3) =~ '^w'
		return "\<C-P>"
	else
		return "\<Tab>"
endfunction

map <F5> :!python %<CR>
command! -nargs=0 -bar -range=% Reverse
    \       let save_mark_t = getpos("'t")
    \<bar>      <line2>kt
    \<bar>      exe "<line1>,<line2>g/^/m't"
    \<bar>  call setpos("'t", save_mark_t)
map <C-e> :Reverse<CR>
