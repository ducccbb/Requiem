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
--           File: ReplicatedStorage.Client.User.Equipment.Tools.Economy.Book
--                              Dumped in 0.000443 seconds
--                          Bytecode version 9  |  3 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local Common = game:GetService("ReplicatedStorage"):WaitForChild("Common")
local Types = Common:WaitForChild("Types")
local Books = Types:WaitForChild("Books")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage:WaitForChild("Common")
local Observers = Common_2:WaitForChild("Observers")
local useAnimatorObserver = require(Observers:WaitForChild("useAnimatorObserver"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common_3 = ReplicatedStorage_2:WaitForChild("Common")
local Utilities = Common_3:WaitForChild("Utilities")
local State = require(Utilities:WaitForChild("State"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_4 = ReplicatedStorage_3:WaitForChild("Common")
local Animations = Common_4:WaitForChild("Animations")
local Book = require(Animations:WaitForChild("Book"))
local ReplicatedStorage_4 = game:GetService("ReplicatedStorage")
local Common_5 = ReplicatedStorage_4:WaitForChild("Common")
local Types_2 = Common_5:WaitForChild("Types")
local v2 = {
    description = "A book, which can be read to reveal its contents.",
    attributes = {"Session Based"},
    category = require(Types_2:WaitForChild("Item")).CATEGORIES.Economy,
}
local u110 = nil
return {
    equipped = function(p1, p2) -- Line: 48 -- upvalues: Books (val), u110 (ref), useAnimatorObserver (val), Book (val), State (val)
        local v1 = Books:FindFirstChild(p2.tags[1])
        if not v1 then
            return
        end
        local v2 = require(v1)
        if not v2 then
            return
        end
        u110 = useAnimatorObserver.play(Book.Idle, 0.1)
        State("book")({visible = true, content = v2.content})
    end,
    unequipped = function() -- Line: 73 -- upvalues: State (val), u110 (ref)
        State("book")({visible = false})
        if u110 then
            u110:Stop(0.1)
        end
    end,
    data = v2,
}