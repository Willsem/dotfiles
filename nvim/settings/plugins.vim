call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips', { 'for': 'tex' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-dadbod'
Plug 'bfrg/vim-cpp-modern'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Yggdroot/indentLine'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'omnisharp/omnisharp-roslyn'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
call plug#end()
