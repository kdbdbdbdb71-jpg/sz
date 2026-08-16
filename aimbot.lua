--[========================================================]
--[           MATRIX HUB - ULTIMATE CORE ENGINE            ]
--[           Developer: أمير                             ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 1. نظام الترجمة (عربي / إنجليزي)
local Translations = {
    ["AR"] = {
        ["Title"] = "نظام التفعيل // الماتريكس",
        ["Info"] = "أدخل مفتاح الماتريكس للوصول إلى كامل خصائص النظام.",
        ["Placeholder"] = "أدخل المفتاح هنا...",
        ["Status_Ready"] = "الحالة: جاهز للاتصال",
        ["Status_Checking"] = "جاري التحقق من السيرفر...",
        ["Status_Success"] = "تم التحقق! جاري التحميل...",
        ["Status_Empty"] = "الرجاء إدخال المفتاح أولاً!",
        ["Status_Error"] = "خطأ في الاتصال بالملف.",
        ["Verify"] = "تحقق وتفعيل",
        ["CopyLink"] = "نسخ رابط المفتاح",
        ["SuccessNotif"] = "تم التفعيل بنجاح عبر الماتريكس.",
        ["ErrorNotif"] = "فشل التحقق من المفتاح."
    },
    ["EN"] = {
        ["Title"] = "MATRIX HUB // ACTIVATION",
        ["Info"] = "Enter your Matrix key to unlock full system features.",
        ["Placeholder"] = "Enter key here...",
        ["Status_Ready"] = "STATUS: READY TO CONNECT",
        ["Status_Checking"] = "CHECKING SERVER...",
        ["Status_Success"] = "VERIFIED! LOADING...",
        ["Status_Empty"] = "PLEASE ENTER THE KEY!",
        ["Status_Error"] = "CONNECTION ERROR.",
        ["Verify"] = "VERIFY KEY",
        ["CopyLink"] = "COPY LINK",
        ["SuccessNotif"] = "Successfully activated via Matrix.",
        ["ErrorNotif"] = "Key verification failed."
    }
}

local CurrentLang = "AR"

-- تنظيف الواجهات القديمة
if CoreGui:FindFirstChild("MatrixUltimateActivation") then
    CoreGui.MatrixUltimateActivation:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixUltimateActivation"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success, err = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = PlayerGui
end

-- نظام الإشعارات الداخلي
local NotificationHolder = Instance.new("Frame")
NotificationHolder.Name = "NotificationHolder"
NotificationHolder.Size = UDim2.new(0, 300, 1, 0)
NotificationHolder.Position = UDim2.new(1, -320, 0, 20)
NotificationHolder.BackgroundTransparency = 1
NotificationHolder.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = NotificationHolder

local function SendNotification(title, message, duration)
    duration = duration or 3
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(1, 0, 0, 70)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(5, 12, 5)
    NotifFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
    NotifFrame.BorderSizePixel = 1
    NotifFrame.BackgroundTransparency = 0.1
    NotifFrame.Parent = NotificationHolder
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = NotifFrame
    
    local Glow = Instance.new("UIStroke")
    Glow.Color = Color3.fromRGB(0, 255, 65)
    Glow.Thickness = 1.5
    Glow.Parent = NotifFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -20, 0, 35)
    DescLabel.Position = UDim2.new(0, 10, 0, 30)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Font = Enum.Font.Code
    DescLabel.Text = message
    DescLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
    DescLabel.TextSize = 12
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = NotifFrame
    
    task.delay(duration, function()
        local tween = TweenService:Create(NotifFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Connect(function()
            NotifFrame:Destroy()
        end)
    end)
end

-- واجهة التفعيل الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 440, 0, 290)
MainFrame.Position = UDim2.new(0.5, -220, 0.5, -145)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainGlow = Instance.new("UIStroke")
MainGlow.Color = Color3.fromRGB(0, 255, 65)
MainGlow.Thickness = 2
MainGlow.Parent = MainFrame

-- الشريط العلوي
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(10, 20, 10)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -60, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.Code
TitleText.TextColor3 = Color3.fromRGB(0, 255, 65)
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Header

-- زر تغيير اللغة (مترجم فوري)
local LangBtn = Instance.new("TextButton")
LangBtn.Size = UDim2.new(0, 45, 0, 25)
LangBtn.Position = UDim2.new(1, -50, 0, 7)
LangBtn.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
LangBtn.BorderColor3 = Color3.fromRGB(0, 200, 50)
LangBtn.Font = Enum.Font.Code
LangBtn.Text = "EN/AR"
LangBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
LangBtn.TextSize = 11
LangBtn.Parent = Header

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 4)
LangCorner.Parent = LangBtn

