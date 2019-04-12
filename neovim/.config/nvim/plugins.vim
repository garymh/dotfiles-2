" Plugin installation
if empty(glob('~/.local/share/nvim/site/autoload/plugpac.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plugpac.vim --create-dirs
		\ https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim
  au VimEnter * PackInstall
source ~/.config/nvim/init.vim
endif

call plugpac#begin()

" minpac
Pack 'k-takata/minpac', {'type': 'opt'}

" Moonscript
" Pack 'svermeulen/nvim-moonmaker'

" Tweaks
Pack 'vim-scripts/LargeFile'

" Split resizing
" Pack 'roman/golden-ratio'

" QuickFix help
Pack 'romainl/vim-qf'

" Mappings
Pack 'liuchengxu/vim-which-key'

" Registers
Pack 'junegunn/vim-peekaboo'

" Marks
Pack 'kshenoy/vim-signature'

" Buffer management
Pack 'mhinz/vim-sayonara', {'on': 'Sayonara'}

" Startup screen
Pack 'mhinz/vim-startify'

" Status line
Pack 'itchyny/lightline.vim'
Pack 'maximbaz/lightline-ale'

" System utilities
" Pack 'tpope/vim-eunuch'

" Movement
Pack 'chaoren/vim-wordmotion'
Pack 'tpope/vim-repeat'
Pack 'justinmk/vim-sneak'
" Pack 'tpope/vim-unimpaired'

" Tmux and vim split navigation
Pack 'christoomey/vim-tmux-navigator'

" Indentation tracking
Pack 'yggdroot/indentLine'

" Comments
Pack 'tomtom/tcomment_vim'

" Wrapping/delimiters
Pack 'machakann/vim-sandwich'
Pack 'luochen1990/rainbow'
" Pack 'itchyny/vim-parenmatch'
" Pack 'djdt/vim-matchparenalways'
Pack 'andymass/vim-matchup'
Pack 'rstacruz/vim-closer'
Pack 'tpope/vim-endwise'
Pack 'machakann/vim-swap'

" Search
Pack 'romainl/vim-cool'

" Yank highlighting
Pack 'machakann/vim-highlightedyank'

" Prettification
Pack 'junegunn/vim-easy-align'
Pack 'sbdchd/neoformat', {'on': 'Neoformat'}

" Text objects
Pack 'wellle/targets.vim'

" Tags
" Pack 'ludovicchabant/vim-gutentags'

" FZF
" Pack 'junegunn/fzf'
Pack 'junegunn/fzf.vim'
Pack 'fszymanski/fzf-gitignore', {'on': 'FzfGitignore'}
Pack 'justinhoward/fzf-neoyank', {'on': 'FZFNeoyank'}
Pack 'Shougo/neoyank.vim'

" Special symbols
Pack 'chrisbra/unicode.vim', {'on': 'UnicodeSearch'}

" Project Management/Sessions
" Pack 'airblade/vim-rooter'
Pack 'tpope/vim-obsession', {'on': 'Prosession'}
Pack 'dhruvasagar/vim-prosession', {'on': 'Prosession'}

" REPL
" Pack 'Vigemus/iron.nvim'

" Jupyter
" Pack 'vyzyv/vimpyter'

" Undo tree
Pack 'simnalamburt/vim-mundo', {'on': ['MundoShow', 'MundoToggle']}

" File explorer
Pack 'cocopon/vaffle.vim'

" Git
Pack 'mhinz/vim-signify'
Pack 'tpope/vim-fugitive', {'on': ['Gstatus', 'Gpush', 'Gpull', 'Gdiff']}
Pack 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
Pack 'itchyny/vim-gitbranch'

" Completion
Pack 'Shougo/echodoc.vim'
Pack 'jsfaint/coc-neoinclude'
Pack 'neoclide/coc-sources'
Pack 'neoclide/coc.nvim', {'do': {-> system('yarn install')}}
Pack 'Shougo/neco-syntax'
Pack 'Shougo/neoinclude.vim'

" Snippets
Pack 'Shougo/neosnippet.vim'
Pack 'Shougo/neosnippet-snippets'

" Checkers
Pack 'w0rp/ale'

" Async building & commands
" Pack 'wbthomason/buildit.nvim'
Pack 'tpope/vim-dispatch'
Pack 'radenling/vim-dispatch-neovim'

" Language multipack
Pack 'sheerun/vim-polyglot'

" Path changing
Pack 'tpope/vim-apathy'

" C/C++/Python debugging
Pack 'sakhnik/nvim-gdb', {'do': {-> system('./install.sh')}, 'on': ['GdbStart', 'GdbStartLLDB', 'GdbStartPDB']}

" Clojure/Lisps/Scheme
Pack 'guns/vim-sexp', {'for': ['clojure', 'lisp', 'scheme', 'racket', 'jbuild']}
Pack 'tpope/vim-sexp-mappings-for-regular-people', {'for': ['clojure', 'lisp', 'scheme', 'racket', 'jbuild']}
Pack 'vim-scripts/scribble.vim'
Pack 'kovisoft/slimv', {'for': ['clojure', 'scheme', 'racket']}
Pack 'l04m33/vlime', {'rtp': 'vim/', 'for': 'lisp'}

" Pandoc/Markdown
Pack 'vim-pandoc/vim-pandoc'
Pack 'vim-pandoc/vim-pandoc-syntax'
Pack 'vim-pandoc/vim-pandoc-after'

" Org-mode
Pack 'vim-scripts/utl.vim', {'for': 'org'}
Pack 'itchyny/calendar.vim', {'for': 'org'}
Pack 'tpope/vim-speeddating', {'for': 'org'}
Pack 'chrisbra/NrrwRgn', {'for': 'org'}
Pack 'inkarkat/vim-SyntaxRange', {'for': 'org'}
Pack 'jceb/vim-orgmode'
Pack 'wbthomason/capture.vim'
" Pack '/home/wil/projects/personal/orgmode.nvim'

" Vimscript
Pack 'Shougo/neco-vim'
Pack 'neoclide/coc-neco'

" LaTeX
Pack 'lervag/vimtex'

" Meson
Pack 'stfl/meson.vim'
Pack 'igankevich/mesonic'

" PDDL
Pack 'PontusPersson/pddl.vim'

" Coq
Pack 'jvoorhis/coq.vim'

" Pretty pretty symbols
" Pack 'calebsmith/vim-lambdify'

" Profiling
Pack 'tweekmonster/startuptime.vim'

" Color scheme
Pack 'wbthomason/vim-nazgul'
" Pack 'chriskempson/base16-vim'

call plugpac#end()
