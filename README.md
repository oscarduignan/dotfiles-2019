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
