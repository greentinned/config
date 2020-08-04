call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-commentary'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dart-lang/dart-vim-plugin'
Plug 'mhinz/vim-startify'
Plug 'jreybert/vimagit'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'greentinned/vim-code-dark'
call plug#end()

" STANDARD SETUP:
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autowrite
set nobackup
set noshowmode
set encoding=UTF-8
set mouse=a

" Netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle= 3

" Colorscheme
color codedark

"set termguicolors
"set t_Co=256

" Mouse
set mouse=a

" Turn on numbers
" set number

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Clear signcolumn bg
highlight clear SignColumn

" COMMON KEYS:
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>vr :sp $MYVIMRC<CR>
nnoremap <CR> :nohl<CR><CR>
:imap jj <Esc>

" AIRLINE:
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='dracula'
let g:airline_section_y = ''
let g:airline_section_z = ''

" DIRVISH:
hi DirvishGitModified guifg=NONE ctermbg=NONE
hi DirvishGitStaged guifg=NONE ctermbg=NONE
hi DirvishGitRenamed guifg=NONE ctermbg=NONE
hi DirvishGitUnmerged guifg=NONE ctermbg=NONE
hi DirvishGitIgnored guifg=NONE ctermbg=NONE
hi DirvishGitUntracked guifg=NONE ctermbg=NONE

let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish silent keeppatterns g@\v/\.[^\/]+/?$@d _

let g:dirvish_git_indicators = {
    \ 'Modified'  : 'M',
    \ 'Staged'    : 'S',
    \ 'Untracked' : 'U',
    \ 'Renamed'   : 'R',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : 'I',
    \ 'Unknown'   : '?'
\ }

" ASYNCOMPLETE:
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" VIMLSP:
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_virtual_text_enabled = 0

" Diagnostics gutter signs
let g:lsp_signs_error = {'text': '>>'}
let g:lsp_signs_information = {'text': '>>'}
let g:lsp_signs_warning = {'text': '>>'}
let g:lsp_signs_hint = {'text': '>>'}

" Diagnostics colors
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
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
