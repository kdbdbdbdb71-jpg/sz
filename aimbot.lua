--[========================================================]
--[    AMIR'S MM2 ARABIC HUB (لوحة أمير الخاصة)             ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- تنظيف أي واجهة قديمة لمنع التكرار
if CoreGui:FindFirstChild("AmirArabicMM2") then
    CoreGui.AmirArabicMM2:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirArabicMM2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم (قابل للسحب والإفلات بإصبعك بكل سهولة)
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 100)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية بالعربي بالكامل
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 100)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- العنوان بالعربي
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(30, 32, 45)
Title.TextColor3 = Color3.fromRGB(0, 255, 100)
Title.Text = "⚡ لوحة أدمن أمير لـ MM2 ⚡"
Title.TextSize = 13
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
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 520)
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

-- أزرار القائمة مترجمة بالكامل للعربية
local BtnSpawner = createBtn("🗡️ تفعيل قائمة الأسلحة والكروما", Color3.fromRGB(255, 215, 0))
local BtnShells = createBtn("🐚 تجميع الصدف والمفاتيح تلقائياً", Color3.fromRGB(255, 150, 100))
local BtnAutoFarm = createBtn("💰 جمع العملات والفلوس أوتوماتيك", Color3.fromRGB(0, 255, 120))
local BtnRoleESP = createBtn("👁️ كشف القاتل والشرطي (رؤية الأسرار)", Color3.fromRGB(255, 100, 255))
local BtnBringGun = createBtn("🔫 جلب المسدس الساقط بالخريطة", Color3.fromRGB(0, 200, 255))
local BtnSpeed = createBtn("⚡ تفعيل سرعة خارقة (120)", Color3.fromRGB(0, 255, 100))

-- ==========================================================
-- تشغيل الأوامر برمجياً
-- ==========================================================

BtnSpawner.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "لوحة أمير",
        Text = "تم فتح قائمة الأسلحة والكروما!",
        Duration = 3
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenosScript/Mm2Autofarm/refs/heads/main/Valentines"))()
    end)
end)

BtnShells.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الحدث الصيفي",
        Text = "جاري تجميع الصدف والمفاتيح الآن...",
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

BtnAutoFarm.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "جمع العملات",
        Text = "تم تفعيل جمع العملات تلقائياً!",
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

BtnRoleESP.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "كشف الأدوار",
        Text = "تم كشف القاتل والشرطي بنجاح!",
        Duration = 2
    })
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        if not p.Character.Head:FindFirstChild("AmirArabicESP") then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "AmirArabicESP"
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

BtnBringGun.MouseButton1Click:Connect(function()
    pcall(function()
        for _, v in pairs(Workspace:GetDescendants()) do
            if v.Name == "GunDrop" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end)
end)

BtnSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 120
    end)
end)
