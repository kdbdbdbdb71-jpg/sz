--[========================================================]
--[    AMIR'S INTERNET CAFE TYCOON PRO HUB                  ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

if CoreGui:FindFirstChild("AmirInternetCafeHub") then
    CoreGui.AmirInternetCafeHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirInternetCafeHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- زر النينجا العائم للتحكم بالقائمة
-- ==========================================================
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 200)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- ==========================================================
-- اللوحة الرئيسية بتصميم فخم وبالعربي
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 360)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 200)
MainFrame.BorderSizePixel = 2
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 42)
Title.BackgroundColor3 = Color3.fromRGB(25, 28, 40)
Title.TextColor3 = Color3.fromRGB(0, 255, 200)
Title.Text = "💻 لوحة مقهى الألعاب - أمير 💻"
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

-- الأزرار الخاصة بمقهى الألعاب
local BtnAutoMoney = createBtn("💰 جمع الأرباح والأموال تلقائياً (Auto Cash)", Color3.fromRGB(0, 255, 120))
local BtnFastPCs = createBtn("⚡ تفعيل سرعة العمل وتطوير الحواسيب", Color3.fromRGB(255, 215, 0))
local BtnAutoCollect = createBtn("📥 تجمع الإيرادات من طاولات الزبائن", Color3.fromRGB(0, 200, 255))
local BtnSuperSpeed = createBtn("🚀 سرعة خارقة للتنقل في المقهى", Color3.fromRGB(255, 100, 255))

-- ==========================================================
-- تشغيل الأوامر والوظائف للماب
-- ==========================================================

BtnAutoMoney.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "الأموال التلقائية",
        Text = "تم تفعيل نظام الأرباح الهائلة بنجاح!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(0.5) do
            pcall(function()
                -- البحث التلقائي عن الصناديق أو أزرار جمع الفلوس في المقهى
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("TouchTransmitter") and v.Parent and (v.Parent.Name:lower():find("cash") or v.Parent.Name:lower():find("money") or v.Parent.Name:lower():find("collect")) then
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                        firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
            end)
        end
    end)
end)

BtnFastPCs.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ترقية الأجهزة",
        Text = "جاري تفعيل كفاءة وتطوير الحواسيب...",
        Duration = 3
    })
    pcall(function()
        for _, remote in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if remote:IsA("RemoteEvent") and (remote.Name:lower():find("upgrade") or remote.Name:lower():find("buy") or remote.Name:lower():find("pc")) then
                remote:FireServer()
            end
        end
    end)
end)

BtnAutoCollect.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "إيرادات الطاولات",
        Text = "تم تفعيل جمع أرباح الزبائن أوتوماتيكياً!",
        Duration = 3
    })
    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v.Name:lower():find("income") or v.Name:lower():find("profit") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

BtnSuperSpeed.MouseButton1Click:Connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 80
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "السرعة",
            Text = "تم تفعيل السرعة الخارقة لتطوير المقهى بسرعة!",
            Duration = 2
        })
    end)
end)
