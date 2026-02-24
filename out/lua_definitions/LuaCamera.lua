--- @param tag string
--- @param x number
--- @param y number
--- @param width integer
--- @param height integer
--- @param zoom number
function makeLuaCamera(tag, x, y, width, height, zoom) -- ... 
end

--- @param tag string
--- @param defaultDraw boolean?
function addCamera(tag, defaultDraw) -- ... 
end

--- @param tag string
function removeCamera(tag) -- ... 
end

--- @param camera string
--- @param tag string
--- @param intensity number?
--- @param duration number?
--- @param force boolean?
--- @param axes string?
function cameraShake(camera, tag, intensity, duration, force, axes) -- ... 
end

--- @param camera string
--- @param tag string
--- @param color integer?
--- @param duration number?
--- @param force boolean?
function cameraFlash(camera, tag, color, duration, force) -- ... 
end

--- @param camera string
--- @param tag string
--- @param color integer?
--- @param duration number?
--- @param fadeIn boolean?
--- @param force boolean?
function cameraFade(camera, tag, color, duration, fadeIn, force) -- ... 
end

--- @param camera string
function stopCameraFX(camera) -- ... 
end

--- @param camera string
function stopCameraFade(camera) -- ... 
end

--- @param camera string
function stopCameraFlash(camera) -- ... 
end

--- @param camera string
function stopCameraShake(camera) -- ... 
end

--- @param camera string
--- @param target string
--- @param lerp number?
function cameraFollow(camera, target, lerp) -- ... 
end