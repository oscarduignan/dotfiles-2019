{ config, pkgs, ... }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;

  vimWhichKey = buildVimPlugin {
    name = "vim-which-key";
    src = builtins.fetchGit {
      url = "https://github.com/liuchengxu/vim-which-key.git";
      rev = "ccb656f30ccafc00cf633fa4b42540739f538356";
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

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
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
        # custom
        vimWhichKey
      ];
      customRC = ''
        set mouse=a
        colorscheme gruvbox
        let g:mapleader = "\<Space>"
        let g:maplocalleader = ','
        nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
        nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
      '';
    };
  };

  home.packages = with pkgs; [
    zim
    encfs
    fzf
  ];
}
