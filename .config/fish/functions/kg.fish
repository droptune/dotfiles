function kg --wraps='kubectl get' --description 'alias kubectl get'
  kubectl get $argv
        
end
