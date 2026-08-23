--[========================================================]
--[    THE MATRIX // ULTIMATE GOD HUB (V.5.0)              ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- تنظيف أي واجهة قديمة لمنع التداخل
if CoreGui:FindFirstChild("MatrixGodHub") then
    CoreGui.MatrixGodHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixGodHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم (قابل للسحب والإفلات بإصبعك بكل سهولة)
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
-- اللوحة الرئيسية الشاملة (تحتوي على أقسام لكل الميزات)
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 310, 0, 380)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -190)
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
Title.Text = "  ⚡ THE MATRIX ULTIMATE HUB ⚡"
Title.TextSize = 13
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
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 650)
ScrollContainer.ScrollBarThickness = 5
ScrollContainer.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollContainer

-- دالة مساعدة لإنشاء الأزرار باحترافية
local function createFeatureBtn(text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(25, 30, 42)
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

-- ==========================================================
-- قائمة الأزرار والمميزات الخرافية
-- ==========================================================
local BtnFly = createFeatureBtn("✈️ تفعيل الطيران الخارق (Fly)", Color3.fromRGB(0, 200, 255))
local BtnNoclip = createFeatureBtn("🧱 اختراق الجدران (Noclip - عبر الحوائط)", Color3.fromRGB(255, 215, 0))
local BtnSpeed = createFeatureBtn("⚡ سرعة خارقة (WalkSpeed 150)", Color3.fromRGB(0, 255, 65))
local BtnJump = createFeatureBtn("🦘 قفز عالي جداً (Super Jump)", Color3.fromRGB(255, 150, 0))
local BtnESP = createFeatureBtn("👁️ كشف اللاعبين والأماكن (ESP Boxes)", Color3.fromRGB(255, 100, 255))
local BtnGodMode = createFeatureBtn("🛡️ وضع عدم الموت (God Mode / الصحة الكاملة)", Color3.fromRGB(0, 255, 120))
local BtnInvis = createFeatureBtn("👻 التخفي التام عن عيون اللاعبين (Invisibility)", Color3.fromRGB(200, 200, 200))
local BtnInfiniteYield = createFeatureBtn("👑 تحميل لوحة أدمن Infinite Yield الكاملة", Color3.fromRGB(255, 50, 50))
local BtnRejoin = createFeatureBtn("🔄 إعادة دخول السيرفر الحالي (Rejoin)", Color3.fromRGB(150, 150, 255))

-- ==========================================================
-- البرمجة ووظائف الميزات بالتفصيل
-- ==========================================================

-- 1. الطيران الخارق
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

-- 2. اختراق الجدران (Noclip)
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

-- 3. السرعة الخارقة
BtnSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 150
    end)
end)

-- 4. القفز العالي
BtnJump.MouseButton1Click:Connect(function()
    pcall(function()
        local hum = LocalPlayer.Character.Humanoid
        hum.JumpPower = 300
        hum.UseJumpPower = true
    end)
end)

-- 5. كشف اللاعبين (ESP)
local espActive = false
BtnESP.MouseButton1Click:Connect(function()
    espActive = not espActive
    BtnESP.TextColor3 = espActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 255)
    task.spawn(function()
        while espActive and task.wait(1) do
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        if not p.Character.Head:FindFirstChild("MatrixESP_Tag") then
                            local bg = Instance.new("BillboardGui")
                            bg.Name = "MatrixESP_Tag"
                            bg.Size = UDim2.new(0, 80, 0, 30)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            bg.Parent = p.Character.Head
                            
                            local txt = Instance.new("TextLabel")
                            txt.Size = UDim2.new(1,0,1,0)
                            txt.BackgroundTransparency = 1
                            txt.TextColor3 = Color3.fromRGB(0, 255, 65)
                            txt.TextSize = 12
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

-- 6. وضع عدم الموت (God Mode)
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

-- 7. التخفي التام
BtnInvis.MouseButton1Click:Connect(function()
    pcall(function()
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("MeshPart") then
                part.Transparency = 1
            elseif part:IsA("Accessory") then
                part:Destroy()
            end
        end
    end)
end)

-- 8. تحميل Infinite Yield الشامل
BtnInfiniteYield.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end)

-- 9. إعادة دخول السيرفر
BtnRejoin.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end)