-- وصف ترحيبي
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 0, 40)
InfoLabel.Position = UDim2.new(0, 20, 0, 50)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Font = Enum.Font.Code
InfoLabel.TextColor3 = Color3.fromRGB(150, 220, 150)
InfoLabel.TextSize = 12
InfoLabel.TextWrapped = true
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = MainFrame

-- حقل إدخال المفتاح
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.Position = UDim2.new(0, 20, 0, 100)
KeyBox.BackgroundColor3 = Color3.fromRGB(10, 15, 10)
KeyBox.BorderColor3 = Color3.fromRGB(0, 180, 50)
KeyBox.BorderSizePixel = 1
KeyBox.Font = Enum.Font.Code
KeyBox.TextColor3 = Color3.fromRGB(0, 255, 65)
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = MainFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 6)
KeyBoxCorner.Parent = KeyBox

-- نص الحالة
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 25)
StatusLabel.Position = UDim2.new(0, 20, 0, 150)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Code
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 50)
StatusLabel.TextSize = 12
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- حاوية الأزرار في الأسفل
local ButtonHolder = Instance.new("Frame")
ButtonHolder.Size = UDim2.new(1, -40, 0, 45)
ButtonHolder.Position = UDim2.new(0, 20, 0, 185)
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.FillDirection = Enum.FillDirection.Horizontal
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.Parent = ButtonHolder

-- زر التحقق الأساسي
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.5, -5, 1, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
VerifyBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
VerifyBtn.Font = Enum.Font.Code
VerifyBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
VerifyBtn.TextSize = 13
VerifyBtn.Parent = ButtonHolder

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 6)
VerifyCorner.Parent = VerifyBtn

-- زر نسخ الرابط
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.5, -5, 1, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 15)
GetKeyBtn.BorderColor3 = Color3.fromRGB(0, 150, 40)
GetKeyBtn.Font = Enum.Font.Code
GetKeyBtn.TextColor3 = Color3.fromRGB(150, 255, 150)
GetKeyBtn.TextSize = 13
GetKeyBtn.Parent = ButtonHolder

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

-- تحديث النصوص بناءً على اللغة المحددة
local function UpdateUI()
    local T = Translations[CurrentLang]
    TitleText.Text = T["Title"]
    InfoLabel.Text = T["Info"]
    KeyBox.PlaceholderText = T["Placeholder"]
    StatusLabel.Text = T["Status_Ready"]
    VerifyBtn.Text = T["Verify"]
    GetKeyBtn.Text = T["CopyLink"]
end

-- تبديل اللغة عبر الزر العلوي
LangBtn.MouseButton1Click:Connect(function()
    CurrentLang = (CurrentLang == "AR" and "EN" or "AR")
    UpdateUI()
end)

-- وظيفة زر التحقق وتشغيل السكربت المطلوب
VerifyBtn.MouseButton1Click:Connect(function()
    local T = Translations[CurrentLang]
    local enteredKey = KeyBox.Text
    
    if enteredKey == "" then
        StatusLabel.Text = T["Status_Empty"]
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        SendNotification("Matrix Hub", T["Status_Empty"], 2)
        return
    end
    
    StatusLabel.Text = T["Status_Checking"]
    StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 50)
    
    task.wait(1.5)
    
    if #enteredKey >= 3 then
        StatusLabel.Text = T["Status_Success"]
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
        SendNotification("Matrix Hub // أمير", T["SuccessNotif"], 3)
        
        task.wait(1)
        ScreenGui:Destroy()
        
        -- تشغيل السكربت المطلوب بأمان تام
        local success, result = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
        end)
        
        if not success then
            warn("Matrix Hub Error: " .. tostring(result))
        end
    else
        StatusLabel.Text = T["Status_Error"]
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        SendNotification("Matrix Hub", T["ErrorNotif"], 2)
    end
end)

-- وظيفة زر النسخ
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://github.com/caomod2077/Script")
        StatusLabel.Text = (CurrentLang == "AR" and "الحالة: تم نسخ الرابط بنجاح" or "STATUS: LINK COPIED")
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
        SendNotification("Matrix Hub", "Link copied to clipboard.", 2)
    else
        StatusLabel.Text = (CurrentLang == "ار" and "الحالة: الحافظة غير مدعومة" or "STATUS: CLIPBOARD UNSUPPORTED")
        StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
    end
end)

-- التهيئة الأولية
UpdateUI()
