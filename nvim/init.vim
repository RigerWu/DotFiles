" 插件选择
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion' 
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'udalov/kotlin-vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'psliwka/vim-smoothie'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'honza/vim-snippets'
Plug 'sbdchd/neoformat'
Plug 'chrisbra/Colorizer'
Plug 'skywind3000/vim-terminal-help'

" Initialize plugin system
call plug#end()

" 基础设置
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set nocompatible                                     " 不要兼容vi
syntax on                                            " vimwiki 和 anyfold需要 pyplot也要
filetype plugin indent on

set clipboard+=unnamed                               " 共享系统剪切板
set encoding=utf-8                                   " 编码
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1 " 编码猜测
set number
set relativenumber                                   " 设置相对行号
set incsearch                                        " 搜索时即高亮
set hlsearch                                         " 高亮匹配内容
set wrap
set smartindent                                      " 智能缩进
set autoindent                                       " 自动换行缩进
set linebreak                                        " 软折行
set noswapfile                                       " 禁止生成swap文件
set hidden                                           " 终端隐藏后不结束
set ignorecase                                       " 忽略大小写
set smartcase
set infercase                                        " Adjust case in insert completion mode
set history=500                                      " 历史命令
set splitbelow                                       " 在下方分割
set splitright                                       " 在右边分割
set autoindent                                       " 使用空格进行缩进
set expandtab                                        " tab扩展为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
                                                     " set foldmethod=indent
set list                                             " 只有setlist后面的才会起作用
set listchars=tab:\|\→·,nbsp:⣿,extends:»,precedes:«
set listchars+=eol:¬
set listchars+=trail:·                               " 尾部空白
" set listchars+=space:\                             " 空白
set pumheight=20                                     " 设置弹出框大小, 0 则有多少显示多少

set nobackup                                         " coc
set nowritebackup                                    " coc
set shortmess+=c                                     " coc
set signcolumn=yes                                   " coc
set sessionoptions+=globals                          " coc
set autoread                                         " 文件在外部被修改过，重新读入
set autowrite                                        " 自动写回
set confirm                                          " 显示确认对话框
set noshowmode
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=100                                   " 更新时间100ms 默认4000ms 写入swap的时间
set shortmess+=c

set mouse=a                                          " 允许使用鼠标, normal生效，a则是全模式生效
set cmdheight=2
set conceallevel=0                                   " json文件不显示引号
set laststatus=2                                     " 状态栏, lightline中更改了
"set showtabline=2                                   " 总是显示tab标签栏
set re=1
set cursorline                                       " 高亮当前行
"set cursorcolumn                                    " 高亮当前列
set guicursor=

set undodir=~/.vim/undodir
set undofile


" 环境设置
" 界面设置
if has('termguicolors')
    set termguicolors
endif
set background=dark
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

let g:polyglot_disabled = ['kotlin']

" 键位设置
" 查看键位冲突  :verbose imap <C-H>
let mapleader=" "
" 取消搜索高亮
nnoremap <BackSpace> :nohl<CR>
" 快速ESC, 灰常好用
inoremap jk <esc>
" 窗口移动
" nnoremap <Up>        gt
" nnoremap <Down>      gT
" nnoremap <Left>      <C-W>h
" nnoremap <Right>     <C-W>l
noremap <c-h> <C-w>h
noremap <c-j> <C-w>j
noremap <c-k> <C-w>k
noremap <c-l> <C-w>l
nnoremap <A-j>    :resize -3<CR>
nnoremap <A-k>    :resize +3<CR>
nnoremap <A-h>    :vertical resize -3<CR>
nnoremap <A-l>    :vertical resize +3<CR>
" 插入模式下移动到行首行尾
" 解决与autopirs的c-h冲突
let g:AutoPairsMapCh=0
inoremap <c-h> <esc>I
inoremap <c-l> <esc>A
nnoremap Y y$

" undotree
nnoremap <leader>u :UndotreeToggle<CR>
" fzf 配置
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse --info=inline'
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE><CR>
if executable('rg')
    let g:rg_derive_root='true'
endif

" V模式下代码移动
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap < <gv
vnoremap > >gv

" easymotion 配置
let g:EasyMotion_smartcase = 1
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" <Leader>f search in line
map  <Leader>f <Plug>(easymotion-lineanywhere)

" s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-e)
nmap <Leader>w <Plug>(easymotion-e)
map  <Leader>b <Plug>(easymotion-ge)
nmap <Leader>b <Plug>(easymotion-ge)

" EasyAlign 配置
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" LightLine 配合 devicons 使用
let g:lightline = {
            \ 'colorscheme': 'gruvbox_material',
            \ 'active':{
            \    'left':[['mode', 'paste'],['gitbranch','readonly','filename','modified']]
            \  },
            \ 'component_function': {
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \   'gitbranch': 'FugitiveHead'
            \ }
            \ }

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" Toggle 'default' terminal
nnoremap <M-`> :call ChooseTerm("term-slider", 1)<CR>
" Start terminal in current pane
nnoremap <M-CR> :call ChooseTerm("term-pane", 0)<CR>

" coc 设置
source ~/.config/nvim/coc.vim
