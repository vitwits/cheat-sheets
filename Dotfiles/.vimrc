" ================================
" Minimal & Functional Vim Configuration
" ================================

" ----------------
" Basic settings
" ----------------
set nocompatible             " Disable Vi compatibility
set number                   " Show absolute line numbers
set cursorline               " Highlight current line

set expandtab                " Use spaces instead of tabs
set shiftwidth=4             " 4 spaces per indent
set softtabstop=4
set autoindent               " Copy indentation from previous line

syntax on                    " Enable syntax highlighting
set background=dark          " Use dark background colors

if has("termguicolors")
  set termguicolors          " Enable true color support
endif

" ----------------
" Colorscheme
" ----------------
" Use any built-in Vim theme. Examples below:
" desert, elflord, evening, morning, industry,
" koehler, murphy, pablo, peachpuff, ron, shine,
" slate, torte, zellner

colorscheme desert           " Default theme, change as you like

" ----------------
" Key mappings
" ----------------
let mapleader = " "
nnoremap <leader>/ :nohlsearch<CR>   " Clear search highlighting

" ----------------
" Additional tips / mini wiki
" ----------------
" How to switch colorscheme while Vim is running:
" :colorscheme desert
" :colorscheme elflord
" :colorscheme evening
" (use <Tab> to autocomplete available schemes)

" How to check available built-in colorschemes:
" :echo globpath(&rtp, "colors/*.vim")

" Useful commands:
" :syntax on/off          -> Enable/disable syntax highlighting
" :set number/nohlsearch  -> Show line numbers / Clear search
" :set cursorline         -> Highlight current line
" :set background=dark    -> Optimize colors for dark background
" :set expandtab          -> Use spaces instead of tabs
" :set shiftwidth=4       -> Set indent width
" :set softtabstop=4      -> Set tab width for editing

" Quick tips:
" - <leader>/ clears search highlights
" - Use built-in colorschemes for immediate color support
" - For more advanced themes (like Dracula) use vim-plug
