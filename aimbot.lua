-- Matrix Hub - Keyboard Simulator Ultimate
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local Window = Library:CreateWindow({ Title = "Matrix Keyboard Hub", Center = true, AutoShow = true })

local Tab = Window:AddTab("التحكم الأساسي")
local MainGroup = Tab:AddLeftGroupbox("الميزات")

-- ميزة الفوز التلقائي
MainGroup:AddToggle("AutoWin", { Text = "الفوز التلقائي", Default = false }):OnChanged(function(Value)
    _G.AutoWin = Value
    while _G.AutoWin do
        -- ضع كود الـ Teleport للنهاية هنا
        task.wait(1)
    end
end)

-- ميزة السرعة اللانهائية
MainGroup:AddToggle("InfSpeed", { Text = "سرعة لانهائية", Default = false }):OnChanged(function(Value)
    if Value then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 500
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

Library:Notify("تم تحميل مصفوفة الماتريكس بنجاح!")
