set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
source ~/.config/nvim/cocconfig.vim
nmap <space>e :CocCommand explorer<CR>

colorscheme gruvbox
