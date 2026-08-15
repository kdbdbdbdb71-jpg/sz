--[[
    Matrix Hub - Pro Ultimate Edition
    Developer: أمير
    Key: 11229900077
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("MatrixUltimateHub") then
    CoreGui.MatrixUltimateHub:Destroy()
end

-- ==========================================
-- نافذة إدخال الرمز السري (Key System)
-- ==========================================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "MatrixKeyGui"
KeyGui.Parent = CoreGui

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Size = UDim2.new(0, 380, 0, 230)
KeyFrame.Position = UDim2.new(0.5, -190, 0.5, -115)
KeyFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
KeyFrame.BorderSizePixel = 0
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "🔐 Matrix Hub | نظام التحقق"
KeyTitle.TextColor3 = Color3.fromRGB(0, 255, 120)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.85, 0, 0, 45)
KeyBox.Position = UDim2.new(0.075, 0, 0, 70)
KeyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
KeyBox.PlaceholderText = "أدخل الرمز السري هنا..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 150)
KeyBox.TextSize = 13
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextWrapped = true
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 42)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 140)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
SubmitBtn.Text = "دخول / Submit"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "11229900077" then
        KeyGui:Destroy()
        LoadMainHub()
    else
        SubmitBtn.Text = "❌ الرمز غير صحيح!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        task.wait(1.5)
        SubmitBtn.Text = "دخول / Submit"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
    end
end)

