--- @param tag string
--- @param text string
--- @param width integer
--- @param x number
--- @param y number
function makeLuaText(tag, text, width, x, y) end

--- @param tag string
--- @param size number
--- @param color integer
--- @param style string? Valores válidos: "shadow", "outline", "outline_fast". Por defecto usa NONE.
function setTextBorder(tag, size, color, style) end

--- @param tag string
--- @param newFont string
function setTextFont(tag, newFont) end

--- @param tag string
--- @deprecated Use `add` instead.
function addLuaText(tag) end

--- @param tag string
--- @param destroy boolean?
--- @deprecated Use `remove` instead.
function removeLuaText(tag, destroy) end