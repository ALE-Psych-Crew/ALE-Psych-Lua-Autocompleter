--- @param tag string
--- @param obj string
--- @param props table
--- @param time number?
--- @param options table?
function tween(tag, obj, props, time, options) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `tween` instead.
function doTweenX(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `tween` instead.
function doTweenY(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `tween` instead.
function doTweenAngle(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `tween` instead.
function doTweenAlpha(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `tween` instead.
function doTweenZoom(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param value any
--- @param time number?
--- @param ease string?
--- @deprecated Use `colorTween` instead.
function doTweenColor(tag, obj, value, time, ease) end

--- @param tag string
--- @param obj string
--- @param time number?
--- @param from integer?
--- @param to integer?
--- @param options table?
function colorTween(tag, obj, time, from, to, options) end

--- @param tag string
--- @param fromValue number
--- @param toValue number
--- @param duration number?
--- @param options table?
function numTween(tag, fromValue, toValue, duration, options) end

--- @param tag string
function cancelTween(tag) end

--- @param tag string
function cancelTweensOf(tag) end