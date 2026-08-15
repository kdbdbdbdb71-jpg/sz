--[[
    Matrix Hub - Pro Roblox Script (Delta Executor UI Style)
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
ScreenGui.Name = "MatrixHubPro"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 10)

-- الشريط العلوي (Title Bar)
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0.02, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Matrix Hub  /  discord.gg/MatrixScript"
Title.TextColor3 = Color3.fromRGB(0, 255, 120)
Title.TextSize = 13
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left

-- زر إغلاق الواجهة
local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(0.94, 0, 0.15, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- القائمة الجانبية (Sidebar)
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Size = UDim2.new(0, 140, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Sidebar.BorderSizePixel = 0

-- حاوية الصفحات الرئيسية
local Containers = Instance.new("Folder", MainFrame)

local function createTabContent(name)
    local scrolling = Instance.new("ScrollingFrame", MainFrame)
    scrolling.Name = name
    scrolling.Size = UDim2.new(1, -150, 1, -50)
    scrolling.Position = UDim2.new(0, 145, 0, 45)
    scrolling.BackgroundTransparency = 1
    scrolling.Visible = false
    scrolling.CanvasSize = UDim2.new(0, 0, 0, 600)
    scrolling.ScrollBarThickness = 4
    
    local layout = Instance.new("UIListLayout", scrolling)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    return scrolling
end

local TabHome = createTabContent("Home")
local TabTarget = createTabContent("Target")
local TabTeleport = createTabContent("Teleport")
local TabAnims = createTabContent("Anims")
TabHome.Visible = true -- الصفحة الافتراضية

local function createSidebarBtn(text, posY, targetTab)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        TabHome.Visible = false
        TabTarget.Visible = false
        TabTeleport.Visible = false
        TabAnims.Visible = false
        targetTab.Visible = true
    end)
end

createSidebarBtn("⚡ الرئيسية والهكر", 10, TabHome)
createSidebarBtn("🎯 استهداف ومزح", 55, TabTarget)
createSidebarBtn("📍 الأماكن والمواقع", 100, TabTeleport)
createSidebarBtn("🎭 رزمة الحركات", 145, TabAnims)

-- دالة لإنشاء أزرار التفعيل (Toggles)
local function createToggle(parent, name, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0.95, 0, 0, 45)
    frame.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 8)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0.05, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 13
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 50, 0, 24)
    btn.Position = UDim2.new(0.8, 0, 0.25, 0)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.Text = ""
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 12)
    
    local dot = Instance.new("Frame", btn)
    dot.Size = UDim2.new(0, 20, 0, 20)
    dot.Position = UDim2.new(0, 2, 0.1, 0)
    dot.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    
    local dotCorner = Instance.new("UICorner", dot)
    dotCorner.CornerRadius = UDim.new(0, 10)
    
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            btn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
            dot.Position = UDim2.new(1, -22, 0.1, 0)
        else
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            dot.Position = UDim2.new(0, 2, 0.1, 0)
        end
        callback(active)
    end)
end

-- دالة لإدخال الأرقام أو النصوص
local function createInputBox(parent, placeholder, callback)
    local box = Instance.new("TextBox", parent)
    box.Size = UDim2.new(0.95, 0, 0, 40)
    box.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    box.PlaceholderText = placeholder
    box.Text = ""
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.PlaceholderColor3 = Color3.fromRGB(130, 130, 140)
    box.TextSize = 13
    box.Font = Enum.Font.Gotham
    
    local corner = Instance.new("UICorner", box)
    corner.CornerRadius = UDim.new(0, 8)
    
    box.FocusLost:Connect(function(enter)
        if enter then
            callback(box.Text)
        end
    end)
end

----------------------------------------------------
-- 1. تبويب الرئيسية والهكر (Home Tab)
----------------------------------------------------
local AimbotActive = false
createToggle(TabHome, "إيمبوت (Aimbot)", function(state) AimbotActive = state end)

RunService.RenderStepped:Connect(function()
    if AimbotActive then
        local closest, dist = nil, math.huge
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if onScreen then
                    local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                    if mag < dist then dist = mag closest = v.Character.HumanoidRootPart end
                end
            end
        end
        if closest then Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position) end
    end
end)

