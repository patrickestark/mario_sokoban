
function copyTable(tab)
	local copy
	if type(tab) == 'table' then
		copy = {}
		for k, v in pairs(tab) do
			copy[k] = v
		end
	else
		copy = tab
	end
	return copy
end

function new_matrix(w, h, val)
	mx = {}
	for i = 1, h do
		mx[i] = {}
		for j = 1, w do
			mx[i][j] = copyTable(val)
		end
	end
	return mx
end
