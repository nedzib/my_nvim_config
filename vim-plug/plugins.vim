" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Gruvbox theme
    Plug 'morhetz/gruvbox'   
    Plug 'godlygeek/csapprox'

  	Plug 'powerline/powerline'    

    Plug 'easymotion/vim-easymotion'
    Plug 'christoomey/vim-tmux-navigator'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'mhartington/oceanic-next'
    
    " Ned plugins
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-rails'
    Plug 'voldikss/vim-floaterm'
    Plug 'frazrepo/vim-rainbow'

call plug#end()
