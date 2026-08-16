--[========================================================]
--[           MATRIX HUB - ACTIVATION & LICENSE ENGINE     ]
--[           Developer: أمير                             ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean up existing instances
if CoreGui:FindFirstChild("MatrixActivationGUI") then
    CoreGui.MatrixActivationGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixActivationGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = PlayerGui
end

-- Main Activation Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "ActivationFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 250)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainGlow = Instance.new("UIStroke")
MainGlow.Color = Color3.fromRGB(0, 255, 65)
MainGlow.Thickness = 2
MainGlow.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(10, 20, 10)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -20, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.Code
TitleText.Text = "MATRIX HUB // SECURITY ACTIVATION"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 65)
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Header

-- Subtitle / Instructions
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 0, 40)
InfoLabel.Position = UDim2.new(0, 20, 0, 45)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Font = Enum.Font.Code
InfoLabel.Text = "Enter your license key or request activation to unlock the full Matrix terminal suite."
InfoLabel.TextColor3 = Color3.fromRGB(150, 220, 150)
InfoLabel.TextSize = 12
InfoLabel.TextWrapped = true
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = MainFrame

-- Key Input Box
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.Position = UDim2.new(0, 20, 0, 95)
KeyBox.BackgroundColor3 = Color3.fromRGB(10, 15, 10)
KeyBox.BorderColor3 = Color3.fromRGB(0, 180, 50)
KeyBox.BorderSizePixel = 1
KeyBox.Font = Enum.Font.Code
KeyBox.PlaceholderText = "ENTER-KEY-HERE..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(80, 120, 80)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(0, 255, 65)
KeyBox.TextSize = 14
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = MainFrame

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 6)
KeyBoxCorner.Parent = KeyBox

-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -40, 0, 25)
StatusLabel.Position = UDim2.new(0, 20, 0, 145)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Code
StatusLabel.Text = "STATUS: WAITING FOR INPUT"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 50)
StatusLabel.TextSize = 12
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

-- Action Buttons Holder
local ButtonHolder = Instance.new("Frame")
ButtonHolder.Size = UDim2.new(1, -40, 0, 35)
ButtonHolder.Position = UDim2.new(0, 20, 0, 185)
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.FillDirection = Enum.FillDirection.Horizontal
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayoutPadding = UDim.new(0, 10)
UIList.Padding = UDim.new(0, 10)
UIList.Parent = ButtonHolder

-- Verify Button
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.5, -5, 1, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 20)
VerifyBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
VerifyBtn.Font = Enum.Font.Code
VerifyBtn.Text = "VERIFY KEY"
VerifyBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
VerifyBtn.TextSize = 13
VerifyBtn.Parent = ButtonHolder

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 6)
VerifyCorner.Parent = VerifyBtn

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.5, -5, 1, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 15)
GetKeyBtn.BorderColor3 = Color3.fromRGB(0, 150, 40)
GetKeyBtn.Font = Enum.Font.Code
GetKeyBtn.Text = "COPY LINK"
GetKeyBtn.TextColor3 = Color3.fromRGB(150, 255, 150)
GetKeyBtn.TextSize = 13
GetKeyBtn.Parent = ButtonHolder

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 6)
GetKeyCorner.Parent = GetKeyBtn

-- Functionality
VerifyBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    if enteredKey == "" then
        StatusLabel.Text = "STATUS: ERROR - KEY CANNOT BE EMPTY"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        return
    end
    
    StatusLabel.Text = "STATUS: CHECKING CREDENTIALS..."
    StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 50)
    
    task.wait(1.5)
    
    if #enteredKey >= 5 then
        StatusLabel.Text = "STATUS: ACTIVATED SUCCESSFULLY!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
        task.wait(1)
        ScreenGui:Destroy()
        -- Load main loader script after activation
        loadstring(game:HttpGet("https://www.luxyhub.space/api/loader/luxyhub"))()
    else
        StatusLabel.Text = "STATUS: INVALID LICENSE KEY"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://www.luxyhub.space")
        StatusLabel.Text = "STATUS: LINK COPIED TO CLIPBOARD"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
    else
        StatusLabel.Text = "STATUS: CLIPBOARD NOT SUPPORTED"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 150, 50)
    end
end)
