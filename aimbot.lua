--[========================================================]
--[    MATRIX // FOOTBALL CARD BIDDING - MINI HUB          ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("FootballBidMiniHub") then
    CoreGui.FootballBidMiniHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FootballBidMiniHub"
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

-- 1. زر الفلوس والعملات (Max Money / Cash Boost)
local MoneyBtn = Instance.new("TextButton")
MoneyBtn.Size = UDim2.new(1, -16, 0, 35)
MoneyBtn.Position = UDim2.new(0, 8, 0, 12)
MoneyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MoneyBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MoneyBtn.Text = "تفعيل فول فلوس وعملات"
MoneyBtn.TextSize = 12
MoneyBtn.Parent = SmallFrame

local MoneyCorner = Instance.new("UICorner")
MoneyCorner.CornerRadius = UDim.new(0, 6)
MoneyCorner.Parent = MoneyBtn

-- 2. زر المزايدة التلقائية لكسب البطاقات (Auto Bid)
local BidBtn = Instance.new("TextButton")
BidBtn.Size = UDim2.new(1, -16, 0, 35)
BidBtn.Position = UDim2.new(0, 8, 0, 55)
BidBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
BidBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
BidBtn.Text = "المزايدة التلقائية للبطاقات"
BidBtn.TextSize = 12
BidBtn.Parent = SmallFrame

local BidCorner = Instance.new("UICorner")
BidCorner.CornerRadius = UDim.new(0, 6)
BidCorner.Parent = BidBtn

-- 3. زر السرعة الخارقة للتنقل بين طاولات المزادات
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 98)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
SpeedBtn.Text = "السرعة الخارقة للمزادات"
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SmallFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedBtn

-- 4. زر النظام الشامل (FoxnameHub)
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

-- وظيفة الفلوس والعملات (تعديل القيم المرئية وجلب المكافآت)
MoneyBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأموال",
        Text = "تم تفعيل مضاعفة الأرباح والفلوس في الحساب!",
        Duration = 2
    })
    
    task.spawn(function()
        pcall(function()
            for _, v in pairs(LocalPlayer:GetDescendants()) do
                if v.Name:lower():find("money") or v.Name:lower():find("cash") or v.Name:lower():find("coins") then
                    if v:IsA("NumberValue") or v:IsA("IntAttribute") then
                        v.Value = 999999999
                    end
                end
            end
        end)
    end)
end)

-- وظيفة المزايدة التلقائية للفوز بالبطاقات (مثل ميسي وبقية النجوم)
BidBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // المزايدة",
        Text = "تم تفعيل نظام المزايدة التلقائية على بطاقات كرة القدم!",
        Duration = 3
    })
    
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- البحث عن أزرار المزايدة التلقائية في اللعبة وضغطها تلقائياً
                for _, btn in pairs(workspace:GetDescendants()) do
                    if btn:IsA("TextButton") and (btn.Text:lower():find("bid") or btn.Text:lower():find("buy")) then
                        -- محاكاة الضغط التلقائي للفوز بالبطاقة
                        fireclickdetector(btn)
                    end
                end
            end)
        end
    end)
end)

-- وظيفة السرعة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 65
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم تفعيل السرعة للتنقل السريع بين طاولات المزاد!",
            Duration = 2
        })
    end
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
