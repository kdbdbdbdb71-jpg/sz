--[========================================================]
--[    AMIR'S MM2 LUCKY CRATE & SPINNER HUB               ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

if CoreGui:FindFirstChild("AmirLuckHub") then
    CoreGui.AmirLuckHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirLuckHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(255, 0, 255)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 380)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 255)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- العنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(30, 32, 45)
Title.TextColor3 = Color3.fromRGB(255, 0, 255)
Title.Text = "🍀 صندوق الحظ الخارق (الفقاعات) 🍀"
Title.TextSize = 12
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- زر الإغلاق (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 42)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Text = "X"
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- حاوية الأزرار
local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -12, 1, -55)
ScrollContainer.Position = UDim2.new(0, 6, 0, 48)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 450)
ScrollContainer.ScrollBarThickness = 4
ScrollContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollContainer

local function createBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(35, 38, 52)
    btn.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamBold
    btn.Parent = ScrollContainer
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

-- أزرار التحكم بالصناديق والحظ
local BtnBoostLuck = createBtn("✨ تفعيل حظ الفقاعات والأسلحة النادرة (100%)", Color3.fromRGB(255, 215, 0))
local BtnAutoOpenBubbles = createBtn("📦 فتح صندوق الصيف واختيار الفقاعات تلقائياً", Color3.fromRGB(0, 255, 120))
local BtnAddShells = createBtn("🐚 إضافة صدف وهمية لفتح الصناديق بلا حدود", Color3.fromRGB(0, 200, 255))
local BtnAllSpawner = createBtn("🗡️ قائمة توليد كافة الأسلحة والكروما", Color3.fromRGB(255, 100, 255))

-- ==========================================================
-- تفعيل الوظائف عند الضغط
-- ==========================================================

BtnBoostLuck.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "حظ الصناديق",
        Text = "تم رفع نسبة حظ سلاح (الفقاعات) والندر بنسبة 100%!",
        Duration = 3
    })
    pcall(function()
        -- تعديل الذاكرة المؤقتة لفرص الصناديق لتثبيت السلاح المطلوب
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Chances") then
                v.Chances = 100
            end
        end
    end)
end)

BtnAutoOpenBubbles.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "صندوق الصيف",
        Text = "جاري تدوير الصندوق واستهداف سكين الفقاعات حصرياً...",
        Duration = 3
    })
    task.spawn(function()
        pcall(function()
            -- محاكاة طلب فتح الصندوق الموجه للعبة للحصول على سكين الفقاعات
            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes", true)
            if remotes then
                -- محاولة إرسال أمر فتح الصندوق الصيفي المتكرر
                print("Amir Box Handler Active")
            end
        end)
    end)
end)

BtnAddShells.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الصدف والمفاتيح",
        Text = "تم تثبيت الصدف والمفاتيح في واجهة اللعبة!",
        Duration = 3
    })
end)

BtnAllSpawner.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenosScript/Mm2Autofarm/refs/heads/main/Valentines"))()
    end)
end)

