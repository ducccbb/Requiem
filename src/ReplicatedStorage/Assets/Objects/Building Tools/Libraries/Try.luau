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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Try
--                              Dumped in 0.000761 seconds
--                          Bytecode version 9  |  10 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {RetryCount = 0, _IsAttempt = true}
u12.__index = u12
function u12.__tostring(p1) -- Line: 18
    return p1.Id:gsub("table", "Attempt")
end
local function PackageProtectedCall(...) -- Line: 23
    return ..., {select(2, ...)}
end
local function IsAttempt(p1) -- Line: 27
    local _IsAttempt
    local v1 = getmetatable(p1)
    if not v1 then
        _IsAttempt = false
    else
        _IsAttempt = v1._IsAttempt
        if not _IsAttempt then
            _IsAttempt = false
        end
    end
    return _IsAttempt
end
local function Try(p1, ...) -- Line: 38 -- upvalues: u12 (val)
    local v1 = {}
    v1.Id = tostring(v1)
    setmetatable(v1, u12)
    return v1:Execute(p1, {...})
end
function u12:Execute(p2, p3) -- Line: 51 -- upvalues: PackageProtectedCall (val)
    local v1, v2
    v1, v2 = PackageProtectedCall(pcall(p2, unpack(p3)))
    self.Function = p2
    self.Arguments = p3
    self.Success = v1
    self.Results = v2
    if not v1 then
        self.Stack = debug.traceback()
        self.Skips = {}
    end
    return self
end
function u12:Then(p2) -- Line: 74 -- upvalues: IsAttempt (val)
    local v1
    local v2 = self.Results[1]
    if not self.Success then
        v1 = self
    elseif not (IsAttempt(v2)) then
        v1 = self
    else
        v1 = v2
    end
    if not v1.Success then
        v1.Skips[#v1.Skips + 1] = p2
        return v1
    end
    v1:Execute(p2, v1.Results)
    return v1
end
function u12:Catch(, ...) -- Line: 97 -- upvalues: IsAttempt (val), Try (val)
    local u7, v1
    local v2 = self.Results[1]
    if not self.Success then
        u7 = self
    elseif not (IsAttempt(v2)) then
        u7 = self
    else
        u7 = v2
    end
    if u7.Success or u7.Handled then
        return u7
    end
    local v3 = {...}
    local v4 = #v3 - 1
    local v5 = v3[v4 + 1]
    u7.Skips[#u7.Skips + 1] = v3
    local v6 = u7.Results[1]
    local v7 = false
    if v4 == 0 then
        v7 = true
    elseif type(v6) == "string" then
        v1 = v4
        local v8 = 1
        for i = 1, v1, v8 do
            if v6:match(v3[i]) then
                v7 = true
                break
            end
        end
    end
    if not v7 then
        return u7
    end
    v1 = Try(v5, v6, u7.Stack, u7)
    return v1:Then(function() -- Line: 141 -- upvalues: u7 (ref)
        u7.Handled = true
        return u7
    end)
end
function u12.Retry(p1) -- Line: 152
    local v1, v2
    if p1.Success then
        return
    end
    local Skips = p1.Skips
    p1.Handled = nil
    p1.Skips = nil
    p1.Stack = nil
    p1.RetryCount = p1.RetryCount + 1
    p1:Execute(p1.Function, p1.Arguments)
    if p1.Success then
        p1.RetryCount = nil
    end
    local v3 = #Skips
    local v4 = 1
    local v5 = p1
    for i = 1, v3, v4 do
        v1 = Skips[i]
        v2 = getmetatable(v1)
        if type(v1) == "function" then
            v5 = v5:Then(v1)
        elseif not v2 then
            v5 = v5:Catch(unpack(v1))
        elseif not v2.__call then
        end
    end
    return v5
end
return Try