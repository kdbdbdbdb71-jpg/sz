-- سكربت واجهة تفاعلية للعبة التخمين (Lua Script UI)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- إزالة أي واجهة سابقة لمنع التكرار
if CoreGui:FindFirstChild("FootballGuessUI") then
    CoreGui.FootballGuessUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FootballGuessUI"
ScreenGui.Parent = CoreGui

-- الإطار الرئيسي للقائمة
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 340)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- قابلة للسحب في الشاشة
MainFrame.Parent = ScreenGui

-- زوايا دائرية للإطار
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- شريط العنوان العلوي
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

-- عنوان القائمة
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -90, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Text = "Football Guess | خمن البلد"
TitleLabel.Parent = TopBar

-- زر إغلاق القائمة (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(210, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- زر زيادة السرعة (مفيد للتجول السريع في الخريطة)
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 290, 0, 45)
SpeedBtn.Position = UDim2.new(0.5, -145, 0, 65)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.TextSize = 13
SpeedBtn.Font = Enum.Font.GothamMedium
SpeedBtn.Text = "تفعيل السرعة الإضافية (Speed: OFF)"
SpeedBtn.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedBtn

-- زر إظهار جميع الأعلام أو المساعدة (توضحي للوظائف الإضافية)
local ExtraBtn = Instance.new("TextButton")
ExtraBtn.Size = UDim2.new(0, 290, 0, 45)
ExtraBtn.Position = UDim2.new(0.5, -145, 0, 125)
ExtraBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
ExtraBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExtraBtn.TextSize = 13
ExtraBtn.Font = Enum.Font.GothamMedium
ExtraBtn.Text = "تثبيت الكاميرا / منع السقوط"
ExtraBtn.Parent = MainFrame

local ExtraCorner = Instance.new("UICorner")
ExtraCorner.CornerRadius = UDim.new(0, 8)
ExtraCorner.Parent = ExtraBtn

-- زر الطفو لإعادة فتح القائمة عند إغلاقها
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0, 20, 0.5, -25)
OpenBtn.BackgroundColor3 = Color3.fromRGB(30, 38, 52)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 11
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Text = "MENU"
OpenBtn.Visible = false
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenBtn

-- الأوامر البرمجية والوظائف
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

-- تفعيل ميزة السرعة
local speedActive = false
SpeedBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    if speedActive then
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(46, 160, 90)
        SpeedBtn.Text = "إيقاف السرعة (Speed: ON)"
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 40
        end
    else
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
        SpeedBtn.Text = "تفعيل السرعة (Speed: OFF)"
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- وظيفة زر المساعدة الإضافي
ExtraBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        -- تثبيت مؤقت لجسم اللاعب لمنع دفعات الجيم المزعجة
        local rootPart = LocalPlayer.Character.HumanoidRootPart
        rootPart.Velocity = Vector3.new(0, 0, 0)
    end
end)
