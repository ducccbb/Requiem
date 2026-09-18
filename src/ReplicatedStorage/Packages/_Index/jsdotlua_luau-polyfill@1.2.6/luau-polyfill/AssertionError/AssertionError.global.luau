-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--[[
__________                   __               __    __________              .__
\______   \_______  ____    |__| ____   _____/  |_  \______   \ ____ _____  |  |
 |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\  |       _// __ \\__  \ |  |
 |    |     |  | \(  <_> )  |  \  ___/\  \___|  |    |    |   \  ___/ / __ \|  |__
 |____|     |__|   \____/\__|  |\___  >\___  >__|    |____|_  /\___  >____  /____/
                        \______|    \/     \/               \/     \/     \/
]]
--                           Project Real  |  Luau Decompiler
--                                   Made by @zinvera
--File: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.6.luau-polyfill.AssertionError.AssertionError.global
--                               Dumped in 0.00290 seconds
--                          Bytecode version 9  |  10 functions

local collections = require(script.Parent.Parent.Parent:WaitForChild("collections"))
local Array = collections.Array
local Object = collections.Object
local boolean = require(script.Parent.Parent.Parent:WaitForChild("boolean"))
local string = require(script.Parent.Parent.Parent:WaitForChild("string"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local inspect = collections.inspect
local Error = require(script.Parent.Parent:WaitForChild("Error"))
local u61 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local u62 = {
    stderr = {
        isTTY = false,
        columns = 0,
        hasColors = function(...) -- Line: 45
            return true
        end,
    },
}
function ErrorCaptureStackTrace(p1, ...) -- Line: 52 -- upvalues: Error (val)
    Error.captureStackTrace(p1, ...)
end
local function removeColors(p1) -- Line: 57
    return p1
end
local u67 = ""
local u68 = ""
local u69 = ""
local u70 = ""
local u71 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:",
    strictEqual = "Expected values to be strictly equal:",
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":",
    deepEqual = "Expected values to be loosely deep-equal:",
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:",
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:",
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":",
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:",
    notIdentical = "Values have same structure but are not reference-equal:",
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:",
}
local function copyError(p1) -- Line: 85 -- upvalues: Object (val)
    local v1 = Object.keys(p1)
    local v2 = {}
    local v3 = v1
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v2[j] = p1[j]
    end
    v2.message = p1.message
    return v2
end
local function inspectValue(p1) -- Line: 96 -- upvalues: inspect (val)
    return inspect(p1, {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    })
end
local function createErrDiff(p1, p2, p3) -- Line: 111 -- upvalues: inspect (val), string (val), boolean (val), u71 (val), u62 (val), u67 (ref), u70 (ref), Array (val), u68 (ref), u69 (ref)
    local v1, v2, v3, v4, v5
    local v6 = ""
    local v7 = ""
    local v8 = ""
    local v9 = false
    local v10 = inspect(p1, {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    })
    local v11 = string.split(v10, "\n")
    local v12 = {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    }
    local v13 = inspect(p2, v12)
    local v14 = string.split(v13, "\n")
    v13 = 0
    local v15 = ""
    if p3 ~= "strictEqual" then
        v5 = p3
    elseif typeof(p1) ~= "table" then
        if typeof(p1) ~= "function" then
            v5 = p3
        elseif typeof(p2) ~= "function" then
            v5 = p3
        else
            v5 = "strictEqualObject"
        end
    elseif p1 ~= nil and typeof(p2) == "table" and p2 ~= nil then
    end
    if #v11 ~= 1 then
        local v16, v17, v18, v19
        v12 = v11[#v11]
        v1 = v14[#v14]
        while v12 == v1 do
            v2 = v13
            v13 = v13 + 1
            if v2 >= 3 then
                v6 = v12
            else
                v8 = ("\n  %s%s"):format(v12, v8)
            end
            table.remove(v11)
            table.remove(v14)
            if #v11 == 0 or #v14 == 0 then
                break
            end
            v12 = v11[#v11]
            v1 = v14[#v14]
        end
        v2 = math.max(#v11, #v14)
        if v2 == 0 then
            v3 = string.split(v10, "\n")
            if 50 < #v3 then
                v3[47] = ("%s...%s"):format(u67, u70)
                while 47 < #v3 do
                    table.remove(v3)
                end
            end
            v16 = ("%s\n\n"):format("Values have same structure but are not reference-equal:")
            return v16 .. ("%s\n"):format(Array.join(v3, "\n"))
        end
        if 5 <= v13 then
            v8 = ("\n%s...%s%s"):format(u67, u70, v8)
            v9 = true
        end
        if v6 ~= "" then
            v8 = ("\n  %s%s"):format(v6, v8)
            v6 = ""
        end
        v3 = 0
        v4 = 0
        v16 = u71[v5] .. ("\n%s+ actual%s %s- expected%s"):format(u68, u70, u69, u70)
        local v20 = (" %s...%s Lines skipped"):format(u67, u70)
        local v21 = v11
        local v22 = ("%s+%s"):format(u68, u70)
        local v23 = #v14
        if #v11 < v2 then
            v21 = v14
            v22 = ("%s-%s"):format(u69, u70)
            v23 = #v11
        end
        local v24 = v2
        local v25 = 1
        for i = 1, v24, v25 do
            if v23 >= i then
                v17 = v14[i]
                v18 = v11[i]
                v19 = false
                if v18 ~= v17 then
                    v19 = not boolean.toJSBoolean(string.endsWith(v18, ","))
                    if not v19 then
                        v19 = string.slice(v18, 0, -1) ~= v17
                    end
                end
                if v19 and string.endsWith(v17, ",") and string.slice(v17, 0, -1) == v18 then
                    v19 = false
                    v18 = v18 .. ","
                end
                if not v19 then
                    v7 = v7 .. v6
                    v6 = ""
                    v4 = v4 + 1
                    if v4 <= 2 then
                        v7 = v7 .. ("\n  %s"):format(v18)
                        v3 = v3 + 1
                    end
                else
                    if 2 < v4 then
                        if 3 < v4 then
                            if 4 < v4 then
                                if v4 ~= 5 then
                                    v7 = v7 .. ("\n%s...%s"):format(u67, u70)
                                    v9 = true
                                else
                                    v7 = v7 .. ("\n  %s"):format(v11[i - 3])
                                    v3 = v3 + 1
                                end
                            end
                            v7 = v7 .. ("\n  %s"):format(v11[i - 2])
                            v3 = v3 + 1
                        end
                        v7 = v7 .. ("\n  %s"):format(v11[i - 1])
                        v3 = v3 + 1
                    end
                    v4 = 0
                    v7 = v7 .. ("\n%s+%s %s"):format(u68, u70, v18)
                    v6 = v6 .. ("\n%s-%s %s"):format(u69, u70, v17)
                    v3 = v3 + 2
                end
            else
                if 2 < v4 then
                    if 3 < v4 then
                        if 4 < v4 then
                            if v4 ~= 5 then
                                v7 = v7 .. ("\n%s...%s"):format(u67, u70)
                                v9 = true
                            else
                                v7 = v7 .. ("\n  %s"):format(v21[i - 3])
                                v3 = v3 + 1
                            end
                        end
                        v7 = v7 .. ("\n  %s"):format(v21[i - 2])
                        v3 = v3 + 1
                    end
                    v7 = v7 .. ("\n  %s"):format(v21[i - 1])
                    v3 = v3 + 1
                end
                v4 = 0
                if v21 ~= v11 then
                    v6 = v6 .. ("\n%s %s"):format(v22, v21[i])
                else
                    v7 = v7 .. ("\n%s %s"):format(v22, v21[i])
                end
                v3 = v3 + 1
            end
            if 50 < v3 and i < v2 - 2 then
                v18 = ("%s%s\n%s\n%s...%s%s\n"):format(v16, v20, v7, u67, u70, v6)
                return v18 .. ("%s...%s"):format(u67, u70)
            end
        end
        if not v9 then
            v17 = ""
        else
            v17 = v20
        end
        return ("%s%s\n%s%s%s%s"):format(v16, v17, v7, v6, v8, v15)
    elseif #v14 == 1 and v11[1] ~= v14[1] then
        v12 = v11[1]
        if not (boolean.toJSBoolean(false)) then
            v1 = v14[1]
        else
            v1 = v14[1]
        end
        v3 = string.len(v12)
        v2 = v3 + string.len(v1)
        if v2 > 12 then
            if v5 ~= "strictEqualObject" then
                local columns
                if not u62.stderr.isTTY then
                    columns = 80
                else
                    columns = u62.stderr.columns
                end
                if v2 < columns then
                    while true do
                        v4 = string.sub(v12, v13 + 1, v13 + 1)
                        if v4 ~= string.sub(v1, v13 + 1, v13 + 1) then
                            break
                        end
                        v13 = v13 + 1
                    end
                    if 2 < v13 then
                        v15 = ("\n  %s^"):format(string.rep(" ", v13))
                        v13 = 0
                    end
                end
            end
        elseif typeof(p1) ~= "table" then
            if typeof(p2) ~= "table" then
                if p1 ~= 0 then
                    v4 = ("%s\n\n"):format(u71[v5])
                    return v4 .. ("%s !== %s\n"):format(v11[1], v14[1])
                elseif p2 ~= 0 then
                    v4 = ("%s\n\n"):format(u71[v5])
                    return v4 .. ("%s !== %s\n"):format(v11[1], v14[1])
                end
            elseif p2 ~= nil then
            end
        elseif p1 ~= nil then
        end
    end
end
local u78 = setmetatable({}, {__index = Error})
u78.__index = u78
function u78.__tostring(p1) -- Line: 391
    return p1:toString()
end
function u78.new(p1) -- Line: 404 -- upvalues: Error (val), u78 (val), u62 (val), u67 (ref), u68 (ref), u70 (ref), u69 (ref), Array (val), Object (val), u61 (val), createErrDiff (val), u71 (val), string (val), inspect (val), boolean (val)
    local v1, v2
    local message = p1.message
    local operator = p1.operator
    local stackStartFn = p1.stackStartFn
    local actual = p1.actual
    local expected = p1.expected
    if message == nil then
        local v3, v4, v5, v6
        if u62.stderr.isTTY then
            if not (u62.stderr:hasColors()) then
                u67 = ""
                u68 = ""
                u70 = ""
                u69 = ""
            else
                u67 = "\027[34m"
                u68 = "\027[32m"
                u70 = "\027[39m"
                u69 = "\027[31m"
            end
        end
        if typeof(actual) == "table" and actual ~= nil and typeof(expected) == "table" and expected ~= nil then
            v2 = Object.keys(actual)
            if Array.indexOf(v2, "stack") ~= -1 and u61(actual, Error) then
                v2 = Object.keys(expected)
                if Array.indexOf(v2, "stack") ~= -1 and u61(expected, Error) then
                    v5 = actual
                    v2 = Object.keys(v5)
                    v6 = {}
                    v3 = v2
                    v4 = nil
                    local v7 = nil
                    for i, j in v3, v4, v7 do
                        v6[j] = v5[j]
                    end
                    v6.message = v5.message
                    actual = v6
                    v5 = expected
                    v2 = Object.keys(v5)
                    v6 = {}
                    v3 = v2
                    v4 = nil
                    v7 = nil
                    for k, n in v3, v4, v7 do
                        v6[n] = v5[n]
                    end
                    v6.message = v5.message
                    expected = v6
                end
            end
        end
        if operator == "deepStrictEqual" then
            v2 = Error.new(createErrDiff(actual, expected, operator))
            v1 = setmetatable(v2, u78)
        elseif operator == "strictEqual" then
            v2 = Error.new(createErrDiff(actual, expected, operator))
            v1 = setmetatable(v2, u78)
        elseif operator == "notDeepStrictEqual" then
            v5 = u71[operator]
            v2 = string.split(inspect(actual, {
                compact = false,
                customInspect = false,
                depth = 1000,
                maxArrayLength = (1 / 0),
                showHidden = false,
                showProxy = false,
                sorted = true,
                getters = true,
            }), "\n")
            if operator == "notStrictEqual" then
                if typeof(actual) ~= "table" then
                    if typeof(actual) == "function" then
                        v5 = "Expected \"actual\" not to be reference-equal to \"expected\":"
                    end
                elseif actual ~= nil then
                end
            end
            if 50 < #v2 then
                v2[47] = ("%s...%s"):format(u67, u70)
                while 47 < #v2 do
                    table.remove(v2)
                end
            end
            if #v2 ~= 1 then
                v3 = Error.new(("%s\n\n%s\n"):format(v5, Array.join(v2, "\n")))
                v1 = setmetatable(v3, u78)
            else
                local v8
                local v9 = string.len(v2[1])
                if 5 >= v9 then
                    v8 = " "
                else
                    v8 = "\n\n"
                end
                v3 = Error.new(("%s%s%s"):format(v5, v8, v2[1]))
                v1 = setmetatable(v3, u78)
            end
        elseif operator ~= "notStrictEqual" then
            v4 = {
                compact = false,
                customInspect = false,
                depth = 1000,
                maxArrayLength = (1 / 0),
                showHidden = false,
                showProxy = false,
                sorted = true,
                getters = true,
            }
            v5 = inspect(actual, v4)
            v2 = inspect(expected, {
                compact = false,
                customInspect = false,
                depth = 1000,
                maxArrayLength = (1 / 0),
                showHidden = false,
                showProxy = false,
                sorted = true,
                getters = true,
            })
            v6 = u71[tostring(operator)]
            if operator ~= "notDeepEqual" then
                v3 = string.len(v5)
                if 512 < v3 then
                    v5 = ("%s..."):format(string.slice(v5, 0, 509))
                end
                v3 = string.len(v2)
                if 512 < v3 then
                    v2 = ("%s..."):format(string.slice(v2, 0, 509))
                end
                if operator ~= "deepEqual" then
                    v3 = u71[("%sUnequal"):format((tostring(operator)))]
                    if not (boolean.toJSBoolean(v3)) then
                        local v10 = tostring(operator)
                        v2 = (" %s %s"):format(v10, v2)
                    else
                        v5 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v3, v5)
                    end
                else
                    v5 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v6, v5)
                end
                v4 = Error.new(("%s%s"):format(v5, v2))
                v1 = setmetatable(v4, u78)
            elseif v5 == v2 then
                v5 = ("%s\n\n%s"):format(v6, v5)
                v3 = string.len(v5)
                if 1024 < v3 then
                    v5 = ("%s..."):format(string.slice(v5, 0, 1021))
                end
                v4 = Error.new(v5)
                v1 = setmetatable(v4, u78)
            end
        end
    else
        v2 = Error.new((tostring(message)))
        v1 = setmetatable(v2, u78)
    end
    v1.generatedMessage = not boolean.toJSBoolean(message)
    v1.name = "AssertionError [ERR_ASSERTION]"
    v1.code = "ERR_ASSERTION"
    v1.actual = actual
    v1.expected = expected
    v1.operator = operator
    local new = stackStartFn
    if not new then
        new = u78.new
    end
    ErrorCaptureStackTrace(v1, new)
    v1.name = "AssertionError"
    return v1
end
function u78:toString() -- Line: 573
    return ("%s [%s]: %s"):format(self.name, self.code, self.message)
end
u78.name = "AssertionError"
return {AssertionError = u78}