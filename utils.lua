function parse_str_to_table(input, separator)
	local t = {}

	if separator == nil then
		separator = "%s"
	end

	for str in string.gmatch(input, "([^"..separator.."]+)") do
		table.insert(t, str)
	end

	return t
end

function print_debug(variable, text)
	print("[DEBUG]: " .. variable .. ": " .. text)
end

function is_dir(path)
	return exists(path.."/")
end

function exists(file)
	local ok, err, code = os.rename(file, file)

	if not ok then
	   if code == 13 then
		  return true
	   end
	end

	return ok, err
 end