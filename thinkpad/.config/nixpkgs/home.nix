{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = "Oscar Duignan";
    userEmail = "oscar@mutualism.co.uk";
  };

  programs.neovim = {
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
      ];
      customRC = ''
        set mouse=a
        colorscheme gruvbox
      '';
    };
  };

  home.packages = with pkgs; [
    zim
    encfs
  ];
}
