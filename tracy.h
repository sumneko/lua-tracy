#define TRACY_ENABLE
#include "TracyLua.hpp"

int luaopen_tracy (lua_State *L);
int luaopen_tracy (lua_State *L) {
    tracy::LuaRegister(L);
    return 0;
}
