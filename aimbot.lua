--[========================================================]
--[    MATRIX // DUSTY TRIP (الرحلة المغبرة) - MINI HUB     ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("DustyTripMiniHub") then
    CoreGui.DustyTripMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DustyTripMiniHub"
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
SmallFrame.Size = UDim2.new(0, 210, 0, 250)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- 1. زر عدم الموت (God Mode)
local GodBtn = Instance.new("TextButton")
GodBtn.Size = UDim2.new(1, -16, 0, 35)
GodBtn.Position = UDim2.new(0, 8, 0, 12)
GodBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
GodBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
GodBtn.Text = "عدم الموت (God Mode)"
GodBtn.TextSize = 12
GodBtn.Parent = SmallFrame

local GodCorner = Instance.new("UICorner")
GodCorner.CornerRadius = UDim.new(0, 6)
GodCorner.Parent = GodBtn

-- 2. زر منع الجوع والعطش
local HungerBtn = Instance.new("TextButton")
HungerBtn.Size = UDim2.new(1, -16, 0, 35)
HungerBtn.Position = UDim2.new(0, 8, 0, 55)
HungerBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
HungerBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
HungerBtn.Text = "منع الجوع والعطش نهائياً"
HungerBtn.TextSize = 12
HungerBtn.Parent = SmallFrame

local HungerCorner = Instance.new("UICorner")
HungerCorner.CornerRadius = UDim.new(0, 6)
HungerCorner.Parent = HungerBtn

-- 3. زر البانزين اللانهائي للسيارة
local FuelBtn = Instance.new("TextButton")
FuelBtn.Size = UDim2.new(1, -16, 0, 35)
FuelBtn.Position = UDim2.new(0, 8, 0, 98)
FuelBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FuelBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
FuelBtn.Text = "بانزين لا نهائي للسيارة"
FuelBtn.TextSize = 12
FuelBtn.Parent = SmallFrame

local FuelCorner = Instance.new("UICorner")
FuelCorner.CornerRadius = UDim.new(0, 6)
FuelCorner.Parent = FuelBtn

-- 4. ميزة من عندي: تثبيت السيارة ومنع انقلابها في الصحراء
local CarFixBtn = Instance.new("TextButton")
CarFixBtn.Size = UDim2.new(1, -16, 0, 35)
CarFixBtn.Position = UDim2.new(0, 8, 0, 141)
CarFixBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CarFixBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
CarFixBtn.Text = "منع انقلاب السيارة بالصحراء"
CarFixBtn.TextSize = 12
CarFixBtn.Parent = SmallFrame

local CarFixCorner = Instance.new("UICorner")
CarFixCorner.CornerRadius = UDim.new(0, 6)
CarFixCorner.Parent = CarFixBtn

-- 5. زر النظام الشامل
local CoreBtn = Instance.new("TextButton")
CoreBtn.Size = UDim2.new(1, -16, 0, 35)
CoreBtn.Position = UDim2.new(0, 8, 0, 184)
CoreBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
CoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CoreBtn.Text = "تحميل الماتريكس الشامل"
CoreBtn.TextSize = 12
CoreBtn.Parent = CoreBtn and SmallFrame

local CoreCorner = Instance.new("UICorner")
CoreCorner.CornerRadius = UDim.new(0, 6)
CoreCorner.Parent = CoreBtn

-- فتح وإغلاق القائمة المصغرة بلمسة زر النينجا
local isOpen = false
ToggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    SmallFrame.Visible = isOpen
end)

-- وظيفة عدم الموت
GodBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الحماية",
        Text = "تم تفعيل وضع عدم الموت بنجاح!",
        Duration = 2
    })
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
        end
    end)
end)

-- وظيفة منع الجوع والعطش
HungerBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // البقاء",
        Text = "تم تثبيت مؤشرات الجوع والعطش للحد الأقصى!",
        Duration = 2
    })
    -- محاكاة تجميد الستاماينا والجوع والعطش عبر حماية اللاعب
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- البحث عن قيم الحالة الخاصة بالجوع والعطش وتعديلها إن وجدت في الشخصية
                for _, v in pairs(LocalPlayer:GetDescendants()) do
                    if v.Name == "Hunger" or v.Name == "Thirst" or v.Name == "Stamina" then
                        if v:IsA("NumberValue") or v:IsA("IntAttribute") then
                            v.Value = 100
                        end
                    end
                end
            end)
        end
    end)
end)

-- وظيفة البانزين اللانهائي
FuelBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // السيارة",
        Text = "تم تفعيل البانزين اللانهائي للسيارة!",
        Duration = 2
    })
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj.Name:lower():find("fuel") or obj.Name:lower():find("gas") then
                        if obj:IsA("NumberValue") or obj:IsA("IntAttribute") then
                            obj.Value = 100
                        end
                    end
                end
            end)
        end
    end)
end)

-- وظيفة منع انقلاب السيارة في مطبات الصحراء
CarFixBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // تثبيت",
        Text = "تم تفعيل نظام منع انقلاب السيارة!",
        Duration = 2
    })
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                local seat = LocalPlayer.Character and LocalPlayer.Character.Humanoid.SeatPart
                if seat and seat.Parent then
                    local car = seat.Parent.Parent
                    if car and car:FindFirstChild("BodyGyro") == nil then
                        local gyro = Instance.new("BodyGyro")
                        gyro.MaxTorque = Vector3.new(400000, 0, 400000)
                        gyro.CFrame = car.PrimaryPart and car.PrimaryPart.CFrame or seat.CFrame
                        gyro.Parent = car:FindFirstChild("PrimaryPart") or seat
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
        Text = "جاري تشغيل النظام الإضافي...",
        Duration = 2
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
    end)
end)
