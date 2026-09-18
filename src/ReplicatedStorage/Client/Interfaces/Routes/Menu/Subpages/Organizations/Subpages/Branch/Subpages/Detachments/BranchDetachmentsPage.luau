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
--File: ReplicatedStorage.Client.Interfaces.Routes.Menu.Subpages.Organizations.Subpages.Branch.Subpages.Detachments.BranchDetachmentsPage
--                              Dumped in 0.000832 seconds
--                          Bytecode version 9  |  3 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local react = require(Packages:WaitForChild("react"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local Common = ReplicatedStorage_2:WaitForChild("Common")
local Network = Common:WaitForChild("Network")
local Namespaces = Network:WaitForChild("Namespaces")
require(Namespaces:WaitForChild("Branch"))
local Subpages = v1.Parent:WaitForChild("Subpages")
local BranchDetachmentOverviewPage = require(Subpages:WaitForChild("BranchDetachmentOverviewPage"))
local Subpages_2 = v1.Parent:WaitForChild("Subpages")
local BranchDetachmentsMainPage = require(Subpages_2:WaitForChild("BranchDetachmentsMainPage"))
return function(p1) -- Line: 32 -- upvalues: react (val), BranchDetachmentsMainPage (val), BranchDetachmentOverviewPage (val)
    local u5, v1
    v1, u5 = react.useState(nil)
    local v2 = {}
    local v3 = {}
    local Enabled = p1.Enabled
    if Enabled then
        Enabled = v1 == nil
    end
    v3.Enabled = Enabled
    local Selected = p1.Selected
    if Selected then
        Selected = v1 == nil
    end
    v3.Selected = Selected
    v3.Branch = p1.Branch
    v3.Clicked = u5
    v2.Main = react.createElement(BranchDetachmentsMainPage, v3)
    v3 = {}
    local Enabled_2 = p1.Enabled
    if Enabled_2 then
        Enabled_2 = v1 ~= nil
    end
    v3.Enabled = Enabled_2
    local Selected_2 = p1.Selected
    if Selected_2 then
        Selected_2 = v1 ~= nil
    end
    v3.Selected = Selected_2
    v3.Branch = p1.Branch
    v3.Detachment = v1
    function v3.Returned() -- Line: 51 -- upvalues: u5 (val)
        u5(nil)
    end
    v2.Overview = react.createElement(BranchDetachmentOverviewPage, v3)
    return react.createElement(react.Fragment, {}, v2)
end