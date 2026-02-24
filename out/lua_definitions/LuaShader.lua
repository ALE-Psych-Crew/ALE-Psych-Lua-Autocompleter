--- @param tag string
--- @param name string
function initLuaShader(tag, name) end

--- @param camera string
--- @param shaderTags string[]
function setCameraShaders(camera, shaderTags) end

--- @param tag string
--- @param name string
function setSpriteShader(tag, name) end

--- @param tag string
--- @param id string
--- @param int integer
function setShaderInt(tag, id, int) end

--- @param tag string
--- @param id string
--- @return integer
function getShaderInt(tag, id) end

--- @param tag string
--- @param id string
--- @param ints integer[]
function setShaderIntArray(tag, id, ints) end

--- @param tag string
--- @param id string
--- @return integer[]
function getShaderIntArray(tag, id) end

--- @param tag string
--- @param id string
--- @param float number
function setShaderFloat(tag, id, float) end

--- @param tag string
--- @param id string
--- @return number
function getShaderFloat(tag, id) end

--- @param tag string
--- @param id string
--- @param floats number[]
function setShaderFloatArray(tag, id, floats) end

--- @param tag string
--- @param id string
--- @return number[]
function getShaderFloatArray(tag, id) end

--- @param tag string
--- @param id string
--- @param bool boolean
function setShaderBool(tag, id, bool) end

--- @param tag string
--- @param id string
--- @return boolean
function getShaderBool(tag, id) end

--- @param tag string
--- @param id string
--- @param bools boolean[]
function setShaderBoolArray(tag, id, bools) end

--- @param tag string
--- @param id string
--- @return boolean[]
function getShaderBoolArray(tag, id) end

--- @param tag string
--- @param id string
--- @param path string
function setShaderSample2D(tag, id, path) end