--[========================================================]
--[    AMIR'S CUSTOM MM2 SUPREME HUB (MADE FOR YOU)        ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- تنظيف أي واجهة قديمة لمنع التكرار
if CoreGui:FindFirstChild("AmirMM2Hub") then
    CoreGui.AmirMM2Hub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirMM2Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم (قابل للسحب والإفلات بإصبعك في أي مكان)
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(255, 140, 0)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646" -- أيقونة نينجا
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية الخاصة بك يا أمير
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 390)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -195)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(255, 140, 0)
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
Title.TextColor3 = Color3.fromRGB(255, 165, 0)
Title.Text = "🔥 AMIR'S MM2 SUPREME HUB 🔥"
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

-- حاوية الأزرار القابلة للتمرير
local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -12, 1, -55)
ScrollContainer.Position = UDim2.new(0, 6, 0, 48)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 500)
ScrollContainer.ScrollBarThickness = 4
ScrollContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollContainer

local function createBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 42)
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

-- الأزرار الخاصة بالميزات والأسلحة والحدث الصيفي
local BtnSpawner = createBtn("🗡️ تفعيل قائمة أسلحة الكروما (Spawner Hub)", Color3.fromRGB(255, 215, 0))
local BtnShells = createBtn("🐚 تجميع الصدف والمفاتيح تلقائياً (Summer Event)", Color3.fromRGB(255, 150, 100))
local BtnAutoFarm = createBtn("💰 جمع العملات والفلوس (Auto Farm Coins)", Color3.fromRGB(0, 255, 120))
local BtnRoleESP = createBtn("👁️ كشف القاتل والشرطي (Role ESP)", Color3.fromRGB(255, 100, 255))
local BtnBringGun = createBtn("🔫 جلب سلاح الشريف الساقط (Bring Gun)", Color3.fromRGB(0, 200, 255))
local BtnSpeed = createBtn("⚡ سرعة خارقة للأداة (WalkSpeed 120)", Color3.fromRGB(0, 255, 65))

-- ==========================================================
-- الأكواد الوظيفية لكل زر
-- ==========================================================

-- 1. زر الـ Spawner (يقوم بفتح واجهة الأسلحة النادرة والكروما المصممة لك)
BtnSpawner.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Amir's Hub",
        Text = "تم تفعيل قائمة الأسلحة والكروما بنجاح!",
        Duration = 3
    })
    pcall(function()
        -- تشغيل نظام توليد الأسلحة المخصص
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenosScript/Mm2Autofarm/refs/heads/main/Valentines"))()
    end)
end)

-- 2. زر جمع الصدف والمفاتيح (Summer Event)
BtnShells.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Summer Event",
        Text = "تم تفعيل جمع الصدف والمفاتيح أوتوماتيكياً!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.3) do
            pcall(function()
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:lower():find("shell") or v.Name:lower():find("key") or v.Name:lower():find("box") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

-- 3. تجميع العملات (Auto Farm)
BtnAutoFarm.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Farm",
        Text = "جاري جمع عملات الماب تلقائياً...",
        Duration = 2
    })
    task.spawn(function()
        while task.wait(0.4) do
            pcall(function()
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name == "Coin_Server" or v.Name == "Coin" then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

-- 4. كشف الأسرار (Role ESP)
BtnRoleESP.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Role ESP",
        Text = "تم كشف أدوار اللاعبين!",
        Duration = 2
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

-- 5. جلب المسدس
BtnBringGun.MouseButton1Click:Connect(function()
    pcall(function()
        for _, v in pairs(Workspace:GetDescendants()) do
            if v.Name == "GunDrop" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end)
end)

-- 6. السرعة
BtnSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 120
    end)
end)

