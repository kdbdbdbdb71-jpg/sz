local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Workspace = workspace

-- حالات التشغيل
local AimbotEnabled = false
local AutoFarmEnabled = false

-- إنشاء الواجهة الرئيسية
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "AmirHackGui"

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Active = true
Frame.Draggable = true

-- زر الإيم بوت
local AimbotBtn = Instance.new("TextButton")
AimbotBtn.Parent = Frame
AimbotBtn.Size = UDim2.new(0, 180, 0, 50)
AimbotBtn.Position = UDim2.new(0.05, 0, 0.1, 0)
AimbotBtn.Text = "Aimbot [❌]"
AimbotBtn.MouseButton1Click:Connect(function()
    AimbotEnabled = not AimbotEnabled
    AimbotBtn.Text = AimbotEnabled and "Aimbot [✔️]" or "Aimbot [❌]"
end)

-- زر تجميع الخشب
local WoodBtn = Instance.new("TextButton")
WoodBtn.Parent = Frame
WoodBtn.Size = UDim2.new(0, 180, 0, 50)
WoodBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
WoodBtn.Text = "تجميع الخشب [❌]"
WoodBtn.MouseButton1Click:Connect(function()
    AutoFarmEnabled = not AutoFarmEnabled
    WoodBtn.Text = AutoFarmEnabled and "تجميع الخشب [✔️]" or "تجميع الخشب [❌]"
end)

-- وظيفة الإيم بوت
RunService.RenderStepped:Connect(function()
    if not AimbotEnabled then return end
    local closest, dist = nil, math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if onScreen then
                local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                if mag < dist then dist = mag; closest = v.Character.HumanoidRootPart end
            end
        end
    end
    if closest then Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position) end
end)

-- وظيفة تجميع الخشب
task.spawn(function()
    while true do
        task.wait(0.5)
        if AutoFarmEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(Workspace:GetDescendants()) do
                if AutoFarmEnabled and (obj.Name:lower():find("wood") or obj.Name:lower():find("tree")) and obj:IsA("BasePart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame
                    task.wait(0.3)
                end
            end
        end
    end
end)
