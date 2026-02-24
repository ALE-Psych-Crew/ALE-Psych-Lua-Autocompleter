--- @param tag string
--- @param x number?
--- @param y number?
--- @param path string?
--- @param playOnLoad boolean?
--- @param loop boolean?
function makeLuaVideoSprite(tag, x, y, path, playOnLoad, loop) end

--- @param tag string
function playVideoSprite(tag) end

--- @param tag string
function stopVideoSprite(tag) end

--- @param tag string
function pauseVideoSprite(tag) end

--- @param tag string
function resumeVideoSprite(tag) end

--- @param tag string
function toggleVideoSpritePaused(tag) end