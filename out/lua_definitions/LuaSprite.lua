--- @param tag string
--- @param image string?
--- @param x number?
--- @param y number?
function makeLuaSprite(tag, image, x, y) end

--- @param tag string
--- @param sprite string
--- @param gridX integer?
--- @param gridY integer?
function loadGraphic(tag, sprite, gridX, gridY) end

--- @param tag string
--- @param x number
--- @param y number
--- @param color integer?
function makeGraphic(tag, x, y, color) end

--- @param tag string
--- @param sprite string
--- @param spriteType string? Valores válidos: "sparrow", "packer", "aseprite". Por defecto usa "multi".
function loadFrames(tag, sprite, spriteType) end

--- @param tag string
--- @param name string
--- @param prefix string
--- @param framerate integer?
--- @param loop boolean?
function addAnimationByPrefix(tag, name, prefix, framerate, loop) end

--- @param tag string
--- @param name string
--- @param frames integer[]
--- @param framerate integer?
--- @param loop boolean?
function addAnimation(tag, name, frames, framerate, loop) end

--- @param tag string
--- @param name string
--- @param prefix string
--- @param indices integer[]
--- @param framerate integer?
--- @param loop boolean?
function addAnimationByIndices(tag, name, prefix, indices, framerate, loop) end

--- @param tag string
--- @param name string
--- @param forced boolean?
--- @param reversed boolean?
--- @param startFrame integer?
function playAnim(tag, name, forced, reversed, startFrame) end

--- @param tag string
--- @param w integer
--- @param h integer
function setGraphicSize(tag, w, h) end

--- @param tag string
function updateHitbox(tag) end

--- @param tag string
--- @param mode string
function setBlendMode(tag, mode) end

--- @param tag string
--- @param x integer
--- @param y integer
--- @return integer
function getPixelColor(tag, x, y) end

--- @param tag string
--- @deprecated Use `add` instead.
function addLuaSprite(tag) end

--- @param tag string
--- @param destroy boolean?
--- @deprecated Use `remove` instead.
function removeLuaSprite(tag, destroy) end

--- @param tag string
--- @return number
function getMidpointX(tag) end

--- @param tag string
--- @return number
function getMidpointY(tag) end

--- @param tag string
--- @return number
function getGraphicMidpointX(tag) end

--- @param tag string
--- @return number
function getGraphicMidpointY(tag) end

--- @param tag string
--- @return number
function getScreenPositionX(tag) end

--- @param tag string
--- @return number
function getScreenPositionY(tag) end