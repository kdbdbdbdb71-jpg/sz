--[========================================================]
--[    MATRIX // FOOTBALL TYCOON 2 - MINI HUB              ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("FootballTycoon2MiniHub") then
    CoreGui.FootballTycoon2MiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FootballTycoon2MiniHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (قابل للسحب والإفلات بإصبعك في أي مكان)
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

-- 1. زر تجميع الفلوس والأرباح تلقائياً (Auto Collect Cash)
local CashBtn = Instance.new("TextButton")
CashBtn.Size = UDim2.new(1, -16, 0, 35)
CashBtn.Position = UDim2.new(0, 8, 0, 12)
CashBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CashBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
CashBtn.Text = "تجميع الفلوس والأرباح تلقائياً"
CashBtn.TextSize = 12
CashBtn.Parent = SmallFrame

local CashCorner = Instance.new("UICorner")
CashCorner.CornerRadius = UDim.new(0, 6)
CashCorner.Parent = CashBtn

-- 2. زر السرعة الخارقة للتنقل في النادي
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 55)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "السرعة الخارقة للبناء والتنقل"
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 3. ميزة مميزة: جمع مكافآت النادي وسرعة التطوير
local BoostBtn = Instance.new("TextButton")
BoostBtn.Size = UDim2.new(1, -16, 0, 35)
BoostBtn.Position = UDim2.new(0, 8, 0, 98)
BoostBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BoostBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
BoostBtn.Text = "مضاعفة دخل التذاكر والجماهير"
BoostBtn.TextSize = 12
BoostBtn.Parent = SmallFrame

local BoostCorner = Instance.new("UICorner")
BoostCorner.CornerRadius = UDim.new(0, 6)
BoostCorner.Parent = BoostBtn

-- 4. زر النظام الشامل
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

-- فتح وإغلاق القائمة المصغرة بلمسة زر النينجا
local isOpen = false
ToggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    SmallFrame.Visible = isOpen
end)

-- وظيفة جمع الفلوس والأرباح من أزرار وقواطع التاييكون تلقائياً
CashBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأرباح",
        Text = "تم تفعيل نظام جلب وجمع أرباح النادي تلقائياً!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("TouchTransmitter") and (obj.Parent.Name:lower():find("cash") or obj.Parent.Name:lower():find("money") or obj.Parent.Name:lower():find("collector")) then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 0)
                        task.wait(0.1)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, obj.Parent, 1)
                    end
                end
            end)
        end
    end)
end)

-- وظيفة السرعة الخارقة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 60
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم تفعيل السرعة الخارقة للتجوال في النادي!",
            Duration = 2
        })
    end
end)

-- وظيفة مضاعفة دخل الجماهير والتذاكر
BoostBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // تطوير النادي",
        Text = "تم تفعيل مضاعفة أرباح المباريات والجماهير في الملعب!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(2) do
            pcall(function()
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("income") or remote.Name:lower():find("cash") or remote.Name:lower():find("match")) then
                        remote:FireServer()
                    end
                end
            end)
        end
    end)
end)

-- تشغيل النظام الشامل
CoreBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // أمير",
        Text = "جاري تشغيل السكربت الإضافي...",
        Duration = 2
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)
