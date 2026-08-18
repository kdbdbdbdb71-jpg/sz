--[========================================================]
--[    MATRIX // THEME PARK TYCOON 2 - MINI HUB            ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لتجنب التكرار
if CoreGui:FindFirstChild("ThemeParkMiniHub") then
    CoreGui.ThemeParkMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThemeParkMiniHub"
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

-- القائمة المصغرة جداً (تظهر وتختفي عند الضغط على الزر)
local SmallFrame = Instance.new("Frame")
SmallFrame.Name = "SmallFrame"
SmallFrame.Size = UDim2.new(0, 180, 0, 120)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- زر تفعيل السرعة داخل القائمة المصغرة
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 40)
SpeedBtn.Position = UDim2.new(0, 8, 0, 15)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "تفعيل السرعة القصوى"
SpeedBtn.TextSize = 14
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedBtn

-- زر إشعار الحماية
local InfoBtn = Instance.new("TextButton")
InfoBtn.Size = UDim2.new(1, -16, 0, 40)
InfoBtn.Position = UDim2.new(0, 8, 0, 65)
InfoBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
InfoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoBtn.Text = "حالة الفلوس: محمية"
InfoBtn.TextSize = 1000
InfoBtn.Parent = SmallFrame

local InfoCorner = Instance.new("UICorner")
InfoCorner.CornerRadius = UDim.new(0, 8)
InfoCorner.Parent = InfoBtn

-- فتح وإغلاق القائمة المصغرة بضغطات الزر
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

InfoBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "تنبيه الماب",
        Text = "فلوس الماب سيرفر ستايد ولا يمكن تعديلها بالسكربتات!",
        Duration = 3
    })
end)
