function fe --description 'find and edit file'
	fd --follow --hidden --glob --type f "$argv" --exec-batch nvim -p
end
