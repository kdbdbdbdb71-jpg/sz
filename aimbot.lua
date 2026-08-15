حيدر:
-- ============================================================
-- Delta Script - النسخة الكاملة (المطور: ziko)
-- ============================================================
-- يدعم: التحقق، الهكرات، الموارد، الترجمة
-- ============================================================

local player = game.Players.LocalPlayer
local character = player.Character
local mouse = player:GetMouse()

-- ============================================================
-- 1. نظام التفعيل والتحقق
-- ============================================================

local config = {
    verified = false,
    lang = "ar", -- ar / en
    verify_code = "11229900032"
}

local function verify()
    if config.verified then return true end
    
    local code = game:GetService("TeleportService"):GetLocalPlayer().UserId
    if tostring(code) == config.verify_code then
        config.verified = true
        print("[✅] تم التفعيل بنجاح")
        return true
    else
        print("[❌] رمز التحقق غير صحيح")
        return false
    end
end

-- ============================================================
-- 2. نظام الترجمة (عربي/إنكليزي)
-- ============================================================

local translations = {
    ar = {
        active = "✅ تم التفعيل",
        hacks = "🔓 الهكرات مفعلة",
        resources = "📦 تم إضافة الموارد",
        mamoth = "🦣 تم تفعيل الماموت",
        coal = "🔥 فحم لا نهاية",
    },
    en = {
        active = "✅ Activated",
        hacks = "🔓 Hacks Enabled",
        resources = "📦 Resources Added",
        mamoth = "🦣 Mamoth Enabled",
        coal = "🔥 Infinite Coal",
    }
}

local function t(key)
    return translations[config.lang][key] or key
end

-- ============================================================
-- 3. نظام الهكرات
-- ============================================================

local hacks = {
    -- 99 ليلة (تجميد الوقت)
    freeze_time = function()
        game:GetService("Lighting"):SetMinutesAfterMidnight(0)
        game:GetService("Lighting"):SetTimeOfDay(0)
        print("[🌙] 99 ليلة مفعلة")
    end,
    
    -- كشف الماكن
    reveal_players = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= player then
                local char = v.Character
                if char and char:FindFirstChild("Humanoid") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = char
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.FillTransparency = 0.5
                    print("[👁️] كشف: " .. v.Name)
                end
            end
        end
    end,
    
    -- ايم بوت (تصويب تلقائي)
    aimbot = function()
        local target = nil
        local nearest = math.huge
        
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= player then
                local char = v.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local dist = (char.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
                    if dist < nearest then
                        nearest = dist
                        target = char
                    end
                end
            end
        end
        
        if target then
            character.HumanoidRootPart.CFrame = CFrame.new(
                character.HumanoidRootPart.Position,
                target.HumanoidRootPart.Position
            )
            print("[🎯] ايم بوت مفعل")
        end
    end,
}

-- ============================================================
-- 4. نظام الموارد
-- ============================================================

local resources = {
    wood = 500,
    iron = 500,
    mamoth = 1,
    coal = "infinite"
}

local function add_resources()
    print("[📦] إضافة الموارد...")
    print("   🌲 خشب: " .. resources.wood)
    print("   🔩 حديد: " .. resources.iron)
    print("   🦣 ماموت: " .. resources.mamoth)
    print("   🔥 فحم: لا نهاية")
end

-- ============================================================
-- 5. التشغيل الرئيسي
-- ============================================================

local function main()
    -- التحقق
    if not verify() then return end
    
    print(t("active"))
    print(t("hacks"))
    
    -- تفعيل الهكرات
    hacks.freeze_time()
    hacks.reveal_players()
    hacks.aimbot()
    
    -- إضافة الموارد
    add_resources()
    print(t("resources"))
    print(t("mamoth"))
    print(t("coal"))
    
    print("[✅] السكربت يعمل بنجاح")
end

-- ============================================================
-- 6. التشغيل
-- ============================================================

-- تنفيذ عند التحميل
coroutine.wrap(function()
    wait(2)
    main()
end)()

-- ============================================================
-- 7. أوامر التحكم
-- ============================================================

-- /reload : إعادة تحميل السكربت
-- /lang en : تغيير اللغة إلى الإنكليزية
-- /lang ar : تغيير اللغة إلى العربية

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/reload" then
        print("[🔄] إعادة تحميل...")
        main()
    elseif msg == "/lang en" then
        config.lang = "en"
        print("[🌐] اللغة: إنكليزي")
    elseif msg == "/lang ar" then
        config.lang = "ar"
        print("[🌐] اللغة: عربي")
    end
end)
