local lm = require 'luamake'
lm.arch = 'x64'

lm:shared_library 'lua54' {
    rootdir = '3rd/lua',
    sources = {
        "*.c",
        "!lua.c",
        "!luac.c",
        "!testes/libs/*.c",
        "!onelua.c",
    },
    defines = {
        "LUA_BUILD_AS_DLL",
    }
}

lm:shared_library 'lua-tracy' {
    deps = "lua54",
    includes = {
        '3rd/lua',
        '3rd/tracy',
        '.',
    },
    sources = {
        'tracy.cpp',
        '3rd/tracy/common/*.cpp',
        '3rd/tracy/client/*.cpp',
    },
    links = {
        'dbghelp',
    },
    ldflags = '/EXPORT:luaopen_tracy'
}
