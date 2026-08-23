--[========================================================]
--[    MATRIX // KICK SIMULATOR - MINI HUB                 ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("KickSimulatorMiniHub") then
    CoreGui.KickSimulatorMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KickSimulatorMiniHub"
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

-- 1. زر ركل قوي جداً (Super Kick Power)
local KickBtn = Instance.new("TextButton")
KickBtn.Size = UDim2.new(1, -16, 0, 35)
KickBtn.Position = UDim2.new(0, 8, 0, 12)
KickBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KickBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
KickBtn.Text = "تفعيل ركل قوي جداً (Power)"
KickBtn.TextSize = 12
KickBtn.Parent = SmallFrame

local KickCorner = Instance.new("UICorner")
KickCorner.CornerRadius = UDim.new(0, 6)
KickCorner.Parent = KickBtn

-- 2. زر تجميع الفلوس والأرباح تلقائياً (Auto Farm Money)
local MoneyBtn = Instance.new("TextButton")
MoneyBtn.Size = UDim2.new(1, -16, 0, 35)
MoneyBtn.Position = UDim2.new(0, 8, 0, 55)
MoneyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MoneyBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MoneyBtn.Text = "تجميع الفلوس تلقائياً (Cash)"
MoneyBtn.TextSize = 12
MoneyBtn.Parent = SmallFrame

local MoneyCorner = Instance.new("UICorner")
MoneyCorner.CornerRadius = UDim.new(0, 6)
MoneyCorner.Parent = MoneyBtn

-- 3. زر السرعة الخارقة للتنقل السريع
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 98)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "السرعة الخارقة للتنقل"
SpeedBtn.TextSize = 12
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

-- وظيفة الركل القوي جداً (زيادة قوة وسرعة دفع الكرة لأقصى حد)
KickBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // القوة",
        Text = "تم تفعيل قوة الركل الخارقة لتطير الكرة لآخر الخريطة!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                -- رفع قيم القوة الخاصة باللاعب إذا وجدت في ملفات الشخصية أو الاحداث
                for _, v in pairs(LocalPlayer:GetDescendants()) do
                    if v.Name:lower():find("power") or v.Name:lower():find("strength") or v.Name:lower():find("kick") then
                        if v:IsA("NumberValue") or v:IsA("IntAttribute") then
                            v.Value = 999999999
                        end
                    end
                end
                
                -- تنفيذ حدث الركل التلقائي في السيرفر
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("kick") or remote.Name:lower():find("ball")) then
                        remote:FireServer(999999)
                    end
                end
            end)
        end
    end)
end)

-- وظيفة تجميع الفلوس تلقائياً
MoneyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأموال",
        Text = "تم تفعيل نظام جلب الفلوس والجوائز تلقائياً!",
        Duration = 2
    })
    
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("money") or remote.Name:lower():find("cash") or remote.Name:lower():find("claim")) then
                        remote:FireServer()
                    end
                end
            end)
        end
    end)
end)

-- وظيفة السرعة الخارقة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 65
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم تفعيل السرعة الخارقة بنجاح!",
            Duration = 2
        })
    end
end)

-- تشغيل النظام الشامل
CoreBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // أمير",
        Text = "جاري تشغيل النظام الإضافي...",
        Duration = 2
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)
