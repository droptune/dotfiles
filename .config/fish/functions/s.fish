function s --description 'load ssh-key and start tmux'
  ssh-add ~/.ssh/id_ed25519
  tmux -2 $argv
end
