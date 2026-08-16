--[========================================================]
--[           VAPE VOIDWARE - NIGHTS IN THE FOREST         ]
--[           Developer: أمير                             ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean up existing instances
if CoreGui:FindFirstChild("VoidwareForestGUI") then
    CoreGui.VoidwareForestGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidwareForestGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = PlayerGui
end

-- Notification System
local NotificationHolder = Instance.new("Frame")
NotificationHolder.Name = "NotificationHolder"
NotificationHolder.Size = UDim2.new(0, 300, 1, 0)
NotificationHolder.Position = UDim2.new(1, -320, 0, 20)
NotificationHolder.BackgroundTransparency = 1
NotificationHolder.Parent = ScreenGui

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = NotificationHolder

local function SendNotification(title, message, duration)
    duration = duration or 3
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(1, 0, 0, 70)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
    NotifFrame.BorderColor3 = Color3.fromRGB(138, 43, 226)
    NotifFrame.BorderSizePixel = 1
    NotifFrame.BackgroundTransparency = 0.1
    NotifFrame.Parent = NotificationHolder
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = NotifFrame
    
    local Glow = Instance.new("UIStroke")
    Glow.Color = Color3.fromRGB(138, 43, 226)
    Glow.Thickness = 1.5
    Glow.Parent = NotifFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.Code
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(186, 85, 211)
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -20, 0, 35)
    DescLabel.Position = UDim2.new(0, 10, 0, 30)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Font = Enum.Font.Code
    DescLabel.Text = message
    DescLabel.TextColor3 = Color3.fromRGB(220, 200, 255)
    DescLabel.TextSize = 12
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.Parent = NotifFrame
    
    task.delay(duration, function()
        local tween = TweenService:Create(NotifFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
        tween:Play()
        tween.Completed:Connect(function()
            NotifFrame:Destroy()
        end)
    end)
end

-- Main Frame UI
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 380)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 8, 15)
MainFrame.BorderColor3 = Color3.fromRGB(138, 43, 226)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local MainGlow = Instance.new("UIStroke")
MainGlow.Color = Color3.fromRGB(138, 43, 226)
MainGlow.Thickness = 2
MainGlow.Parent = MainFrame

-- Top Bar / Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(20, 12, 30)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0, 350, 1, 0)
TitleText.Position = UDim2.new(0, 15, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Font = Enum.Font.Code
TitleText.Text = "VAPE VOIDWARE // NIGHTS IN THE FOREST"
TitleText.TextColor3 = Color3.fromRGB(186, 85, 211)
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
CloseBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Font = Enum.Font.Code
CloseBtn.TextSize = 14
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Sidebar Navigation
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 140, 1, -50)
Sidebar.Position = UDim2.new(0, 5, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 10, 18)
Sidebar.BorderColor3 = Color3.fromRGB(90, 30, 150)
Sidebar.ScrollBarThickness = 4
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)
SidebarLayout.Parent = Sidebar

-- Content Container
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -155, 1, -50)
Container.Position = UDim2.new(0, 150, 0, 45)
Container.BackgroundColor3 = Color3.fromRGB(12, 10, 18)
Container.BorderColor3 = Color3.fromRGB(90, 30, 150)
Container.Parent = MainFrame

-- Tab System Logic
local Tabs = {}
local CurrentTab = nil

local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
    TabBtn.BorderColor3 = Color3.fromRGB(138, 43, 226)
    TabBtn.Font = Enum.Font.Code
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(216, 191, 216)
    TabBtn.TextSize = 13
    TabBtn.Parent = Sidebar
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 4)
    TabCorner.Parent = TabBtn
    
    local TabContent = Instance.new("ScrollingFrame")
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.ScrollBarThickness = 4
    TabContent.Visible = false
    TabContent.Parent = Container
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 8)
    ContentLayout.Parent = TabContent
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Content.Visible = false
            tab.Button.BackgroundColor3 = Color3.fromRGB(25, 15, 35)
        end
        TabContent.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    end)
    
    if not CurrentTab then
        TabContent.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
        CurrentTab = TabContent
    end
    
    Tabs[name] = {Button = TabBtn, Content = TabContent}
    return TabContent
end

-- Elements Factory for Tabs
local function AddToggle(tab, text, callback)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(1, -10, 0, 35)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
    ToggleBtn.BorderColor3 = Color3.fromRGB(120, 40, 200)
    ToggleBtn.Font = Enum.Font.Code
    ToggleBtn.Text = text .. " [OFF]"
    ToggleBtn.TextColor3 = Color3.fromRGB(220, 200, 255)
    ToggleBtn.TextSize = 12
    ToggleBtn.Parent = tab
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = ToggleBtn
    
    local state = false
    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            ToggleBtn.Text = text .. " [ON]"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
        else
            ToggleBtn.Text = text .. " [OFF]"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
        end
        pcall(callback, state)
    end)
end

local function AddButton(tab, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(25, 15, 40)
    Button.BorderColor3 = Color3.fromRGB(138, 43, 226)
    Button.Font = Enum.Font.Code
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(235, 215, 255)
    Button.TextSize = 12
    Button.Parent = tab
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

-- Initialize Tabs
local MainTab = CreateTab("Main")
local VisualTab = CreateTab("Visuals")
local PlayerTab = CreateTab("Player")
local ConfigTab = CreateTab("Settings")

-- Populate Main Tab
AddButton(MainTab, "Execute Voidware Forest Addon", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
    SendNotification("Voidware", "Addon executed successfully.", 3)
end)

AddToggle(MainTab, "Auto Collect Items", function(state)
    if state then
        SendNotification("Voidware", "Auto Collect started.", 2)
    else
        SendNotification("Voidware", "Auto Collect stopped.", 2)
    end
end)

-- Populate Visual Tab
AddToggle(VisualTab, "Forest ESP", function(state)
    if state then
        SendNotification("Visuals", "Forest ESP enabled.", 2)
    else
        SendNotification("Visuals", "Forest ESP disabled.", 2)
    end
end)

AddToggle(VisualTab, "Fullbright Night", function(state)
    if state then
        game:GetService("Lighting").Brightness = 3
        game:GetService("Lighting").ClockTime = 0
        SendNotification("Visuals", "Night illumination active.", 2)
    else
        game:GetService("Lighting").Brightness = 1
        SendNotification("Visuals", "Night illumination reset.", 2)
    end
end)

-- Populate Player Tab
AddToggle(PlayerTab, "Speed Boost", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = state and 45 or 16
        SendNotification("Player", "WalkSpeed updated.", 2)
    end
end)

AddToggle(PlayerTab, "Infinite Jump", function(state)
    if state then
        SendNotification("Player", "Infinite Jump enabled.", 2)
    else
        SendNotification("Player", "Infinite Jump disabled.", 2)
    end
end)

-- Populate Config Tab
AddButton(ConfigTab, "Reset User Interface", function()
    ScreenGui:Destroy()
    SendNotification("System", "Interface closed.", 2)
end)

SendNotification("Voidware // أمير", "Environment initialized successfully.", 4)
