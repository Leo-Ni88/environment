" /home/leo/.config/nvim/init.vim
" Copyright (c) 2021 jni <jni@bouffalolab.com>
" GNU Affero General Public License for more details.
"
" You should have received a copy of the GNU Affero General Public License
" along with this program.  If not, see <https://www.gnu.org/licenses/>.
"
" File              : init.vim
" Author            : jni <jni@bouffalolab.com>
" Date              : 16.12.2021
" Last Modified Date: 16.12.2021
" Last Modified By  : jni <jni@bouffalolab.com>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rhysd/vim-clang-format'
Plug 'Leo-Ni88/vim-uncrustify'
Plug 'alpertuna/vim-header'
Plug 'numToStr/Comment.nvim'
Plug 'lfv89/vim-interestingwords'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'honza/vim-snippets'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'jiangmiao/auto-pairs'
Plug 'yamatsum/nvim-cursorline'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'mhinz/vim-startify'
" Plug 'ap/vim-css-color'
"Plug 'altercation/vim-colors-solarized'
"Plug 'morhetz/gruvbox'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'machakann/vim-highlightedyank'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 主题
"The configuration options should be placed before colorscheme sonokai
set background=dark

let g:sonokai_style = 'maia'
" let g:sonokai_style = 'espresso'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized

" let g:gruvbox_material_statusline_style = 'mix'
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_enable_italic = 0
" let g:gruvbox_material_disable_italic_comment = 1
" colorscheme gruvbox

" true colors. Important!! not friendly to solarized
if has('termguicolors')
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'sonokai'
"let g:airline_theme = 'angr'
"let g:airline_theme = 'dracula'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bufferline.nvim
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
nnoremap <silent><leader>bb :BufferLinePick<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" kyazdani42/nvim-tree.lua
nnoremap <leader>ee :NvimTreeToggle<CR>
nnoremap <leader>er :NvimTreeRefresh<CR>
nnoremap <leader>en :NvimTreeFindFile<CR>
" highlight NvimTreeOpenedFile guifg=yellow gui=bold

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" regular setting
" Spaces & Tabs config
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
set whichwrap=b,s,h,l,<,>,[,]   " 左右移动可跨行

" Clipboard 
set clipboard+=unnamedplus

" UI Config
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
set wrap
set mouse=a                  " enable mouse in Nomal,Visual,Insert mode
set scrolloff=12
set updatetime=10            " for signify plug
set nofsync
"syntax on

let g:cursorline_timeout = 10
" let &colorcolumn="78"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" normal key map
" Quick quit command && chunk jump
noremap <Leader>q :q<CR>
noremap <Leader>Q :qa!<CR>
noremap <Leader>w :w<CR>
noremap <Leader>W :wa<CR>
noremap <Leader>wq :wq<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Buffer key bind
noremap <leader>bp :bp<CR>
noremap <leader>bn :bn<CR>
noremap <leader>bd :bd<CR>

" Tab key bind
noremap <leader>tn :tabnext<CR>
noremap <leader>tp :tabprev<CR>

" no highlight search 
noremap <leader>nh :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto cmd
" jump to the last position when
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" auto highlight_current_word
"augroup highlight_current_word
"  au!
"  au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/'
"  setl updatetime=5
"augroup END

"autocmd FileType c ClangFormatAutoEnable

" started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rhysd/vim-clang-format
noremap <F3> :ClangFormat<CR>
let g:clang_format#command = "clang-format"
" let g:clang_format#code_style = "llvm"
let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "ColumnLimit" : 0,
            \ "SortIncludes": "false"}

let g:header_field_author = 'jni'
let g:header_field_author_email = 'jni@bouffalolab.com'
let g:header_auto_add_header = 0

" Leo-Ni88/vim-uncrustify
autocmd FileType c noremap <buffer> <c-f> :call Uncrustify('c')<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call RangeUncrustify('c')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"cscope
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lfv89/vim-interestingwords
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

nnoremap <silent> <leader>h :call InterestingWords('n')<cr>
vnoremap <silent> <leader>h :call InterestingWords('v')<cr>
nnoremap <silent> <leader>H :call UncolorAllWords()<cr>
nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

" auto-pair
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairsMapCR = 4
let g:AutoPairsMapSpace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" junegunn/fzf
noremap <leader>fz :Files<cr>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yggdroot/LeaderF
" don't show the help in normal mode
" let g:Lf_ShortcutF = '<C-P>'
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
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 0, 'File': 0, 'Buffer': 0, 'Mru': 0, 'Line': 0, 'Gtags': 1, 'Rg':1}
let g:Lf_PopupPreviewPosition = 'top'

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.repo']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_DefaultExternalTool='rg'
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_StlColorscheme = 'powerline'
" let g:Lf_CommandMap = {'<C-Up>': ['<C-n>']}
"let g:Lf_PopupWidth = 0.95
"let g:Lf_WindowHeight = 0.30

"let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <leader>f :LeaderfSelf<cr>
noremap <leader>f :LeaderfFile<cr>
noremap <leader>fc :LeaderfFunction<cr>
noremap <leader>fw :LeaderfWindow<cr>
" nmap <unique> <leader>fs <Plug>LeaderfGtagsSymbol
" nmap <unique> <leader>fg <Plug>LeaderfGtagsGrep

