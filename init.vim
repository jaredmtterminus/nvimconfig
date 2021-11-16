" let &packpath=&runtimepath
" source ~/.vimrc

set hls
set ic
set is
set number

set inccommand=nosplit

" syntax highlighting (vim has some built in)
syntax on

" indentation for all programming languages
set expandtab
set shiftwidth=2
set smartindent
set tabstop=2
set softtabstop=2

" fold method (default is manual)
" setting to syntax auto folds functions
" set foldmethod=syntax

" remember fold methods for manual folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" mapping example:
" nmap <F3> :set number! <CR>

" autocorrect dictionary
abbr ture true
abbr flase false

" netrw settings (vim file/folder explorer)
let g:netrw_liststyle=3 " tree listing (default is 0)

" fuzzy search
set nocompatible " limit search to your project
set path+=** " Search all subirectories recursively
set wildmenu "shows multiple matches on one line


" plugin manager
call plug#begin('~/.config/nvim/plugged/')

Plug 'junegunn/fzf', {'do': {-> fzf#install()} }
Plug 'junegunn/fzf.vim'

" changes scope of search to project directory (not current directory)
" Plug 'airblade/vim-rooter' 

" preview window with vim fzf
Plug 'yuki-yano/fzf-preview.vim', {'rev':'release/rpc'}

" colorschemes (using this just for neovim)
Plug 'morhetz/gruvbox'

"nerd tree lets you view the folder/file structure
Plug 'preservim/nerdtree'

"CoC
Plug 'neoclide/coc.nvim', {'branch':'release'}

"nerd fonts to work with NERDTree or CocExplorer
" (currently not working with NERDTree)
Plug 'ryanoasis/vim-devicons'

" vimspector is for debugging
Plug 'puremourning/vimspector'

" maximizer is useful for toggling window sizes with inspector
Plug 'szw/vim-maximizer'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" map <C-t> :FZF<CR>
map <C-t> :Files<CR>
let g:fzf_preview_window=['right:60%','ctrl-/']
" map <C-f> :FZF<CR>
map <C-f> :Rg<CR>
map <C-p> :Rg<CR>
map <C-r> :History:<CR>
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector


" miscellaneous
" removes highlight after hit esc
nnoremap <silent><Leader><Esc> :noh<CR>
" allows you to escape terminal in vim easier
tnoremap <Leader><Esc> <C-\><C-n>
" allows you to copy to clipboard
" vnoremap <C-c> :w !pbcopy<CR><CR>
vnoremap <C-c> "*y
" noremap <C-v> :r !pbpaste<CR><CR>
" shows file info when tab is active
" autocmd BufWinEnter *.* <C-g>
" open terminal in separate tab
" (note an alternative: ctrl-z. then to go back to nvim, type fg)
nnoremap <leader>tt :tabnew<CR>:terminal<CR>i
nnoremap <leader>tx :split<CR>:terminal<CR><C-w>r:resize 6<CR>i
nnoremap <leader>tv :vsplit<CR>:terminal<CR><C-w>ri
nnoremap <leader>ti :terminal<CR>i
autocmd TermOpen * setlocal nonumber

" open link from grep command
nnoremap <leader>ot viW"xy:tabnew <C-r>x<CR>
nnoremap <leader>ox viW"xy:split <C-r>x<CR><C-w>K
nnoremap <leader>ov viW"xy:vsplit <C-r>x<CR><C-w>L
nnoremap <leader>oi viW"xy:e <C-r>x<CR>

" all default settings copy/pasted to cocconfig.vim
source ~/.config/nvim/cocconfig.vim
nmap <space>e :CocCommand explorer<CR>
nmap <leader>dh :echo "
      \F3: stop\n
      \F4: restart\n
      \F5: launch/continue\n
      \F9: set breakpoint\n
      \F10: step over\n
      \F11: step into\n
      \F12: step out"
      \<CR>
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dc :call win_gotoid(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call win_gotoid(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call win_gotoid(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call win_gotoid(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call win_gotoid(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call win_gotoid(g:vimspector_session_windows.output)<CR>

" this will make sure all files/windows show the title
set statusline=[%n]\ %t
colorscheme gruvbox

let g:coc_global_extensions=[
      \'coc-python',
      \'coc-html',
      \'coc-vimlsp',
      \'coc-markdownlint',
      \'coc-solargraph',
      \'coc-explorer',
      \'coc-git',
      \'coc-yaml',
      \'coc-xml',
      \'coc-go', 
      \'coc-css',
      \'coc-tsserver',
      \'coc-json'
      \]
" maybe add: coc-metals

