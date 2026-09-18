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
--File: ReplicatedStorage.Client.Interfaces.Routes.Editor.Staff.Pages.Lighting.SkyboxPresets
--                               Dumped in 0.00174 seconds
--                          Bytecode version 9  |  6 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    Bright_Sky_1 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=150335574",
        SkyboxDn = "http://www.roblox.com/asset/?id=150335585",
        SkyboxFt = "http://www.roblox.com/asset/?id=150335628",
        SkyboxLf = "http://www.roblox.com/asset/?id=150335620",
        SkyboxRt = "http://www.roblox.com/asset/?id=150335610",
        SkyboxUp = "http://www.roblox.com/asset/?id=150335642",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_1 = {
        SkyboxBk = "rbxassetid://9544505500",
        SkyboxDn = "rbxassetid://9544547905",
        SkyboxFt = "rbxassetid://9544504852",
        SkyboxLf = "rbxassetid://9544547694",
        SkyboxRt = "rbxassetid://9544547542",
        SkyboxUp = "rbxassetid://9544547398",
        SunTextureId = "rbxassetid://5392574622",
        MoonTextureId = "rbxassetid://62326944",
    },
    Clear_Noon_Sky_2 = {
        SkyboxBk = "rbxassetid://18586524369",
        SkyboxDn = "rbxassetid://18586494459",
        SkyboxFt = "rbxassetid://18586524369",
        SkyboxLf = "rbxassetid://18586524369",
        SkyboxRt = "rbxassetid://18586524369",
        SkyboxUp = "rbxassetid://18586494073",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_3 = {
        SkyboxBk = "rbxassetid://144815627",
        SkyboxDn = "rbxassetid://144815649",
        SkyboxFt = "rbxassetid://144815667",
        SkyboxLf = "rbxassetid://144815688",
        SkyboxRt = "rbxassetid://144815714",
        SkyboxUp = "rbxassetid://144815743",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_4 = {
        SkyboxBk = "rbxassetid://4555652172",
        SkyboxDn = "rbxassetid://4555652492",
        SkyboxFt = "rbxassetid://4555652689",
        SkyboxLf = "rbxassetid://4555652858",
        SkyboxRt = "rbxassetid://4555653030",
        SkyboxUp = "rbxassetid://4555653225",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "http://www.roblox.com/asset/?id=4547507884",
    },
    Clear_Noon_Sky_5 = {
        SkyboxBk = "rbxassetid://8414650174",
        SkyboxDn = "rbxassetid://8414646786",
        SkyboxFt = "rbxassetid://8414647927",
        SkyboxLf = "rbxassetid://8414647713",
        SkyboxRt = "rbxassetid://8414647152",
        SkyboxUp = "rbxassetid://8414647508",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_6 = {
        SkyboxBk = "rbxassetid://4835387103",
        SkyboxDn = "rbxassetid://4835386769",
        SkyboxFt = "rbxassetid://4835387179",
        SkyboxLf = "rbxassetid://4835386869",
        SkyboxRt = "rbxassetid://4835387103",
        SkyboxUp = "rbxassetid://4835386963",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_7 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=153695414",
        SkyboxDn = "http://www.roblox.com/asset/?id=153695352",
        SkyboxFt = "http://www.roblox.com/asset/?id=153695452",
        SkyboxLf = "http://www.roblox.com/asset/?id=153695320",
        SkyboxRt = "http://www.roblox.com/asset/?id=153695383",
        SkyboxUp = "http://www.roblox.com/asset/?id=153695471",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_8 = {
        SkyboxBk = "rbxassetid://73424304938650",
        SkyboxDn = "rbxassetid://6412503613",
        SkyboxFt = "rbxassetid://73424304938650",
        SkyboxLf = "rbxassetid://73424304938650",
        SkyboxRt = "rbxassetid://73424304938650",
        SkyboxUp = "rbxassetid://6412503613",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Clear_Noon_Sky_9 = {
        SkyboxBk = "rbxassetid://6444884337",
        SkyboxDn = "rbxassetid://6444884785",
        SkyboxFt = "rbxassetid://6444884337",
        SkyboxLf = "rbxassetid://6444884337",
        SkyboxRt = "rbxassetid://6444884337",
        SkyboxUp = "rbxassetid://6412503613",
        SunTextureId = "rbxassetid://6196665106",
        MoonTextureId = "rbxassetid://6444320592",
    },
    Cloudy_Sky_1 = {
        SkyboxBk = "rbxassetid://8959270613",
        SkyboxDn = "rbxassetid://8959328839",
        SkyboxFt = "rbxassetid://8959269803",
        SkyboxLf = "rbxassetid://8959270223",
        SkyboxRt = "rbxassetid://8959269319",
        SkyboxUp = "rbxassetid://8959268207",
        SunTextureId = "",
        MoonTextureId = "",
    },
    Default = {
        SkyboxBk = "http://www.roblox.com/asset/?id=144933338",
        SkyboxDn = "http://www.roblox.com/asset/?id=144931530",
        SkyboxFt = "http://www.roblox.com/asset/?id=144933262",
        SkyboxLf = "http://www.roblox.com/asset/?id=144933244",
        SkyboxRt = "http://www.roblox.com/asset/?id=144933299",
        SkyboxUp = "http://www.roblox.com/asset/?id=144931564",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Gloomy_Sky = {
        SkyboxBk = "http://www.roblox.com/asset/?id=4495864450",
        SkyboxDn = "http://www.roblox.com/asset/?id=4495864887",
        SkyboxFt = "http://www.roblox.com/asset/?id=4495865458",
        SkyboxLf = "http://www.roblox.com/asset/?id=4495866035",
        SkyboxRt = "http://www.roblox.com/asset/?id=4495866584",
        SkyboxUp = "http://www.roblox.com/asset/?id=4495867486",
        SunTextureId = "",
        MoonTextureId = "",
    },
    Gloomy_Sky_2 = {
        SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1010388",
        SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1010389",
        SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1010386",
        SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1010387",
        SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1010385",
        SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1010390",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Gloomy_Sky_3 = {
        SkyboxBk = "rbxassetid://218448217",
        SkyboxDn = "rbxassetid://218448317",
        SkyboxFt = "rbxassetid://218448269",
        SkyboxLf = "rbxassetid://218448234",
        SkyboxRt = "rbxassetid://218448178",
        SkyboxUp = "rbxassetid://218448296",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Gloomy_Sky_4 = {
        SkyboxBk = "rbxassetid://16942875080",
        SkyboxDn = "rbxassetid://16942877575",
        SkyboxFt = "rbxassetid://16942880136",
        SkyboxLf = "rbxassetid://16942882073",
        SkyboxRt = "rbxassetid://16942886505",
        SkyboxUp = "rbxassetid://16942889498",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Summer_Sky_1 = {
        SkyboxBk = "rbxassetid://18603249071",
        SkyboxDn = "rbxassetid://18603241716",
        SkyboxFt = "rbxassetid://18603244510",
        SkyboxLf = "rbxassetid://18603245276",
        SkyboxRt = "rbxassetid://18603246382",
        SkyboxUp = "rbxassetid://18603261859",
        SunTextureId = "",
        MoonTextureId = "",
    },
    Summer_Sky_2 = {
        SkyboxBk = "rbxassetid://679786546",
        SkyboxDn = "rbxassetid://680029379",
        SkyboxFt = "rbxassetid://679786832",
        SkyboxLf = "rbxassetid://679786679",
        SkyboxRt = "rbxassetid://679786411",
        SkyboxUp = "rbxassetid://679787023",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Summer_Sky_3 = {
        SkyboxBk = "rbxassetid://479712644",
        SkyboxDn = "rbxassetid://479712702",
        SkyboxFt = "rbxassetid://479712776",
        SkyboxLf = "rbxassetid://479712892",
        SkyboxRt = "rbxassetid://479713047",
        SkyboxUp = "rbxassetid://479713195",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Summer_Sky_4 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=225469345",
        SkyboxDn = "http://www.roblox.com/asset/?id=225469349",
        SkyboxFt = "http://www.roblox.com/asset/?id=225469359",
        SkyboxLf = "http://www.roblox.com/asset/?id=225469364",
        SkyboxRt = "http://www.roblox.com/asset/?id=225469372",
        SkyboxUp = "http://www.roblox.com/asset/?id=225469380",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Summer_Sky_5 = {
        SkyboxBk = "rbxassetid://566598488",
        SkyboxDn = "rbxassetid://566598717",
        SkyboxFt = "rbxassetid://566598536",
        SkyboxLf = "rbxassetid://566598581",
        SkyboxRt = "rbxassetid://566598640",
        SkyboxUp = "rbxassetid://566598894",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Summer_Sky_6 = {
        SkyboxBk = "rbxassetid://14080153924",
        SkyboxDn = "rbxassetid://14080154954",
        SkyboxFt = "rbxassetid://14080156118",
        SkyboxLf = "rbxassetid://14080157396",
        SkyboxRt = "rbxassetid://14080158459",
        SkyboxUp = "rbxassetid://14080159532",
        SunTextureId = "rbxassetid://1345009717",
        MoonTextureId = "rbxassetid://1345054856",
    },
    Summer_Sky_7 = {
        SkyboxBk = "rbxassetid://11832302094",
        SkyboxDn = "rbxassetid://11832301800",
        SkyboxFt = "rbxassetid://11832301591",
        SkyboxLf = "rbxassetid://11832301424",
        SkyboxRt = "rbxassetid://11832301165",
        SkyboxUp = "rbxassetid://11832308453",
        SunTextureId = "rbxassetid://4774583925",
        MoonTextureId = "rbxassetid://4774580371",
    },
    Summer_Sky_8 = {
        SkyboxBk = "rbxassetid://16648590964",
        SkyboxDn = "rbxassetid://16648617436",
        SkyboxFt = "rbxassetid://16648595424",
        SkyboxLf = "rbxassetid://16648566370",
        SkyboxRt = "rbxassetid://16648577071",
        SkyboxUp = "rbxassetid://16648598180",
        SunTextureId = "",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_1 = {
        SkyboxBk = "rbxassetid://15502525195",
        SkyboxDn = "rbxassetid://15502522797",
        SkyboxFt = "rbxassetid://15502524520",
        SkyboxLf = "rbxassetid://15502522129",
        SkyboxRt = "rbxassetid://15502523711",
        SkyboxUp = "rbxassetid://15502526102",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_2 = {
        SkyboxBk = "rbxassetid://600830446",
        SkyboxDn = "rbxassetid://600831635",
        SkyboxFt = "rbxassetid://600832720",
        SkyboxLf = "rbxassetid://600886090",
        SkyboxRt = "rbxassetid://600833862",
        SkyboxUp = "rbxassetid://600835177",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_3 = {
        SkyboxBk = "rbxassetid://541743453",
        SkyboxDn = "rbxassetid://541743443",
        SkyboxFt = "rbxassetid://541743446",
        SkyboxLf = "rbxassetid://541743436",
        SkyboxRt = "rbxassetid://541743435",
        SkyboxUp = "rbxassetid://541743441",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_4 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=458016711",
        SkyboxDn = "http://www.roblox.com/asset/?id=458016826",
        SkyboxFt = "http://www.roblox.com/asset/?id=458016532",
        SkyboxLf = "http://www.roblox.com/asset/?id=458016655",
        SkyboxRt = "http://www.roblox.com/asset/?id=458016782",
        SkyboxUp = "http://www.roblox.com/asset/?id=458016792",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_5 = {
        SkyboxBk = "rbxassetid://16822814492",
        SkyboxDn = "rbxassetid://16822817869",
        SkyboxFt = "rbxassetid://16822820770",
        SkyboxLf = "rbxassetid://16822819205",
        SkyboxRt = "rbxassetid://16822824162",
        SkyboxUp = "rbxassetid://16822822957",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_6 = {
        SkyboxBk = "rbxassetid://17525686840",
        SkyboxDn = "rbxassetid://17525678473",
        SkyboxFt = "rbxassetid://17525684686",
        SkyboxLf = "rbxassetid://17525680663",
        SkyboxRt = "rbxassetid://17525682665",
        SkyboxUp = "rbxassetid://17525674545",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_7 = {
        SkyboxBk = "rbxassetid://252760981",
        SkyboxDn = "rbxassetid://252763035",
        SkyboxFt = "rbxassetid://252761439",
        SkyboxLf = "rbxassetid://252760980",
        SkyboxRt = "rbxassetid://252760986",
        SkyboxUp = "rbxassetid://252762652",
        SunTextureId = "rbxassetid://1345009717",
        MoonTextureId = "",
    },
    Sunset_Sky_8 = {
        SkyboxBk = "rbxassetid://2673265892",
        SkyboxDn = "rbxassetid://2673266169",
        SkyboxFt = "rbxassetid://2673266316",
        SkyboxLf = "rbxassetid://2673266471",
        SkyboxRt = "rbxassetid://2673266027",
        SkyboxUp = "rbxassetid://2673265754",
        SunTextureId = "rbxassetid://1084351190",
        MoonTextureId = "rbxassetid://1075087760",
    },
    Sunset_Sky_9 = {
        SkyboxBk = "rbxassetid://14533954252",
        SkyboxDn = "rbxassetid://14533953542",
        SkyboxFt = "rbxassetid://14533952289",
        SkyboxLf = "rbxassetid://14533952800",
        SkyboxRt = "rbxassetid://14533950568",
        SkyboxUp = "rbxassetid://14533951474",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_10 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=35268852",
        SkyboxDn = "http://www.roblox.com/asset/?id=35268837",
        SkyboxFt = "http://www.roblox.com/asset/?id=35268884",
        SkyboxLf = "http://www.roblox.com/asset/?id=35268868",
        SkyboxRt = "http://www.roblox.com/asset/?id=35268872",
        SkyboxUp = "http://www.roblox.com/asset/?id=35268877",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_11 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=148403925",
        SkyboxDn = "http://www.roblox.com/asset/?id=148406871",
        SkyboxFt = "http://www.roblox.com/asset/?id=148403950",
        SkyboxLf = "http://www.roblox.com/asset/?id=148403915",
        SkyboxRt = "http://www.roblox.com/asset/?id=148403920",
        SkyboxUp = "http://www.roblox.com/asset/?id=148403969",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Sunset_Sky_12 = {
        SkyboxBk = "rbxassetid://15463858941",
        SkyboxDn = "rbxassetid://15463855620",
        SkyboxFt = "rbxassetid://15463845281",
        SkyboxLf = "rbxassetid://15463850725",
        SkyboxRt = "rbxassetid://15463802657",
        SkyboxUp = "rbxassetid://15463816404",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Thunderstorm_Sky_1 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=18703245834",
        SkyboxDn = "http://www.roblox.com/asset/?id=18703243349",
        SkyboxFt = "http://www.roblox.com/asset/?id=18703240532",
        SkyboxLf = "http://www.roblox.com/asset/?id=18703237556",
        SkyboxRt = "http://www.roblox.com/asset/?id=18703235430",
        SkyboxUp = "http://www.roblox.com/asset/?id=18703232671",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Thunderstorm_Sky_2 = {
        SkyboxBk = "rbxassetid://15502511288",
        SkyboxDn = "rbxassetid://15502508460",
        SkyboxFt = "rbxassetid://15502510289",
        SkyboxLf = "rbxassetid://15502507918",
        SkyboxRt = "rbxassetid://15502509398",
        SkyboxUp = "rbxassetid://15502511911",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Warm_Sky_1 = {
        SkyboxBk = "rbxassetid://600830446",
        SkyboxDn = "rbxassetid://600831635",
        SkyboxFt = "rbxassetid://600832720",
        SkyboxLf = "rbxassetid://600886090",
        SkyboxRt = "rbxassetid://600833862",
        SkyboxUp = "rbxassetid://600835177",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Warm_Sky_2 = {
        SkyboxBk = "http://www.roblox.com/asset/?id=271042516",
        SkyboxDn = "http://www.roblox.com/asset/?id=271077243",
        SkyboxFt = "http://www.roblox.com/asset/?id=271042556",
        SkyboxLf = "http://www.roblox.com/asset/?id=271042310",
        SkyboxRt = "http://www.roblox.com/asset/?id=271042467",
        SkyboxUp = "http://www.roblox.com/asset/?id=271077958",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Warm_Sky_3 = {
        SkyboxBk = "rbxassetid://15470310980",
        SkyboxDn = "rbxassetid://15470308646",
        SkyboxFt = "rbxassetid://15470306877",
        SkyboxLf = "rbxassetid://15470312884",
        SkyboxRt = "rbxassetid://15470316058",
        SkyboxUp = "rbxassetid://15470318949",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
    Wilderness_Night_Sky_1 = {
        SkyboxBk = "http://www.roblox.com/Asset/?ID=12064107",
        SkyboxDn = "http://www.roblox.com/Asset/?ID=12064152",
        SkyboxFt = "http://www.roblox.com/Asset/?ID=12064121",
        SkyboxLf = "http://www.roblox.com/Asset/?ID=12063984",
        SkyboxRt = "http://www.roblox.com/Asset/?ID=12064115",
        SkyboxUp = "http://www.roblox.com/Asset/?ID=12064131",
        SunTextureId = "rbxasset://sky/sun.jpg",
        MoonTextureId = "rbxasset://sky/moon.jpg",
    },
}
local v2 = {
    SkyboxBk = "rbxassetid://8417330991",
    SkyboxDn = "rbxassetid://8417324206",
    SkyboxFt = "rbxassetid://8417315133",
    SkyboxLf = "rbxassetid://8417302317",
    SkyboxRt = "rbxassetid://8417284052",
    SkyboxUp = "rbxassetid://8417276195",
    SunTextureId = "rbxasset://sky/sun.jpg",
    MoonTextureId = "rbxasset://sky/moon.jpg",
}
u12.Wilderness_Night_Sky_2 = v2
local u56 = {
    "Default",
    "Bright_Sky_1",
    "Clear_Noon_Sky_1",
    "Clear_Noon_Sky_2",
    "Clear_Noon_Sky_3",
    "Clear_Noon_Sky_4",
    "Clear_Noon_Sky_5",
    "Clear_Noon_Sky_6",
    "Clear_Noon_Sky_7",
    "Clear_Noon_Sky_8",
    "Clear_Noon_Sky_9",
    "Cloudy_Sky_1",
    "Gloomy_Sky_1",
    "Gloomy_Sky_2",
    "Gloomy_Sky_3",
    "Gloomy_Sky_4",
    "Summer_Sky_1",
    "Summer_Sky_2",
    "Summer_Sky_3",
    "Summer_Sky_4",
    "Summer_Sky_5",
    "Summer_Sky_6",
    "Summer_Sky_7",
    "Summer_Sky_8",
    "Sunset_Sky_1",
    "Sunset_Sky_2",
    "Sunset_Sky_3",
    "Sunset_Sky_4",
    "Sunset_Sky_5",
    "Sunset_Sky_6",
    "Sunset_Sky_7",
    "Sunset_Sky_8",
    "Sunset_Sky_9",
    "Sunset_Sky_10",
    "Sunset_Sky_11",
    "Sunset_Sky_12",
    "Thunderstorm_Sky_1",
    "Thunderstorm_Sky_2",
    "Warm_Sky_1",
    "Warm_Sky_2",
    "Warm_Sky_3",
    "Wilderness_Night_Sky_1",
    "Wilderness_Night_Sky_2",
    "Custom",
}
local function getStr(p1, p2) -- Line: 510
    local v1
    local v2 = p1[p2]
    if typeof(v2) == "string" then
        v1 = v2
    elseif v2 == nil then
        v1 = ""
    else
        v1 = tostring(v2)
        if not v1 then
            v1 = ""
        end
    end
    return v1
end
local function getPreset(p1) -- Line: 554 -- upvalues: u12 (val)
    return u12[p1]
end
return {
    getPresetNames = function() -- Line: 550 -- upvalues: u56 (val)
        return u56
    end,
    getPreset = getPreset,
    getMatchingPresetName = function(p1) -- Line: 515 -- upvalues: u12 (val), getStr (val)
        local v1
        local v2 = u12
        local v3 = nil
        local v4 = nil
        for i, j in v2, v3, v4 do
            if i ~= "Custom" then
                v1 = getStr(p1, "SkyboxBk")
                if v1 == j.SkyboxBk or "" then
                    v1 = getStr(p1, "SkyboxDn")
                    if v1 == j.SkyboxDn or "" then
                        v1 = getStr(p1, "SkyboxFt")
                        if v1 == j.SkyboxFt or "" then
                            v1 = getStr(p1, "SkyboxLf")
                            if v1 == j.SkyboxLf or "" then
                                v1 = getStr(p1, "SkyboxRt")
                                if v1 == j.SkyboxRt or "" then
                                    v1 = getStr(p1, "SkyboxUp")
                                    if v1 == j.SkyboxUp or "" then
                                        v1 = getStr(p1, "SunTextureId")
                                        if v1 == j.SunTextureId or "" then
                                            v1 = getStr(p1, "MoonTextureId")
                                            if v1 == j.MoonTextureId or "" then
                                                return i
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return "Custom"
    end,
    applyPreset = function(p1, p2) -- Line: 558 -- upvalues: getPreset (val)
        local v1 = getPreset(p2)
        if not v1 then
            return
        end
        if v1.SkyboxBk ~= nil then
            p1.SkyboxBk = v1.SkyboxBk
        end
        if v1.SkyboxDn ~= nil then
            p1.SkyboxDn = v1.SkyboxDn
        end
        if v1.SkyboxFt ~= nil then
            p1.SkyboxFt = v1.SkyboxFt
        end
        if v1.SkyboxLf ~= nil then
            p1.SkyboxLf = v1.SkyboxLf
        end
        if v1.SkyboxRt ~= nil then
            p1.SkyboxRt = v1.SkyboxRt
        end
        if v1.SkyboxUp ~= nil then
            p1.SkyboxUp = v1.SkyboxUp
        end
        if v1.SunTextureId ~= nil then
            p1.SunTextureId = v1.SunTextureId
        end
        if v1.MoonTextureId ~= nil then
            p1.MoonTextureId = v1.MoonTextureId
        end
    end,
}