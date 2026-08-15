--[[
    Matrix Hub - Ultimate Roblox Script
    Designed for Delta Executor
    Developer: أمير
]]--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- إنشاء واجهة المستخدم (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixHubUltimate"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 480)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Text = "⚡ MATRIX HUB | ULTIMATE ⚡"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 15
Title.Font = Enum.Font.Code

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 10)

-- حاوية الأزرار القابلة للتمرير
local ScrollingFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollingFrame.Size = UDim2.new(1, -10, 1, -55)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 50)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
ScrollingFrame.ScrollBarThickness = 4

local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- دالة لإنشاء زر تفعيل وإغلاق (Toggle)
local function createToggle(name, callback)
    local btn = Instance.new("TextButton", ScrollingFrame)
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = name .. " [OFF]"
    btn.TextColor3 = Color3.fromRGB(255, 80, 80)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    
    local state = false
    btn.MouseButton1Click:Connect(function()
        state = not state
        if state then
            btn.Text = name .. " [ON]"
            btn.TextColor3 = Color3.fromRGB(80, 255, 80)
            btn.BackgroundColor3 = Color3.fromRGB(20, 50, 20)
        else
            btn.Text = name .. " [OFF]"
            btn.TextColor3 = Color3.fromRGB(255, 80, 80)
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        end
        callback(state)
    end)
end

-- دالة لإنشاء حقول إدخال الأرقام (السرعة والقوة والقفز)
local function createTextBox(placeholder, callback)
    local box = Instance.new("TextBox", ScrollingFrame)
    box.Size = UDim2.new(0.95, 0, 0, 40)
    box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    box.TextSize = 14
    box.Font = Enum.Font.Gotham
    
    local corner = Instance.new("UICorner", box)
    corner.CornerRadius = UDim.new(0, 6)
    
    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local num = tonumber(box.Text)
            if num then
                callback(num)
            end
        end
    end)
end

-- المتغيرات الأساسية للميزات
local AimbotActive = false
local ESPActive = false
local NoclipActive = false
local GodmodeActive = false
local FlyActive = false
local CustomSpeed = 16
local CustomJump = 7.2
local DamageBoost = false

-- 1. إيمبوت (Aimbot)
createToggle("إيمبوت (Aimbot)", function(state)
    AimbotActive = state
end)

RunService.RenderStepped:Connect(function()
    if AimbotActive then
        local closest = nil
        local dist = math.huge
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if onScreen then
                    local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if mag < dist then
                        dist = mag
                        closest = v.Character.HumanoidRootPart
                    end
                end
            end
        end
        if closest then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
        end
    end
end)

-- 2. كشف الأماكن (ESP)
createToggle("كشف الأماكن (ESP Wallhack)", function(state)
    ESPActive = state
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character then
            local hl = v.Character:FindFirstChild("MatrixESP")
            if ESPActive and not hl then
                local highlight = Instance.new("Highlight")
                highlight.Name = "MatrixESP"
                highlight.Adornee = v.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Parent = v.Character
            elseif not ESPActive and hl then
                hl:Destroy()
            end
        end
    end
end)

-- 3. السرعة (من 50 إلى 10000)
createTextBox("السرعة (اكتب من 50 إلى 10000 واضغط Enter)", function(val)
    if val >= 50 and val <= 10000 then
        CustomSpeed = val
    end
end)

RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if CustomSpeed > 16 then
            LocalPlayer.Character.Humanoid.WalkSpeed = CustomSpeed
        end
    end
end)

-- 4. القفز (من 50 إلى 10000)
createTextBox("القفز (اكتب من 50 إلى 10000 واضغط Enter)", function(val)
    if val >= 50 and val <= 10000 then
        CustomJump = val
    end
end)

RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        if CustomJump > 7.2 then
            LocalPlayer.Character.Humanoid.JumpPower = CustomJump
            LocalPlayer.Character.Humanoid.UseJumpPower = true
        end
    end
end)

-- 5. عدم الموت (Godmode)
createToggle("عدم الموت (Godmode)", function(state)
    GodmodeActive = state
end)

RunService.Stepped:Connect(function()
    if GodmodeActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
    end
end)

-- 6. اختراق الجدران (Noclip)
createToggle("اختراق الجدران (Noclip)", function(state)
    NoclipActive = state
end)

RunService.Stepped:Connect(function()
    if NoclipActive and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 7. ضرب قوي نار / دمج خارق (Damage Boost)
createToggle("ضرب قوي / دمج خارق", function(state)
    DamageBoost = state
end)

RunService.Heartbeat:Connect(function()
    if DamageBoost and LocalPlayer.Character then
        -- زيادة تأثير الأدوات أو الهجمات إن وجدت في الشخصية
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Handle") then
            -- تضخيم حجم أداة الضرب لزيادة نطاق الضرر
            tool.Handle.Size = Vector3.new(5, 5, 5)
        end
    end
end)

-- 8. ميزة إضافية: طيران (Fly)
createToggle("طيران (Fly Mode)", function(state)
    FlyActive = state
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        if FlyActive then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "MatrixFly"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)
            
            task.spawn(function()
                while FlyActive and char and char.Parent do
                    local cam = workspace.CurrentCamera
                    local vel = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector end
                    bv.Velocity = vel * 50
                    task.wait()
                end
                if bv then bv:Destroy() end
            end)
        else
            if hrp:FindFirstChild("MatrixFly") then
                hrp.MatrixFly:Destroy()
            end
        end
    end
end)

-- زر إغلاق الواجهة بالكامل
local CloseBtn = Instance.new("TextButton", ScrollingFrame)
CloseBtn.Size = UDim2.new(0.95, 0, 0, 40)
CloseBtn.BackgroundColor3 = Color3.fromRGB(120, 20, 20)
CloseBtn.Text = "إغلاق الواجهة (Close)"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
