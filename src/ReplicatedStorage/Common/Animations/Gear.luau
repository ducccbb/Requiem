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
--                    File: ReplicatedStorage.Common.Animations.Gear
--                              Dumped in 0.000436 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    Idle = "rbxassetid://16983783147",
    Walk = "rbxassetid://16983788695",
    Sprint = "rbxassetid://16983785906",
    Idles = {"rbxassetid://103759147046567", "rbxassetid://82086001772577", "rbxassetid://123384480210108"},
    Unholster = {Default = "rbxassetid://16898597465", Blades = "rbxassetid://78822368398809"},
    Holster = {Default = "rbxassetid://16898586866", Blades = "rbxassetid://102338460501644"},
    Slide = "rbxassetid://132423694185606",
    Shake = "rbxassetid://109511203443423",
    Landing = {Running = "rbxassetid://121513467674255"},
    Draw = {Charge = "rbxassetid://95271646757817", Slash = "rbxassetid://72771561922649"},
    Blades = {
        Sheathe = "rbxassetid://17018418849",
        Unsheathe = "rbxassetid://88347195175417",
        Blocking = "rbxassetid://84018799124207",
        Swings = {
            Ground = {"rbxassetid://96150550684216", "rbxassetid://107395560572172", "rbxassetid://94107418581065"},
            Air = {"rbxassetid://78407720926422", "rbxassetid://106676784817648"},
        },
    },
    Clashes = {Left = "rbxassetid://131550269550719", Right = "rbxassetid://110632561267530"},
    Grapples = {
        Ground = {Left = "rbxassetid://78675393507059", Right = "rbxassetid://99380249395011"},
        Air = {
            Left = "rbxassetid://139930780675290",
            Right = "rbxassetid://118570445218661",
            Behind = {Left = "rbxassetid://132038296946147", Right = "rbxassetid://82738426470734 "},
            Directional = {Left = "rbxassetid://78861105727492", Right = "rbxassetid://126810877940962 "},
            Upward = {Left = "rbxassetid://73461427754685", Right = "rbxassetid://121458092710909"},
        },
        Double = {"rbxassetid://134125991831718", "rbxassetid://128488196778361", "rbxassetid://133017397454538"},
        Releases = {
            Left = {"rbxassetid://16899902126", "rbxassetid://16899905457", "rbxassetid://16899907657"},
            Right = {"rbxassetid://16899909637", "rbxassetid://16899911826", "rbxassetid://16899914089"},
        },
        Orbit = {Left = "rbxassetid://116102028771421", Right = "rbxassetid://118192530550579"},
        Idle = {
            Left = {Boosting = "rbxassetid://76656511162291", Default = "rbxassetid://122992549709727"},
            Right = {Boosting = "rbxassetid://111466842883640", Default = "rbxassetid://99726450792863"},
        },
    },
    Recoveries = {"rbxassetid://120620528209768"},
    Launches = {"rbxassetid://98227138288925", "rbxassetid://108398223984723"},
    Walls = {
        Release = {Left = "rbxassetid://16942767247", Right = "rbxassetid://16942769926"},
        Idles = {Left = "rbxassetid://16941677482", Right = "rbxassetid://16941688366"},
    },
    Hanging = {Idle = "rbxassetid://76800421805173", Start = "rbxassetid://89619930509035"},
    Dashes = {Forward = "rbxassetid://16954125654", Backward = "rbxassetid://16954122718", Left = "rbxassetid://16954128107", Right = "rbxassetid://16954129829"},
    Stances = {
        Crossguard = {
            Idle = "rbxassetid://130653220948285",
            Blades = {
                Swings = {
                    Air = {"rbxassetid://86336690808665", "rbxassetid://85287366164918"},
                },
            },
            Grapples = {
                Double = {"rbxassetid://74187733545663"},
            },
        },
        Tempo = {
            Idle = "rbxassetid://132464820072885",
            Blades = {
                Swings = {
                    Air = {"rbxassetid://102346761719959", "rbxassetid://135697384008415"},
                },
            },
            Grapples = {
                Double = {"rbxassetid://130669624827630"},
            },
        },
        Burst = {
            Idle = "rbxassetid://127601956186671",
            Blades = {
                Swings = {
                    Air = {"rbxassetid://128445066928907", "rbxassetid://73922915237760"},
                },
            },
            Grapples = {
                Double = {"rbxassetid://87282893325731"},
            },
        },
    },
    Counter = "rbxassetid://113241550259085",
    Parry = "rbxassetid://89583460276496",
    Parried = "rbxassetid://84390695370400",
    Forward = "rbxassetid://92644101274615",
    Trainer = "rbxassetid://117217026650164",
    RefillAction = "rbxassetid://132402793312166",
    RefillLoop = "rbxassetid://70843183486491",
    Refill = "rbxassetid://85198753834010",
    BladeRefill = "rbxassetid://87858782212766",
    CheckGas = "rbxassetid://79580064561827",
    CheckGasHanging = "rbxassetid://140359686333986",
    Yank = "rbxassetid://95274588375465",
    Yanked = "rbxassetid://125857120076407",
    Aero = "rbxassetid://131460382478371",
    Downshift = "rbxassetid://90557343258405",
    Wallrun = "rbxassetid://91460184825589",
    WallrunKickflip = "rbxassetid://132144967554987",
    CutTheHook = "rbxassetid://118084411827927",
}