--- @param tag string
--- @param path string
--- @param prop string
function setVariableFromClass(tag, path, prop) end

--- @param tag string
--- @param groupTag string
--- @param index integer
function setVariableFromGroup(tag, groupTag, index) end

--- @param variable string
--- @param tag string
--- @param key string
function setVariableFromMap(variable, tag, key) end

--- @param tag string
--- @return any
function getProperty(tag) end

--- @param tag string
--- @param index integer
--- @param prop string
--- @return any
function getPropertyFromGroup(tag, index, prop) end

--- @param path string
--- @param prop string
--- @return any
function getPropertyFromClass(path, prop) end

--- @param tag string
--- @param value any
function setProperty(tag, value) end

--- @param tag string
--- @param index integer
--- @param prop string
--- @param value any
function setPropertyFromGroup(tag, index, prop, value) end

--- @param path string
--- @param prop string
--- @param value any
function setPropertyFromClass(path, prop, value) end

--- @param tag string
--- @param props table
function setProperties(tag, props) end

--- @param tag string
--- @param index integer
--- @param props table
function setPropertiesFromGroup(tag, index, props) end

--- @param path string
--- @param props table
function setPropertiesFromClass(path, props) end

--- @param tag string
--- @param args any[]?
--- @return any
function callMethod(tag, args) end

--- @param path string
--- @param func string
--- @param args any[]?
--- @return any
function callMethodFromClass(path, func, args) end

--- @param tag string
--- @param path string
--- @param args any[]?
function createInstance(tag, path, args) end

--- @param tag string
--- @deprecated Use `add` instead.
function addInstance(tag) end

--- @param tag string
--- @return string
function instanceArg(tag) end