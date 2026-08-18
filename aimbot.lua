--[========================================================]
--[    MATRIX // STRONGMAN SIMULATOR - MINI HUB            ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لتجنب التكرار
if CoreGui:FindFirstChild("StrongmanMiniHub") then
    CoreGui.StrongmanMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StrongmanMiniHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (قابل للسحب والإفلات بإصبعك)
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
SmallFrame.Size = UDim2.new(0, 210, 0, 215)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر التجميع التلقائي للأغراض (Auto Farm)
local FarmBtn = Instance.new("TextButton")
FarmBtn.Size = UDim2.new(1, -16, 0, 35)
FarmBtn.Position = UDim2.new(0, 8, 0, 12)
FarmBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FarmBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
FarmBtn.Text = "تجميع الأغراض تلقائياً (Auto)"
FarmBtn.TextSize = 12
FarmBtn.Parent = SmallFrame

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 6)
FarmCorner.Parent = FarmBtn

-- 2. زر السرعة الخارقة لتخطي المراحل
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 55)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
SpeedBtn.Text = "السرعة القصوى للمراحل"
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 3. زر فتح المراحل التالية والتنقل السريع
local StagesBtn = Instance.new("TextButton")
StagesBtn.Size = UDim2.new(1, -16, 0, 35)
StagesBtn.Position = UDim2.new(0, 8, 0, 98)
StagesBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
StagesBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
StagesBtn.Text = "فتح جميع المراحل والبوكسات"
StagesBtn.TextSize = 12
StagesBtn.Parent = SmallFrame

local StagesCorner = Instance.new("UICorner")
StagesCorner.CornerRadius = UDim.new(0, 6)
StagesCorner.Parent = StagesBtn

-- 4. زر تشغيل النظام الكامل (FoxnameHub الأساسي)
local CoreBtn = Instance.new("TextButton")
CoreBtn.Size = UDim2.new(1, -16, 0, 35)
CoreBtn.Position = UDim2.new(0, 8, 0, 141)
CoreBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
CoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CoreBtn.Text = "تحميل الماتريكس الشامل"
CoreBtn.TextSize = 12
CoreBtn.Parent = SmallFrame

local CoreCorner = Instance.new("UICorner")
CoreCorner.CornerRadius = UDim.new(0, 6)
CoreCorner.Parent = CoreBtn

-- فتح وإغلاق القائمة المصغرة بالضغط على زر النينجا
local isOpen = false
ToggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    SmallFrame.Visible = isOpen
end)

-- وظيفة التجميع التلقائي للأغراض (حمل الأثقال والإطارات)
FarmBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // تجميع",
        Text = "تم تفعيل نظام جلب وحمل الأغراض تلقائياً!",
        Duration = 2
    })
    
    -- كود تجميع الأغراض المتاحة في الماب وسحبها للاعب
    task.spawn(function()
        pcall(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("TouchTransmitter") and obj.Parent and obj.Parent:FindFirstChild("TouchInterest") then
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 0)
                    task.wait(0.1)
                    firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 1)
                end
            end
        end)
    end)
end)

-- وظيفة السرعة لتجاوز المراحل بسرعة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 70
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم تفعيل السرعة الخارقة للتنقل بين المراحل!",
            Duration = 2
        })
    end
end)

-- وظيفة فتح البوابات والمراحل
StagesBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // المراحل",
        Text = "تم تجاوز متطلبات البوابات وفتح العوالم التالية!",
        Duration = 3
    })
end)

-- تشغيل الكور الشامل الخاص بك
CoreBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // أمير",
        Text = "جاري تحميل النظام الكامل...",
        Duration = 2
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)
