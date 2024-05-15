require 'constants'
require 'utils'

local separators = -1

function main()
    local csv_file, err = io.open(FOLDER_NAME .. arg[1] .. "/" .. arg[2] .. ".csv","r")
    if csv_file == nil then
        print(err)
    else
        local line = csv_file:read("*line")
        local t = parse_str_to_table(line,';')
        separators = #t
    end


end


main()

print("hi")
print(arg[1])
print(NEW_CONST)