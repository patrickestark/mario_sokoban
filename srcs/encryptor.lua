
require "global"

local encryptor = {}

encryptor.key = {52, 467, 2, 35, 64, 987}

function replace_char(pos, str, r)
    return str:sub(1, pos-1) .. r .. str:sub(pos+1)
end

function get_char(str, pos)
	return string.char(string.byte(str, pos))
end

encryptor.encrypt = function(str)
	
end
	