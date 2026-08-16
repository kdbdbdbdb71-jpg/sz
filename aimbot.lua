-- تهيئة الواجهة لسكربت روبلوكس (Lua Script UI)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- إزالة أي واجهة قديمة لمنع التكرار
if CoreGui:FindFirstChild("CustomScriptUI") then
    CoreGui.CustomScriptUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomScriptUI"
ScreenGui.Parent = CoreGui

-- الإطار الرئيسي (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 380)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- جعل النافذة قابلة للسحب
MainFrame.Parent = ScreenGui

-- زوايا دائرية للإطار
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- شريط العنوان (Top Bar)
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -100, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Text = "Royal Menu | القائمة"
TitleLabel.Parent = TopBar

-- زر تغيير اللغة (Language Toggle)
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 35, 0, 28)
LangBtn.Position = UDim2.new(1, -80, 0.5, -14)
LangBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
LangBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LangBtn.TextSize = 12
LangBtn.Font = Enum.Font.GothamBold
LangBtn.Text = "EN/AR"
LangBtn.Parent = TopBar

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 6)
LangCorner.Parent = LangBtn

-- زر الإغلاق (Close Button)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- زر تفعيل ميزة (مثال: Speed Hack)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 290, 0, 45)
ToggleButton.Position = UDim2.new(0.5, -145, 0, 70)
ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamMedium
ToggleButton.Text = "تفعيل السرعة (Speed: OFF)"
ToggleButton.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- زر عائم لإظهار/إخفاء القائمة (Floating Toggle Button)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Size = UDim2.new(0, 50, 0, 50)
OpenBtn.Position = UDim2.new(0, 20, 0.5, -25)
OpenBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 12
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.Text = "MENU"
OpenBtn.Visible = false
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0) -- دائري بالكامل
OpenCorner.Parent = OpenBtn

-- الوظائف البرمجية (Functions)
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

-- متغير لحالة السرعة
local speedActive = false
ToggleButton.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    if speedActive then
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
        ToggleButton.Text = "إيقاف السرعة (Speed: ON)"
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 50
        end
    else
        ToggleButton.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        ToggleButton.Text = "تفعيل السرعة (Speed: OFF)"
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- نظام تغيير اللغة البسيط
local isArabic = true
LangBtn.MouseButton1Click:Connect(function()
    isArabic = not isArabic
    if isArabic then
        TitleLabel.Text = "Royal Menu | القائمة"
        if speedActive then
            ToggleButton.Text = "إيقاف السرعة (Speed: ON)"
        else
            ToggleButton.Text = "تفعيل السرعة (Speed: OFF)"
        end
    else
        TitleLabel.Text = "Royal Menu"
        if speedActive then
            ToggleButton.Text = "Disable Speed (ON)"
        else
            ToggleButton.Text = "Enable Speed (OFF)"
        end
    end
end)
