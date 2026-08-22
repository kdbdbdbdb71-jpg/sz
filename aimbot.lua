--[========================================================]
--[    MATRIX // VEHICLE LEGENDS - MINI HUB                ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("VehicleLegendsMiniHub") then
    CoreGui.VehicleLegendsMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VehicleLegendsMiniHub"
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
SmallFrame.Size = UDim2.new(0, 210, 0, 215)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر تجميع الفلوس والأرباح تلقائياً (Auto Farm Money)
local FarmMoneyBtn = Instance.new("TextButton")
FarmMoneyBtn.Size = UDim2.new(1, -16, 0, 35)
FarmMoneyBtn.Position = UDim2.new(0, 8, 0, 12)
FarmMoneyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FarmMoneyBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
FarmMoneyBtn.Text = "تجميع فلوس تلقائي (Auto Farm)"
FarmMoneyBtn.TextSize = 12
FarmMoneyBtn.Parent = SmallFrame

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 6)
FarmCorner.Parent = FarmMoneyBtn

-- 2. زر سرعة السيارة الخارقة (Car Speed Hack)
local CarSpeedBtn = Instance.new("TextButton")
CarSpeedBtn.Size = UDim2.new(1, -16, 0, 35)
CarSpeedBtn.Position = UDim2.new(0, 8, 0, 55)
CarSpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CarSpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
CarSpeedBtn.Text = "سرعة خارقة للسيارة (Speed)"
CarSpeedBtn.TextSize = 12
CarSpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = CarSpeedBtn

-- 3. زر الفوز التلقائي بالسباقات (Auto Win Races)
local WinBtn = Instance.new("TextButton")
WinBtn.Size = UDim2.new(1, -16, 0, 35)
WinBtn.Position = UDim2.new(0, 8, 0, 98)
WinBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
WinBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
WinBtn.Text = "الفوز التلقائي بالسباقات"
WinBtn.TextSize = 12
WinBtn.Parent = SmallFrame

local WinCorner = Instance.new("UICorner")
WinCorner.CornerRadius = UDim.name and UDim.new(0, 6) or UDim.new(0, 6)
WinCorner.Parent = WinBtn

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

-- وظيفة جمع الفلوس والأرباح تلقائياً
FarmMoneyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // تجميع الفلوس",
        Text = "تم تفعيل نظام جمع الأرباح وتكرار السباقات للحصول على ملايين الفلوس!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- تفعيل الأحداث المسؤولة عن إعطاء مكافآت السباقات ووقت اللعب
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("reward") or remote.Name:lower():find("money") or remote.Name:lower():find("cash")) then
                        remote:FireServer()
                    end
                end
            end)
        end
    end)
end)

-- وظيفة سرعة السيارة الخارقة (تعديل عزم السيارة الحالية التي تقودها)
CarSpeedBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // سرعة السيارة",
        Text = "تم تفعيل السرعة الخارقة والنيترو الدائم للسيارة!",
        Duration = 2
    })
    
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                local seat = LocalPlayer.Character and LocalPlayer.Character.Humanoid.SeatPart
                if seat and seat.Parent then
                    local vehicle = seat.Parent
                    -- البحث عن خصائص السرعة والمحرك وزيادتها للضعف
                    if vehicle:FindFirstChild("Configuration") then
                        for _, v in pairs(vehicle.Configuration:GetChildren()) do
                            if v.Name:lower():find("speed") or v.Name:lower():find("max") or v.Name:lower():find("horse") then
                                v.Value = 99999
                            end
                        end
                    end
                    -- زيادة سرعة العجلات مباشرة
                    for _, part in pairs(vehicle:GetDescendants()) do
                        if part:IsA("VehicleSeat") or part:IsA("Model") then
                            part.MaxSpeed = 99999
                            part.Torque = 99999
                        end
                    end
                end
            end)
        end
    end)
end)

-- وظيفة الفوز التلقائي بالسباقات للحصول على الجوائز الكبرى
WinBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // السباقات",
        Text = "تم تفعيل إنهاء السباقات وتصدر المركز الأول تلقائياً!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(2) do
            pcall(function()
                for _, r in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if r:IsA("RemoteEvent") and (r.Name:lower():find("race") or r.Name:lower():find("win") or r.Name:lower():find("finish")) then
                        r:FireServer("Win")
                        r:FireServer(true)
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
