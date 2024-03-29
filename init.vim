"██╗███╗░░██╗██╗████████╗░░░██╗░░░██╗██╗███╗░░░███╗
"██║████╗░██║██║╚══██╔══╝░░░██║░░░██║██║████╗░████║
"██║██╔██╗██║██║░░░██║░░░░░░╚██╗░██╔╝██║██╔████╔██║
"██║██║╚████║██║░░░██║░░░░░░░╚████╔╝░██║██║╚██╔╝██║
"██║██║░╚███║██║░░░██║░░░██╗░░╚██╔╝░░██║██║░╚═╝░██║ 
"╚═╝╚═╝░░╚══╝╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
"by Abel Paz 
set title   " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a " Permite la integración del mouse (seleccionar texto, mover el cursor)
set encoding=UTF-8
" Tamaño por defecto del terminal
""set termwinsize=10x0
set clipboard=unnamedplus "copiar en el portapapeles

set relativenumber    "Numero de saltos
set cursorline        "Resalta la línea actual
set cuc cul           "Resalta la fila y la columna
"set cursorline       "Resalta la línea actual
set list listchars=tab:>\ ,trail:+,eol:$  "Configuración Parrot
syntax on
set tabstop=5         "numero de espacios visuales por tab
set shiftwidth=5      "numero de espacios tabulados
set softtabstop=5     "numero de espacios en el atabulador al editar
set shiftround 
set expandtab             "los tabuladores son espacios
set hidden                "el archivo no se muestra si noy un archivo para este buffer
set smartcase             "No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en_us,es    " Corregir palabras usando diccionarios en inglés y español
set termguicolors         "Activa colors en la terminal
set splitbelow            "el siguiete buffer se cree abajo (ejem cmd)
set hlsearch              "resalta la busqueda
set incsearch             "resalta la busqueda
set nobackup              "evita recuperar el archivo
set nowritebackup
set cmdheight=2           "numero de lineas de pantalla a utilizar
set updatetime=200        "el archivo de intercambio se guarda en 2s default 4s
set shortmess+=c          "ayuda a evitar todos los mensajes hit-enter (mensajes de ayuda)




" Required:
call plug#begin('~/.config/nvim/plugged')
"Plugged"
"source $HOME/AppData/Local/nvim/plugins/plug-config.vim
"
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"Them"
Plug 'morhetz/gruvbox'

"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'nvim-treesitter/nvim-treesitter' "java neovim >=0.5
Plug 'scrooloose/nerdtree' "Presioando n se despliega options
Plug 'tpope/vim-surround'  
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'

"Live Server"
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'Shougo/echodoc.vim' "Muestra la firma de la función.

Plug 'w0rp/ale'         "Analizador estático de codigo

Plug 'sheerun/vim-polyglot' "Resaltado de sintaxix polyglot

Plug 'ryanoasis/vim-devicons' "Mostrar icons



Plug 'ianks/vim-tsx'

"Functionality
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim'

let g:coc_global_extensions=['coc-json' , 'coc-tsserver' , 'coc-emmet' , 'coc-tslint' , 'coc-prettier','coc-omnisharp']

Plug 'neoclide/coc.nvim'

call plug#end()

let g:coc_global_extensions=['coc-json' , 'coc-tsserver' , 'coc-emmet' , 'coc-tslint' , 'coc-prettier', 'coc-html']


"tecla maestra o lider
let mapleader= ','


""------------------------------------------------------------"

" -------------------------Customise-----------------------"
nmap <leader>rg :Rg<CR>

"------------------------------------------------------------"

" -------------------------Global-----------------------"
let g:NERDTreeChDirMode = 2  " Cambia el directocrio actual al nodo padre actual

" Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#enabled = 1
" Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#fnamemod = ':t'
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
" No mostrar el modo actual (ya lo muestra la barra de estado)
set noshowmode

" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Abrir/cerrar NERDTree con t
let g:NERDTreeChDirMode = 2 " Cambiar el directorio actual al padre del nodo actual
map <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction



" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" Invertir direccion de navegacion (de arriba a abajo)
let g:SuperTabDefaultCompletionType = '<c-n>'

" No mostrar el modo actual (echodoc hace uso de este espacio)
set noshowmode
" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1


