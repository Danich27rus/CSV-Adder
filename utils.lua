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