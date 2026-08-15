-- Villar Matrix - GitHub Raw Repository Format
-- Developer: أمير
-- Environment: Delta Executor

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Clean up existing GUI if any
if CoreGui:FindFirstChild("VillarMatrixDelta") then
    CoreGui:FindFirstChild("VillarMatrixDelta"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VillarMatrixDelta"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 128)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -140)
MainFrame.Size = UDim2.new(0, 220, 0, 280)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.Code
Title.Text = "Villar Matrix"
Title.TextColor3 = Color3.fromRGB(15, 15, 15)
Title.TextSize = 16

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

-- Function to create buttons dynamically
local function createStageButton(name, order, callback)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Button.Size = UDim2.new(0, 190, 0, 42)
    Button.Font = Enum.Font.Code
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(0, 255, 128)
    Button.TextSize = 14
    Button.LayoutOrder = order
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button
    
    Button.MouseButton1Click:Connect(callback)
end

-- Stage Buttons Implementation
createStageButton("تفعيل المرحلة الأولى", 1, function()
    print("[Villar Matrix]: تم تنفيذ المرحلة الأولى بنجاح.")
    -- كود المرحلة الأولى هنا
end)

createStageButton("تفعيل المرحلة الثانية", 2, function()
    print("[Villar Matrix]: تم تنفيذ المرحلة الثانية بنجاح.")
    -- كود المرحلة الثانية هنا
end)

createStageButton("تفعيل المرحلة الثالثة", 3, function()
    print("[Villar Matrix]: تم تنفيذ المرحلة الثالثة بنجاح.")
    -- كود المرحلة الثالثة هنا
end)

createStageButton("تفعيل المرحلة الرابعة", 4, function()
    print("[Villar Matrix]: تم تنفيذ المرحلة الرابعة بنجاح.")
    -- كود المرحلة الرابعة هنا
end)

print("[Villar Matrix]: تم تحميل واجهة دلتا بنجاح بواسطة أمير.")
