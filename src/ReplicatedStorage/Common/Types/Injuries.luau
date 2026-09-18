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
--                     File: ReplicatedStorage.Common.Types.Injuries
--                              Dumped in 0.000947 seconds
--                          Bytecode version 9  |  1 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {Head = "Head", Torso = "Torso"}
v1["Left Arm"] = "Left Arm"
v1["Right Arm"] = "Right Arm"
v1["Left Leg"] = "Left Leg"
v1["Right Leg"] = "Right Leg"
local v2 = {
    None = 0,
    Mild = 1,
    Moderate = 2,
    Severe = 3,
    Extreme = 4,
}
local v3 = {Cause = 0, Common = 1, Moderate = 2, Rare = 3}
v3["Extremely Rare"] = 4
local v4 = {Forceps = "Forceps"}
v4["Surgical Knife"] = "Surgical Knife"
v4.Splint = "Splint"
v4["Surgical Clamp"] = "Surgical Clamp"
v4["Cauterization Kit"] = "Cauterization Kit"
v4["Medical Bandage"] = "Medical Bandage"
v4.Syringe = "Syringe"
v4["Cold Water"] = "Cold Water"
v4["Warm Water"] = "Warm Water"
v4.Cloth = "Cloth"
v4.Saline = "Saline"
v4["Needle and Thread"] = "Needle and Thread"
local v5 = {
    Bruising = {
        Name = "Bruising",
        Pain = 1,
        Expires = 21600,
        Procedure = {v4["Cold Water"]},
        Chance = v3.Common,
    },
    Grazing = {
        Name = "Grazing",
        Pain = 1,
        Expires = 28800,
        Procedure = {v4["Medical Bandage"]},
        Infects = v3.Rare,
        Chance = v3.Common,
    },
}
v5["First Degree Frost Bite"] = {
    Name = "First Degree Frost Bite",
    Pain = 2,
    Expires = 43200,
    Procedure = {v4["Warm Water"]},
    Chance = v3.Common,
}
v5["First Degree Burn"] = {
    Name = "First Degree Burn",
    Pain = 2,
    Expires = 86400,
    Procedure = {v4["Cold Water"]},
    Infects = v3.Moderate,
    Chance = v3.Moderate,
}
v5["Vein Bleeding"] = {
    Name = "Vein Bleeding",
    Pain = 2,
    Expires = 43200,
    Procedure = {
        v4.Cloth,
        v4.Saline,
        v4["Needle and Thread"],
        v4.Saline,
        v4["Needle and Thread"],
        v4["Medical Bandage"],
    },
    Infects = v3.Common,
    Chance = v3.Common,
}
v5["Oblique Fracture"] = {
    Name = "Oblique Fracture",
    Pain = 3,
    Expires = 345600,
    Procedure = {v4.Cloth, v4.Splint, v4["Medical Bandage"]},
    Chance = v3.Moderate,
    Limbs = {
        v1["Left Arm"],
        v1["Right Arm"],
        v1["Left Leg"],
        v1["Right Leg"],
        v1.Torso,
    },
}
v5["Cut Wound"] = {
    Name = "Cut Wound",
    Pain = 2,
    Expires = 43200,
    Procedure = {v4.Saline, v4.Cloth, v4["Needle and Thread"], v4["Medical Bandage"]},
    Infects = v3.Moderate,
    Chance = v3.Cause,
}
v5["Lodged Bullet"] = {
    Name = "Lodged Bullet",
    Pain = 3,
    Expires = 216000,
    Procedure = {
        v4.Saline,
        v4.Cloth,
        v4.Forceps,
        v4["Needle and Thread"],
        v4["Medical Bandage"],
    },
    Infects = v3.Common,
    Chance = v3.Cause,
}
v5["Bite Wound"] = {
    Name = "Lodged Bullet",
    Pain = 3,
    Expires = 172800,
    Procedure = {v4.Saline, v4.Cloth, v4["Needle and Thread"], v4["Medical Bandage"]},
    Infects = v3.Common,
    Chance = v3.Cause,
}
v5["Cracked Skull"] = {
    Name = "Cracked Skull",
    Pain = 3,
    Expires = 259200,
    Procedure = {v4["Cold Water"], v4["Medical Bandage"]},
    Chance = v3.Moderate,
    Limbs = {v1.Head},
}
v5["Teeth Debris"] = {
    Name = "Teeth Debris",
    Pain = 2,
    Expires = 43200,
    Procedure = {v4.Saline, v4.Forceps, v4["Needle and Thread"], v4["Medical Bandage"]},
    Chance = v3.Moderate,
}
v5["Second Degree Frost Bite"] = {
    Name = "Second Degree Frost Bite",
    Pain = 2,
    Expires = 86400,
    Procedure = {v4.Saline, v4["Warm Water"], v4["Medical Bandage"]},
    Chance = v3.Common,
}
v5["Second Degree Burn"] = {
    Name = "Second Degree Burn",
    Pain = 2,
    Expires = 86400,
    Procedure = {v4.Saline, v4["Cold Water"], v4["Medical Bandage"]},
    Infects = v3.Common,
    Chance = v3.Cause,
}
v5["Artery Bleeding"] = {
    Name = "Artery Bleeding",
    Pain = 3,
    Expires = 172800,
    Damages = 1,
    Procedure = {
        v4.Saline,
        v4.Cloth,
        v4["Surgical Clamp"],
        v4["Needle and Thread"],
        v4.Saline,
        v4["Needle and Thread"],
        v4["Medical Bandage"],
    },
    Infects = v3.Common,
    Chance = v3.Moderate,
    Limbs = {
        v1["Left Arm"],
        v1["Right Arm"],
        v1["Left Leg"],
        v1["Right Leg"],
        v1.Torso,
    },
}
v5["Compound Fracture"] = {
    Name = "Compound Fracture",
    Pain = 3,
    Expires = 259200,
    Procedure = {
        v4.Saline,
        v4.Cloth,
        v4["Needle and Thread"],
        v4.Saline,
        v4.Splint,
        v4["Medical Bandage"],
    },
    Infects = v3.Common,
    Chance = v3.Rare,
    Limbs = {
        v1["Left Arm"],
        v1["Right Arm"],
        v1["Left Leg"],
        v1["Right Leg"],
        v1.Torso,
    },
}
v5["Comminuted Fracture"] = {
    Name = "Comminuted Fracture",
    Pain = 3,
    Expires = 172800,
    Procedure = {
        v4.Saline,
        v4["Surgical Knife"],
        v4.Forceps,
        v4["Needle and Thread"],
        v4.Saline,
        v4.Splint,
        v4["Medical Bandage"],
    },
    Chance = v3.Rare,
    Infects = v3.Cause,
    Limbs = {
        v1["Left Arm"],
        v1["Right Arm"],
        v1["Left Leg"],
        v1["Right Leg"],
        v1.Torso,
    },
}
v5["Rib Fracture"] = {
    Name = "Rib Fracture",
    Pain = 3,
    Expires = 172800,
    Procedure = {
        v4.Saline,
        v4["Surgical Knife"],
        v4.Forceps,
        v4["Needle and Thread"],
        v4.Saline,
        v4["Medical Bandage"],
    },
    Chance = v3.Rare,
    Infects = v3.Cause,
    Limbs = {v1.Torso},
}
v5["Third Degree Frost Bite"] = {
    Name = "Third Degree Frost Bite",
    Pain = 3,
    Expires = 172800,
    Damages = 1,
    Procedure = {
        v4.Saline,
        v4["Surgical Knife"],
        v4.Cloth,
        v4["Needle and Thread"],
        v4["Warm Water"],
        v4["Medical Bandage"],
    },
    Chance = v3.Cause,
}
v5["Third Degree Burn"] = {
    Name = "Third Degree Burn",
    Pain = 3,
    Expires = 259200,
    Damages = 1,
    Procedure = {
        v4.Saline,
        v4["Surgical Knife"],
        v4.Cloth,
        v4["Needle and Thread"],
        v4["Cold Water"],
        v4["Medical Bandage"],
    },
    Infects = v3.Common,
    Chance = v3.Cause,
}
v5["Ripped Flesh"] = {
    Name = "Ripped Flesh",
    Pain = 3,
    Expires = 259200,
    Damages = 1,
    Procedure = {v4.Saline, v4["Cauterization Kit"], v4["Medical Bandage"]},
    Infects = v3.Common,
    Chance = v3.Rare,
}
v5["Internal Artery Bleeding"] = {
    Name = "Artery Bleeding",
    Pain = 4,
    Expires = 259200,
    Damages = 5,
    Procedure = {
        v4.Saline,
        v4["Surgical Knife"],
        v4.Cloth,
        v4["Surgical Clamp"],
        v4["Needle and Thread"],
        v4.Saline,
        v4["Needle and Thread"],
        v4["Medical Bandage"],
    },
    Chance = v3.Moderate,
    Limbs = {
        v1["Left Arm"],
        v1["Right Arm"],
        v1["Left Leg"],
        v1["Right Leg"],
        v1.Torso,
    },
}
local v6 = {}
v6["Sharp Object"] = "Cut Wound"
v6["Bullet Wound"] = "Lodged Bullet"
v6["Arrow Wound"] = "Arrow Wound"
v6["Bite Wound"] = "Bite Wound"
v6["Cold Wound"] = "First Degree Frost Bite"
local v7 = {}
v7["Sharp Object"] = {v5.Grazing, v5["Artery Bleeding"], v5["Vein Bleeding"]}
v7["Bullet Wound"] = {
    v5.Grazing,
    v5["First Degree Burn"],
    v5["Artery Bleeding"],
    v5["Vein Bleeding"],
    v5["Rib Fracture"],
    v5["Comminuted Fracture"],
}
v7["Arrow Wound"] = {
    v5.Grazing,
    v5["Artery Bleeding"],
    v5["Vein Bleeding"],
    v5["Rib Fracture"],
    v5["Comminuted Fracture"],
}
v7["Medium Blunt Force"] = {
    v5["First Degree Burn"],
    v5["Oblique Fracture"],
    v5["Cracked Skull"],
    v5["Comminuted Fracture"],
    v5["Rib Fracture"],
}
v7["Heavy Blunt Force"] = {
    v5["First Degree Burn"],
    v5["Oblique Fracture"],
    v5["Cracked Skull"],
    v5["Compound Fracture"],
    v5["Comminuted Fracture"],
    v5["Ripped Flesh"],
    v5["Internal Artery Bleeding"],
    v5["Rib Fracture"],
}
v7["Bite Wound"] = {
    v5["Oblique Fracture"],
    v5["Cracked Skull"],
    v5["Compound Fracture"],
    v5["Comminuted Fracture"],
    v5["Ripped Flesh"],
    v5["Internal Artery Bleeding"],
    v5["Rib Fracture"],
    v5["Teeth Debris"],
}
v7["Cold Wound"] = {v5["First Degree Frost Bite"], v5["Second Degree Frost Bite"]}
return {
    LIMPING_THRESHOLD = 300,
    MEDIC_PRICE = 15,
    Injuries = v5,
    Causes = v7,
    Consistent = v6,
    Limbs = v1,
    Equipment = v4,
    Rarities = v3,
}