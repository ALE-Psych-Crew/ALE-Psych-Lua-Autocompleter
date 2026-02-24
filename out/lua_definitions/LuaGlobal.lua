--- @param tag string
function add(tag) end

--- @param tag string
--- @param destroy boolean?
function remove(tag, destroy) end

--- @param position integer
--- @param tag string
function insert(position, tag) end

--- @param tag string
--- @return integer
function getObjectOrder(tag) end

--- @param tag string
--- @param position integer
function setObjectOrder(tag, position) end

--- @param min integer?
--- @param max integer?
--- @param excludes integer[]?
--- @return integer
function getRandomInt(min, max, excludes) end

--- @param min number?
--- @param max number?
--- @param excludes number[]?
--- @return number
function getRandomFloat(min, max, excludes) end

--- @param chance number?
--- @return boolean
function getRandomBool(chance) end

--- @param name string
function registerGlobalFunction(name) end

--- @param name string
function registerGlobalLuaFunction(name) end

--- @param name string
function registerGlobalHScriptFunction(name) end

--- @param tag string
function registerGlobalVariable(tag) end

--- @param tag string
function registerGlobalLuaVariable(tag) end

--- @param tag string
function registerGlobalHScriptVariable(tag) end

--- @param tag string
--- @return boolean
function variableExists(tag) end

function close() end

--- @param name string
--- @param hsArguments any[]?
--- @param luaArguments any[]?
--- @param hsVariables table?
--- @param luaVariables table?
function switchToCustomState(name, hsArguments, luaArguments, hsVariables, luaVariables) end

--- @param name string
--- @param hsArguments any[]?
--- @param luaArguments any[]?
--- @param hsVariables table?
--- @param luaVariables table?
function openCustomSubState(name, hsArguments, luaArguments, hsVariables, luaVariables) end