" LeaderF Rg config
let g:Lf_RgConfig = [
    \ "--max-columns=150",
    \ "--glob=!node_modules/*",
    \ "--glob=!dist/*",
    \ ]

"LeaderF rg map
nmap <unique> <leader>rg <Plug>LeaderfRgPrompt
nmap <unique> <leader>re <Plug>LeaderfRgCwordRegexNoBoundary
nmap <unique> <leader>rw <Plug>LeaderfRgCwordRegexBoundary
nmap <unique> <leader>rt <Plug>LeaderfRgCwordLiteralNoBoundary
nmap <unique> <leader>ry <Plug>LeaderfRgCwordLiteralBoundary

vmap <unique> <leader>re <Plug>LeaderfRgVisualRegexNoBoundary
vmap <unique> <leader>rw <Plug>LeaderfRgVisualRegexBoundary
vmap <unique> <leader>rt <Plug>LeaderfRgVisualLiteralNoBoundary
vmap <unique> <leader>ry <Plug>LeaderfRgVisualLiteralBoundary

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsGutentags = 1
let g:Lf_GtagsAutoUpdate = 1
let g:Lf_GtagsSource = 1
let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagslabel = 'native-pygments'

"LeaderF gtags
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ludovicchabant/vim-gutentags
"ctags auto load tags
set tags=./.tags;,.tags

" gutentags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root', '.svn', '.repo', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags, cscope 和 gtags 支持：
" 需手动去github下载ctags和gtags源码编译安装
let g:gutentags_modules = []
if executable('ctags')
" let g:gutentags_modules += ['ctags']
endif
if executable('cscope')
" let g:gutentags_modules += ['cscope']
endif
if executable('gtags-cscope') && executable('gtags')
let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags
" 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand(g:Lf_CacheDirectory.'/.LfCache/gtags')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

let g:gutentags_background_update = 0
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" open debug
" let g:gutentags_define_advanced_commands = 1

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags
" 不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neoclide/coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-f> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" this setting may cause err
" highlight HighlightedyankRegion guifg=#282828 guibg=#d79921 

autocmd FileType tex let b:coc_pairs = [["$", "$"]]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" easymotion/vim-easymotion
" 使用 ss 启用
nmap <leader>s <Plug>(easymotion-s2)
" JK motions: Line motions
" map <leader>j <Plug>(easymotion-j)
" map <leader>k <Plug>(easymotion-k)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mhinz/vim-startify
let g:startify_files_number = 15

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nvim-telescope/telescope.nvim
" Find files using Telescope command-line sugar.
" nnoremap <leader>tf <cmd>Telescope find_files<cr>
" nnoremap <leader>tg <cmd>Telescope live_grep<cr>
" nnoremap <leader>tb <cmd>Telescope buffers<cr>
" nnoremap <leader>th <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ma <cmd>lua require('telescope.builtin').help_tags()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  -- comment
  require('Comment').setup()

  -- nvim-treesitter
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    git = {
      ignore = 0
    },
    highlight = {
      enable = true,              -- false will disable the whole extension
      -- disable = { "c", "rust" },  -- list of language that will be disabled
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
  }

  -- nvim-cursorline
  require('nvim-cursorline').setup {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  }

  -- nvim-web-devicons
  require'nvim-web-devicons'.setup{}

  -- bufferline
  require('bufferline').setup {
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      numbers = "both", --"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon' -- 'icon' | 'underline' | 'none'
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc"
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number, buf_numbers)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
          return true
        end
        -- filter out by buffer name
        if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
          return true
        end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
          return true
        end
        -- filter out by it's index number in list (don't show first buffer)
        if buf_numbers[1] ~= buf_number then
          return true
        end
      end,
      offsets = {{filetype = "NvimTree", text = "File Explorer" , highlight = "Directory", text_align = "left"}},
      color_icons = true, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = false,
      show_tab_indicators = false,
      persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "slant", -- "slant" | "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      sort_by = 'id',
      -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        -- add custom logic
        -- return buffer_a.modified > buffer_b.modified
      -- end
    }
  }

  -- NvimTree
  -- empty setup using defaults: add your own options
  require'nvim-tree'.setup {
    open_on_setup_file = false,
    view = {
      adaptive_size = true,
      side = "left",
    },
    renderer = {
      highlight_git = false,
      highlight_opened_files = "name",
      symlink_destination = false,
    },
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    git = {
      enable = false,
      ignore = false,
      timeout = 400,
    },
    log = {
      enable = false,
      truncate = true,
      types = {
        all = true,
        profile = true,
        watcher = true,
      },
    },
  }

  -- ToggleTerm
  require("toggleterm").setup{
    direction = 'float',
    open_mapping = [[<leader>tt]],
    insert_mappings = false,
    terminal_mappings = true,
  }

  -- nvim-telescope/telescope.nvim
  require('telescope').setup{
    defaults = {
      layout_strategy = "horizontal", -- center/horizontal ..
      layout_config = {
          height = 0.90,
          width = 0.90,
          mirror = false,
          prompt_position = "bottom",
      },
    },
  }
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
