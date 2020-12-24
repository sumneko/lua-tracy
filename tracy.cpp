extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}
#include "TracyLua.hpp"

int luaopen_tracy (lua_State *L);
int luaopen_tracy (lua_State *L) {
    tracy::LuaRegister(L);
    return 0;
}
