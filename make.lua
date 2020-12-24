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

lm:shared_library 'luatracy' {
    deps = "lua54",
    includes = {
        '3rd/lua',
        '3rd/tracy',
        '.',
    },
    sources = {
        'luatracy.cpp',
        '3rd/tracy/tracyClient.cpp',
    },
    links = {
        'dbghelp',
        'Advapi32',
        'User32',
    },
    defines = {
        'TRACY_ENABLE',
    },
    ldflags = '/EXPORT:luaopen_luatracy'
}
