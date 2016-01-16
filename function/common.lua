function file_exists(filename)
    local f,err = io.open(filename,"r+")
    if f then
       f:close()
       return true
    end
    return false
end
