# Dotfiles 2019

Using these on my thinkpad which is running nixos, so setup is basically

```
nix-env -i git stow
git clone https://github.com/oscarduignan/dotfiles-2019.git ~/.dotfiles
cd ~/.dotfiles
stow thinkpad
```

And symlinks will be created in your home directory :thumbsup:

I have gone with a context based catch-all rather than having separate folders for separate apps for now because I'm only using this on a single system.

I would like to look at using https://github.com/rycee/home-manager to help me manage things

And I also need to version /etc/nixos here too at some point, which might need me to rejig the folder layout a bit

## TODO

Not all of these are just to do with dotfiles, but in more general managing config of my whole system / dev processes

- [ ] version /etx/nixos
- [ ] think about how nix overlays should be managed, feels like I should make a choice between system vs user level
- [ ] look at home-manager
- [ ] grab my overlays for things like vim from other laptop
- [ ] think about how I can maintain project templates
- [ ] add a .dotfiles/shell.nix and update the install instructions to avoid `nix-env -i` and to just start a shell with git and checkout .dotfiles then load up dotfiles
- [ ] get .direnv stuff setup
- [ ] look into whether I can effectively use intellij stuff on the thinkpad
