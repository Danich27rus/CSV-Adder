require 'constants'
require 'utils'
require 'debug'

local separators = -1

function main()
    local ok = is_dir(FOLDER_NAME)
    if DEBUG then
        --ok is the first variable on current stack of this scope
        local name, value = debug.getlocal(1, 1)
        print_debug(name, tostring(ok))
    end
    if ok == nil then
        io.write("Folder dosen't exists\n")
        return
    end

    if arg[2] == nil and arg[1] == nil then
        io.write("Pharmacy is nil in arg[1] and file is not supplied in arg[2]\n")
        return
    end

    if arg[2] == nil then
        io.write("Pharmacy is nil in arg[1]\n")
        arg[2] = arg[1]
        arg[1] = ""
    end

    local csv_file, err = io.open(FOLDER_NAME .. arg[1] .. "/" .. arg[2] .. ".csv","r")
    if csv_file == nil then
        print(err)
    else
        local line = csv_file:read("*line")
        separators = #parse_str_to_table(line, SEPARATOR)
    end
    io.close(csv_file)

    if DEBUG then
        --separators on second level of stack because it's out of scope
        local name, value = debug.getlocal(2, 1)
        print_debug(name, separators)
    end
    if err ~= nil then
        return
    end
    if separators < 2 then
        io.write("File dosen't contain separator '" .. SEPARATOR .. "'.\nMaybe it's not in MS-DOS format?\n")
    end

    csv_file = io.open(FOLDER_NAME .. arg[1] .. "/" .. arg[2] .. ".csv","rb")
    if csv_file == nil then
        return
    end

    local lines = parse_str_to_table(csv_file:read("a"),"\n")
    for _, v in pairs(lines) do
        print(v)
    end
    --io.output("Tried to read file, file" .. arg[1] .. "was found\n")
    --io.output("Write file name that will be complemented: ")
    --local filename = io.read()
    
end


main()

print("hi")
print(arg[1])
print(NEW_CONST)