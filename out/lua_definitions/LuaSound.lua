--- @param sound string
--- @param volume number?
--- @param loop boolean?
function playMusic(sound, volume, loop) end

--- @param sound string
--- @param volume number?
--- @param tag string?
--- @param loop boolean?
function playSound(sound, volume, tag, loop) end

--- @param tag string
function stopSound(tag) end

--- @param tag string
function pauseSound(tag) end

--- @param tag string
function resumeSound(tag) end

--- @param tag string
--- @param duration number?
--- @param fromValue number?
--- @param toValue number?
function soundFadeIn(tag, duration, fromValue, toValue) end

--- @param tag string
--- @param duration number?
--- @param toValue number?
function soundFadeOut(tag, duration, toValue) end

--- @param tag string
function soundFadeCancel(tag) end