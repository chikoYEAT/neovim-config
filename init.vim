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
Plug 'APZelos/blamer.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'alexghergh/nvim-tmux-navigation'
Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'f-person/git-blame.nvim'
" Loaded when clojure file is opened
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif
" Multiple figunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'vim-denops/denops.vim'
Plug 'tennashi/gitsign.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'
call plug#end()
 
set encoding=UTF-8

autocmd VimEnter * NERDTree
let g:NERDTreeFileLines = 1
:colorscheme slate
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


# Commands
nnoremap <C-n> :NERDTreeToggle<CR>


function! ToggleTerminal()
    " Check if the terminal buffer is open
    let l:term_bufnr = bufnr('$')
    while l:term_bufnr >= 1
        if getbufvar(l:term_bufnr, '&buftype') == 'terminal'
            " If terminal is found, check if it's visible
            for l:win in range(1, winnr('$'))
                if winbufnr(l:win) == l:term_bufnr
                    " If terminal is visible, close the window
                    execute l:win . 'close!'
                    return
                endif
            endfor
            " If terminal is not visible, make it the current buffer
            execute 'buffer' l:term_bufnr
            return
        endif
        let l:term_bufnr -= 1
    endwhile
    " If no terminal buffer is found, open a new one
    execute 'terminal'
endfunction

nnoremap <C-t> :call ToggleTerminal()<CR>
let g:gitsign#auto_enable = 1

" default updatetime 4000ms is not good for async update
set updatetime=100
