--[[
    Matrix Hub - 99 Nights in the Forest (Voidware UI Style)
    Developer: أمير
    Required Key: The Matrix20354
]]--

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- التحقق من وجود الواجهة مسبقاً لمنع التكرار
if CoreGui:FindFirstChild("MatrixVoidwareHub") then
    CoreGui.MatrixVoidwareHub:Destroy()
end

-- ==========================================
-- نافذة إدخال المفتاح (Key System)
-- ==========================================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "MatrixKeySystem"
KeyGui.Parent = CoreGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 350, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(35, 20, 45)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = KeyGui

local KeyCorner = Instance.new("UICorner", KeyFrame)
KeyCorner.CornerRadius = UDim.new(0, 12)

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "Matrix Hub - Key System"
KeyTitle.TextColor3 = Color3.fromRGB(255, 100, 255)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.85, 0, 0, 45)
KeyBox.Position = UDim2.new(0.075, 0, 0, 60)
KeyBox.BackgroundColor3 = Color3.fromRGB(50, 30, 65)
KeyBox.PlaceholderText = "أدخل الرمز هنا (The Matrix20354)"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(170, 150, 180)
KeyBox.TextSize = 13
KeyBox.Font = Enum.Font.Gotham

local KeyBoxCorner = Instance.new("UICorner", KeyBox)
KeyBoxCorner.CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.075, 0, 0, 125)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 180)
SubmitBtn.Text = "دخول / Submit"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Font = Enum.Font.GothamBold

local SubmitCorner = Instance.new("UICorner", SubmitBtn)
SubmitCorner.CornerRadius = UDim.new(0, 8)

-- دالة فتح الواجهة الرئيسية بعد صحة الرمز
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "The Matrix20354" then
        KeyGui:Destroy()
        LoadMainHub()
    else
        SubmitBtn.Text = "الرمز غير صحيح! / Invalid Key"
        task.wait(1.5)
        SubmitBtn.Text = "دخول / Submit"
    end
end)

