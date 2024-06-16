:set number


:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()
Plug 'https://github.com/preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'sindrets/diffview.nvim'
Plug 'https://github.com/vim-test/vim-test.git' 
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'ThePrimeagen/vim-be-good'
Plug 'alexghergh/nvim-tmux-navigation'
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }
call plug#end()
 
set encoding=UTF-8

autocmd VimEnter * NERDTree
let g:NERDTreeFileLines = 1
:colorscheme gruvbox
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

{
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
  },
},


