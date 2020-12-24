extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}
#include "TracyLua.hpp"

int luaopen_lua_tracy (lua_State *L);
int luaopen_lua_tracy (lua_State *L) {
    tracy::LuaRegister(L);
    return 0;
}
