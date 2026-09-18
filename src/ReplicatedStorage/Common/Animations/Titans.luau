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
--                   File: ReplicatedStorage.Common.Animations.Titans
--                              Dumped in 0.000530 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
return {
    Downslam = {Start = "rbxassetid://127198877432080", End = "rbxassetid://117514738082057"},
    Dash = {Start = "rbxassetid://122040642524697", End = "rbxassetid://87861655747000"},
    Smash = {Arm = "rbxassetid://78380858052901"},
    Stomp = {Left = "rbxassetid://127028936556401", Right = "rbxassetid://105029023250330"},
    Mouth = {Open = "rbxassetid://95997777051948", Chomp = "rbxassetid://132411345488480"},
    Lunges = {Left = "rbxassetid://128370620835869"},
    Idles = {
        "rbxassetid://98428851775328",
        "rbxassetid://105439298125202",
        "rbxassetid://101153968529196",
        "rbxassetid://112874586140841",
        "rbxassetid://129440424455208",
        "rbxassetid://130961698872478",
        "rbxassetid://134199797444221",
        "rbxassetid://72000978259631",
        "rbxassetid://90171943289522",
        "rbxassetid://138465633617709",
        "rbxassetid://123595942836156",
        "rbxassetid://77210455827516",
        "rbxassetid://91056377441816",
        "rbxassetid://125875427487911",
        "rbxassetid://85074124209864",
    },
    Stuns = {
        "rbxassetid://85807105242722",
        "rbxassetid://89723743152987",
        "rbxassetid://139113429027606",
        "rbxassetid://102357484816662",
        "rbxassetid://134356389412425",
    },
    Sleeps = {
        "rbxassetid://119043431539046",
        "rbxassetid://92795514143560",
        "rbxassetid://132330307762661",
        "rbxassetid://128270574163145",
        "rbxassetid://92758232418349",
    },
    Walks = {
        "rbxassetid://140316891408290",
        "rbxassetid://113003905215186",
        "rbxassetid://98204805605607",
        "rbxassetid://99705096541950",
        "rbxassetid://128226785281920",
    },
    Runs = {
        "rbxassetid://94859566811000",
        "rbxassetid://108579470300757",
        "rbxassetid://118288539531101",
        "rbxassetid://103181743486226",
        "rbxassetid://92898578055992",
        "rbxassetid://116817501070954",
        "rbxassetid://138041159547453",
        "rbxassetid://73164365796871",
        "rbxassetid://72197556886619",
        "rbxassetid://111230920998655",
        "rbxassetid://135292723721238",
        "rbxassetid://95338990684409",
        "rbxassetid://82677010326076",
    },
    Clicker = {Run = "rbxassetid://134254437706633"},
    Ice = {
        Walks = {"rbxassetid://140316891408290", "rbxassetid://113003905215186"},
        Idles = {"rbxassetid://98428851775328", "rbxassetid://105439298125202"},
    },
    Deaths = {"rbxassetid://90040104467902", "rbxassetid://72926003257057", "rbxassetid://71028017021241", "rbxassetid://136342643925713"},
    Chewing = "rbxassetid://118539634885238",
    LongRangeAboveGrab = "rbxassetid://135338316117173",
    LongRangeAttackAir = "rbxassetid://127857932477365",
    LongRangeAttackGround = "rbxassetid://87199352747485",
    ShortRangeAttackGround = {"rbxassetid://137557642566996", "rbxassetid://79807870470249"},
    MediumRangeAttackGround = "rbxassetid://111508788215614",
    Trapped = "rbxassetid://126801537503175",
    Jumps = {
        "rbxassetid://91866332123690",
        "rbxassetid://103674282960577",
        "rbxassetid://121871653542021",
        "rbxassetid://90937269674308",
        "rbxassetid://108149328703884",
        "rbxassetid://82841655296232",
    },
    MediumRangeBite = {Right = "rbxassetid://99158762186667", Left = "rbxassetid://125284277416841"},
    LongRangeBite = {Right = "rbxassetid://89797832039833", Left = "rbxassetid://136176959503942"},
    MediumRangeGrab = {Right = "rbxassetid://72180201149498", Left = "rbxassetid://105613450754242"},
    SidewaysGrab = {Right = "rbxassetid://83959182693768", Left = "rbxassetid://117878040011299"},
    ShortRangeSwat = {Right = "rbxassetid://77483083534261", Left = "rbxassetid://135960797402588"},
    ShortRangeGrab = {Right = "rbxassetid://93916929623858", Left = "rbxassetid://74117188628577"},
    ShortRangeFrontArmGrab = {Right = "rbxassetid://97643219256036", Left = "rbxassetid://124463473649107"},
    ShortRangeGrabLeg = {Right = "rbxassetid://78662966195254", Left = "rbxassetid://93004327399439"},
    LongRangeGrab = {Right = "rbxassetid://97016819631864", Left = "rbxassetid://132145672736993"},
    WideRangeGrab = {
        Right = {"rbxassetid://118891384152531", "rbxassetid://111959123887976"},
        Left = {"rbxassetid://89792317470241", "rbxassetid://114947392927302"},
    },
    BackGrab = {Right = "rbxassetid://115215726134288", Left = "rbxassetid://114870892249594"},
    MediumRangeKick = {Right = "rbxassetid://108782407133647", Left = "rbxassetid://119139537002039"},
    LongRangeKick = {Left = "rbxassetid://79132812249686", Right = "rbxassetid://74361663996121"},
    Grabs = {
        Blind = {Right = "rbxassetid://121154535856632", Left = "rbxassetid://109610499079636"},
        Nape = {Right = "rbxassetid://130230322498062", Left = "rbxassetid://79865411368428"},
    },
    Eats = {
        Left = {
            Slow = {"rbxassetid://100174564330577", "rbxassetid://83151224663611", "rbxassetid://133506414206473"},
            Medium = {"rbxassetid://78660561753509", "rbxassetid://129816957204480"},
            Fast = {"rbxassetid://133145540906429", "rbxassetid://117335172537286"},
        },
        Right = {
            Slow = {"rbxassetid://91613851280115", "rbxassetid://102395689553826", "rbxassetid://86962345035543"},
            Medium = {"rbxassetid://117227207886115", "rbxassetid://91629720063159"},
            Fast = {"rbxassetid://96769735491031", "rbxassetid://127154239386306"},
        },
    },
    Swats = {
        Front = "rbxassetid://103985177785577",
        Nape = {Right = "rbxassetid://106427404834521", Left = "rbxassetid://73744024218726"},
    },
    Blinds = {"rbxassetid://72707653458041", "rbxassetid://133387067729541"},
    Armcuts = {
        Left = {"rbxassetid://115703734342477", "rbxassetid://125006721710250"},
        Right = {"rbxassetid://129898401520603", "rbxassetid://134075319010043"},
    },
    Legcuts = {
        Left = {"rbxassetid://72412677416797", "rbxassetid://73173220432122", "rbxassetid://86571163323766"},
        Right = {"rbxassetid://115692586135071", "rbxassetid://130422083595098", "rbxassetid://92891832248685"},
    },
    Angry = {Frenzy = "rbxassetid://77813612645452", Left = "rbxassetid://70574408029556", Right = "rbxassetid://119319050839523"},
}