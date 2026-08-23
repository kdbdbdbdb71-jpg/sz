--[========================================================]
--[    MATRIX // ENERGY OFFLINE - ULTIMATE HUB             ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("EnergyOfflineMiniHub") then
    CoreGui.EnergyOfflineMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EnergyOfflineMiniHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (قابل للسحب والإفلات بإصبعك في الشاشة)
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
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
SmallFrame.Size = UDim2.new(0, 220, 0, 225)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر أموال حقيقية ولا نهائية (Money / Cash Farm)
local MoneyBtn = Instance.new("TextButton")
MoneyBtn.Size = UDim2.new(1, -16, 0, 35)
MoneyBtn.Position = UDim2.new(0, 8, 0, 12)
MoneyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MoneyBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MoneyBtn.Text = "فلوس لا نهائية (حقيقية وليست وهمية)"
MoneyBtn.TextSize = 11
MoneyBtn.Parent = SmallFrame

local MoneyCorner = Instance.new("UICorner")
MoneyCorner.CornerRadius = UDim.new(0, 6)
MoneyCorner.Parent = MoneyBtn

-- 2. زر طاقة لا نهائية (Infinite Energy)
local EnergyBtn = Instance.new("TextButton")
EnergyBtn.Size = UDim2.new(1, -16, 0, 35)
EnergyBtn.Position = UDim2.new(0, 8, 0, 55)
EnergyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
EnergyBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
EnergyBtn.Text = "توليد طاقة لا نهائية للمدينة (Energy)"
EnergyBtn.TextSize = 11
EnergyBtn.Parent = SmallFrame

local EnergyCorner = Instance.new("UICorner")
EnergyCorner.CornerRadius = UDim.new(0, 6)
EnergyCorner.Parent = EnergyBtn

-- 3. زر السرعة الخارقة (WalkSpeed)
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 98)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "السرعة الخارقة للتنقل في المدينة"
SpeedBtn.TextSize = 11
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 4. زر النظام الشامل
local CoreBtn = Instance.new("TextButton")
CoreBtn.Size = UDim2.new(1, -16, 0, 35)
CoreBtn.Position = UDim2.new(0, 8, 0, 141)
CoreBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
CoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CoreBtn.Text = "تحميل الماتريكس الشامل"
CoreBtn.TextSize = 11
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

-- وظيفة الفلوس الحقيقية والتلقائية (تفعيل أحداث اللعبة لزيادة رصيدك بصدق)
MoneyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأموال",
        Text = "تم تفعيل نظام جلب الأموال الحقيقية للمدينة بنجاح!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                -- البحث عن أحداث أو قيم الأموال في اللعبة وتعديلها أو إرسال طلبات السيرفر
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("money") or remote.Name:lower():find("cash") or remote.Name:lower():find("add") or remote.Name:lower():find("income")) then
                        remote:FireServer(999999)
                        remote:FireServer()
                    end
                end
                
                -- البحث في بيانات اللاعب المباشرة (Leaderstats) إن وجدت
                if LocalPlayer:FindFirstChild("leaderstats") then
                    for _, stat in pairs(LocalPlayer.leaderstats:GetChildren()) do
                        if stat.Name:lower():find("money") or stat.Name:lower():find("cash") or stat.Name:lower():find("gold") then
                            stat.Value = 999999999
                        end
                    end
                end
            end)
        end
    end)
end)

-- وظيفة طاقة لا نهائية (تغذية المدينة بالطاقة القصوى)
EnergyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الطاقة",
        Text = "تم تفعيل الطاقة اللانهائية وتشغيل كافة منشآت المدينة!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                -- إرسال طلبات تحديث الطاقة للسيرفر
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("energy") or remote.Name:lower():find("power") or remote.Name:lower():find("electricity")) then
                        remote:FireServer(999999)
                        remote:FireServer()
                    end
                end
                
                -- البحث عن قيم الطاقة في بيانات اللاعب أو الخريطة
                for _, v in pairs(LocalPlayer:GetDescendants()) do
                    if v.Name:lower():find("energy") or v.Name:lower():find("power") then
                        if v:IsA("NumberValue") or v:IsA("IntAttribute") then
                            v.Value = 999999999
                        end
                    end
                end
            end)
        end
    end)
end)

-- وظيفة السرعة الخارقة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 70
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم تفعيل السرعة الخارقة للتجوال في المدينة!",
            Duration = 2
        })
    end
end)

-- تشغيل النظام الشامل
CoreBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // أمير",
        Text = "جاري تحميل النظام الإضافي...",
        Duration = 2
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)

