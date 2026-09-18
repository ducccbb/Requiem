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
--      File: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs
--                              Dumped in 0.000210 seconds
--                          Bytecode version 9  |  1 functions

local PrimitiveControls = require(script.Controls.PrimitiveControls)
local DatatypeControls = require(script.Controls.DatatypeControls)
local AdvancedControls = require(script.Controls.AdvancedControls)
local StoryCreators = require(script.StoryCreators)
local ControlUtils = require(script.Controls.ControlUtils)
local ControlConversion = require(script.Controls.ControlConversion)
local Utils = require(script.Utils)
local Environment = require(script.Environment)
require(script.Types)
local Version = require(script.Version)
return {
    _version = Version,
    Boolean = PrimitiveControls.Boolean,
    Number = PrimitiveControls.Number,
    String = PrimitiveControls.String,
    Choose = AdvancedControls.Choose,
    EnumList = AdvancedControls.EnumList,
    Object = AdvancedControls.Object,
    RGBA = AdvancedControls.RGBA,
    Slider = AdvancedControls.Slider,
    Primitive = PrimitiveControls.Primitive,
    Advanced = AdvancedControls,
    Datatype = DatatypeControls,
    ListenControl = Utils.ListenControl,
    CreateControlStates = Utils.CreateControlStates,
    UpdateControlStates = Utils.UpdateControlStates,
    ControlGroup = ControlUtils.ControlGroup,
    Ordered = ControlUtils.Ordered,
    ConvertControl = ControlConversion.ConvertControl,
    CreateGenericStory = StoryCreators.CreateGenericStory,
    CreateReactStory = StoryCreators.CreateReactStory,
    CreateRoactStory = StoryCreators.CreateRoactStory,
    CreateFusionStory = StoryCreators.CreateFusionStory,
    CreateIrisStory = StoryCreators.CreateIrisStory,
    CreateVideStory = StoryCreators.CreateVideStory,
    Environment = Environment,
}