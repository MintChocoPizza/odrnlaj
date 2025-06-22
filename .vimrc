if has("syntax")
  syntax on
endif

"""""""""""""""""""""""
"       GENERAL       "
"""""""""""""""""""""""
set encoding=UTF-8
set noswapfile
set mouse+=a
"set mouse=

"""""""""""""""""""""""
"       Plug          "
"""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"set rtp+=~/.vim/bundle/Vundle.vim


call plug#begin()
"Plug 'bluz71/vim-nightfly-guicolors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

"""""""""""""""""""""""
"    VIM Interface    "
"""""""""""""""""""""""
set ruler
set autoread
set backspace=eol,start,indent
set nu
set relativenumber
set hls
set ignorecase
let g:netrw_winsize=22
let g:netrw_liststyle=3
let g:netrw_banner=0
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

"""""""""""""""""""""""
"     Cursor          "
"""""""""""""""""""""""
if &term =~ "xterm" || &term =~ "kitty" || &term =~ "alacritty" || &term =~ "tmux"
    let &t_SI = "\e[6 q"   " Insert 모드: 세로 막대 커서
    let &t_EI = "\e[2 q"   " Normal 모드: 블록 커서
    let &t_SR = "\e[4 q"   " Replace 모드: 밑줄 커서
endif

"""""""""""""""""""""""
"     Color Theme     "
"""""""""""""""""""""""
set termguicolors
set t_Co=256
"colorscheme nightfly
"colo slate

"""""""""""""""""""""""
"    Tab and Indent   "
"""""""""""""""""""""""
set autoindent
set cindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"""""""""""""""""""""""
"     Key Setting     "
"""""""""""""""""""""""
set noesckeys
let mapleader=","
inoremap <leader>j <C-n>
inoremap <leader>k <C-p>
"nnoremap <leader>w :w<CR>
"nnoremap <leader>q :q<CR>
nnoremap <leader>nh :nohl<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprevious<CR>

"""""""""""""""""""""""
"     Tmux Keyset     "
"""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1
noremap <silent><S-h> :<C-U>TmuxNavigateLeft<CR>
noremap <silent><S-j> :<C-U>TmuxNavigateDown<CR>
noremap <silent><S-k> :<C-U>TmuxNavigateUp<CR>
noremap <silent><S-l> :<C-U>TmuxNavigateRight<CR>

"""""""""""""""""""""""
"    NERDTree         "
"""""""""""""""""""""""
let NERDTreeWinPos = "left"
nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>


"""""""""""""""""""""""
"       CtrlP         "
"""""""""""""""""""""""
set wildignore+=*/node_modules/*,*/tmp/*,*/build/*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'


"""""""""""""""""""""""
"     Vim-airline     "
"""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

"""""""""""""""""""""""
"       gruvbos       "
"""""""""""""""""""""""
set background=dark
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1
:colorscheme gruvbox 


"""""""""""""""""""""""
"       YCM           "
"""""""""""""""""""""""
" 예: <C-Space>로 YCM 완성 호출 (Ctrl + Space)
"inoremap <silent><expr> <S-Space> youcompleteme#Complete()


"""""""""""""""""""""""
"       ctags         "
"       사용 안함     "
"""""""""""""""""""""""
"set tags+=./tags,tags
"noremap <C-[> <Esc>:po<CR>


"""""""""""""""""""""""
"     gutentags       "
"""""""""""""""""""""""
let g:gutentags_enabled = 1
let g:gutentags_project_root = ['.git', '.hg', '.svn']
let g:gutentags_ctags_extra_args = ['--fields=+l', '--extras=+q']


"""""""""""""""""""""""
"       tagbar        "
"""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""
"      coc.nvim       "
"""""""""""""""""""""""
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <leader><Space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)
nmap <silent><nowait> gD <Plug>(coc-declaration)

" Use K to show documentation in preview window
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider''hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K''in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText guibg=red guifg=NONE gui=bold

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

 " Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold'<f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand''editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vimvim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"autocmd BufWrite *.c,*.cpp,*.h :silent! call CocAction('format')
"autocmd BufWritePre *.c,*.cpp,*.h :call CocAction('format')



