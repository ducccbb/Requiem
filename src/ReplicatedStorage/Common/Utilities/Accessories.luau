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
--                 File: ReplicatedStorage.Common.Utilities.Accessories
--                              Dumped in 0.000393 seconds
--                          Bytecode version 9  |  5 functions

local findFirstMatchingAttachment
script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
function weldAttachments(p1, p2) -- Line: 9
    local Weld = Instance.new("Weld")
    Weld.Part0 = p1.Parent
    Weld.Part1 = p2.Parent
    Weld.C0 = p1.CFrame
    Weld.C1 = p2.CFrame
    Weld.Parent = p1.Parent
    return Weld
end
local function buildWeld(p1, p2, p3, p4, p5, p6) -- Line: 19
    local Weld = Instance.new("Weld")
    Weld.Name = p1
    Weld.Part0 = p3
    Weld.Part1 = p4
    Weld.C0 = p5
    Weld.C1 = p6
    Weld.Parent = p2
    return Weld
end
function findFirstMatchingAttachment(p1, p2) -- Line: 30 -- upvalues: findFirstMatchingAttachment (val)
    local v1
    local v2 = p2
    for k, v in pairs(p1:GetChildren()) do
        if v:IsA("Attachment") and v.Name == v2 then
            return v
        end
        if not (v:IsA("Accoutrement")) and not (v:IsA("Tool")) then
            v1 = findFirstMatchingAttachment(v, v2)
            if v1 then
                return v1
            end
        end
    end
    return nil
end
function addAccoutrement(p1, p2) -- Line: 45 -- upvalues: findFirstMatchingAttachment (val), buildWeld (val)
    p2.Parent = p1
    local Handle = p2:FindFirstChild("Handle")
    if not Handle then
        return
    end
    local Attachment = Handle:FindFirstChildOfClass("Attachment")
    if Attachment then
        local v1 = findFirstMatchingAttachment(p1, Attachment.Name)
        if not v1 then
            return
        end
        weldAttachments(v1, Attachment)
        return
    end
    local Head = p1:FindFirstChild("Head")
    if Head then
        local v2 = CFrame.new(0, 0.5, 0)
        buildWeld("HeadWeld", Head, Head, Handle, v2, p2.AttachmentPoint)
    end
end
return {addAccoutrement = addAccoutrement}