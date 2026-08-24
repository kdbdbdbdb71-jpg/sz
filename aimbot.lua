--[========================================================]
--[    AMIR'S KICK & POWER SIMULATOR PRO HUB               ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")

if CoreGui:FindFirstChild("AmirKickSimulatorHub") then
    CoreGui.AmirKickSimulatorHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirKickSimulatorHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم (قابل للسحب والإفلات)
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(255, 100, 0)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية بالعربي
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 380)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(255, 100, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(30, 32, 45)
Title.TextColor3 = Color3.fromRGB(255, 140, 0)
Title.Text = "⚽ لوحة الركلات الخارقة - أمير ⚽"
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

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

local ScrollContainer = Instance.new("ScrollingFrame")
ScrollContainer.Size = UDim2.new(1, -12, 1, -55)
ScrollContainer.Position = UDim2.new(0, 6, 0, 48)
ScrollContainer.BackgroundTransparency = 1
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 420)
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

-- الأزرار الخاصة بماب الركلات وتجميع القوة
local BtnAutoKick = createBtn("⚽ تفعيل الركل التلقائي (Auto Kick)", Color3.fromRGB(0, 255, 120))
local BtnAutoTrain = createBtn("💪 زيادة القوة والتدريب تلقائياً (+1 Power)", Color3.fromRGB(255, 215, 0))
local BtnClaimRewards = createBtn("🎁 استلام الهدايا والجوائز أوتوماتيك", Color3.fromRGB(0, 200, 255))
local BtnFastSpeed = createBtn("⚡ تفعيل سرعة خارقة (WalkSpeed 100)", Color3.fromRGB(255, 100, 255))
local BtnAntiAFK = createBtn("🛡️ منع الطرد بسبب الخمول (Anti-AFK)", Color3.fromRGB(200, 200, 200))

-- ==========================================================
-- تشغيل الوظائف البرمجية
-- ==========================================================

-- 1. الركل التلقائي
BtnAutoKick.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الركل التلقائي",
        Text = "تم تفعيل الركل المتكرر بنجاح!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.1) do
            pcall(function()
                -- محاكاة النقر للركل المستمر
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("kick") or remote.Name:lower():find("shoot") or remote.Name:lower():find("power")) then
                        remote:FireServer()
                    end
                end
            end)
        end
    end)
end)

-- 2. التدريب وزيادة القوة
BtnAutoTrain.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "التدريب التلقائي",
        Text = "جاري تجميع نقاط القوة بدون توقف...",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.2) do
            pcall(function()
                for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                    if remote:IsA("RemoteEvent") and (remote.Name:lower():find("train") or remote.Name:lower():find("click") or remote.Name:lower():find("stat")) then
                        remote:FireServer()
                    end
                end
            end)
        end
    end)
end)

-- 3. الهدايا
BtnClaimRewards.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الجوائز",
        Text = "جاري فتح واستلام الهدايا المتاحة...",
        Duration = 2
    })
    task.spawn(function()
        pcall(function()
            for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                if remote:IsA("RemoteEvent") and (remote.Name:lower():find("reward") or remote.Name:lower():find("claim") or remote.Name:lower():find("gift")) then
                    remote:FireServer()
                end
            end
        end)
    end)
end)

-- 4. السرعة
BtnFastSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "السرعة",
            Text = "تم تفعيل السرعة الخارقة!",
            Duration = 2
        })
    end)
end)

-- 5. منع الخمول
BtnAntiAFK.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "حماية الخمول",
        Text = "تم تفعيل منع الطرد (Anti-AFK) بنجاح!",
        Duration = 3
    })
    LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
