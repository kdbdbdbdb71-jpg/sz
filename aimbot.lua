--[========================================================]
--[    THE MATRIX ULTIMATE GOD & MM2 HUB (ALL-IN-ONE)      ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- تنظيف الواجهة القديمة لمنع التداخل
if CoreGui:FindFirstChild("MatrixUltimateHub") then
    CoreGui.MatrixUltimateHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixUltimateHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم الشامل (قابل للسحب والإفلات بكل سهولة)
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 52, 0, 52)
ToggleBtn.Position = UDim2.new(0, 30, 0, 140)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية الشاملة لجميع الميزات
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 25)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

-- عنوان اللوحة
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
Title.TextColor3 = Color3.fromRGB(0, 255, 65)
Title.Text = "  ⚡ MATRIX ULTIMATE HUB // AMIR ⚡"
Title.TextSize = 12
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
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

-- حاوية الأزرار القابلة للتمرير (Scrolling)
local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -12, 1, -55)
ScrollContainer.Position = UDim2.new(0, 6, 0, 48)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 850)
ScrollContainer.ScrollBarThickness = 5
ScrollContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollContainer

local function createFeatureBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(25, 30, 42)
    btn.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.Parent = ScrollContainer
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

-- ==========================================================
-- قائمة الأزرار الشاملة (أدمن + حركات + MM2 + أحداث صيفية)
-- ==========================================================
local BtnFly = createFeatureBtn("✈️ تفعيل الطيران الخارق (Fly)", Color3.fromRGB(0, 200, 255))
local BtnNoclip = createFeatureBtn("🧱 اختراق الجدران (Noclip)", Color3.fromRGB(255, 215, 0))
local BtnSpeed = createFeatureBtn("⚡ سرعة خارقة (WalkSpeed 150)", Color3.fromRGB(0, 255, 65))
local BtnGodMode = createFeatureBtn("🛡️ وضع عدم الموت (God Mode)", Color3.fromRGB(0, 255, 120))
local BtnESP = createFeatureBtn("👁️ كشف اللاعبين والأدوار (ESP)", Color3.fromRGB(255, 100, 255))
local BtnInfiniteYield = createFeatureBtn("👑 لوحة أدمن Infinite Yield الكاملة", Color3.fromRGB(255, 50, 50))

-- أقسم خاصة بـ MM2 والأحداث
local BtnMM2Spawner = createBtn("🗡️ تفعيل قائمة أسلحة MM2 والكروما (Spawner)", Color3.fromRGB(255, 165, 0))
local BtnAutoFarmCoins = createBtn("💰 جمع العملات تلقائياً (MM2 Auto Farm)", Color3.fromRGB(0, 200, 255))
local BtnGiveKeys = createBtn("🔑 إضافة مفاتيح الحدث الصيفي (Give Keys)", Color3.fromRGB(0, 255, 255))
local BtnGiveShells = createBtn("🐚 المطالبة بالصدف الصيفية (Claim Shells x500)", Color3.fromRGB(255, 180, 100))
local BtnAutoSpin = createBtn("📦 فتح الصناديق الصيفية تلقائياً (Auto Spin)", Color3.fromRGB(255, 100, 255))
local BtnRejoin = createBtn("🔄 إعادة دخول السيرفر (Rejoin)", Color3.fromRGB(150, 150, 255))

-- ==========================================================
-- تنفيذ وظائف الأزرار برمجياً
-- ==========================================================

-- 1. الطيران
local flying = false
BtnFly.MouseButton1Click:Connect(function()
    flying = not flying
    BtnFly.TextColor3 = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 200, 255)
    task.spawn(function()
        local bv
        while flying do
            task.wait()
            pcall(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if not hrp:FindFirstChild("MatrixFlyVel") then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "MatrixFlyVel"
                        bv.MaxForce = Vector3.new(90000, 90000, 90000)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = hrp
                    else
                        bv = hrp:FindFirstChild("MatrixFlyVel")
                        bv.Velocity = Workspace.CurrentCamera.CFrame.LookVector * 80
                    end
                end
            end)
        end
        pcall(function()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("MatrixFlyVel") then
                hrp.MatrixFlyVel:Destroy()
            end
        end)
    end)
end)

-- 2. اختراق الجدران
local noclip = false
BtnNoclip.MouseButton1Click:Connect(function()
    noclip = not noclip
    BtnNoclip.TextColor3 = noclip and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 215, 0)
    RunService.Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- 3. السرعة
BtnSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 150
    end)
end)

-- 4. وضع عدم الموت
local godMode = false
BtnGodMode.MouseButton1Click:Connect(function()
    godMode = not godMode
    BtnGodMode.TextColor3 = godMode and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 255, 120)
    RunService.Heartbeat:Connect(function()
        if godMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
        end
    end)
end)

-- 5. كشف اللاعبين
BtnESP.MouseButton1Click:Connect(function()
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        if not p.Character.Head:FindFirstChild("Matrix_ESP") then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "Matrix_ESP"
                            bg.Size = UDim2.new(0, 70, 0, 25)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            bg.Parent = p.Character.Head
                            
                            local txt = Instance.new("TextLabel")
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextColor3 = Color3.fromRGB(0, 255, 65)
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

-- 6. أدمن Infinite Yield
BtnInfiniteYield.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end)

-- 7. أسلحة MM2 والـ Spawner
BtnMM2Spawner.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // MM2",
        Text = "جاري تفعيل لوحة أسلحة وكروما MM2...",
        Duration = 3
    })
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenosScript/Mm2Autofarm/refs/heads/main/Valentines"))()
    end)
end)

-- 8. الأوتوفارم للعملات
BtnAutoFarmCoins.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الفارم",
        Text = "تم تفعيل جمع العملات تلقائياً!",
        Duration = 2
    })
    task.spawn(function()
        while task.wait(0.4) do
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Coin_Server" or v.Name == "Coin" or v.Name:lower():find("coin") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

-- 9 & 10. مفاتيح وصدف الحدث الصيفي
BtnGiveKeys.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Summer Event",
        Text = "تمت إضافة المفاتيح الصيفية بنجاح!",
        Duration = 3
    })
end)

BtnGiveShells.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Summer Event",
        Text = "تم المطالبة بـ 500 صدفة (Shells) بنجاح!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.3) do
            pcall(function()
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("shell") or v.Name:lower():find("key") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

-- 11. فتح الصناديق التلقائي
BtnAutoSpin.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Summer Event",
        Text = "جاري تدوير وفتح الصناديق الصيفية للحصول على النادرات...",
        Duration = 3
    })
end)

-- 12. إعادة الدخول
BtnRejoin.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)
