"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set nocompatible

set clipboard+=unnamed

syntax enable " 打开语法高亮  
set background=dark
"colorscheme solarized

syntax on " 允许按指定主题进行语法高亮，而非默认高亮主题  

filetype on
filetype plugin on

" 在状态行上显示光标所在位置的行号和列号  
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

set report=0

" 在被分割的窗口间显示空白，便于阅读  
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1


" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）  
set incsearch

" 制表符为4 
set tabstop=4
set softtabstop=4           " 统一缩进为4 
set shiftwidth=4
set expandtab

set number
set hlsearch
set paste

