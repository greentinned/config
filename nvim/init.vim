" PLUG:
call plug#begin('~/.config/nvim/plugged/')
" Colors
Plug 'greentinned/vim-code-dark'
Plug 'axvr/photon.vim'
" Syntax
Plug 'dart-lang/dart-vim-plugin'
Plug 'tikhomirov/vim-glsl'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'JuliaEditorSupport/julia-vim'
" Lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Other
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'justinmk/vim-dirvish'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-surround'
Plug 'jpalardy/vim-slime'
" Music
Plug 'tidalcycles/vim-tidal'
call plug#end()

" BASE:
" set number
" set relativenumber
set mouse=a
set background=dark
set t_Co=256
set t_ut=
colorscheme codedark
" colorscheme photon
set tabstop=2     		        " Size of a hard tabstop (ts).
set shiftwidth=2  		        " Size of an indentation (sw).
set expandtab     		        " Always uses spaces instead of tab characters (et).
set softtabstop=0 		        " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent    		        " Copy indent from current line when starting a new line.
set smarttab
set updatetime=300 		        " Delay before show floating window
set hidden 			              " No confirm when change buffer
set nobackup 			            " Some servers have issues with backup files, see #649
set nowritebackup
set shortmess+=c 		          " Don't give |ins-completion-menu| messages.  
set nocompatible
set hlsearch
filetype plugin on
set signcolumn=yes
hi clear SignColumn

" KEYS:
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>vr :sp $MYVIMRC<CR>
nnoremap <CR> :nohlsearch<CR><CR>
" Better tabbing
vnoremap < <gv
vnoremap > >gv

" STATUSLINE:
hi StatusLine ctermbg=236
hi StatusLineTerm ctermbg=8 ctermfg=black
hi StatusLineTermNC ctermbg=236 ctermfg=8
set statusline=
set statusline+=\                             " blank space
" set statusline+=%#Pmenu#
set statusline+=%{expand('%:p:h:t')}/%t       " current file path
set statusline+=\                             " blank space
set statusline+=%m                            " modified flag [+]
" set statusline+=%#LineNr#
set statusline+=\                             " blank space
set statusline+=%=                            " right-align from now on
set statusline+=\                             " blank space
set statusline+=%{&filetype}                  " filetype
"set statusline+=%{StatusDiagnostic()}        " Syntastic error flag
set statusline+=\                             " blank space

" CURSOR:
set cursorline

" FILE TYPES:
autocmd Filetype help nnoremap <buffer> q :q<CR>
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType netrw setlocal bufhidden=delete

" FINDING FILES:
" Find files and opened buffers:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - :b lets you autocomplete any opened buffer
set path+=**         " Search down into subfolders
set wildmenu         " Display all matching files when we tab complete

" FILE BROWSING:
let g:netrw_banner = 0        " disable banner
let g:netrw_liststyle = 3     " tree view
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" COLORSCHEME FIX:
" hi CocWarningSign ctermfg=yellow
" hi Warning ctermfg=Red

" " COC:
" let g:coc_node_path = '/Users/skorotkov/.nvm/versions/node/v13.1.0/bin/node'

" " Trigger completion
" inoremap <silent><expr> <c-n> coc#refresh()
" "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" " Keys
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" nmap <silent> <leader>t <Plug>(coc-terminal-toggle)
" nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" VIMLSP:
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 0

" Diagnostics gutter signs
let g:lsp_signs_error = {'text': '>>'}
let g:lsp_signs_information = {'text': '>>'}
let g:lsp_signs_warning = {'text': '>>'}
let g:lsp_signs_hint = {'text': '>>'}

" Diagnostics colors
highlight LspErrorText cterm=underline ctermfg=red
highlight LspErrorHighlight cterm=underline ctermfg=red
highlight LspWarningText cterm=underline ctermfg=yellow
highlight LspWarningHighlight cterm=underline ctermfg=yellow
highlight LspInformationText cterm=underline ctermfg=blue
highlight LspInformationHighlight cterm=underline ctermfg=blue
highlight LspHintText cterm=underline ctermfg=green
highlight LspHintHighlight cterm=underline ctermfg=green

" Keys and some other bindnings
function! s:on_lsp_buffer_enabled() abort
    autocmd BufWritePre * silent LspDocumentFormatSync
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>aw <plug>(lsp-code-action)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" RAINBOW:
let g:rainbow_active = 1

" DIRVISH:
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _

" COMMENTARY:
autocmd FileType tidal setlocal commentstring=--\ %s

" VIMSLIME:
" let g:slime_target = "tmux"
let g:slime_target = "neovim"

