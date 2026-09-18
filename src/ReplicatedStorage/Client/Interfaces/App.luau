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
--                     File: ReplicatedStorage.Client.Interfaces.App
--                               Dumped in 0.00320 seconds
--                          Bytecode version 9  |  12 functions

local v1 = script
script = nil
local v2 = getfenv(0)
v2.script = nil
_G.script = nil
v2 = getfenv(0)
v2.getfenv = nil
local Players = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
v3 = v3:WaitForChild("Common")
local v4 = require(v3:WaitForChild("Constants"))
local v5 = game:GetService("ReplicatedStorage")
v5 = v5:WaitForChild("Common")
local Network = require(v5:WaitForChild("Network"))
local v6 = game:GetService("ReplicatedStorage")
v6 = v6:WaitForChild("Packages")
local react = require(v6:WaitForChild("react"))
local v7 = game:GetService("ReplicatedStorage")
v7 = v7:WaitForChild("Packages")
local u76 = require(v7:WaitForChild("react-roblox"))
local v8 = v1.Parent:WaitForChild("Components")
v8 = v8:WaitForChild("Primitives")
local Layer = require(v8:WaitForChild("Layer"))
local v9 = v1.Parent:WaitForChild("Routes")
v9 = v9:WaitForChild("Screen")
local Aimlabs = require(v9:WaitForChild("Aimlabs"))
local v10 = v1.Parent:WaitForChild("Components")
v10 = v10:WaitForChild("Screen")
v10 = v10:WaitForChild("Alert")
local AlertPopupPage = require(v10:WaitForChild("AlertPopupPage"))
local v11 = v1.Parent:WaitForChild("Components")
v11 = v11:WaitForChild("Screen")
local Anxiety = require(v11:WaitForChild("Anxiety"))
local v12 = v1.Parent:WaitForChild("Routes")
v12 = v12:WaitForChild("Screen")
local Auxiliary = require(v12:WaitForChild("Auxiliary"))
local v13 = v1.Parent:WaitForChild("Routes")
v13 = v13:WaitForChild("Screen")
local Awakening = require(v13:WaitForChild("Awakening"))
local v14 = v1.Parent:WaitForChild("Routes")
v14 = v14:WaitForChild("Screen")
v14 = v14:WaitForChild("Effects")
local BarScreenOverlay = require(v14:WaitForChild("BarScreenOverlay"))
local v15 = v1.Parent:WaitForChild("Routes")
v15 = v15:WaitForChild("Screen")
v15 = v15:WaitForChild("Effects")
local BlackScreenOverlay = require(v15:WaitForChild("BlackScreenOverlay"))
local v16 = v1.Parent:WaitForChild("Routes")
v16 = v16:WaitForChild("Screen")
v16 = v16:WaitForChild("Effects")
local BlinkScreenOverlay = require(v16:WaitForChild("BlinkScreenOverlay"))
local v17 = v1.Parent:WaitForChild("Routes")
v17 = v17:WaitForChild("Screen")
local Blood = require(v17:WaitForChild("Blood"))
local v18 = v1.Parent:WaitForChild("Routes")
v18 = v18:WaitForChild("Pages")
v18 = v18:WaitForChild("Book")
local Book = require(v18:WaitForChild("Book"))
local v19 = v1.Parent:WaitForChild("Routes")
v19 = v19:WaitForChild("Screen")
local Bossbar = require(v19:WaitForChild("Bossbar"))
local v20 = v1.Parent:WaitForChild("Routes")
v20 = v20:WaitForChild("Screen")
local Buffs = require(v20:WaitForChild("Buffs"))
local v21 = v1.Parent:WaitForChild("Routes")
v21 = v21:WaitForChild("Screen")
local Calculator = require(v21:WaitForChild("Calculator"))
local v22 = v1.Parent:WaitForChild("Routes")
v22 = v22:WaitForChild("Screen")
local Captions = require(v22:WaitForChild("Captions"))
local v23 = v1.Parent:WaitForChild("Routes")
v23 = v23:WaitForChild("Screen")
local Concussed = require(v23:WaitForChild("Concussed"))
local v24 = v1.Parent:WaitForChild("Routes")
v24 = v24:WaitForChild("Screen")
local Console = require(v24:WaitForChild("Console"))
local v25 = v1.Parent:WaitForChild("Routes")
v25 = v25:WaitForChild("Screen")
local ContextMenu = require(v25:WaitForChild("ContextMenu"))
local v26 = v1.Parent:WaitForChild("Routes")
v26 = v26:WaitForChild("Pages")
v26 = v26:WaitForChild("Corpse")
local Corpse = require(v26:WaitForChild("Corpse"))
local v27 = v1.Parent:WaitForChild("Components")
v27 = v27:WaitForChild("Screen")
local Damage = require(v27:WaitForChild("Damage"))
local v28 = v1.Parent:WaitForChild("Routes")
v28 = v28:WaitForChild("Screen")
local Deadzone = require(v28:WaitForChild("Deadzone"))
local v29 = v1.Parent:WaitForChild("Components")
v29 = v29:WaitForChild("Screen")
local Emote = require(v29:WaitForChild("Emote"))
local v30 = v1.Parent:WaitForChild("Routes")
v30 = v30:WaitForChild("Screen")
local Event = require(v30:WaitForChild("Event"))
local v31 = v1.Parent:WaitForChild("Routes")
v31 = v31:WaitForChild("Screen")
v31 = v31:WaitForChild("Eyecatchers")
local Eyecatcher = require(v31:WaitForChild("Eyecatcher"))
local v32 = v1.Parent:WaitForChild("Routes")
v32 = v32:WaitForChild("Screen")
local Fishing = require(v32:WaitForChild("Fishing"))
local v33 = v1.Parent:WaitForChild("Routes")
v33 = v33:WaitForChild("Screen")
local Flare = require(v33:WaitForChild("Flare"))
local v34 = v1.Parent:WaitForChild("Routes")
v34 = v34:WaitForChild("Screen")
v34 = v34:WaitForChild("Flashbacks")
local Flashback = require(v34:WaitForChild("Flashback"))
local v35 = v1.Parent:WaitForChild("Routes")
v35 = v35:WaitForChild("Screen")
local Freezing = require(v35:WaitForChild("Freezing"))
local v36 = v1.Parent:WaitForChild("Routes")
v36 = v36:WaitForChild("Screen")
local GrappleRange = require(v36:WaitForChild("GrappleRange"))
local v37 = v1.Parent:WaitForChild("Routes")
v37 = v37:WaitForChild("Screen")
local Health = require(v37:WaitForChild("Health"))
local v38 = v1.Parent:WaitForChild("Routes")
v38 = v38:WaitForChild("Screen")
local Horse = require(v38:WaitForChild("Horse"))
local v39 = v1.Parent:WaitForChild("Routes")
v39 = v39:WaitForChild("Screen")
local Indicator = require(v39:WaitForChild("Indicator"))
local v40 = v1.Parent:WaitForChild("Routes")
v40 = v40:WaitForChild("Screen")
local Input = require(v40:WaitForChild("Input"))
local v41 = v1.Parent:WaitForChild("Routes")
v41 = v41:WaitForChild("Screen")
local Keybinds = require(v41:WaitForChild("Keybinds"))
local v42 = v1.Parent:WaitForChild("Routes")
v42 = v42:WaitForChild("Screen")
local Knocked = require(v42:WaitForChild("Knocked"))
local v43 = v1.Parent:WaitForChild("Routes")
v43 = v43:WaitForChild("Screen")
local Language = require(v43:WaitForChild("Language"))
local v44 = v1.Parent:WaitForChild("Routes")
v44 = v44:WaitForChild("Screen")
local Leaderboard = require(v44:WaitForChild("Leaderboard"))
local v45 = v1.Parent:WaitForChild("Routes")
v45 = v45:WaitForChild("Screen")
local Loading = require(v45:WaitForChild("Loading"))
local v46 = v1.Parent:WaitForChild("Routes")
v46 = v46:WaitForChild("Screen")
v46 = v46:WaitForChild("Messages")
local Messages = require(v46:WaitForChild("Messages"))
local v47 = v1.Parent:WaitForChild("Routes")
v47 = v47:WaitForChild("Screen")
local Monologue = require(v47:WaitForChild("Monologue"))
local v48 = v1.Parent:WaitForChild("Routes")
v48 = v48:WaitForChild("Screen")
local Notifications = require(v48:WaitForChild("Notifications"))
local v49 = v1.Parent:WaitForChild("Routes")
v49 = v49:WaitForChild("Screen")
local Nourishment = require(v49:WaitForChild("Nourishment"))
local v50 = v1.Parent:WaitForChild("Routes")
v50 = v50:WaitForChild("Screen")
local Objective = require(v50:WaitForChild("Objective"))
local v51 = v1.Parent:WaitForChild("Routes")
v51 = v51:WaitForChild("Screen")
local Oxygen = require(v51:WaitForChild("Oxygen"))
local v52 = v1.Parent:WaitForChild("Routes")
v52 = v52:WaitForChild("Screen")
local Pamphlet = require(v52:WaitForChild("Pamphlet"))
local v53 = v1.Parent:WaitForChild("Routes")
v53 = v53:WaitForChild("Screen")
local Pending = require(v53:WaitForChild("Pending"))
local v54 = v1.Parent:WaitForChild("Components")
v54 = v54:WaitForChild("Screen")
local Radial = require(v54:WaitForChild("Radial"))
local v55 = v1.Parent:WaitForChild("Routes")
v55 = v55:WaitForChild("Screen")
local Recustomize = require(v55:WaitForChild("Recustomize"))
local v56 = v1.Parent:WaitForChild("Routes")
v56 = v56:WaitForChild("Screen")
local ReelingState = require(v56:WaitForChild("ReelingState"))
local v57 = v1.Parent:WaitForChild("Routes")
v57 = v57:WaitForChild("Screen")
local Remnants = require(v57:WaitForChild("Remnants"))
local v58 = v1.Parent:WaitForChild("Routes")
v58 = v58:WaitForChild("Screen")
local Requests = require(v58:WaitForChild("Requests"))
local v59 = v1.Parent:WaitForChild("Routes")
v59 = v59:WaitForChild("Screen")
local Shake = require(v59:WaitForChild("Shake"))
local v60 = v1.Parent:WaitForChild("Routes")
v60 = v60:WaitForChild("Screen")
local Shifter = require(v60:WaitForChild("Shifter"))
local v61 = v1.Parent:WaitForChild("Routes")
v61 = v61:WaitForChild("Screen")
local Skillcheck = require(v61:WaitForChild("Skillcheck"))
local v62 = v1.Parent:WaitForChild("Routes")
v62 = v62:WaitForChild("Screen")
local Squad = require(v62:WaitForChild("Squad"))
local v63 = v1.Parent:WaitForChild("Routes")
v63 = v63:WaitForChild("Screen")
local SquadInvites = require(v63:WaitForChild("SquadInvites"))
local v64 = v1.Parent:WaitForChild("Routes")
v64 = v64:WaitForChild("Screen")
local Statuses = require(v64:WaitForChild("Statuses"))
local v65 = v1.Parent:WaitForChild("Routes")
v65 = v65:WaitForChild("Screen")
local Toasts = require(v65:WaitForChild("Toasts"))
local v66 = v1.Parent:WaitForChild("Components")
v66 = v66:WaitForChild("Screen")
local Tooltips = require(v66:WaitForChild("Tooltips"))
local v67 = v1.Parent:WaitForChild("Routes")
v67 = v67:WaitForChild("Screen")
local Velocity = require(v67:WaitForChild("Velocity"))
local v68 = v1.Parent:WaitForChild("Routes")
v68 = v68:WaitForChild("Screen")
local Watermark = require(v68:WaitForChild("Watermark"))
local v69 = v1.Parent:WaitForChild("Routes")
v69 = v69:WaitForChild("Screen")
local Identification = require(v69:WaitForChild("Identification"))
local v70 = v1.Parent:WaitForChild("Routes")
v70 = v70:WaitForChild("Customization")
local Introduction = require(v70:WaitForChild("Introduction"))
local v71 = v1.Parent:WaitForChild("Routes")
v71 = v71:WaitForChild("Editor")
v71 = v71:WaitForChild("Builder")
local Root = require(v71:WaitForChild("Root"))
local v72 = v1.Parent:WaitForChild("Routes")
v72 = v72:WaitForChild("Editor")
local Root_2 = require(v72:WaitForChild("Root"))
local v73 = v1.Parent:WaitForChild("Routes")
v73 = v73:WaitForChild("Debug")
local Root_3 = require(v73:WaitForChild("Root"))
do
    local v74 = v1.Parent:WaitForChild("Routes")
    v74 = v74:WaitForChild("Pages")
    v74 = v74:WaitForChild("Overlays")
    local Compass = require(v74:WaitForChild("Compass"))
    local v75 = v1.Parent:WaitForChild("Routes")
    v75 = v75:WaitForChild("Pages")
    v75 = v75:WaitForChild("Overlays")
    local Hotbar = require(v75:WaitForChild("Hotbar"))
    local v76 = v1.Parent:WaitForChild("Routes")
    v76 = v76:WaitForChild("Administration")
    local CommandBar = require(v76:WaitForChild("CommandBar"))
    local v77 = v1.Parent:WaitForChild("Routes")
    v77 = v77:WaitForChild("Interactions")
    local Interaction = require(v77:WaitForChild("Interaction"))
    local v78 = v1.Parent:WaitForChild("Routes")
    v78 = v78:WaitForChild("Menu")
    local Menu = require(v78:WaitForChild("Menu"))
    local v79 = v1.Parent:WaitForChild("Routes")
    v79 = v79:WaitForChild("Pages")
    v79 = v79:WaitForChild("Tailor")
    local Accessory = require(v79:WaitForChild("Accessory"))
    local v80 = v1.Parent:WaitForChild("Routes")
    v80 = v80:WaitForChild("Pages")
    v80 = v80:WaitForChild("Trainer")
    local Balancer = require(v80:WaitForChild("Balancer"))
    local v81 = v1.Parent:WaitForChild("Routes")
    v81 = v81:WaitForChild("Screen")
    local CardViewport = require(v81:WaitForChild("CardViewport"))
    local v82 = v1.Parent:WaitForChild("Routes")
    v82 = v82:WaitForChild("Pages")
    v82 = v82:WaitForChild("Construction")
    local Construction = require(v82:WaitForChild("Construction"))
    local v83 = v1.Parent:WaitForChild("Routes")
    v83 = v83:WaitForChild("Pages")
    v83 = v83:WaitForChild("Crafting")
    local Crafting = require(v83:WaitForChild("Crafting"))
    local v84 = v1.Parent:WaitForChild("Routes")
    v84 = v84:WaitForChild("Pages")
    v84 = v84:WaitForChild("Enchantment")
    local Card = require(v84:WaitForChild("Card"))
    local v85 = v1.Parent:WaitForChild("Routes")
    v85 = v85:WaitForChild("Pages")
    v85 = v85:WaitForChild("Enchantment")
    local Enchantment = require(v85:WaitForChild("Enchantment"))
    local v86 = v1.Parent:WaitForChild("Routes")
    v86 = v86:WaitForChild("Screen")
    local Enchantments = require(v86:WaitForChild("Enchantments"))
    local v87 = v1.Parent:WaitForChild("Routes")
    v87 = v87:WaitForChild("Pages")
    v87 = v87:WaitForChild("Forgery")
    local Forgery = require(v87:WaitForChild("Forgery"))
    local v88 = v1.Parent:WaitForChild("Routes")
    v88 = v88:WaitForChild("Pages")
    v88 = v88:WaitForChild("Examination")
    v88 = v88:WaitForChild("Nape")
    local Nape = require(v88:WaitForChild("Nape"))
    local v89 = v1.Parent:WaitForChild("Routes")
    v89 = v89:WaitForChild("Pages")
    v89 = v89:WaitForChild("Examination")
    v89 = v89:WaitForChild("Quiz")
    local Quiz = require(v89:WaitForChild("Quiz"))
    local v90 = v1.Parent:WaitForChild("Routes")
    v90 = v90:WaitForChild("Pages")
    v90 = v90:WaitForChild("Refining")
    local Refining = require(v90:WaitForChild("Refining"))
    local v91 = v1.Parent:WaitForChild("Routes")
    v91 = v91:WaitForChild("Pages")
    v91 = v91:WaitForChild("Smithing")
    local Smithing = require(v91:WaitForChild("Smithing"))
    local v92 = v1.Parent:WaitForChild("Routes")
    v92 = v92:WaitForChild("Pages")
    v92 = v92:WaitForChild("Tailor")
    local StaffAccessory = require(v92:WaitForChild("StaffAccessory"))
    local v93 = v1.Parent:WaitForChild("Routes")
    v93 = v93:WaitForChild("Pages")
    v93 = v93:WaitForChild("Stores")
    local Store = require(v93:WaitForChild("Store"))
    local v94 = v1.Parent:WaitForChild("Routes")
    v94 = v94:WaitForChild("Pages")
    v94 = v94:WaitForChild("Tailor")
    local Tailor = require(v94:WaitForChild("Tailor"))
    local v95 = v1.Parent:WaitForChild("Routes")
    v95 = v95:WaitForChild("Pages")
    v95 = v95:WaitForChild("Tinkering")
    local Tinkering = require(v95:WaitForChild("Tinkering"))
    local v96 = v1.Parent:WaitForChild("Routes")
    v96 = v96:WaitForChild("Customization")
    local Customization = require(v96:WaitForChild("Customization"))
    local v97 = v1.Parent:WaitForChild("Routes")
    v97 = v97:WaitForChild("Customization")
    local Servers = require(v97:WaitForChild("Servers"))
    local v98 = v1.Parent:WaitForChild("Routes")
    v98 = v98:WaitForChild("Screen")
    local Wipe = require(v98:WaitForChild("Wipe"))
    local v99 = v1.Parent:WaitForChild("Routes")
    v99 = v99:WaitForChild("Screen")
    local Queue = require(v99:WaitForChild("Queue"))
    local v100 = v1.Parent:WaitForChild("Routes")
    v100 = v100:WaitForChild("Enchantments")
    local Circle = require(v100:WaitForChild("Circle"))
    local v101 = v1.Parent:WaitForChild("Routes")
    v101 = v101:WaitForChild("Enchantments")
    local Focusing = require(v101:WaitForChild("Focusing"))
    local v102 = v1.Parent:WaitForChild("Providers")
    local ContextMenuProvider = require(v102:WaitForChild("ContextMenuProvider"))
    local v103 = v1.Parent:WaitForChild("Providers")
    local InputPopupProvider = require(v103:WaitForChild("InputPopupProvider"))
    local v104 = v1.Parent:WaitForChild("Providers")
    local RemProvider = require(v104:WaitForChild("RemProvider"))
    local v105 = v1.Parent:WaitForChild("Providers")
    local SettingProvider = require(v105:WaitForChild("SettingProvider"))
    local v106 = v1.Parent:WaitForChild("Providers")
    local ThemeProvider = require(v106:WaitForChild("ThemeProvider"))
    local v107 = v1.Parent:WaitForChild("Providers")
    local ToastProvider = require(v107:WaitForChild("ToastProvider"))
    local v108 = v1.Parent:WaitForChild("Providers")
    local TooltipProvider = require(v108:WaitForChild("TooltipProvider"))
    local u1685 = game.PlaceId == v4.Places.Lobby
    local u1692 = game.PlaceId == v4.Places.Exam
    local function createLayer(p1, p2, p3, p4) -- Line: 155 -- upvalues: Layer (val)
        return Layer(p1, {DisplayOrder = p2}, p3, p4)
    end
    local function createLayerBasic(p1, p2, p3) -- Line: 160 -- upvalues: Layer (val)
        return Layer(p1, {}, p2, p3)
    end
    local function UniversalComponents(p1) -- Line: 165 -- upvalues: createLayer (val), Loading (val), BlackScreenOverlay (val), BarScreenOverlay (val), BlinkScreenOverlay (val), Toasts (val), AlertPopupPage (val), Tooltips (val), ContextMenu (val), Watermark (val), Emote (val), Radial (val), Input (val), Console (val)
        return {
            Loading = createLayer("Loading", 150, p1, Loading),
            Black = createLayer("Transition", 90, p1, BlackScreenOverlay),
            Bars = createLayer("Bars", 90, p1, BarScreenOverlay),
            Blink = createLayer("Blink", 19, p1, BlinkScreenOverlay),
            Toast = createLayer("Toasts", 150, p1, Toasts),
            Alert = createLayer("Alerts", 120, p1, AlertPopupPage),
            Tooltip = createLayer("Tooltips", 85, p1, Tooltips),
            ContextMenu = createLayer("Context", 30, p1, ContextMenu.ContextPage),
            Watermark = createLayer("Watermark", 100, p1, Watermark),
            Emote = createLayer("Emote", 50, p1, Emote),
            Radial = createLayer("Radial", 50, p1, Radial.Component),
            Input = createLayer("Input", 90, p1, Input),
            Console = createLayer("Console", 200, p1, Console),
        }
    end
    local function GameComponents(p1) -- Line: 184 -- upvalues: createLayer (val), Enchantments (val), Calculator (val), Damage (val), Pending (val), Event (val), Requests (val), Squad (val), SquadInvites (val), Notifications (val), Health (val), Knocked (val), createLayerBasic (val), Interaction (val), Monologue (val), Objective (val), Indicator (val), Messages (val), Anxiety (val), Skillcheck (val), Fishing (val), Aimlabs (val), Horse (val), Auxiliary (val), Remnants (val), Buffs (val), Eyecatcher (val), Flashback (val), Keybinds (val), Shifter (val), Recustomize (val), Bossbar (val), Captions (val), Identification (val), Language (val), Awakening (val), Book (val), Deadzone (val), Pamphlet (val), Corpse (val), Menu (val), react (val), Leaderboard (val), Blood (val), Concussed (val), Freezing (val), Nourishment (val), Oxygen (val), Statuses (val), Store (val), Enchantment (val), Card (val), Balancer (val), Tinkering (val), Crafting (val), Forgery (val), Smithing (val), Refining (val), Construction (val), Tailor (val), Accessory (val), StaffAccessory (val), Quiz (val), Flare (val), Hotbar (val), Compass (val), CommandBar (val), Root_2 (val), Root (val), Root_3 (val), Focusing (val), Circle (val), Shake (val), Velocity (val), GrappleRange (val), ReelingState (val), CardViewport (val)
        return {
            Enchantments = createLayer("Enchantments", 5, p1, Enchantments),
            Calculator = createLayer("Calculator", 31, p1, Calculator),
            DamagePage = createLayer("Damage", 30, p1, Damage),
            Pending = createLayer("Pending", 100, p1, Pending),
            EventPage = createLayer("Event", 40, p1, Event),
            Requests = createLayer("Requests", 100, p1, Requests),
            Squad = createLayer("Squad", 2, p1, Squad),
            SquadInvites = createLayer("SquadInvites", 100, p1, SquadInvites),
            Notifications = createLayer("Notifications", 100, p1, Notifications),
            Health = createLayer("Health", 20, p1, Health),
            Knocked = createLayer("Knocked", 20, p1, Knocked),
            Interaction = createLayerBasic("Interaction", p1, Interaction.Interaction),
            Monologue = createLayer("Monologue", 20, p1, Monologue),
            Objective = createLayer("Objective", 20, p1, Objective),
            Indicator = createLayer("Indicator", 10, p1, Indicator),
            Messages = createLayer("Messages", 100, p1, Messages),
            Anxiety = createLayer("Anxiety", 20, p1, Anxiety),
            Skillcheck = createLayer("Skillcheck", 20, p1, Skillcheck),
            Fishing = createLayer("Fishing", 21, p1, Fishing),
            Aimlabs = createLayer("Aimlabs", 20, p1, Aimlabs),
            Horse = createLayer("Horse", 2, p1, Horse),
            Auxiliary = createLayer("Auxiliary", 20, p1, Auxiliary),
            Remnants = createLayer("Remnants", 20, p1, Remnants),
            Buffs = createLayer("Buffs", 5, p1, Buffs),
            Eyecatcher = createLayer("Eyecatcher", 20, p1, Eyecatcher),
            Flashback = createLayer("Flashback", 20, p1, Flashback),
            Keybinds = createLayer("Keybinds", 20, p1, Keybinds),
            Shifter = createLayer("Shifter", 2, p1, Shifter),
            Recustomize = createLayer("Recustomize", 2, p1, Recustomize),
            Bossbar = createLayer("Bossbar", 2, p1, Bossbar),
            Captions = createLayer("Captions", 91, p1, Captions),
            Identification = createLayer("Identification", 120, p1, Identification),
            Language = createLayer("Language", 20, p1, Language),
            Awakening = createLayer("Awakening", 20, p1, Awakening),
            Book = createLayer("Book", 2, p1, Book),
            Deadzone = createLayer("Deadzone", 96, p1, Deadzone),
            Pamphlet = createLayer("Pamphlet", 2, p1, Pamphlet),
            Corpse = createLayer("Corpse", 10, p1, Corpse),
            Menu = createLayer("Menu", 3, p1, Menu.Menu),
            MenuPages = react.createElement(Menu.Pages),
            Leaderboard = createLayer("Leaderboard", 2, p1, Leaderboard),
            Concussed = createLayer("Blood", 95, p1, Blood),
            Blood = createLayer("Concussed", 95, p1, Concussed),
            Freezing = createLayer("Freezing", 25, p1, Freezing),
            Nourishment = createLayer("Nourishment", 24, p1, Nourishment),
            Oxygen = createLayer("Oxygen", 24, p1, Oxygen),
            Statuses = createLayer("Statuses", 1, p1, Statuses),
            Store = createLayer("Store", 2, p1, Store),
            EnchantmentPage = createLayer("Enchantment", 7, p1, Enchantment),
            EnchantmentCard = createLayer("EnchantmentCard", 201, p1, Card),
            Balancer = createLayer("Balancer", 2, p1, Balancer),
            Tinkering = createLayer("Tinkering", 2, p1, Tinkering),
            Crafting = createLayer("Crafting", 2, p1, Crafting),
            Forgery = createLayer("Forgery", 2, p1, Forgery),
            Smithing = createLayer("Smithing", 2, p1, Smithing),
            Refining = createLayer("Refining", 2, p1, Refining),
            Construction = createLayer("Construction", 2, p1, Construction),
            Tailor = createLayer("Tailor", 2, p1, Tailor),
            Accessory = createLayer("Accessory", 2, p1, Accessory),
            StaffAccessory = createLayer("StaffAccessory", 2, p1, StaffAccessory),
            Quiz = createLayer("Quiz", 5, p1, Quiz),
            Flare = createLayer("Flare", 5, p1, Flare),
            Hotbar = createLayerBasic("Hotbar", p1, Hotbar),
            Compass = createLayerBasic("Compass", p1, Compass),
            CommandBar = createLayer("CommandBar", 120, p1, CommandBar),
            Editor = createLayer("Editor", 80, p1, Root_2),
            Builder = createLayer("Builder", 80, p1, Root),
            Debugger = createLayer("Debugger", 80, p1, Root_3),
            Focusing = createLayerBasic("Focusing", p1, Focusing),
            Circle = createLayerBasic("Circle", p1, Circle),
            Shake = createLayerBasic("Shake", p1, Shake),
            Velocity = createLayerBasic("Velocity", p1, Velocity),
            GrappleRange = createLayerBasic("GrappleRange", p1, GrappleRange),
            ReelingState = createLayerBasic("ReelingState", p1, ReelingState),
            CardViewport = react.createElement(CardViewport),
        }
    end
    local function LobbyComponents(p1) -- Line: 286 -- upvalues: createLayer (val), Customization (val), createLayerBasic (val), Servers (val), Introduction (val), Queue (val), Wipe (val)
        return {
            Customization = createLayer("Customization", 20, p1, Customization),
            Servers = createLayerBasic("Servers", p1, Servers),
            Introduction = createLayer("Introduction", 91, p1, Introduction),
            Queue = createLayer("Queue", 99, p1, Queue),
            Wipe = createLayer("Wipe", 100, p1, Wipe),
        }
    end
    local function ExamComponents(p1) -- Line: 297 -- upvalues: createLayer (val), Nape (val), Calculator (val), Damage (val), Balancer (val)
        return {Nape = createLayer("Nape", 15, p1, Nape), Calculator = createLayer("Calculator", 31, p1, Calculator), DamagePage = createLayer("Damage", 30, p1, Damage), Balancer = createLayer("Balancer", 2, p1, Balancer)}
    end
    local u1891 = react.memo(function(p1) -- Line: 307 -- upvalues: react (val)
        return react.createElement(react.Fragment, nil, p1.components)
    end)
    local function App(p1) -- Line: 311 -- upvalues: react (val), UniversalComponents (val), u1685 (val), u1692 (val), GameComponents (val), LobbyComponents (val), ExamComponents (val), RemProvider (val), SettingProvider (val), ToastProvider (val), TooltipProvider (val), ThemeProvider (val), InputPopupProvider (val), ContextMenuProvider (val), u1891 (val)
        local root = p1.root
        local v1 = react.useMemo(function() -- Line: 315 -- upvalues: UniversalComponents (upval), root (val), u1685 (upval), u1692 (upval), GameComponents (upval), LobbyComponents (upval), ExamComponents (upval)
            local v1 = {}
            for k, v in pairs(UniversalComponents(root)) do
                v1[k] = v
            end
            if not u1685 and not u1692 then
                for k2, i in pairs(GameComponents(root)) do
                    v1[k2] = i
                end
            end
            if u1685 then
                for k3, j in pairs(LobbyComponents(root)) do
                    v1[k3] = j
                end
            end
            if u1692 then
                for k4, k5 in pairs(ExamComponents(root)) do
                    v1[k4] = k5
                end
            end
            return v1
        end, {root})
        return react.createElement(RemProvider.RemProvider, {}, {Settings = react.createElement(SettingProvider.SettingProvider, {}, {Toast = react.createElement(ToastProvider.ToastProvider, {}, {Tooltip = react.createElement(TooltipProvider.TooltipProvider, {}, {Theme = react.createElement(ThemeProvider.ThemeProvider, {}, {Inputs = react.createElement(InputPopupProvider.InputProvider, {}, {ContextMenu = react.createElement(ContextMenuProvider.ContextMenuProvider, {}, {Components = react.createElement(u1891, {components = v1})})})})})})})})
    end
    return function() -- Line: 367 -- upvalues: Players (val), u76 (val), react (val), App (val), Network (val)
        local function create() -- Line: 368 -- upvalues: Players (upval), u76 (upval), react (upval), App (upval)
            local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
            local v1 = {
                "Freecam",
                "Teleport",
                "Loading",
                "ExperienceChat",
                "BubbleChat",
            }
            for i, v in ipairs(PlayerGui:GetChildren()) do
                if not (table.find(v1, v.Name)) then
                    v:Destroy()
                end
            end
            local Folder = Instance.new("Folder")
            local v2 = u76.createRoot(Folder)
            v2:render(react.createElement(App, {root = v2}))
            return Folder
        end
        if Network.loaded:getStatus() == "Resolved" then
            return create()
        end
        Network.loaded:andThen(create)
    end
end