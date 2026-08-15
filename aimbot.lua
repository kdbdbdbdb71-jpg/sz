--[[
    Matrix Hub - Character Cloner & Skin Stealer
    Developer: أمير
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("MatrixSkinStealer") then
    CoreGui.MatrixSkinStealer:Destroy()
end

-- واجهة نسخ السكنات والأزياء
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixSkinStealer"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 220)
MainFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 28, 38)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.04, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "👕 ناسخ سكنات اللاعبين - أمير"
Title.TextColor3 = Color3.fromRGB(255, 140, 0)
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.91, 0, 0.12, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize = 14
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local TargetBox = Instance.new("TextBox", MainFrame)
TargetBox.Size = UDim2.new(0.85, 0, 0, 45)
TargetBox.Position = UDim2.new(0.075, 0, 0, 60)
TargetBox.BackgroundColor3 = Color3.fromRGB(32, 28, 40)
TargetBox.PlaceholderText = "اكتب اسم اللاعب هنا لنسخ سكنه..."
TargetBox.Text = ""
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 150)
TargetBox.TextSize = 12
TargetBox.Font = Enum.Font.Gotham
Instance.new("UICorner", TargetBox).CornerRadius = UDim.new(0, 8)

local CopyBtn = Instance.new("TextButton", MainFrame)
CopyBtn.Size = UDim2.new(0.85, 0, 0, 42)
CopyBtn.Position = UDim2.new(0.075, 0, 0, 125)
CopyBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
CopyBtn.Text = "نسخ وارتداء السكن فوراً"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.TextSize = 13
CopyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 8)

CopyBtn.MouseButton1Click:Connect(function()
    local target = Players:FindFirstChild(TargetBox.Text)
    if target and target.Character and LocalPlayer.Character then
        local myChar = LocalPlayer.Character
        local targetChar = target.Character
        
        -- نسخ الملابس والملحقات والإكسسوارات
        for _, v in pairs(myChar:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                v:Destroy()
            end
        end
        
        for _, v in pairs(targetChar:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Clothing") or v:IsA("ShirtGraphic") then
                v:Clone().Parent = myChar
            end
        end
        
        -- نسخ ألوان الجسم إن أمكن
        if targetChar:FindFirstChild("Body Colors") and myChar:FindFirstChild("Body Colors") then
            myChar["Body Colors"]:Destroy()
            targetChar["Body Colors"]:Clone().Parent = myChar
        end
        
        CopyBtn.Text = "✅ تم نسخ السكن بنجاح!"
        task.wait(1.5)
        CopyBtn.Text = "نسخ وارتداء السكن فوراً"
    else
        CopyBtn.Text = "❌ اللاعب غير موجود!"
        task.wait(1.5)
        CopyBtn.Text = "نسخ وارتداء السكن فوراً"
    end
end)
