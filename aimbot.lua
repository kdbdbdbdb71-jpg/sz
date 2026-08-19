--[========================================================]
--[    MATRIX // THEME PARK TYCOON 2 - MONEY & SPEED HUB   ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("ThemeParkMoneyHub") then
    CoreGui.ThemeParkMoneyHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThemeParkMoneyHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (قابل للسحب بإصبعك في أي مكان)
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

-- القائمة المصغرة (تظهر وتختفي بضغطة زر)
local SmallFrame = Instance.new("Frame")
SmallFrame.Name = "SmallFrame"
SmallFrame.Size = UDim2.new(0, 210, 0, 170)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر رفع السرعة للتنقل والبناء السريع
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 12)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "تفعيل السرعة القصوى"
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 2. زر جلب الزوار وتسريع الأرباح
local BoostMoneyBtn = Instance.new("TextButton")
BoostMoneyBtn.Size = UDim2.new(1, -16, 0, 35)
BoostMoneyBtn.Position = UDim2.new(0, 8, 0, 55)
BoostMoneyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BoostMoneyBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
BoostMoneyBtn.Text = "مضاعفة إقبال الزوار والأرباح"
BoostMoneyBtn.TextSize = 12
BoostMoneyBtn.Parent = SmallFrame

local BoostCorner = Instance.new("UICorner")
BoostCorner.CornerRadius = UDim.new(0, 6)
BoostCorner.Parent = BoostMoneyBtn

-- 3. زر التنبيهات حول حالة السيرفر والألعاب
local InfoBtn = Instance.new("TextButton")
InfoBtn.Size = UDim2.new(1, -16, 0, 35)
InfoBtn.Position = UDim2.new(0, 8, 0, 98)
InfoBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InfoBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
InfoBtn.Text = "تنبيه شراء الألعاب (محمي)"
InfoBtn.TextSize = 12
InfoBtn.Parent = SmallFrame

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 6)
InfoCorner.Parent = InfoBtn

-- فتح وإغلاق القائمة المصغرة
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
            Title = "Matrix // سرعة",
            Text = "تم رفع سرعة التنقل للبناء السريع!",
            Duration = 2
        })
    end
end)

-- وظيفة مضاعفة أرباح الزوار
BoostMoneyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأرباح",
        Text = "تم إرسال إشارة جذب الزوار لزيادة دخل الحديقة وسرعة جمع الفلوس!",
        Duration = 3
    })
end)

-- تنبيه بخصوص الأسعار
InfoBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "توضيح مهم",
        Text = "الألعاب والأسعار محمية بالسيرفر، اجمع الأرباح بالزوار لتشتريها!",
        Duration = 4
    })
end)
