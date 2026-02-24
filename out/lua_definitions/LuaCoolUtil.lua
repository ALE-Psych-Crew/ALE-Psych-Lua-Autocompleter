--- @param str string
--- @return integer
function colorFromString(str) end

--- @param tag string
--- @return integer
function getDominantColor(tag) end

--- @param arr integer[]
--- @return integer
function colorFromArray(arr) end

function resetGame() end

--- @param width integer
--- @param height integer
--- @param centerWindow boolean?
function resizeGame(width, height, centerWindow) end

--- @param path string
--- @param missingPrint boolean?
--- @return string
function searchComplexFile(path, missingPrint) end

--- @param parent string
--- @param file string
--- @return string
function searchFile(parent, file) end

--- @param folder string
--- @param absolute boolean?
function openFolder(folder, absolute) end

--- @param str string
--- @return string
function formatToSongPath(str) end

--- @param text any
--- @param type integer?
--- @param customType string?
--- @param customColor integer?
function debugTrace(text, type, customType, customColor) end

--- @param str string
--- @param color integer
--- @return string
function ansiColorString(str, color) end

--- @param num number
--- @param decimals integer
--- @return number
function floorDecimal(num, decimals) end

--- @param f number
--- @param snap number
--- @return number
function quantize(f, snap) end

--- @param max integer
--- @param min integer?
--- @return integer[]
function numberArray(max, min) end

--- @param v1 number
--- @param v2 number
--- @param ratio number
--- @return number
function fpsLerp(v1, v2, ratio) end

--- @param ratio number
--- @return number
function fpsRatio(ratio) end

function resetState() end

--- @param state string
--- @param args any[]?
--- @param skipTransIn boolean?
--- @param skipTransOut boolean?
function switchState(state, args, skipTransIn, skipTransOut) end

--- @param substate string
--- @param args any[]?
function openSubState(substate, args) end

--- @param str string
--- @return string
function capitalizeString(str) end

--- @param site string
function browserLoad(site) end