" Mostrar mejor mensajes de error
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


" Ignorar archivos en .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Guardar con <líder> + s
nnoremap <leader>w :w<CR>
" Guardar Y Salir
nnoremap <leader>1w :wq<CR>
" Salir sin guardar
nnoremap <leader>2w :exit!<CR>

" Abrir el archivo init.vim con <líder> + e
nnoremap <leader>e :e $MYVIMRC<CR>



" Moverse al buffer siguiente con <líder> + l
nnoremap <c-m> :bnext<CR>
" Moverse al buffer anterior con <líder> + j
nnoremap <c-n> :bprevious<CR>
" Cerrar el buffer actual con <líder> + q
nnoremap <leader>q :bdelete!<CR>

"----------------------EASY MOTION---------------------------"
"easymotion
nmap <leader>3 <Plug>(easymotion-s2)
noremap <up> <nop>
noremap <down> <nop>

let g:EasyMotion_smartcase = 1

"------------------------------------------------------------"

"-------------------------VIM DEVICONS-----------------------"
" Vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:webdevicons_enable_nerdtree = 1



"------------------------------------------------------------"

"-------------------------NERDTree-----------------------"
let g:NERDTreeChDirMode = 2  " Cambia el directocrio actual al nodo padre actual
" Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#enabled = 1
" Mostrar sólo el nombre del archivo
let g:airline#extensions#tabline#fnamemod = ':t'
" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1
" No mostrar el modo actual (ya lo muestra la barra de estado)
set noshowmode

"------------------------------------------------------------"

"-------------------------FZF-----------------------"
"Configuration of FZF cotrl + p
let g:fzf_preview_window = 'right:40%'
nnoremap <c-p> :Files<CR>
nnoremap <c-g> :GitFiles<CR>
" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

"------------------------------------------------------------"

"-------------------------IDENT LINE-----------------------"
"Se ha eliminado este plug
let g:airline#extensions#tabline#enabled = 1  " show open buffers (like tabs)
let g:airline#extensions#tabline#fnamemod = ':t'  " Show only filename
let g:airline_powerline_fonts = 1 " Change separetors to be triangles
let g:airline_theme='tomorrow'

"------------------------------------------------------------"

"-------------------------GIT-----------------------"

noremap <Leader>ga :Gwrite<CR>
noremap <leader>.  :Git<space>add<space>.<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gp :Gpush<CR>"gsh"
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"------------------------------------------------------------"

"-------------------------SIGNIFY-----------------------"
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" If you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

"*********************************************************************************
" Configure terminal
"
" Abrir terminal
map <F2> :split <CR>:ter<CR>:resize 15<CR>
"Controlar el Modo lectura con ESC en la terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

"Hailitar teclas de navegacion
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"Redimencionado de las ventanas aviertas
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"quitar la navgacion / (precionar / + esc)
nnoremap / /a<DEL>

" Autocompletar parentesis y llaves
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
" inoremap { <CR>{<CR>}<Esc>0
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"*********************************************************************************


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"------------------------------------------------------------"

" -------------------------gruvbox dark-----------------------"
colorscheme gruvbox
let g:gruvbox_contrast = 'medium'
let g:gruvbox_italic = '0'

"------------------------------------------------------------"
"
"Configuration coc 
nnoremap <C-u> :CocAction<C-R>

"Live server"

let g:bracey_refresh_on_save=1
let g:bracey_auto_start_browser=0
let g:bracey_browser_command='brave'
let g:bracey_server_port=5050

"Prettier
""nmap <leader>f <Plug>:CocCommand prettier.formatFile<Plug>
"El codigo de formatea cada ver que lo guardes
command! -nargs=0 Prettier :call CocAction('runCommand','prettier.formatFile')


autocmd FileType html,css,javascript map <leader>s :Bracey<CR>
autocmd FileType html,css,javascript map <leader>st :BraceyStop<CR>
autocmd FileType html,css,javascript map <leader>re :BraceyReload<CR>
"http://127.0.0.1:5050"



"map <F5> 0//hola<Esc> 
""map <F5> 0gewi{<Esc>nuevo}<Esc>
map <F5> 0i//
map <F6> 0$i<!-- --<Esc>04li
map <F7> 0i/*<Esc>$a  */<Esc>