-- ==========================================
-- الواجهة الرئيسية الكاملة (Main Hub)
-- ==========================================
function LoadMainHub()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MatrixUltimateHub"
    ScreenGui.Parent = CoreGui

    -- زر الفتح والإغلاق الجانبي المميز
    local ToggleButton = Instance.new("TextButton", ScreenGui)
    ToggleButton.Size = UDim2.new(0, 50, 0, 50)
    ToggleButton.Position = UDim2.new(0, 20, 0.3, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    ToggleButton.Text = "⚡"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 140, 0)
    ToggleButton.TextSize = 20
    ToggleButton.Active = true
    ToggleButton.Draggable = true
    Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 25)

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 680, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -340, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(18, 16, 22)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    -- الشريط العلوي
    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(25, 22, 30)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

    local Title = Instance.new("TextLabel", TopBar)
    Title.Size = UDim2.new(0.6, 0, 1, 0)
    Title.Position = UDim2.new(0.03, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Matrix Hub | M A T R I X"
    Title.TextColor3 = Color3.fromRGB(255, 140, 0)
    Title.TextSize = 13
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(0.93, 0, 0.12, 0)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CloseBtn.TextSize = 15
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    -- القائمة الجانبية مع صورة نيمار
    local Sidebar = Instance.new("ScrollingFrame", MainFrame)
    Sidebar.Size = UDim2.new(0, 180, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = Color3.fromRGB(15, 13, 18)
    Sidebar.BorderSizePixel = 0
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 500)
    Sidebar.ScrollBarThickness = 2

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SideLayout.Padding = UDim.new(0, 6)

    -- صورة نيمار في أعلى القائمة الجانبية
    local NeymarImg = Instance.new("ImageLabel", Sidebar)
    NeymarImg.Size = UDim2.new(0.85, 0, 0, 110)
    NeymarImg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    NeymarImg.Image = "rbxassetid://6023426915" -- صورة تمثل نيمار / لاعب كرة قدم شهير في روبلوكس
    NeymarImg.ScaleType = Enum.ScaleType.Crop
    Instance.new("UICorner", NeymarImg).CornerRadius = UDim.new(0, 8)

    -- حاوية الصفحات
    local PagesFolder = Instance.new("Folder", MainFrame)

    local function createPageContainer()
        local page = Instance.new("ScrollingFrame", MainFrame)
        page.Size = UDim2.new(1, -190, 1, -50)
        page.Position = UDim2.new(0, 185, 0, 45)
        page.BackgroundTransparency = 1
        page.CanvasSize = UDim2.new(0, 0, 0, 650)
        page.ScrollBarThickness = 4
        page.Visible = false
        local layout = Instance.new("UIListLayout", page)
        layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 8)
        return page
    end

    local page1 = createPageContainer()
    local page2 = createPageContainer()
    local page3 = createPageContainer()
    local page4 = createPageContainer()
    local page5 = createPageContainer()

    page1.Visible = true -- جعل الصفحة الأولى ظاهرة افتراضياً

    local function createTabBtn(name, targetPage)
        local btn = Instance.new("TextButton", Sidebar)
        btn.Size = UDim2.new(0.9, 0, 0, 32)
        btn.BackgroundColor3 = Color3.fromRGB(30, 26, 38)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(220, 220, 230)
        btn.TextSize = 12
        btn.Font = Enum.Font.Gotham
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        btn.MouseButton1Click:Connect(function()
            page1.Visible = false
            page2.Visible = false
            page3.Visible = false
            page4.Visible = false
            page5.Visible = false
            targetPage.Visible = true
        end)
    end

    createTabBtn("📱 حسابي والتواصل", page1)
    createTabBtn("⚡ السرعة والقدرات", page2)
    createTabBtn("🛠️ الأدوات والرقاصة", page3)
    createTabBtn("🎯 الاستهداف والمراقبة", page4)
    createTabBtn("🚀 الانتقالات السريعة", page5)

    -- دوال مساعدة لإنشاء العناصر
    local function createLabel(parent, text)
        local lbl = Instance.new("TextLabel", parent)
        lbl.Size = UDim2.new(0.95, 0, 0, 30)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(255, 140, 0)
        lbl.TextSize = 13
        lbl.Font = Enum.Font.GothamBold
        lbl.TextXAlignment = Enum.TextXAlignment.Left
    end

    local function createToggle(parent, titleText, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(0.95, 0, 0, 40)
        frame.BackgroundColor3 = Color3.fromRGB(26, 23, 32)
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.Position = UDim2.new(0.05, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = titleText
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 12
        label.Font = Enum.Font.GothamBold
        label.TextXAlignment = Enum.TextXAlignment.Left

        local toggleBtn = Instance.new("TextButton", frame)
        toggleBtn.Size = UDim2.new(0, 45, 0, 22)
        toggleBtn.Position = UDim2.new(0.82, 0, 0.25, 0)
        toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 40, 55)
        toggleBtn.Text = ""
        Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 11)

        local circle = Instance.new("Frame", toggleBtn)
        circle.Size = UDim2.new(0, 18, 0, 18)
        circle.Position = UDim2.new(0, 2, 0.1, 0)
        circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        Instance.new("UICorner", circle).CornerRadius = UDim.new(0, 9)

        local active = false
        toggleBtn.MouseButton1Click:Connect(function()
            active = not active
            if active then
                toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
                circle.Position = UDim2.new(1, -20, 0.1, 0)
            else
                toggleBtn.BackgroundColor3 = Color3.fromRGB(45, 40, 55)
                circle.Position = UDim2.new(0, 2, 0.1, 0)
            end
            callback(active)
        end)
    end

    local function createSlider(parent, titleText, min, max, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(0.95, 0, 0, 55)
        frame.BackgroundColor3 = Color3.fromRGB(26, 23, 32)
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(0.8, 0, 0, 25)
        label.Position = UDim2.new(0.05, 0, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = titleText .. ": " .. min
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 12
        label.Font = Enum.Font.GothamBold
        label.TextXAlignment = Enum.TextXAlignment.Left

        local textBox = Instance.new("TextBox", frame)
        textBox.Size = UDim2.new(0.9, 0, 0, 22)
        textBox.Position = UDim2.new(0.05, 0, 0, 28)
        textBox.BackgroundColor3 = Color3.fromRGB(35, 30, 42)
        textBox.Text = tostring(min)
        textBox.TextColor3 = Color3.fromRGB(255, 140, 0)
        textBox.TextSize = 11
        textBox.Font = Enum.Font.GothamBold
        Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 5)

        textBox.FocusLost:Connect(function()
            local val = tonumber(textBox.Text)
            if val then
                if val < min then val = min end
                if val > max then val = max end
                textBox.Text = tostring(val)
                label.Text = titleText .. ": " .. val
                callback(val)
            end
        end)
    end

    ----------------------------------------------------
    -- الخانة الأولى: الحساب والتواصل
    ----------------------------------------------------
    createLabel(page1, "👤 معلومات الحساب والتواصل الاجتماعي")
    createLabel(page1, "تيليجرام: https://t.me/Martrix60168")
    createLabel(page1, "تيك توك: thematrix332")
    createLabel(page1, "اسم المستخدم: " .. LocalPlayer.Name)
    createLabel(page1, "آيدي الحساب: " .. tostring(LocalPlayer.UserId))

    ----------------------------------------------------
    -- الخانة الثانية: السرعة، القفز، الموت، طيران، جدران، قفز لا نهائي، ريستات
    ----------------------------------------------------
    createLabel(page2, "⚡ تعديل السرعة والقدرات (من 50 إلى 10,000,000)")

    createSlider(page2, "سرعة الحركة (Speed)", 16, 10000000, function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = val
        end
    end)

    createSlider(page2, "قوة القفز (JumpPower)", 50, 10000000, function(val)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = val
            LocalPlayer.Character.Humanoid.UseJumpPower = true
        end
    end)

    createSlider(page2, "سرعة الطيران (Fly Speed)", 50, 10000000, function(val)
        getgenv.FlySpeed = val
    end)

    createToggle(page2, "وضع عدم الموت (Godmode)", function(state)
        RunService.Stepped:Connect(function()
            if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
            end
        end)
    end)

    createToggle(page2, "الطيران الخارق (Fly)", function(state)
        getgenv.Flying = state
        local p = LocalPlayer
        local char = p.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        
        if state then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "MatrixFlyVel"
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0)
            
            task.spawn(function()
                while getgenv.Flying and char and char:FindFirstChild("HumanoidRootPart") do
                    local speed = getgenv.FlySpeed or 50
                    local cam = workspace.CurrentCamera
                    local moveDir = Vector3.new()
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CoordinateFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CoordinateFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CoordinateFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CoordinateFrame.RightVector end
                    bv.Velocity = moveDir * speed
                    task.wait()
                end
                if hrp:FindFirstChild("MatrixFlyVel") then hrp.MatrixFlyVel:Destroy() end
            end)
        else
            if hrp:FindFirstChild("MatrixFlyVel") then hrp.MatrixFlyVel:Destroy() end
        end
    end)

    createToggle(page2, "اختراق الجدران (Noclip)", function(state)
        RunService.Stepped:Connect(function()
            if state and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end)

    createToggle(page2, "سقوط بدون ضرر (No Fall Damage)", function(state)
        RunService.Stepped:Connect(function()
            if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Sit = false
            end
        end)
    end)

    createToggle(page2, "قفز لا نهائي (Infinite Jump)", function(state)
        UserInputService.JumpRequest:Connect(function()
            if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end)

    local resetBtn = Instance.new("TextButton", page2)
    resetBtn.Size = UDim2.new(0.95, 0, 0, 40)
    resetBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    resetBtn.Text = "🔄 إعادة تعيين الشخصية (Reset)"
    resetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    resetBtn.TextSize = 12
    resetBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", resetBtn).CornerRadius = UDim.new(0, 8)
    resetBtn.MouseButton1Click:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end)

    ----------------------------------------------------
    -- الخانة الثالثة: أدوات، رقص، كشف لاعبين
    ----------------------------------------------------
    createLabel(page3, "🛠️ الأدوات والمميزات الإضافية")

    local function createActionButton(parent, text, callback)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(0.95, 0, 0, 40)
        btn.BackgroundColor3 = Color3.fromRGB(35, 30, 45)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        btn.MouseButton1Click:Connect(callback)
    end

    createActionButton(page3, "🧰 إعطاء أداة الانتقال (Teleport Tool)", function()
        local tool = Instance.new("Tool")
        tool.Name = "Matrix TP Tool"
        tool.RequiresHandle = false
        tool.Activated:Connect(function()
            local mouse = LocalPlayer:GetMouse()
            if mouse.Target then
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end)
        tool.Parent = LocalPlayer.Backpack
    end)

    createActionButton(page3, "⚡ إعطاء أداة إعادة سرعة فائقة", function()
        local tool = Instance.new("Tool")
        tool.Name = "Matrix Speed Tool"
        tool.RequiresHandle = false
        tool.Activated:Connect(function()
            LocalPlayer.Character.Humanoid.WalkSpeed = 500
        end)
        tool.Parent = LocalPlayer.Backpack
    end)

    createActionButton(page3, "💃 قائمة الرقاصة والرقصات التلقائية", function()
        pcall(function()
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://507771019" -- رقصة شهيرة روبلوكس
            local track = LocalPlayer.Character.Humanoid:LoadAnimation(anim)
            track:Play()
        end)
    end)

    createToggle(page3, "👁️ كشف اللاعبين (ESP All Players)", function(state)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                if state then
                    if not p.Character:FindFirstChild("MatrixHighlight") then
                        local hl = Instance.new("Highlight", p.Character)
                        hl.Name = "MatrixHighlight"
                        hl.FillColor = Color3.fromRGB(255, 140, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                else
                    if p.Character:FindFirstChild("MatrixHighlight") then
                        p.Character.MatrixHighlight:Destroy()
                    end
                end
            end
        end
    end)

    ----------------------------------------------------
    -- الخانة الرابعة: استهداف ومراقبة وإي إس بي ولوحة معلومات
    ----------------------------------------------------
    createLabel(page4, "🎯 الاستهداف ومراقبة اللاعبين")

    local targetNameBox = Instance.new("TextBox", page4)
    targetNameBox.Size = UDim2.new(0.95, 0, 0, 40)
    targetNameBox.BackgroundColor3 = Color3.fromRGB(26, 23, 32)
    targetNameBox.PlaceholderText = "اكتب اسم اللاعب المستهدف هنا..."
    targetNameBox.Text = ""
    targetNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    targetNameBox.TextSize = 12
    targetNameBox.Font = Enum.Font.Gotham
    Instance.new("UICorner", targetNameBox).CornerRadius = UDim.new(0, 8)

    createActionButton(page4, "🎯 استهداف وتثبيت الكاميرا على الشخص", function()
        local t = Players:FindFirstChild(targetNameBox.Text)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            workspace.CurrentCamera.CameraSubject = t.Character.Humanoid
        end
    end)

    createActionButton(page4, "👁️ مراقبة الشخص (Spectate)", function()
        local t = Players:FindFirstChild(targetNameBox.Text)
        if t and t.Character and t.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject = t.Character.Humanoid
        end
    end)

    createActionButton(page4, "🚀 الانتقال الفوري إلى الشخص", function()
        local t = Players:FindFirstChild(targetNameBox.Text)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = t.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end)

    createActionButton(page4, "📊 لوحة معلومات الشخص المستهدف", function()
        local t = Players:FindFirstChild(targetNameBox.Text)
        if t then
            print("اللاعب: " .. t.Name .. " | العمر: " .. t.AccountAge .. " أيام | الآيدي: " .. t.UserId)
        end
    end)

    ----------------------------------------------------
    -- الخانة الخامسة: الانتقالات
    ----------------------------------------------------
    createLabel(page5, "🚀 قائمة الانتقالات السريعة لعالم اللعبة")

    createActionButton(page5, "🏠 الانتقال إلى نقطة البداية (Spawn)", function()
        if workspace:FindFirstChild("SpawnLocation") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SpawnLocation.CFrame + Vector3.new(0, 5, 0)
        else
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0)
        end
    end)

    createActionButton(page5, "⬆️ الانتقال إلى أعلى قمة بالسماء", function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
    end)

    createActionButton(page5, "📍 حفظ الإحداثيات الحالية", function()
        getgenv.MatrixSavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        print("تم حفظ الإحداثيات بنجاح!")
    end)

    createActionButton(page5, "🎯 الانتقال إلى الموقع المحفوظ", function()
        if getgenv.MatrixSavedPos then
            LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv.MatrixSavedPos
        end
    end)
end
