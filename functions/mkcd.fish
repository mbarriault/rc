function mkcd --description "Make and change into directory"
    mkdir -p "$argv"
    cd "$argv"
end
