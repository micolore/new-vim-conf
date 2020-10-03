call plug#begin('/Users/kubrick/.config/nvim/autoload')


" ********************************************************
" 基本配置
" ********************************************************
" 设置前缀键为反斜线, E: /w 保存当前文件 , /q 退出vim
let mapleader="/"
nnoremap <leader>1 :1b<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" 设置行号
set number

" 光标样式竖线
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor

" 设置相对行号
set relativenumber


" ********************************************************
" theme
" ********************************************************
syntax enable
set background=dark        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
set termguicolors
colorscheme molokai


" ********************************************************
" 启动界面
" https://github.com/mhinz/vim-startify
" ********************************************************
Plug 'mhinz/vim-startify'

" ********************************************************
" 可以快速对齐的插件
" https://github.com/junegunn/vim-easy-align
" ********************************************************
Plug 'junegunn/vim-easy-align'


" ********************************************************
" 粘贴板记录
" https://github.com/vim-scripts/YankRing.vim coc有替代品
" ********************************************************
Plug 'vim-scripts/YankRing.vim'

" Or override 
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>


" ********************************************************
" Plug 'itchyny/lightline.vim' "底部状态栏
" ********************************************************
Plug 'vim-airline/vim-airline'
set statusline+=%1*\ %<%F\     "文件路径
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"设置切换Buffer快捷键"
" nnoremap <leader>> :bn<CR>
" nnoremap <leader>< :bp<CR>
" move between file and buffer 

" ********************************************************
" Plug 'ctrlpvim/ctrlp.vim' 模糊搜索插件
" https://github.com/ctrlpvim/ctrlp.vim 
" ********************************************************
"nnoremap <leader>bb :CtrlPBuffer<CR>
"nnoremap <leader>ff :CtrlPMRU<CR>
"nnoremap <leader>ll :CtrlP<CR>
"nnoremap <leader>ll :CtrlPMixed<CR>


" ********************************************************
" 模糊搜索插件
" https://github.com/Yggdroot/LeaderF 
" ********************************************************
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
nnoremap <leader>bb :LeaderfBuffer<CR>
nnoremap <leader>fl :LeaderfFile  <CR>
nnoremap <leader>uf :LeaderfMru   <CR>
nnoremap <leader>fn ::LeaderfFunction <CR>
nnoremap <leader>ln :LeaderfLine  <CR>
nnoremap <leader>r :Leaderf rg <CR>


"" ********************************************************
" 搜索插件
" ********************************************************
Plug 'mileszs/ack.vim'
" ack.vim
" 使用 leader + a search
cnoreabbrev Ack Ack!
nnoremap <F3> :Ack! <Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --nogroup --column'
endif
" 高亮搜索关键词
let g:ackhighlight = 1
nnoremap <leader>cc :cclose<CR> 


" ********************************************************
" 搜索
" https://github.com/junegunn/fzf
" ********************************************************
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"nmap <leader>qf :Files<CR>
"nmap <leader>b :Buffers<CR>
"first vim script 2019-12-15
"nmap <leader>l :Lines<CR> 
"let g:fzf_action = { 'ctrl-e': 'edit' }


" ********************************************************
" Rust language
" ********************************************************
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1


" ********************************************************
" 语法检查，支持lsp
" https://github.com/dense-analysis/ale
" ********************************************************
Plug 'dense-analysis/ale'
let g:ale_list_window_size = 5
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 1000
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

" minibuffer 
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"Plug 'bling/vim-bufferline'

" ********************************************************
" 自动补全括号
" https://github.com/jiangmiao/auto-pairs
" ********************************************************
Plug 'jiangmiao/auto-pairs'


" ********************************************************
" 远程
" https://github.com/roxma/nvim-yarp
" ********************************************************
Plug 'roxma/nvim-yarp'


" ********************************************************
" Golang language
" https://github.com/fatih/vim-go
" ********************************************************
Plug 'fatih/vim-go'


" ********************************************************
" Golang 方法跳转插件
" https://github.com/dgryski/vim-godef
" ********************************************************
Plug 'dgryski/vim-godef'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mode = 'gopls'
let g:go_def_mapping_enabled = 0
" open new window
" let g:godef_split=0 
let g:godef_same_file_in_same_window=1

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1


" ********************************************************
" 文件夹树
" https://github.com/preservim/nerdtree
" ********************************************************
Plug 'scrooloose/nerdtree'


" ********************************************************
" 文件夹树+git相关标识
" ********************************************************
Plug 'Xuyuanp/nerdtree-git-plugin'
" 文件树设置 {{{
" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
" let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=33
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
  \ }
let g:gitgutter_max_signs = 500  " default value " gitgutter

" ********************************************************
" theme 
" https://github.com/mhartington/oceanic-next
" ********************************************************
"Plug 'mhartington/oceanic-next'



" ********************************************************
" 缩进线
" ********************************************************
Plug 'Yggdroot/indentLine'
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进


" ********************************************************
" https://github.com/neoclide/coc.nvim
" ********************************************************
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap ge :CocCommand explorer<CR> 
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

"coc config start
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
" ------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

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

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
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

"coc config end 

call plug#end()