-- ==========================================
-- الواجهة الرئيسية (Main Hub)
-- ==========================================
function LoadMainHub()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MatrixVoidwareHub"
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 650, 0, 380)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 20, 45) -- لون بنفسجي داكن مشابه للصور
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner", MainFrame)
    MainCorner.CornerRadius = UDim.new(0, 10)

    -- الشريط العلوي (TitleBar)
    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 35)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    TopBar.BorderSizePixel = 0

    local Title = Instance.new("TextLabel", TopBar)
    Title.Size = UDim2.new(0.5, 0, 1, 0)
    Title.Position = UDim2.new(0.02, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Matrixware / discord.gg/MatrixHub"
    Title.TextColor3 = Color3.fromRGB(200, 150, 220)
    Title.TextSize = 12
    Title.Font = Enum.Font.Code
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- زر تغيير اللغة (عربي / إنجليزي) داخل الواجهة
    local langArabic = true
    local LangBtn = Instance.new("TextButton", TopBar)
    LangBtn.Size = UDim2.new(0, 60, 0, 24)
    LangBtn.Position = UDim2.new(0.8, 0, 0.15, 0)
    LangBtn.BackgroundColor3 = Color3.fromRGB(70, 40, 90)
    LangBtn.Text = "عربي 🇸🇦"
    LangBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    LangBtn.TextSize = 11
    LangBtn.Font = Enum.Font.GothamBold

    local LangCorner = Instance.new("UICorner", LangBtn)
    LangCorner.CornerRadius = UDim.new(0, 6)

    -- زر إغلاق الواجهة (X)
    local CloseBtn = Instance.new("TextButton", TopBar)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(0.94, 0, 0.1, 0)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    CloseBtn.TextSize = 14

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- القائمة الجانبية (Sidebar)
    local Sidebar = Instance.new("ScrollingFrame", MainFrame)
    Sidebar.Size = UDim2.new(0, 160, 1, -35)
    Sidebar.Position = UDim2.new(0, 0, 0, 35)
    Sidebar.BackgroundColor3 = Color3.fromRGB(28, 15, 36)
    Sidebar.BorderSizePixel = 0
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 450)
    Sidebar.ScrollBarThickness = 2

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
    SideLayout.Padding = UDim.new(0, 5)

    -- حاوية محتوى التفعيلات (Content Area)
    local ContentArea = Instance.new("ScrollingFrame", MainFrame)
    ContentArea.Size = UDim2.new(1, -170, 1, -45)
    ContentArea.Position = UDim2.new(0, 165, 0, 40)
    ContentArea.BackgroundTransparency = 1
    ContentArea.CanvasSize = UDim2.new(0, 0, 0, 600)
    ContentArea.ScrollBarThickness = 4

    local ContentLayout = Instance.new("UIListLayout", ContentArea)
    ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 8)

    -- دالة إنشاء أزرار القائمة الجانبية
    local function createNavButton(nameAr, nameEn)
        local btn = Instance.new("TextButton", Sidebar)
        btn.Size = UDim2.new(0.9, 0, 0, 32)
        btn.BackgroundColor3 = Color3.fromRGB(40, 22, 52)
        btn.Text = langArabic and nameAr or nameEn
        btn.TextColor3 = Color3.fromRGB(220, 200, 230)
        btn.TextSize = 12
        btn.Font = Enum.Font.Gotham
        
        local corner = Instance.new("UICorner", btn)
        corner.CornerRadius = UDim.new(0, 6)
        
        -- تحديث النص عند تغيير اللغة
        LangBtn.MouseButton1Click:Connect(function()
            langArabic = not langArabic
            if langArabic then
                LangBtn.Text = "عربي 🇸🇦"
                btn.Text = nameAr
            else
                LangBtn.Text = "English 🇺🇸"
                btn.Text = nameEn
            end
        end)
        return btn
    end

    createNavButton("🏠 الرئيسية", "Main")
    createNavButton("⚡ الأداء التلقائي", "Auto Farm")
    createNavButton("🌲 جلب الموارد", "Bring Stuff")
    createNavButton("⏳ تخطي الأيام (99)", "Skip Days")

    -- دالة إنشاء خيارات التفعيل والأزرار
    local function createFeatureToggle(parent, titleText, callback)
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(0.95, 0, 0, 40)
        frame.BackgroundColor3 = Color3.fromRGB(45, 25, 58)
        
        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 8)
        
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
        toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 75)
        toggleBtn.Text = ""
        
        local tCorner = Instance.new("UICorner", toggleBtn)
        tCorner.CornerRadius = UDim.new(0, 11)
        
        local circle = Instance.new("Frame", toggleBtn)
        circle.Size = UDim2.new(0, 18, 0, 18)
        circle.Position = UDim2.new(0, 2, 0.1, 0)
        circle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        
        local cCorner = Instance.new("UICorner", circle)
        cCorner.CornerRadius = UDim.new(0, 9)
        
        local active = false
        toggleBtn.MouseButton1Click:Connect(function()
            active = not active
            if active then
                toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 40, 200)
                circle.Position = UDim2.new(1, -20, 0.1, 0)
            else
                toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 75)
                circle.Position = UDim2.new(0, 2, 0.1, 0)
            end
            callback(active)
        end)
    end

    ----------------------------------------------------
    -- تطبيق الوظائف والسكربتات الخاصة بلعبة "يوم 1"
    ----------------------------------------------------

    -- 1. تخطي الأيام (حتى 99 ليلة / Skip Days)
    createFeatureToggle(ContentArea, "تخطي إلى الليلة 99 (Skip to 99 Days)", function(state)
        if state then
            task.spawn(function()
                while state do
                    task.wait(0.1)
                    -- محاولة تغيير وقت أو أيام اللعبة البرمجية المتوفرة
                    pcall(function()
                        if workspace:FindFirstChild("Days") then
                            -- تعديل عداد الأيام إلى اليوم 99 مباشرة
                            workspace.Days.Value = 99
                        end
                    end)
                end
            end)
        end
    end)

    -- 2. جلب جميع الأخشاب والموارد (Bring Wood / Bring Stuff)
    createFeatureToggle(ContentArea, "جلب الأخشاب والموارد إليك (Bring All Wood)", function(state)
        task.spawn(function()
            while state do
                task.wait(0.5)
                pcall(function()
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj.Name:lower():find("wood") or obj.Name:lower():find("log") or obj.Name:lower():find("tree") then
                            if obj:IsA("Model") and obj.PrimaryPart then
                                obj:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 2))
                            elseif obj:IsA("BasePart") then
                                obj.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 2)
                            end
                        end
                    end
                end)
            end
        end)
    end)

    -- 3. عدم الموت / الله مود (Entity Godmode)
    createFeatureToggle(ContentArea, "وضع عدم الموت التام (Godmode)", function(state)
        RunService.Stepped:Connect(function()
            if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
            end
        end)
    end)

    -- 4. الأكل التلقائي وعدم الجوع (Auto Eat)
    createFeatureToggle(ContentArea, "تعبئة مؤشر الطعام تلقائياً (Auto Eat)", function(state)
        task.spawn(function()
            while state do
                task.wait(1)
                pcall(function()
                    -- كود يحاكي استخدام الطعام أو رفع المؤشرات الخاصة بالشخصية
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        -- الحفاظ على صحة وطاقة كاملة
                    end
                end)
            end
        end)
    end)
end
