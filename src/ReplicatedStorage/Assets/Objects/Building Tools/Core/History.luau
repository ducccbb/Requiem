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
--          File: ReplicatedStorage.Assets.Objects.Building Tools.Core.History
--                              Dumped in 0.000303 seconds
--                          Bytecode version 9  |  4 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Libraries = script.Parent.Parent:WaitForChild("Libraries")
local Signal = require(Libraries:WaitForChild("Signal"))
History = {Index = 0, Stack = {}, Changed = Signal.new()}
function History.Undo() -- Line: 27
    local v1 = History.Index - 1
    if v1 < 0 then
        return
    end
    History.Stack[History.Index]:Unapply()
    History.Index = History.Index - 1
    History.Changed:Fire()
end
function History.Redo() -- Line: 47
    local v1 = History.Index + 1
    if #History.Stack < v1 then
        return
    end
    History.Index = History.Index + 1
    History.Stack[History.Index]:Apply()
    History.Changed:Fire()
end
function History.Add(p1) -- Line: 67
    History.Index = History.Index + 1
    History.Stack[History.Index] = p1
    local v1 = History.Index + 1
    local v2 = #History.Stack
    local v3 = 1
    for i = v1, v2, v3 do
        History.Stack[i] = nil
    end
    History.Changed:Fire()
end
return History