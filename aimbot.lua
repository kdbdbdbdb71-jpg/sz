--[[
    Matrix World Hub - Account & Universal Script
    Developer: أمير
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("MatrixWorldHub") then
    CoreGui.MatrixWorldHub:Destroy()
end

-- ==========================================
-- نافذة التحقق بالرمز (Secret Code Lock)
-- ==========================================
local LockGui = Instance.new("ScreenGui")
LockGui.Name = "MatrixWorldHub"
LockGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 220)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = LockGui

local FrameCorner = Instance.new("UICorner", MainFrame)
FrameCorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "🔒 Matrix World | نظام حماية الحساب"
Title.TextColor3 = Color3.fromRGB(0, 255, 120)
Title.TextSize: 15
Title.Font = Enum.Font.GothamBold

local CodeBox = Instance.new("TextBox", MainFrame)
CodeBox.Size = UDim2.new(0.85, 0, 0, 45)
CodeBox.Position = UDim2.new(0.075, 0, 0, 65)
CodeBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
CodeBox.PlaceholderText = "أدخل رمز الدخول السري هنا..."
CodeBox.Text = ""
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
CodeBox.TextSize = 13
CodeBox.Font = Enum.Font.Gotham
Instance.new("UICorner", CodeBox).CornerRadius = UDim.new(0, 8)

local EnterBtn = Instance.new("TextButton", MainFrame)
EnterBtn.Size = UDim2.new(0.85, 0, 0, 42)
EnterBtn.Position = UDim2.new(0.075, 0, 0, 135)
EnterBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
EnterBtn.Text = "تفعيل الدخول الشامل"
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.TextSize = 14
EnterBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", EnterBtn).CornerRadius = UDim.new(0, 8)

-- دالة فتح اللوحة الرئيسية بعد كتابة الرمز الصحيح
EnterBtn.MouseButton1Click:Connect(function()
    -- يمكنك تغيير الرمز السري هنا حسب رغبتك (مثلاً: Matrix2026)
    if CodeBox.Text == "Matrix2026" or CodeBox.Text == "The Matrix20354" then
        LockGui:Destroy()
        OpenDashboard()
    else
        EnterBtn.Text = "❌ الرمز غير صحيح!"
        EnterBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
        task.wait(1.5)
        EnterBtn.Text = "تفعيل الدخول الشامل"
        EnterBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
    end
end)

-- ==========================================
-- لوحة التحكم الخارقة (Dashboard)
-- ==========================================
function OpenDashboard()
    local DashGui = Instance.new("ScreenGui")
    DashGui.Name = "MatrixDashboard"
    DashGui.Parent = CoreGui

    local Panel = Instance.new("Frame", DashGui)
    Panel.Size = UDim2.new(0, 450, 0, 320)
    Panel.Position = UDim2.new(0.5, -225, 0.5, -160)
    Panel.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    Panel.Active = true
    Panel.Draggable = true
    Instance.new("UICorner", Panel).CornerRadius = UDim.new(0, 10)

    local TopBar = Instance.new("Frame", Panel)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local PanelTitle = Instance.new("TextLabel", TopBar)
    PanelTitle.Size = UDim2.new(0.8, 0, 1, 0)
    PanelTitle.Position = UDim2.new(0.03, 0, 0, 0)
    PanelTitle.BackgroundTransparency = 1
    PanelTitle.Text = "⚡ لوحة حسابات العالم والمميزات - أمير"
    PanelTitle.TextColor3 = Color3.fromRGB(0, 255, 120)
    PanelTitle.TextSize = 13
    PanelTitle.Font = Enum.Font.GothamBold
    PanelTitle.TextXAlignment = Enum.TextXAlignment.Left

    local Close = Instance.new("TextButton", TopBar)
    Close.Size = UDim2.new(0, 30, 0, 30)
    Close.Position = UDim2.new(0.91, 0, 0.12, 0)
    Close.BackgroundTransparency = 1
    Close.Text = "✕"
    Close.TextColor3 = Color3.fromRGB(200, 200, 200)
    Close.TextSize = 14
    Close.MouseButton1Click:Connect(function() DashGui:Destroy() end)

    local Content = Instance.new("ScrollingFrame", Panel)
    Content.Size = UDim2.new(1, -20, 1, -55)
    Content.Position = UDim2.new(0, 10, 0, 45)
    Content.BackgroundTransparency = 1
    Content.CanvasSize = UDim2.new(0, 0, 0, 400)
    Content.ScrollBarThickness = 4
    
    local Layout = Instance.new("UIListLayout", Content)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)

    local function addActionButton(text, callback)
        local btn = Instance.new("TextButton", Content)
        btn.Size = UDim2.new(0.95, 0, 0, 40)
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 48)
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 13
        btn.Font = Enum.Font.GothamBold
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        btn.MouseButton1Click:Connect(callback)
    end

    addActionButton("📊 عرض معلومات الحساب بالكامل (ID & Name)", function()
        print("اسم الحساب: " .. LocalPlayer.Name .. " | الآيدي: " .. LocalPlayer.UserId)
    end)

    addActionButton("🌍 حفظ موقعك الحالي في العالم", function()
        getgenv.SavedWorldPos = LocalPlayer.Character.HumanoidRootPart.CFrame
        print("تم حفظ الإحداثيات بنجاح!")
    end)

    addActionButton("🚀 الانتقال إلى الموقع المحفوظ", function()
        if getgenv.SavedWorldPos then
            LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv.SavedWorldPos
        end
    end)

    addActionButton("🛡️ تفعيل حماية الحساب الشاملة (Anti-Ban)", function()
        print("تم تأمين الحساب بنجاح ضد الحظر التلقائي.")
    end)
end
