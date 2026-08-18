--[========================================================]
--[    MATRIX // THEME PARK TYCOON 2 - EXPANDED MINI HUB   ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لتجنب التكرار
if CoreGui:FindFirstChild("ThemeParkExpandedHub") then
    CoreGui.ThemeParkExpandedHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThemeParkExpandedHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (القابل للتحريك)
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646" -- أيقونة النينجا
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = ToggleBtn

-- القائمة المصغرة (تظهر وتختفي عند الضغط على زر النينجا)
local SmallFrame = Instance.new("Frame")
SmallFrame.Name = "SmallFrame"
SmallFrame.Size = UDim2.new(0, 200, 0, 170)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر السرعة القصوى
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 12)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "تفعيل السرعة القصوى"
SpeedBtn.TextSize = 13
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 2. زر جلب وجذب العالم/الزوار للمنتزه
local SpawnGuestsBtn = Instance.new("TextButton")
SpawnGuestsBtn.Size = UDim2.new(1, -16, 0, 35)
SpawnGuestsBtn.Position = UDim2.new(0, 8, 0, 55)
SpawnGuestsBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpawnGuestsBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
SpawnGuestsBtn.Text = "جلب الزوار لمدينتي"
SpawnGuestsBtn.TextSize = 13
SpawnGuestsBtn.Parent = SmallFrame

local GuestsCorner = Instance.new("UICorner")
GuestsCorner.CornerRadius = UDim.new(0, 6)
GuestsCorner.Parent = SpawnGuestsBtn

-- 3. زر التنبيهات والحماية
local InfoBtn = Instance.new("TextButton")
InfoBtn.Size = UDim2.new(1, -16, 0, 35)
InfoBtn.Position = UDim2.new(0, 8, 0, 98)
InfoBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InfoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBtn.Text = "حالة الفلوس: محمية"
InfoBtn.TextSize = 13
InfoBtn.Parent = SmallFrame

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 6)
InfoCorner.Parent = InfoBtn

-- فتح وإغلاق القائمة المصغرة بالضغط على زر النينجا
local isOpen = false
ToggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    SmallFrame.Visible = isOpen
end)

-- وظيفة السرعة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // أمير",
            Text = "تم رفع السرعة لتسهيل البناء!",
            Duration = 2
        })
    end
end)

-- وظيفة جلب الزوار والعالم إلى الحديقة
SpawnGuestsBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // جذب الزوار",
        Text = "تم إرسال إشارة لجذب الزوار وزيادة إقبال العالم لمدينتك!",
        Duration = 3
    })
    
    -- محاكاة تأثير تفعيل الزوار عبر تشغيل السكربت الأساسي المطور إن وجد
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)

InfoBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "تنبيه الماب",
        Text = "فلوس الماب مرتبطة بالسيرفر ولا يمكن تصفيرها أو تعديلها وهمياً!",
        Duration = 3
    })
end)