createToggle(TabHome, "كشف الأماكن (ESP Wallhack)", function(state)
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character then
            local hl = v.Character:FindFirstChild("MatrixESP")
            if state and not hl then
                local h = Instance.new("Highlight", v.Character)
                h.Name = "MatrixESP"
                h.FillColor = Color3.fromRGB(0, 255, 0)
            elseif not state and hl then
                hl:Destroy()
            end
        end
    end
end)

createToggle(TabHome, "عدم الموت (Godmode)", function(state)
    local conn
    if state then
        conn = RunService.Stepped:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
            end
        end)
    end
end)

createToggle(TabHome, "اختراق الجدران (Noclip)", function(state)
    RunService.Stepped:Connect(function()
        if state and LocalPlayer.Character then
            for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end)

createInputBox(TabHome, "السرعة (50 إلى 10000)", function(val)
    local num = tonumber(val)
    if num and num >= 50 and num <= 10000 then
        RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = num
            end
        end)
    end
end)

createInputBox(TabHome, "القفز (50 إلى 10000)", function(val)
    local num = tonumber(val)
    if num and num >= 50 and num <= 10000 then
        RunService.Heartbeat:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = num
                LocalPlayer.Character.Humanoid.UseJumpPower = true
            end
        end)
    end
end)

----------------------------------------------------
-- 2. تبويب استهداف ومزح مع لاعب (Target Tab)
----------------------------------------------------
local targetPlayerName = ""
createInputBox(TabTarget, "اكتب جزء من اسم اللاعب (للمزح/الملاحقة)...", function(name)
    targetPlayerName = name
end)

createToggle(TabTarget, "ملاحقة اللاعب المستهدف (Teleport Behind)", function(state)
    task.spawn(function()
        while state do
            task.wait(0.5)
            if targetPlayerName ~= "" then
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and string.sub(string.lower(v.Name), 1, #targetPlayerName) == string.lower(targetPlayerName) then
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            -- الانتقال وراء اللاعب للقيام بالمزحة
                            LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                        end
                    end
                end
            end
        end
    end)
end)

----------------------------------------------------
-- 3. تبويب الأماكن والمواقع (Teleport Tab)
----------------------------------------------------
local savedLocations = {}
local locationNameInput = ""

createInputBox(TabTeleport, "اسم الموقع الحالي لحفظه...", function(name)
    locationNameInput = name
end)

createToggle(TabTeleport, "حفظ الموقع الحالي في القائمة", function(state)
    if state and locationNameInput ~= "" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        savedLocations[locationNameInput] = LocalPlayer.Character.HumanoidRootPart.CFrame
        
        -- إنشاء زر للانتقال إلى هذا الموقع المحفوظ فوراً
        local tpBtn = Instance.new("TextButton", TabTeleport)
        tpBtn.Size = UDim2.new(0.95, 0, 0, 35)
        tpBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 60)
        tpBtn.Text = "الانتقال إلى: " .. locationNameInput
        tpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tpBtn.TextSize = 13
        tpBtn.Font = Enum.Font.GothamBold
        
        local corner = Instance.new("UICorner", tpBtn)
        corner.CornerRadius = UDim.new(0, 6)
        
        local locToTeleport = savedLocations[locationNameInput]
        tpBtn.MouseButton1Click:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = locToTeleport
            end
        end)
    end
end)

----------------------------------------------------
-- 4. تبويب رزمة الحركات (Anims Tab)
----------------------------------------------------
local animsList = {
    {"Fairy Animation", 507710230},
    {"Ninja Animation", 656118852},
    {"Zombie Animation", 616158929},
    {"Levitation Animation", 616013216}
}

for _, anim in ipairs(animsList) do
    local animBtn = Instance.new("TextButton", TabAnims)
    animBtn.Size = UDim2.new(0.95, 0, 0, 40)
    animBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    animBtn.Text = "تفعيل رزمة: " .. anim[1]
    animBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    animBtn.TextSize = 13
    animBtn.Font = Enum.Font.GothamBold
    
    local corner = Instance.new("UICorner", animBtn)
    corner.CornerRadius = UDim.new(0, 8)
    
    local animId = anim[2]
    animBtn.MouseButton1Click:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Animate") then
            local animateScript = LocalPlayer.Character.Animate
            animateScript.Disabled = true
            -- تطبيق رزمة الحركات الجديدة على الشخصية
            for _, track in pairs(LocalPlayer.Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
                track:Stop()
            end
            animateScript.Disabled = false
        end
    end)
end
