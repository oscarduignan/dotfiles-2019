{ config, pkgs, ... }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;

  vim-which-key = buildVimPlugin {
    name = "vim-which-key";
    src = builtins.fetchGit {
      url = "https://github.com/liuchengxu/vim-which-key.git";
      rev = "ccb656f30ccafc00cf633fa4b42540739f538356";
    };
    dependencies = [];
  };

  notational-fzf-vim = buildVimPlugin {
    name = "notational-fzf-vim";
    src = builtins.fetchGit {
      url = "https://github.com/oscarduignan/notational-fzf-vim.git";
      ref = "patch-1";
      rev = "ef25865a7d4beb4d08812bcfbd77714e8fb08e25";
    };
    dependencies = [];
  };

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Oscar Duignan";
    userEmail = "oscar@mutualism.co.uk";
  };

  home.packages = with pkgs; [
    zim
    encfs
    fzf
    ripgrep
    python3
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    configure = {
      plug.plugins = with pkgs.vimPlugins; [
        fzfWrapper
	fzf-vim
	vim-airline
	vim-gitgutter
	vim-elixir
	vim-javascript
	vim-nix
	nerdtree
	nerdtree-git-plugin
	gruvbox
        fugitive
        # custom
        notational-fzf-vim
        vim-which-key
      ];
      customRC = ''
        set mouse=a
        colorscheme gruvbox

        set timeoutlen=0
        let g:mapleader = "\<Space>"
        let g:maplocalleader = ','
        nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
        nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

        let g:nv_search_paths = ['~/Notebooks', './docs']

        let g:which_key_map = {}

        let g:which_key_map.a = { 'name': '+apps' }

        let g:which_key_map.a.n = ['NV', 'notational-fzf']
        nnoremap <leader>an :NV<CR>

        let g:which_key_map.p = { 'name': '+project' }

        nnoremap <leader>pt :Gcd<CR>:NERDTree<CR>
        let g:which_key_map.p.t = ['Gcd | NERDTree', 'tree']

        nnoremap <leader>pT :Gcd<CR>:NERDTreeFind<CR>
        let g:which_key_map.p.T = ['Gcd | NERDTreeFind', 'tree-find']

        nnoremap - :NERDTreeFind<CR>

        nnoremap <Enter> za
        nnoremap <S-Enter> zO
        nnoremap <C-Enter> zC
      '';
    };
  };
}
