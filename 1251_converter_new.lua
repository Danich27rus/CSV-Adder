function string.fromutf8(utf8str)
    local pos, result_1252 = 1, {}
    while pos <= #utf8str do
       local code, size = utf8_to_unicode(utf8str, pos)
       pos = pos + size
       code = code < 128 and code or map_unicode_to_1252[code] or ('?'):byte()
       table_insert(result_1252, char(code))
    end
    return table_concat(result_1252)
 end
 
 function string.toutf8(str1252)
    local result_utf8 = {}
    for pos = 1, #str1252 do
       local code = str1252:byte(pos)
       print("Code:" .. code)
       table_insert(result_utf8, unicode_to_utf8(map_1252_to_unicode[code] or code))
    end
    return table_concat(result_utf8)
 end