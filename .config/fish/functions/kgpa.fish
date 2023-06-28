function kgpa --wraps='kubectl get pods -A' --description 'alias kgpa kubectl get pods -A'
  kubectl get pods -A $argv
        
end
