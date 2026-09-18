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
--    File: ReplicatedStorage.Client.Interfaces.Routes.Screen.Eyecatchers.Eyecatcher
--                               Dumped in 0.00144 seconds
--                          Bytecode version 9  |  5 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
local Administration = require(Namespaces:WaitForChild("Administration"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage_2:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_3 = game:GetService("ReplicatedStorage")
local Common_2 = ReplicatedStorage_3:WaitForChild("Common")
local Signals = require(Common_2:WaitForChild("Signals"))
local u65 = {}
local Variants = v1.Parent:WaitForChild("Variants")
u65.Basic = require(Variants:WaitForChild("Basic"))
local Variants_2 = v1.Parent:WaitForChild("Variants")
u65.Time = require(Variants_2:WaitForChild("Time"))
local Variants_3 = v1.Parent:WaitForChild("Variants")
u65.White = require(Variants_3:WaitForChild("White"))
local Variants_4 = v1.Parent:WaitForChild("Variants")
u65.Black = require(Variants_4:WaitForChild("Black"))
local Variants_5 = v1.Parent:WaitForChild("Variants")
u65.Ash = require(Variants_5:WaitForChild("Ash"))
local Variants_6 = v1.Parent:WaitForChild("Variants")
u65.Lightning = require(Variants_6:WaitForChild("Lightning"))
local Variants_7 = v1.Parent:WaitForChild("Variants")
u65.Felled = require(Variants_7:WaitForChild("Felled"))
local Variants_8 = v1.Parent:WaitForChild("Variants")
u65.Location = require(Variants_8:WaitForChild("Location"))
local Variants_9 = v1.Parent:WaitForChild("Variants")
u65.Chronicle = require(Variants_9:WaitForChild("Chronicle"))
return function() -- Line: 36 -- upvalues: react (val), Administration (val), Signals (val), u65 (val)
    local body, body_2, body_3, body_4, body_5, body_6, body_7, body_8, body_9, header, header_2, header_3, header_4, header_5, header_6, header_7, header_8, header_9, u4, v1, v2
    v1, u4 = react.useState(nil)
    react.useEffect(function() -- Line: 40 -- upvalues: Administration (upval), u4 (val), Signals (upval)
        Administration.Eyecatcher.listen(function(p1) -- Line: 41 -- upvalues: u4 (upval)
            u4(p1)
        end)
        Signals.Eyecatcher:Connect(function(p1) -- Line: 45 -- upvalues: u4 (upval)
            u4(p1)
        end)
    end, {})
    local createElement = react.createElement
    local v3 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v4 = {}
    local createElement_2 = react.createElement
    local Basic = u65.Basic
    local v5 = {}
    if not v1 then
        header = ""
    else
        header = v1.header
    end
    v5.Header = header
    if not v1 then
        body = ""
    else
        body = v1.body
    end
    v5.Body = body
    if not v1 then
        v2 = false
    elseif v1.variant == "Basic" then
        v2 = true
    end
    v5.Visible = v2
    v4.Basic = createElement_2(Basic, v5)
    local createElement_3 = react.createElement
    local Time = u65.Time
    v5 = {}
    if not v1 then
        header_2 = ""
    else
        header_2 = v1.header
    end
    v5.Header = header_2
    if not v1 then
        body_2 = ""
    else
        body_2 = v1.body
    end
    v5.Body = body_2
    if not v1 then
        v2 = false
    elseif v1.variant == "Time" then
        v2 = true
    end
    v5.Visible = v2
    v4.Time = createElement_3(Time, v5)
    local createElement_4 = react.createElement
    local White = u65.White
    v5 = {}
    if not v1 then
        header_3 = ""
    else
        header_3 = v1.header
    end
    v5.Header = header_3
    if not v1 then
        body_3 = ""
    else
        body_3 = v1.body
    end
    v5.Body = body_3
    if not v1 then
        v2 = false
    elseif v1.variant == "White" then
        v2 = true
    end
    v5.Visible = v2
    v4.White = createElement_4(White, v5)
    local createElement_5 = react.createElement
    local Black = u65.Black
    v5 = {}
    if not v1 then
        header_4 = ""
    else
        header_4 = v1.header
    end
    v5.Header = header_4
    if not v1 then
        body_4 = ""
    else
        body_4 = v1.body
    end
    v5.Body = body_4
    if not v1 then
        v2 = false
    elseif v1.variant == "Black" then
        v2 = true
    end
    v5.Visible = v2
    v4.Black = createElement_5(Black, v5)
    local createElement_6 = react.createElement
    local Ash = u65.Ash
    v5 = {}
    if not v1 then
        header_5 = ""
    else
        header_5 = v1.header
    end
    v5.Header = header_5
    if not v1 then
        body_5 = ""
    else
        body_5 = v1.body
    end
    v5.Body = body_5
    if not v1 then
        v2 = false
    elseif v1.variant == "Ash" then
        v2 = true
    end
    v5.Visible = v2
    v4.Ash = createElement_6(Ash, v5)
    local createElement_7 = react.createElement
    local Lightning = u65.Lightning
    v5 = {}
    if not v1 then
        header_6 = ""
    else
        header_6 = v1.header
    end
    v5.Header = header_6
    if not v1 then
        body_6 = ""
    else
        body_6 = v1.body
    end
    v5.Body = body_6
    if not v1 then
        v2 = false
    elseif v1.variant == "Lightning" then
        v2 = true
    end
    v5.Visible = v2
    v4.Lightning = createElement_7(Lightning, v5)
    local createElement_8 = react.createElement
    local Felled = u65.Felled
    v5 = {}
    if not v1 then
        header_7 = ""
    else
        header_7 = v1.header
    end
    v5.Header = header_7
    if not v1 then
        body_7 = ""
    else
        body_7 = v1.body
    end
    v5.Body = body_7
    if not v1 then
        v2 = false
    elseif v1.variant == "Felled" then
        v2 = true
    end
    v5.Visible = v2
    v4.Felled = createElement_8(Felled, v5)
    local createElement_9 = react.createElement
    local Location = u65.Location
    v5 = {}
    if not v1 then
        header_8 = ""
    else
        header_8 = v1.header
    end
    v5.Header = header_8
    if not v1 then
        body_8 = ""
    else
        body_8 = v1.body
    end
    v5.Body = body_8
    if not v1 then
        v2 = false
    elseif v1.variant == "Location" then
        v2 = true
    end
    v5.Visible = v2
    v4.Location = createElement_9(Location, v5)
    local createElement_10 = react.createElement
    local Chronicle = u65.Chronicle
    v5 = {}
    if not v1 then
        header_9 = ""
    else
        header_9 = v1.header
    end
    v5.Header = header_9
    if not v1 then
        body_9 = ""
    else
        body_9 = v1.body
    end
    v5.Body = body_9
    if not v1 then
        v2 = false
    else
        v2 = not (v1.variant ~= "Chronicle")
    end
    v5.Visible = v2
    v4.Chronicle = createElement_10(Chronicle, v5)
    return createElement("Frame", v3, v4)
end