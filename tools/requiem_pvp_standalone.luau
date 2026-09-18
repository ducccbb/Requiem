--!nocheck
--!nolint
--[[
    ================================================================================
    ⚔️ REQUIEM STANDALONE PVP COMBAT RUNNER
    ================================================================================
    Tác giả: Jarvis Assistant
    Mục đích: Script khởi chạy độc lập PvP Suite, nạp module pvp_combat bằng require.
    Hỗ trợ:
      - 🛡️ Auto Parry Sabre, Combat Knife, Baton, Rìu & Song kiếm ODMG
      - ⚡ Auto Counter-Attack (Tự động chém phản kích trừng phạt sau khi Parry)
      - 💨 Auto Evade Firearms (Né súng ngắm Aiming + Né súng nổ thật On-Fire)
      - ⚠️ Multi-Threat Crossfire Evasion (Góc né thoát hiểm khi bị kẹp đạn)
      - 💥 Blade Reach Extender & Attribute Spoofing (x2.5 sát thương, x2 kháng đòn)
    ================================================================================
]]

-- =========================================================================
-- 🛡️ EXECUTOR ENVIRONMENT COMPATIBILITY LAYER
-- An toàn khai báo các hàm executor toàn cục dưới dạng local biến động để
-- triệt tiêu 100% cảnh báo và lỗi typecheck / undefined global trong IDE Luau.
-- =========================================================================
local _env = getfenv() :: any
local isfile: any = rawget(_env, "isfile")
local readfile: any = rawget(_env, "readfile")
local loadstringFn: any = rawget(_env, "loadstring") or rawget(_G, "loadstring")

local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 3,
        })
    end)
    print(string.format("[Requiem PvP] %s: %s", title, text))
end

-- =========================================================================
-- 📦 SMART UNIVERSAL MODULE LOADER (HYBRID REQUIRE SYSTEM)
-- =========================================================================
local MODULE_CACHE = {}
local GITHUB_MODULE_BASE = "https://raw.githubusercontent.com/ducccbb/Requiem/main/tools/modules/"

local function requireModule(moduleName)
    if MODULE_CACHE[moduleName] then
        return MODULE_CACHE[moduleName]
    end

    -- 1. Kiểm tra ModuleScript Instance trong Roblox DataModel (Rojo / Studio)
    pcall(function()
        local modInst = script and script.Parent and script.Parent:FindFirstChild("modules") and script.Parent.modules:FindFirstChild(moduleName)
        if not modInst and ReplicatedStorage:FindFirstChild("tools") and ReplicatedStorage.tools:FindFirstChild("modules") then
            modInst = ReplicatedStorage.tools.modules:FindFirstChild(moduleName)
        end
        if modInst and modInst:IsA("ModuleScript") then
            local ok, res = pcall(require, modInst)
            if ok and res then
                MODULE_CACHE[moduleName] = res
            end
        end
    end)
    if MODULE_CACHE[moduleName] then return MODULE_CACHE[moduleName] end

    -- 2. Đọc file cục bộ từ Executor (readfile / isfile)
    if typeof(isfile) == "function" and typeof(readfile) == "function" and typeof(loadstringFn) == "function" then
        local searchPaths = {
            "tools/modules/" .. moduleName .. ".luau",
            "Requiem/tools/modules/" .. moduleName .. ".luau",
            "modules/" .. moduleName .. ".luau",
            moduleName .. ".luau"
        }
        for _, path in ipairs(searchPaths) do
            local exists = false
            pcall(function() exists = isfile(path) end)
            if exists then
                local code = nil
                pcall(function() code = readfile(path) end)
                if code and #code > 0 then
                    local fnOk, fn = pcall(loadstringFn, code)
                    if fnOk and typeof(fn) == "function" then
                        local execOk, res = pcall(fn)
                        if execOk and res then
                            MODULE_CACHE[moduleName] = res
                            return res
                        end
                    end
                end
            end
        end
    end

    -- 3. Tải trực tiếp từ GitHub Raw
    if typeof(game.HttpGet) == "function" and typeof(loadstringFn) == "function" then
        local ok, src = pcall(function()
            return game:HttpGet(GITHUB_MODULE_BASE .. moduleName .. ".luau")
        end)
        if ok and src and #src > 10 then
            local fnOk, fn = pcall(loadstringFn, src)
            if fnOk and typeof(fn) == "function" then
                local execOk, res = pcall(fn)
                if execOk and res then
                    MODULE_CACHE[moduleName] = res
                    return res
                end
            end
        end
    end

    return MODULE_CACHE[moduleName]
end

-- =========================================================================
-- CẤU HÌNH TÁC CHIẾN STANDALONE
-- =========================================================================
local Config = {
    AutoParry = true,           -- Tự động đỡ đòn
    ParryMelee = true,          -- Sabre, Knife, Baton, Axe
    ParryBlades = true,         -- Song kiếm ODMG
    ParryDistance = 15,         -- Khoảng cách phát hiện (studs)
    AutoCounter = true,         -- Tự phản đòn ngay sau khi Parry
    CounterDelay = 0.08,        -- Độ trễ phản đòn (giây)
    AutoEvadeGuns = true,       -- Tự né tránh súng ngắm & nổ súng
    EvadeDistance = 85,         -- Khoảng cách phát hiện súng
    BladeReachExtender = true,  -- Tăng tầm với của kiếm
    ExtendedBladeReach = 16,    -- Studs
    DamageBooster = true,       -- Tăng sát thương chém người
    VisualEffects = true,       -- Thông báo hiệu ứng
}

-- =========================================================================
-- NẠP VÀ KHỞI ĐỘNG MODULE PVP COMBAT
-- =========================================================================
local PVP = requireModule("pvp_combat")

if PVP and typeof(PVP.Start) == "function" then
    PVP.Start(Config)
    notify("Requiem PvP Standalone", "Đã nạp thành công module pvp_combat và kích hoạt Auto Parry, Counter & Evade!")
else
    notify("Lỗi nạp Module", "Không thể nạp module pvp_combat. Vui lòng kiểm tra lại đường dẫn file hoặc kết nối internet.")
end

return PVP
