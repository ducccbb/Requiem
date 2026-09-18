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
--                       File: ReplicatedStorage.Common.Types.Quiz
--                               Dumped in 0.00173 seconds
--                          Bytecode version 9  |  2 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
local u12 = {
    {
        question = "What happened to Thalrex Hayes after killing the Clicker Titan?",
        answer = 2,
        options = {"Became king", "Declared Killed in Action", "Promoted", "Imprisoned"},
    },
    {
        question = "What was the mission of the 19th Expedition?",
        answer = 3,
        options = {"Build a new Wall", "Rescue civilians", "Defeat the Titan from the 16th Expedition", "Train recruits"},
    },
    {
        question = "What incident from Blackthorne Holding caused the appearance of the largest titan ever recorded?",
        answer = 3,
        options = {"Explosion", "Ritual", "Lightning strike", "Earthquake"},
    },
    {
        question = "The Royal Military was founded in which time period?",
        answer = 2,
        options = {"First century", "Second century", "Third century", "Fourth century"},
    },
    {
        question = "How many years after the founding of the Scouting Legion did its first expedition occur?",
        answer = 3,
        options = {"1", "2", "3", "5"},
    },
    {
        question = "Ex-Commander Audwin Becker was blamed for a major loss during an expedition. What happened as a result?",
        answer = 3,
        options = {"Promotion", "Execution", "Removal from the military", "Reassignment"},
    },
    {
        question = "The 'Clicker Titan' was first encountered during which expedition?",
        answer = 2,
        options = {"15th", "16th", "17th", "18th"},
    },
    {
        question = "Which event occurred during the 18th Expedition?",
        answer = 2,
        options = {"Discovery of the Abnormal Titan", "Burial of the queen and FOB establishment", "Becker's removal", "First ODMG use"},
    },
    {
        question = "What was unique about the 19th Expedition's objective?",
        answer = 2,
        options = {"It was exploratory only", "It targeted a specific Titan from a prior disaster", "It aimed to build infrastructure", "It focused on diplomacy"},
    },
    {
        question = "What distinguished the largest Titan summoned during the Blackthorne raids?",
        answer = 3,
        options = {"It could speak", "It had armor", "It had no face", "It could fly"},
    },
    {
        question = "Who ultimately destroyed the massive Spider Titan?",
        answer = 3,
        options = {"The Scouting Legion", "Thalrex Hayes", "The Stationary Guard and Military Police", "King Illarion"},
    },
    {
        question = "What made Queen Aurelia Fritz's designation as heir unprecedented?",
        answer = 3,
        options = {"She was not of royal blood", "She was chosen by the military", "She was female", "She was formerly exiled"},
    },
    {
        question = "Which of the following occurred in the same year?",
        answer = 1,
        options = {"17th and 18th Expeditions", "15th and 16th Expeditions", "ODMG development and 15th Expedition", "First expedition and Scouting Legion founding"},
    },
    {
        question = "Which of the following is TRUE about Commander Becker?",
        answer = 2,
        options = {"He led the 16th Expedition successfully", "He was removed after catastrophic losses", "He discovered the Clicker Titan", "He founded the Scouts"},
    },
    {
        question = "Which statement about the Clicker Titan is MOST accurate?",
        answer = 3,
        options = {"It caused the 16th Expedition's failure", "It was first seen in the 18th Expedition", "It forced a retreat before being killed later", "It was killed immediately upon discovery"},
    },
    {
        question = "Which of the following is NOT directly tied to King Illarion Fritz?",
        answer = 4,
        options = {"Great Codification", "Military restructuring", "Naming Aurelia heir", "ODMG development"},
    },
    {
        question = "Which statement about Queen Aurelia Fritz is TRUE?",
        answer = 3,
        options = {"She founded the Scouts", "She reversed the Great Codification", "She secured funding for the Scouts", "She developed ODMG"},
    },
    {
        question = "How many rollable enchantment rarities are there?",
        answer = 1,
        options = {"5", "6", "7", "None of the Above"},
    },
    {
        question = "At which Enchantment milestone do you not get a Sacrament point?",
        answer = 3,
        options = {"25", "50", "75", "100"},
    },
    {
        question = "What crime will you be charged with if you show any expression of doubt regarding Queen Aurelia's right to rule?",
        answer = 3,
        options = {"Dissent against the Crown", "Terrorism", "Treason", "None of the Above"},
    },
    {
        question = "What government entities are normally deputized to enforce the laws of the Kingdom?",
        answer = 1,
        options = {"The Military Police & Royal Guard", "The Military Police", "The Military Police & Stationary Guard", "The Scouting Legion"},
    },
    {
        question = "What enchantment allows you to see enchantment rarities?",
        answer = 2,
        options = {"Deduction", "Insight", "Aware", "Pity"},
    },
    {
        question = "To which rank of nobility do you normally kneel?",
        answer = 4,
        options = {"Archdukes", "The Royal Family", "Knights", "None of the above"},
    },
    {
        question = "What is the name of Eldia's state religion?",
        answer = 3,
        options = {"The Church of Fritz", "The Church of Mitras", "The Church of Ymir", "The Church of Eldia"},
    },
    {
        question = "Which of the following is a right of the Eldian people?",
        answer = 4,
        options = {"The right to free speech", "The right to a speedy trial", "The right to bear arms", "None of the above"},
    },
    {
        question = "The years 820 through 823 are commonly referred to as what?",
        answer = 4,
        options = {"The Great Upheaval", "The Grand Renaissance", "The Grand Revival", "The Great Codification"},
    },
    {
        question = "Unauthorized leave from the Trainee Camp can be considered what crime?",
        answer = 2,
        options = {"Cowardice", "Desertion", "Treason", "None of the above"},
    },
    {
        question = "Which charge can result from unlawfully arresting a person?",
        answer = 1,
        options = {"Kidnapping", "Assault", "Misbehavior as a Sentinel", "Contempt"},
    },
    {
        question = "Precision stops improving accuracy after which sacrament point?",
        answer = 3,
        options = {"Second", "Third", "Fourth", "Fifth"},
    },
    {
        question = "Which level of nobility is not saluted upon simply appearing?",
        answer = 1,
        options = {"Lower Nobility", "Upper Nobility", "The Royal Family", "None of the above"},
    },
    {
        question = "Which of the following privileges do cadets not have?",
        answer = 2,
        options = {"The privilege of free speech", "The privilege to demand trial in place of non-judicial punishments", "The privilege of owning, using, and transferring property", "All of the above"},
    },
    {
        question = "Which family received Ymir's divine mandate?",
        answer = 2,
        options = {"The Holtz", "The Fritz", "The Wiers", "The Philips"},
    },
}
local v2 = {
    question = "Which of the following items does not require a permit to possess?",
    answer = 4,
    options = {"A musket", "A flintlock", "A sabre", "A bow"},
}
local v3 = {
    question = "The Kingdom of Eldia is a...",
    answer = 2,
    options = {"Republic", "Monarchy", "Theocracy", "Oligarchy"},
}
local v4 = {
    question = "The tale of 'THE HILL AND THE FLOOD' is a tale about...",
    answer = 3,
    options = {"Mighty Mouse", "Inner Concentration", "Genetic Outlier", "None of the above"},
}
u12[33] = {
    question = "What does the emblem of a plain shield represent?",
    answer = 2,
    options = {"The Royal Guards", "The Government", "Marian Districts", "The Church"},
}
u12[34] = {
    question = "Which of the following is not an emblem used in Eldia?",
    answer = 1,
    options = {"A shield with crossed sticks", "A shield with a green unicorn", "A shield with a crown", "All of the above are used"},
}
u12[35] = v2
u12[36] = v3
u12[37] = {
    question = "Who was the first ruler of Eldia?",
    answer = 4,
    options = {"Philip Fritz", "Ilar Fritz", "Flavian Fritz", "Solon Fritz"},
}
u12[38] = v4
u12[39] = {
    question = "The tale 'Architecture of Sina' covers which village?",
    answer = 2,
    options = {"Ehrmich", "Amethine", "Rosemere", "Holtzman"},
}
u12[40] = {
    question = "As described by 'The Art of Dueling', what is the third principle that must never be broken?",
    answer = 2,
    options = {"Both parties must willingly agree to the duel", "Witnesses must be present to ensure fairness", "Conditions must be equal and clearly established", "Once begun, the duel must proceed without interference"},
}
u12[41] = {
    question = "The city that governs Eldia.",
    answer = 4,
    options = {"Krolva", "Stohess", "Utopia", "Mitras"},
}
u12[42] = {
    question = "A blue flare is used to call for...",
    answer = 2,
    options = {"Other branch members", "Medical assistance", "An emergency", "An officer"},
}
u12[43] = {
    question = "A purple flare is used to call for...",
    answer = 3,
    options = {"Medical assistance", "Titans spotted", "An emergency", "A catastrophic event"},
}
u12[44] = {
    question = "A titans weak spot is its...",
    answer = 4,
    options = {"Eyes", "Legs", "Arms", "Nape"},
}
u12[45] = {
    question = "The highest court in Eldia is the...",
    answer = 2,
    options = {"Court of Wall Maria", "Royal Court of Justice", "Military Court of Justice", "Court of Wall Sina"},
}
u12[46] = {
    question = "The highest tier of nobility below is...",
    answer = 3,
    options = {"Dukes", "Earls", "Archdukes", "Lords"},
}
u12[47] = {
    question = "An easily concealable weapon..",
    answer = 1,
    options = {"Flintlock", "Bow", "Musket", "Cannon"},
}
u12[48] = {
    question = "The pale blue crystal that powers humanity's ODMG.",
    answer = 4,
    options = {"Mythril", "Copper", "Aquis", "Iceburst"},
}
local v5 = {
    question = "The name of Eldia's first female monarch.",
    answer = 2,
    options = {"Sina Fritz", "Aurelia Fritz", "Regalia Fritz", "Natalia Fritz"},
}
u12[49] = v5
u12[50] = {
    question = "The 'Berserk Titan' is an example of a(n)...",
    answer = 3,
    options = {"Mindless Titan", "Sprinter", "Abnormal Titan", "None of the above"},
}
local v6 = {}
function v6.create(p1) -- Line: 393 -- upvalues: u12 (val)
    local v1, v2
    local v3 = 0 < p1
    assert(v3, "Question count must be greater than 0")
    local v4 = {}
    v3 = #u12
    local v5 = 1
    for i = 1, v3, v5 do
        v4[i] = i
    end
    v3 = 2
    v5 = -1
    for j = #v4, v3, v5 do
        v1 = math.random(j)
        v2 = v4[j]
        v4[j] = v4[v1]
        v4[v1] = v2
    end
    v3 = math.min(p1, #v4)
    v5 = {}
    local v6 = v3
    v1 = 1
    for k = 1, v6, v1 do
        v5[k] = u12[v4[k]]
    end
    return {questions = v5}
end
return v6