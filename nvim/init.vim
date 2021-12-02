" File              : .vimrc
" Author            : jni <jni@bouffalolab.com>
" Date              : 28.09.2021
" Last Modified Date: 18.11.2021
" Last Modified By  : jni <jni@bouffalolab.com>

call plug#begin('~/.config/nvim/plugged')
"Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/vim-clang-format'
Plug 'alpertuna/vim-header'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'machakann/vim-highlightedyank'
Plug 'lfv89/vim-interestingwords'
"Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
call plug#end()


syntax enable
set background=dark
" set background=light

colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" colorscheme gruvbox

" if has("termguicolors")
    " enable true color
    " set termguicolors
" endif

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 0

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
set whichwrap=b,s,h,l,<,>,[,]   " 左右移动可跨行
" }}} Spaces & Tabs

" Clipboard {{{
set clipboard+=unnamedplus
" }}} Clipboard

" UI Config {{{
set hidden
set number                   " show line number
set relativenumber           " show relative line number
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set cursorcolumn             " highlight current colume
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line
set nobackup
set noswapfile
set nowrap
set mouse=v                  " only enable mouse in visual mode
set scrolloff=12
set updatetime=100           " for signify plug
" let &colorcolumn="78"
" }}} UI Config

" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'angr'
"let g:airline_theme = 'dracula'

let g:clang_format#command = "clang-format"
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "ColumnLimit" : 0,
            \ "SortIncludes": "false"}

let g:header_field_author = 'jni'
let g:header_field_author_email = 'jni@bouffalolab.com'
let g:header_auto_add_header = 0

" vim-better-whitespace
"let g:better_whitespace_enabled = 1
"let g:strip_whitespace_on_save = 1

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " Find and add a cscope file. Either from CSCOPE_DB or by searching for it
    " recursively starting in the CWD and going up to /
    if $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    else
        " Get all parts of our current path
        let dirs = split($PWD, '/')
        " Start building a list of paths in which to look for cscope.out
        let paths = ['/']
        " /foo/bar/baz would result in the `paths` array containing:
        " [/ /foo /foo/bar /foo/bar/baz]
        for d in dirs
            let paths = add(paths, paths[len(paths) - 1] . d . '/')
        endfor

        " List is backwards search order, so reverse it.
        for d in reverse(paths)
            let cscope_file = d . "/cscope.out"
            if filereadable(cscope_file)
                execute('cs add ' . cscope_file)
                break
            endif
        endfor
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    " cscope key bind
    nnoremap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nnoremap <leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nnoremap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

    map <F5> :!cscope -Rbqk<CR>:cs reset<CR><CR>
endif

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

" FZF
"let g:fzf_layout = { 'down': '40%' }

" key bind
"noremap <leader>fz :Files<CR>
"noremap <leader>fb :Buffers<CR>

" Buffer key bind
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bd :bd<CR>

" Tab key bind
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprev<CR>

" skywind3000/asyncrun.vim
" let g:asyncrun_open = 15        " 自动打开 quickfix window ，高度为 6
" let g:asyncrun_bell = 1         " 任务结束时候响铃提醒

" 设置 F9 打开/关闭 Quickfix 窗口
"nnoremap <F9> :call asyncrun#quickfix_toggle(6)<cr>

" InterestingWords config
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']  " GUI colors
let g:interestingWordsRandomiseColors = 1  " random colors
nnoremap <F8> :call InterestingWords('n')<cr>

" auto-pair
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairsMapCR = 4
let g:AutoPairsMapSpace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_FollowLinks = 1
let g:Lf_ShowHidden = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 1, 'File': 0, 'Buffer': 1, 'Mru': 0, 'Line': 0, 'Gtags': 1 }
let g:Lf_PopupPreviewPosition = 'top'

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_PopupWidth = 0.95
"let g:Lf_WindowHeight = 0.30

"let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <leader>f :LeaderfSelf<cr>
noremap <leader>ff :LeaderfFile<cr>
noremap <leader>fc :LeaderfFunction<cr>
noremap <leader>fw :LeaderfWindow<cr>
nmap <unique> <leader>fs <Plug>LeaderfGtagsSymbol
nmap <unique> <leader>fg <Plug>LeaderfGtagsGrep


" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsAutoUpdate = 1
let g:Lf_GtagsSource = 1
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'

noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags auto load tags
set tags=./.tags;,.tags

" gutentags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
" 需手动去github下载ctags和gtags源码编译安装
let g:gutentags_modules = []
if executable('ctags')
let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags
" 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags
" 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim config
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd FileType tex let b:coc_pairs = [["$", "$"]]

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

