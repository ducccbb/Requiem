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
--                     File: ReplicatedStorage.Common.Types.Settings
--                               Dumped in 0.00247 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local v2 = {}
local v3 = {}
v3["Chunk Loading"] = {
    {
        Name = "Chunk Loading",
        Description = "Do you wish to enable chunk loading?",
        Value = 0,
        Unique = 51,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Render Distance",
        Description = "How many chunks do you wish to load?",
        Value = 16,
        Unique = 1,
        Metadata = {Type = "Slider", Min = 4, Max = 32},
    },
    {
        Name = "Render Batching",
        Description = "What's the maximum amount of chunks per frame?",
        Value = 5,
        Unique = 2,
        Metadata = {Type = "Slider", Min = 1, Max = 16},
    },
    {
        Name = "Render Batch Delay",
        Description = "How many frames do you wish to wait before rendering the next batch?",
        Value = 0,
        Unique = 3,
        Metadata = {Type = "Slider", Min = 0, Max = 60},
    },
}
v3["Rendering Quality"] = {
    {
        Name = "Display Textures",
        Description = "Do you wish to display ROBLOX asset textures?",
        Value = 1,
        Unique = 4,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Hide Low Detail Props",
        Description = "Do you wish to hide low detail props?",
        Value = 0,
        Unique = 50,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Visual Effect Textures",
        Description = "Do you wish to hide low quality visual effects?",
        Value = 0,
        Unique = 5,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Light Sources",
        Description = "Do you wish to hide exterior light sources?",
        Value = 0,
        Unique = 69,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Rain Detail",
        Description = "How detailed do you wish for the rain to be?",
        Value = 40,
        Unique = 49,
        Metadata = {Type = "Slider", Min = 0, Max = 100},
    },
    {
        Name = "Show Wind Particles",
        Description = "Do you wish to display wind particles?",
        Value = 1,
        Unique = 66,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Play Stationary Animations",
        Description = "Do you wish to play stationary animations?",
        Value = 1,
        Unique = 71,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Enable Seating Interaction",
        Description = "Treat any seat as an interaction, rather than touching it and sitting on it.",
        Value = 0,
        Unique = 74,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Smart Bones",
        Description = "Do you wish to enable SmartBone physics on your character?",
        Value = 1,
        Unique = 73,
        Metadata = {Type = "Boolean"},
    },
}
v3["Graphic Content"] = {
    {
        Name = "Gore Enabled",
        Description = "Do you wish to display and show gore?",
        Value = 1,
        Unique = 6,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Blood Enabled",
        Description = "Do you wish to display and show blood?",
        Value = 1,
        Unique = 7,
        Metadata = {Type = "Boolean"},
    },
    {
        Name = "Titan Clothing",
        Description = "Do you wish for Titans to wear clothing?",
        Value = 1,
        Unique = 8,
        Metadata = {Type = "Boolean"},
    },
}
v2.Graphics = v3
v3 = {}
v3["Sound Effects"] = {
    {
        Name = "Sound Effects Volume",
        Description = "How loud do you wish for sound effects to be?",
        Value = 0.5,
        Unique = 9,
        Metadata = {Type = "Slider", Min = 0, Max = 1},
    },
    {
        Name = "Ambience Volume",
        Description = "How loud do you wish for ambience to be?",
        Value = 0.5,
        Unique = 70,
        Metadata = {Type = "Slider", Min = 0, Max = 1},
    },
}
v3.Music = {
    {
        Name = "Music Volume",
        Description = "How loud do you wish for music to be?",
        Value = 0.5,
        Unique = 10,
        Metadata = {Type = "Slider", Min = 0, Max = 1},
    },
}
v3.Footsteps = {
    {
        Name = "Footstep Volume",
        Description = "How loud do you wish for footstep sounds to be?",
        Value = 2,
        Unique = 53,
        Metadata = {Type = "Slider", Min = 0, Max = 3},
    },
}
v2.Audio = v3
v2.Interface = {
    Visuals = {
        {
            Name = "Theme",
            Description = "What interface theme do you wish to use?",
            Value = 1,
            Unique = 11,
            Metadata = {
                Type = "Dropdown",
                Options = {
                    "Requiem",
                    "Charcoal",
                    "Midnight",
                    "Stationary",
                    "Freedom",
                    "Slate",
                    "Moss",
                },
            },
        },
        {
            Name = "Dopamine Bubble",
            Description = "When you have an unclaimed enchantment a bubble to redeem will show up.",
            Value = 1,
            Unique = 31,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Grapple Range Display",
            Description = "Show grapple range under your cursor.",
            Value = 1,
            Unique = 76,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Enchantment Position",
            Description = "Where do you wish to display the enchantment position?",
            Value = 1,
            Unique = 54,
            Metadata = {
                Type = "Dropdown",
                Options = {"Center", "Bottom Right"},
            },
        },
        {
            Name = "Titan Blood",
            Description = "Titan blood appears on your screen as a kill indicator",
            Value = 1,
            Unique = 33,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Kill Saturation",
            Description = "Will your screen flash a saturation effect when you kill a player?",
            Value = 1,
            Unique = 47,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Kill Indicator",
            Description = "What version of kill indicator do you wish to use?",
            Value = 1,
            Unique = 34,
            Metadata = {
                Type = "Dropdown",
                Options = {"Text", "Splatter", "Simulator"},
            },
        },
        {
            Name = "Custom Cursor",
            Description = "Use a custom cursor instead of the default ROBLOX cursor.",
            Value = 0,
            Unique = 52,
            Metadata = {Type = "Number"},
        },
    },
    Messages = {
        {
            Name = "Use Fullscreen Messages",
            Description = "Use a fullscreen message popup, otherwise it will use a popup at the bottom of the screen.",
            Value = 1,
            Unique = 42,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Message Styling",
            Description = "Which system message styling do you wish to use?",
            Value = 2,
            Unique = 45,
            Metadata = {
                Type = "Dropdown",
                Options = {"Future", "Vintage"},
            },
        },
        {
            Name = "Message Scale",
            Description = "The scale of the message system, scaling the popup, or the text size.",
            Value = 1,
            Unique = 43,
            Metadata = {Type = "Slider", Min = 0.5, Max = 1.5},
        },
        {
            Name = "Message Transparency",
            Description = "The transparency of the background of the message system.",
            Value = 0.175,
            Unique = 44,
            Metadata = {Type = "Slider", Min = 0, Max = 1},
        },
        {
            Name = "Auto Grammar",
            Description = "How strict should the automatic grammar correction be in chat?",
            Value = 3,
            Unique = 68,
            Metadata = {
                Type = "Dropdown",
                Options = {"Disabled", "Low", "Medium", "High"},
            },
        },
    },
    Performance = {
        {
            Name = "Instant Animation",
            Description = "Do you wish to skip the animation when opening the interface?",
            Value = 0,
            Unique = 12,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Render Item Viewports",
            Description = "Do you wish to render item viewports?",
            Value = 1,
            Unique = 38,
            Metadata = {Type = "Boolean"},
        },
    },
}
v2.Gear = {
    Toggles = {
        {
            Name = "Toggle Slacking",
            Description = "If enabled then slacking will be turned on and off with a single keystroke.",
            Value = 0,
            Unique = 13,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Toggle Reeling",
            Description = "If enabled then reeling will be turned on and off with a single keystroke.",
            Value = 0,
            Unique = 14,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Automatic Wall Running",
            Description = "If your camera remains parallel to a large flat surface, you will automatically run on it.",
            Value = 0,
            Unique = 15,
            Metadata = {Type = "Boolean"},
        },
        {
            Name = "Show Reeling State",
            Description = "Show a reeling on/off indicator above your inventory while your handles are out.",
            Value = 0,
            Unique = 77,
            Metadata = {Type = "Boolean"},
        },
    },
}
v3 = {}
local v4 = {}
local v5 = {
    Name = "Enable Slacking",
    Description = "Will turn on slacking, if toggled slacking is enabled then press again to disable, otherwise hold.",
    Unique = 17,
    Value = Enum.KeyCode.LeftControl.Value,
    Metadata = {Type = "Keybind"},
}
local v6 = {
    Name = "Shoot Left Grapple",
    Description = "Shoot your left grapple out of your gear.",
    Unique = 18,
    Value = Enum.KeyCode.Q.Value,
    Metadata = {Type = "Keybind"},
}
local v7 = {
    Name = "Shoot Right Grapple",
    Description = "Shoot your right grapple out of your gear.",
    Unique = 19,
    Value = Enum.KeyCode.E.Value,
    Metadata = {Type = "Keybind"},
}
local v8 = {
    Name = "Gas Boost",
    Description = "Eject bursts of gas from your gear to move faster.",
    Unique = 20,
    Value = Enum.KeyCode.Space.Value,
    Metadata = {Type = "Keybind"},
}
local v9 = {
    Name = "Equip Handles",
    Description = "Take your handles off of your holster belt.",
    Unique = 21,
    Value = Enum.KeyCode.H.Value,
    Metadata = {Type = "Keybind"},
}
local v10 = {
    Name = "Equip Blades",
    Description = "Take blades out from your blade boxes.",
    Unique = 22,
    Value = Enum.KeyCode.R.Value,
    Metadata = {Type = "Keybind"},
}
local v11 = {
    Name = "Remove Gear",
    Description = "Take off all of your gear.",
    Unique = 30,
    Value = Enum.KeyCode.L.Value,
    Metadata = {Type = "Keybind"},
}
local v12 = {
    Name = "Check Gas",
    Description = "Checks your current gas levels.",
    Unique = 35,
    Value = Enum.KeyCode.G.Value,
    Metadata = {Type = "Keybind"},
}
local v13 = {
    Name = "Blade Parry",
    Description = "Parry an opponent's attack.",
    Unique = 39,
    Value = Enum.KeyCode.F.Value,
    Metadata = {Type = "Keybind"},
}
v4[1] = {
    Name = "Enable Reeling",
    Description = "Will turn on reeling, if toggled reeling is enabled then press again to disable, otherwise hold.",
    Unique = 16,
    Value = Enum.KeyCode.LeftShift.Value,
    Metadata = {Type = "Keybind"},
}
v4[2] = v5
v4[3] = v6
v4[4] = v7
v4[5] = v8
v4[6] = v9
v4[7] = v10
v4[8] = v11
v4[9] = v12
v4[10] = v13
v3.Gear = v4
v4 = {}
v5 = {
    Name = "Sprint",
    Description = "Begin running faster until entering a sprint.",
    Unique = 24,
    Value = Enum.KeyCode.LeftShift.Value,
    Metadata = {Type = "Keybind"},
}
v6 = {
    Name = "View Names",
    Description = "View the names of people you are familiar with.",
    Unique = 29,
    Value = Enum.KeyCode.N.Value,
    Metadata = {Type = "Keybind"},
}
v7 = {
    Name = "Staff Editor",
    Description = "If you're a staff, enter staff editor mode.",
    Unique = 41,
    Value = Enum.KeyCode.Backquote.Value,
    Metadata = {Type = "Keybind"},
}
v8 = {
    Name = "Change Language",
    Description = "Change your current spoken language.",
    Unique = 36,
    Value = Enum.KeyCode.RightBracket.Value,
    Metadata = {Type = "Keybind"},
}
v9 = {
    Name = "Carry",
    Description = "Request to carry a player.",
    Unique = 37,
    Value = Enum.KeyCode.P.Value,
    Metadata = {Type = "Keybind"},
}
v10 = {
    Name = "Plot Editor",
    Description = "Enter the plot editor mode while on a plot.",
    Unique = 46,
    Value = Enum.KeyCode.LeftBracket.Value,
    Metadata = {Type = "Keybind"},
}
v11 = {
    Name = "Toggle Hood",
    Description = "Toggle your hood.",
    Unique = 63,
    Value = Enum.KeyCode.B.Value,
    Metadata = {Type = "Keybind"},
}
v12 = {
    Name = "Crouch",
    Description = "Enter a prone state during the duration of the keybind being held.",
    Unique = 67,
    Value = Enum.KeyCode.LeftControl.Value,
    Metadata = {Type = "Keybind"},
}
v13 = {
    Name = "Dump Logs",
    Description = "Dump logs to the console.",
    Unique = 32,
    Value = Enum.KeyCode.F10.Value,
    Metadata = {Type = "Keybind"},
}
local v14 = {
    Name = "Dump Client State",
    Description = "Dump the client state to the console.",
    Unique = 40,
    Value = Enum.KeyCode.F8.Value,
    Metadata = {Type = "Keybind"},
}
local v15 = {
    Name = "Debug Editor",
    Description = "Enter the debug editor mode.",
    Unique = 72,
    Value = Enum.KeyCode.F3.Value,
    Metadata = {Type = "Keybind"},
}
v4[1] = {
    Name = "Summon Companion",
    Description = "Summon a horse or other active companions.",
    Unique = 23,
    Value = Enum.KeyCode.U.Value,
    Metadata = {Type = "Keybind"},
}
v4[2] = v5
v4[3] = v6
v4[4] = v7
v4[5] = v8
v4[6] = v9
v4[7] = v10
v4[8] = v11
v4[9] = v12
v4[10] = v13
v4[11] = v14
v4[12] = v15
v3.Miscellaneous = v4
v4 = {}
v5 = {
    Name = "Emote",
    Description = "Open the emote menu.",
    Unique = 48,
    Value = Enum.KeyCode.K.Value,
    Metadata = {Type = "Keybind"},
}
v6 = {
    Name = "Interact",
    Description = "Interact with an object.",
    Unique = 64,
    Value = Enum.KeyCode.E.Value,
    Metadata = {Type = "Keybind"},
}
v7 = {
    Name = "Toggle Backpack",
    Description = "Open and close the quick-access backpack panel.",
    Unique = 78,
    Value = Enum.KeyCode.Backquote.Value,
    Metadata = {Type = "Keybind"},
}
v4[1] = {
    Name = "Open Menu",
    Description = "Open the main menu.",
    Unique = 25,
    Value = Enum.KeyCode.Tab.Value,
    Metadata = {Type = "Keybind"},
}
v4[2] = v5
v4[3] = v6
v4[4] = v7
v3.Interface = v4
v4 = {}
v5 = {
    Name = "Musket Aim",
    Description = "Aim your musket.",
    Unique = 27,
    Value = Enum.KeyCode.F.Value,
    Metadata = {Type = "Keybind"},
}
v6 = {
    Name = "Musket Reload",
    Description = "Reload your musket.",
    Unique = 28,
    Value = Enum.KeyCode.R.Value,
    Metadata = {Type = "Keybind"},
}
v7 = {
    Name = "Cancel Action",
    Description = "Cancel the current action.",
    Unique = 65,
    Value = Enum.KeyCode.Space.Value,
    Metadata = {Type = "Keybind"},
}
v4[1] = {
    Name = "Bandage Self Heal",
    Description = "Heal yourself with a bandage.",
    Unique = 26,
    Value = Enum.KeyCode.Z.Value,
    Metadata = {Type = "Keybind"},
}
v4[2] = v5
v4[3] = v6
v4[4] = v7
v3.Tools = v4
v4 = {}
v5 = {
    Name = "Cannon Rotate Right",
    Description = "Rotate the cannon to the right.",
    Unique = 56,
    Value = Enum.KeyCode.D.Value,
    Metadata = {Type = "Keybind"},
}
v6 = {
    Name = "Cannon Barrel Up",
    Description = "Rotate the cannon barrel up.",
    Unique = 58,
    Value = Enum.KeyCode.W.Value,
    Metadata = {Type = "Keybind"},
}
v7 = {
    Name = "Cannon Barrel Down",
    Description = "Rotate the cannon barrel down.",
    Unique = 59,
    Value = Enum.KeyCode.S.Value,
    Metadata = {Type = "Keybind"},
}
v8 = {
    Name = "Cannon Fire",
    Description = "Fire the cannon.",
    Unique = 57,
    Value = Enum.KeyCode.F.Value,
    Metadata = {Type = "Keybind"},
}
v9 = {
    Name = "Cannon Dismount",
    Description = "Dismount from the cannon.",
    Unique = 60,
    Value = Enum.KeyCode.LeftControl.Value,
    Metadata = {Type = "Keybind"},
}
v10 = {
    Name = "Cannon Move Right",
    Description = "Move the cannon to the right.",
    Unique = 61,
    Value = Enum.KeyCode.E.Value,
    Metadata = {Type = "Keybind"},
}
v11 = {
    Name = "Cannon Move Left",
    Description = "Move the cannon to the left.",
    Unique = 62,
    Value = Enum.KeyCode.Q.Value,
    Metadata = {Type = "Keybind"},
}
v4[1] = {
    Name = "Cannon Rotate Left",
    Description = "Rotate the cannon to the left.",
    Unique = 55,
    Value = Enum.KeyCode.A.Value,
    Metadata = {Type = "Keybind"},
}
v4[2] = v5
v4[3] = v6
v4[4] = v7
v4[5] = v8
v4[6] = v9
v4[7] = v10
v4[8] = v11
v3.Cannons = v4
v2.Keybinds = v3
return {
    Categories = {"Graphics", "Audio", "Controls", "Interface"},
    Settings = v2,
}