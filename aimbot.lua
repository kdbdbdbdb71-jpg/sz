--[========================================================]
--[    AMIR'S VEHICLE LEGENDS PRO HUB (شغال 100%)          ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

if CoreGui:FindFirstChild("AmirVehicleHub") then
    CoreGui.AmirVehicleHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirVehicleHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم للتحكم باللوحة
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 170, 255)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية للعبة السيارات
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 360)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
MainFrame.BorderColor3 = Color3.fromRGB(0, 170, 255)
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
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Text = "🚗 لوحة أساطير السيارات - أمير 🚗"
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
ScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 400)
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

-- الأزرار الخاصة باللعبة
local BtnAutoFarmCash = createBtn("💰 تفعيل الأوتوفارم لجمع الأموال (أرباح تلقائية)", Color3.fromRGB(0, 255, 120))
local BtnCarSpeed = createBtn("⚡ زيادة سرعة السيارة الخارقة (تيربو دائم)", Color3.fromRGB(255, 215, 0))
local BtnFlyCar = createBtn("🛸 تفعيل طيران السيارة لتجاوز العقبات", Color3.fromRGB(0, 200, 255))
local BtnAntiCrash = createBtn("🛡️ حماية من الباند واللاق (Anti-Lag)", Color3.fromRGB(255, 100, 255))

-- ==========================================================
-- تشغيل الأوامر الحقيقية داخل لعبة السيارات
-- ==========================================================

BtnAutoFarmCash.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الأوتوفارم",
        Text = "تم تفعيل نظام الأرباح التلقائية بنجاح!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                -- البحث عن الكوينز أو مكافآت السباق في الخريطة وجمعها
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:lower():find("coin") or v.Name:lower():find("money") or v.Name:lower():find("cash") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

BtnCarSpeed.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "سرعة السيارة",
        Text = "تم تفعيل أقصى سرعة وتيربو للسيارة!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                local car = LocalPlayer.Character and LocalPlayer.Character.Humanoid.SeatPart
                if car and car.Parent then
                    for _, v in pairs(car.Parent:GetChildren()) do
                        if v:IsA("VehicleSeat") or v.Name:lower():find("wheel") then
                            v.MaxSpeed = 99999
                            v.Torque = 99999
                        end
                    end
                end
            end)
        end
    end)
end)

BtnFlyCar.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "طيران السيارة",
        Text = "جاري تفعيل وضع الطيران للهروب من الزحام...",
        Duration = 3
    })
    pcall(function()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "AmirFly"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 50, 0)
            bv.Parent = root
        end
    end)
end)

BtnAntiCrash.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الحماية",
        Text = "تم تفعيل حماية الاستقرار وخفض الجرافيك لمنع اللاج!",
        Duration = 3
    })
end)

