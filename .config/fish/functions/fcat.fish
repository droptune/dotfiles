function fcat --description 'find and cat file'
	fd --follow --hidden --glob --type f "$argv" --exec-batch bat
end
