--[[
    Matrix Account Manager - Universal Account Data
    Developer: أمير
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("MatrixAccountsHub") then
    CoreGui.MatrixAccountsHub:Destroy()
end

-- واجهة عرض الحسابات
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixAccountsHub"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 280)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
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
Title.Text = "👤 معلومات حسابات العالم - أمير"
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

local Content = Instance.new("ScrollingFrame", MainFrame)
Content.Size = UDim2.new(1, -20, 1, -50)
Content.Position = UDim2.new(0, 10, 0, 45)
Content.BackgroundTransparency = 1
Content.CanvasSize = UDim2.new(0, 0, 0, 300)
Content.ScrollBarThickness = 4

local Layout = Instance.new("UIListLayout", Content)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 8)

local function createInfoBox(text)
    local box = Instance.new("TextLabel", Content)
    box.Size = UDim2.new(0.95, 0, 0, 40)
    box.BackgroundColor3 = Color3.fromRGB(32, 28, 40)
    box.Text = text
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.TextSize = 12
    box.Font = Enum.Font.GothamBold
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
end

createInfoBox("اسم الحساب: " .. LocalPlayer.Name)
createInfoBox("اسم العرض (Display): " .. LocalPlayer.DisplayName)
createInfoBox("آيدي الحساب (User ID): " .. tostring(LocalPlayer.UserId))
createInfoBox("عمر الحساب (بالأيام): " .. tostring(LocalPlayer.AccountAge))
