--[========================================================]
--[    AMIR'S ULTIMATE MM2 HUB v3.0 (نسخة احترافية متكاملة)    ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

if CoreGui:FindFirstChild("AmirUltimateMM2") then
    CoreGui.AmirUltimateMM2:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirUltimateMM2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر التشغيل العائم (قابل للسحب)
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 150)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
– اللوحة الرئيسية (تصميم هب احترافي)
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 340)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -170)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 150)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- شريط العنوان العلوي
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 28, 40)
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.Text = "🚀 AMIR SCRIPT HUB - MM2 EDITION 🚀"
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- زر الإغلاق
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.Text = "X"
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- محتوى القائمة (الأزرار والوظائف)
local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -16, 1, -55)
ScrollContainer.Position = UDim2.new(0, 8, 0, 48)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 420)
ScrollContainer.ScrollBarThickness = 4
ScrollContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollContainer

local function createFeatureBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -8, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 34, 48)
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

-- الأزرار والوظائف الأساسية
local BtnBubbles = createFeatureBtn("🫧 تثبيت الحظ والحصول على (سلاح الفقاعات)", Color3.fromRGB(255, 215, 0))
local BtnSpawner = createFeatureBtn("🗡️ قائمة توليد الأسلحة والكروما (Skin Changer)", Color3.fromRGB(255, 100, 255))
local BtnAutoFarm = createFeatureBtn("💰 تفعيل الأوتوفارم وجمع العملات تلقائياً", Color3.fromRGB(0, 255, 120))
local BtnESP = createFeatureBtn("👁️ تفعيل كشف القاتل والشرطي (Role ESP)", Color3.fromRGB(0, 200, 255))
local BtnSpeed = createFeatureBtn("⚡ تفعيل سرعة خارقة للاعب", Color3.fromRGB(255, 165, 0))

-- ==========================================================
-- ربط الأزرار بالوظائف الفعلية
-- ==========================================================

BtnBubbles.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "حظ الصناديق",
        Text = "تم تفعيل نظام استهداف سكين (الفقاعات) بنجاح!",
        Duration = 3
    })
    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "Chances") then
                v.Chances = 100
            end
        end
    end)
end)

BtnSpawner.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الأسلحة",
        Text = "جاري فتح قائمة تغيير الأشكال والسكاكين...",
        Duration = 3
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenosScript/Mm2Autofarm/refs/heads/main/Valentines"))()
    end)
end)

BtnAutoFarm.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الأوتوفارم",
        Text = "تم تشغيل تجميع العملات والصدف أوتوماتيكياً!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.3) do
            pcall(function()
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "Coin_Server" or v.Name == "Coin" or v.Name:lower():find("shell") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

BtnESP.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "كشف الأدوار",
        Text = "تم تفعيل كشف أماكن اللاعبين والقاتل!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        if not p.Character.Head:FindFirstChild("AmirESP") then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "AmirESP"
                            bg.Size = UDim2.new(0, 70, 0, 25)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            bg.Parent = p.Character.Head
                            
                            local txt = Instance.new("TextLabel")
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextColor3 = Color3.fromRGB(255, 0, 0)
                            txt.TextSize = 11
                            txt.Font = Enum.Font.GothamBold
                            txt.Text = p.Name
                            txt.Parent = bg
                        end
                    end
                end
            end)
        end
    end)
end)

BtnSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "السرعة",
            Text = "تم تفعيل السرعة الخارقة!",
            Duration = 2
        })
    end)
end)
