call plug#begin()
  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp' 

  " Snippets
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'BurntSushi/ripgrep'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'

  " treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " prettier & linting
  Plug 'sbdchd/neoformat'
  Plug 'dense-analysis/ale'  
  Plug 'editorconfig/editorconfig-vim'

  " colorscheme
  Plug 'marko-cerovac/material.nvim'
call plug#end()

" load lua
lua require("init")

" tabs keymap
nnoremap <S-w> :tabclose<cr>

" telescope keymap
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>b <cmd>Telescope file_browser<cr>

" ale config
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint']
\}

" timeoutlen
set timeout timeoutlen=3000 ttimeoutlen=100 

" custom maps
set pastetoggle=<F3>

" misc
set completeopt=menu,menuone,noselect

" theme
let g:material_style = "deep ocean"
colorscheme material
