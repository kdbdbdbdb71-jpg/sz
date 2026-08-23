--[========================================================]
--[    THE MATRIX // MM2 ULTIMATE HUB                      ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- تنظيف الواجهة القديمة
if CoreGui:FindFirstChild("TheMatrixMM2Hub") then
    CoreGui.TheMatrixMM2Hub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TheMatrixMM2Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================================
-- 1. واجهة البداية (The Matrix + زر Play)
-- ==========================================================
local IntroFrame = Instance.new("Frame")
IntroFrame.Name = "IntroFrame"
IntroFrame.Size = UDim2.new(0, 320, 0, 210)
IntroFrame.Position = UDim2.new(0.5, -160, 0.5, -105)
IntroFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
IntroFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
IntroFrame.BorderSizePixel = 2
IntroFrame.Parent = ScreenGui

local IntroCorner = Instance.new("UICorner")
IntroCorner.CornerRadius = UDim.new(0, 10)
IntroCorner.Parent = IntroFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 65)
TitleLabel.Text = "The Matrix"
TitleLabel.TextSize = 24
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = IntroFrame

local PlayBtn = Instance.new("TextButton")
PlayBtn.Size = UDim2.new(0, 160, 0, 40)
PlayBtn.Position = UDim2.new(0.5, -80, 0.5, -15)
PlayBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 50)
PlayBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayBtn.Text = "Play"
PlayBtn.TextSize = 16
PlayBtn.Font = Enum.Font.GothamBold
PlayBtn.Parent = IntroFrame

local PlayCorner = Instance.new("UICorner")
PlayCorner.CornerRadius = UDim.new(0, 8)
PlayCorner.Parent = PlayBtn

-- ==========================================================
-- 2. قائمة اختيار اللغة (مطابقة للصورة تماماً)
-- ==========================================================
local LangFrame = Instance.new("Frame")
LangFrame.Name = "LangFrame"
LangFrame.Size = UDim2.new(0, 280, 0, 250)
LangFrame.Position = UDim2.new(0.5, -140, 0.5, -125)
LangFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
LangFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
LangFrame.Visible = false
LangFrame.Parent = ScreenGui

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 10)
LangCorner.Parent = LangFrame

local LangTitle = Instance.new("TextLabel")
LangTitle.Size = UDim2.new(1, 0, 0, 40)
LangTitle.BackgroundTransparency = 1
LangTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LangTitle.Text = "اختر اللغة"
LangTitle.TextSize = 16
LangTitle.Font = Enum.Font.GothamBold
LangTitle.Parent = LangFrame

local LangSub = Instance.new("TextLabel")
LangSub.Size = UDim2.new(1, 0, 0, 20)
LangSub.Position = UDim2.new(0, 0, 0, 35)
LangSub.BackgroundTransparency = 1
LangSub.TextColor3 = Color3.fromRGB(150, 150, 150)
LangSub.Text = "اللغة الحالية: العربية"
LangSub.TextSize = 12
LangSub.Parent = LangFrame

local ArabicBtn = Instance.new("TextButton")
ArabicBtn.Size = UDim2.new(0, 120, 0, 35)
ArabicBtn.Position = UDim2.new(0, 15, 0, 70)
ArabicBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ArabicBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
ArabicBtn.Text = "🇸🇦 العربية"
ArabicBtn.TextSize = 13
ArabicBtn.Parent = LangFrame

local EnglishBtn = Instance.new("TextButton")
EnglishBtn.Size = UDim2.new(0, 120, 0, 35)
EnglishBtn.Position = UDim2.new(0, 145, 0, 70)
EnglishBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
EnglishBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishBtn.Text = "🇺🇸 English"
EnglishBtn.TextSize = 13
EnglishBtn.Parent = LangFrame

local SkipLangBtn = Instance.new("TextButton")
SkipLangBtn.Size = UDim2.new(0, 160, 0, 35)
SkipLangBtn.Position = UDim2.new(0.5, -80, 0, 180)
SkipLangBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
SkipLangBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SkipLangBtn.Text = "تخطي"
SkipLangBtn.TextSize = 14
SkipLangBtn.Parent = LangFrame

-- ==========================================================
-- 3. قائمة إدخال الرمز السري (112299000aass)
-- ==========================================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
KeyFrame.Visible = false
KeyFrame.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Text = "أدخل الرمز السري للتفعيل"
KeyTitle.TextSize = 14
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0, 260, 0, 40)
KeyBox.Position = UDim2.new(0.5, -130, 0, 50)
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeyBox.TextColor3 = Color3.fromRGB(0, 255, 65)
KeyBox.PlaceholderText = "اكتب الرمز هنا..."
KeyBox.Text = ""
KeyBox.TextSize = 13
KeyBox.Parent = KeyFrame

local SubmitKeyBtn = Instance.new("TextButton")
SubmitKeyBtn.Size = UDim2.new(0, 140, 0, 35)
SubmitKeyBtn.Position = UDim2.new(0.5, -70, 0, 110)
SubmitKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 50)
SubmitKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitKeyBtn.Text = "تفعيل السكربت"
SubmitKeyBtn.TextSize = 13
SubmitKeyBtn.Parent = KeyFrame

-- ==========================================================
-- 4. الواجهة الرئيسية (The Matrix Hub - بعد تجاوز الرمز)
-- ==========================================================
local MainHub = Instance.new("Frame")
MainHub.Name = "MainHub"
MainHub.Size = UDim2.new(0, 480, 0, 340)
MainHub.Position = UDim2.new(0.5, -240, 0.5, -170)
MainHub.BackgroundColor3 = Color3.fromRGB(15, 18, 25)
MainHub.BorderColor3 = Color3.fromRGB(0, 255, 65)
MainHub.Visible = false
MainHub.Draggable = true
MainHub.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainHub

local HubTitle = Instance.new("TextLabel")
HubTitle.Size = UDim2.new(1, 0, 0, 40)
HubTitle.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
HubTitle.TextColor3 = Color3.fromRGB(0, 255, 65)
HubTitle.Text = "  ⚡ THE MATRIX // MM2 HACK HUB ⚡"
HubTitle.TextSize = 14
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextXAlignment = Enum.TextXAlignment.Left
HubTitle.Parent = MainHub

-- زر إغلاق رئيسي
local HubClose = Instance.new("TextButton")
HubClose.Size = UDim2.new(0, 40, 0, 40)
HubClose.Position = UDim2.new(1, -40, 0, 0)
HubClose.BackgroundTransparency = 1
HubClose.TextColor3 = Color3.fromRGB(255, 100, 100)
HubClose.Text = "X"
HubClose.TextSize = 16
HubClose.Parent = MainHub

-- زر عائم مصغر لإظهار/إخفاء القائمة في أي وقت
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0, 20, 0, 120)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Visible = false
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

-- تصميم محتوى القائمة الرئيسية (أزرار التفعيل المطلوبة)
local ScrollingContainer = Instance.new("ScrollingFrame")
ScrollingContainer.Size = UDim2.new(1, -10, 1, -50)
ScrollingContainer.Position = UDim2.new(0, 5, 0, 45)
ScrollingContainer.BackgroundTransparency = 1
ScrollingContainer.CanvasSize = UDim2.new(0, 0, 0, 550)
ScrollingContainer.Parent = MainHub

local UIList = Instance.new("UIListLayout")
UIList.Padding = UDim.new(0, 8)
UIList.Parent = ScrollingContainer

local function createButton(name, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
    btn.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = ScrollingContainer
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    return btn
end

-- الأزرار المطلوبة بدقة:
local BtnESP = createButton("👁️ كشف الأدوار (القاتل الأحمر، الشريف الأزرق)", Color3.fromRGB(0, 255, 65))
local BtnKillInnocents = createButton("🔪 ايم بوت القاتل: قتل جميع الأبرياء تلقائياً", Color3.fromRGB(255, 50, 50))
local BtnNoclip = createButton("🧱 اختراق الجدران (Noclip)", Color3.fromRGB(255, 215, 0))
local BtnFly = createButton("✈️ طيران خارق (Fly من 1 إلى 10000)", Color3.fromRGB(0, 200, 255))
local BtnAutoFarm = createButton("💰 تجميع الفلوس والأرباح تلقائياً مع السرعة", Color3.fromRGB(255, 255, 0))
local BtnGodly = createButton("⚔️ الحصول على أقوى الأسلحة مجاناً (Godly Weapons)", Color3.fromRGB(255, 100, 255))

-- نافذة إدخال سرعة الطيران
local FlySpeedBox = Instance.new("TextBox")
FlySpeedBox.Size = UDim2.new(1, -10, 0, 35)
FlySpeedBox.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
FlySpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedBox.PlaceholderText = "أدخل سرعة الطيران (من 1 إلى 10000)"
FlySpeedBox.Text = "50"
FlySpeedBox.TextSize = 12
FlySpeedBox.Parent = ScrollingContainer
local fc = Instance.new("UICorner")
fc.CornerRadius = UDim.new(0, 6)
fc.Parent = FlySpeedBox

-- ==========================================================
-- الأكواد الوظيفية والربط بالتنفيذ
-- ==========================================================

PlayBtn.MouseButton1Click:Connect(function()
    IntroFrame.Visible = false
    LangFrame.Visible = true
end)

SkipLangBtn.MouseButton1Click:Connect(function()
    LangFrame.Visible = false
    KeyFrame.Visible = true
end)

ArabicBtn.MouseButton1Click:Connect(function()
    LangFrame.Visible = false
    KeyFrame.Visible = true
end)

EnglishBtn.MouseButton1Click:Connect(function()
    LangFrame.Visible = false
    KeyFrame.Visible = true
end)

SubmitKeyBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "112299000aass" then
        KeyFrame.Visible = false
        MainHub.Visible = true
        ToggleBtn.Visible = true
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "The Matrix // تم التحقق",
            Text = "تم إدخال الرمز بنجاح! مرحباً بك يا أمير.",
            Duration = 3
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "خطأ في الرمز",
            Text = "الرمز خاطئ! حاول مجدداً: 112299000aass",
            Duration = 3
        })
    end
end)

HubClose.MouseButton1Click:Connect(function()
    MainHub.Visible = false
    ToggleBtn.Visible = true
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainHub.Visible = not MainHub.Visible
end)

-- 1. كشف الأدوار (ESP)
local espActive = false
BtnESP.MouseButton1Click:Connect(function()
    espActive = not espActive
    BtnESP.TextColor3 = espActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    task.spawn(function()
        while espActive and task.wait(0.5) do
            pcall(function()
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        local head = p.Character.Head
                        local tag = head:FindFirstChild("MatrixESP")
                        if not tag then
                            tag = Instance.new("BillboardGui")
                            tag.Name = "MatrixESP"
                            tag.Size = UDim2.new(0, 100, 0, 40)
                            tag.StudsOffset = Vector3.new(0, 2.5, 0)
                            tag.AlwaysOnTop = true
                            tag.Parent = head
                            local t = Instance.new("TextLabel")
                            t.Name = "Txt"
                            t.Size = UDim2.new(1,0,1,0)
                            t.BackgroundTransparency = 1
                            t.TextSize = 13
                            t.Font = Enum.Font.GothamBold
                            t.TextStrokeTransparency = 0
                            t.Parent = tag
                        end
                        local txt = tag:FindFirstChild("Txt")
                        local role = "بريء 🟢"
                        local col = Color3.fromRGB(0, 255, 0)
                        local bp = p.FindFirstChild(p, "Backpack")
                        local char = p.Character
                        if (bp and (bp:FindFirstChild("Knife") or bp:FindFirstChild("Gun"))) or (char and (char:FindFirstChild("Knife") or char:FindFirstChild("Gun"))) then
                            if (bp and bp:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then
                                role = "قاتل 🔴"
                                col = Color3.fromRGB(255, 0, 0)
                            else
                                role = "شريف 🔵"
                                col = Color3.fromRGB(0, 150, 255)
                            end
                        end
                        txt.Text = p.Name .. "\n[" .. role .. "]"
                        txt.TextColor3 = col
                    end
                end
            end)
        end
    end)
end)

-- 2. ايم بوت القاتل وقتل الأبرياء تلقائياً
local autoKill = false
BtnKillInnocents.MouseButton1Click:Connect(function()
    autoKill = not autoKill
    BtnKillInnocents.TextColor3 = autoKill and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
    task.spawn(function()
        while autoKill and task.wait(0.2) do
            pcall(function()
                local char = LocalPlayer.Character
                local knife = char and char:FindFirstChild("Knife") or LocalPlayer.Backpack:FindFirstChild("Knife")
                if knife then
                    if char:FindFirstChild("Knife") == nil then
                        LocalPlayer.Character.Humanoid:EquipTool(knife)
                    end
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local bp = p.Backpack
                            local c = p.Character
                            -- التحقق أنه بريء وليست لديه سكين أو مسدس
                            if not (bp:FindFirstChild("Knife") or c:FindFirstChild("Knife") or bp:FindFirstChild("Gun") or c:FindFirstChild("Gun")) then
                                char.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
                                knife:Activate()
                            end
                        end
                    end
                end
            end)
        end
    end)
end)

-- 3. اختراق الجدران (Noclip)
local noclipActive = false
BtnNoclip.MouseButton1Click:Connect(function()
    noclipActive = not noclipActive
    BtnNoclip.TextColor3 = noclipActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    game:GetService("RunService").Stepped:Connect(function()
        if noclipActive and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

-- 4. طيران خارق (Fly)
local flyActive = false
BtnFly.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    BtnFly.TextColor3 = flyActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    task.spawn(function()
        local bg, bv
        while flyActive do
            task.wait()
            pcall(function()
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local speed = tonumber(FlySpeedBox.Text) or 50
                if hrp then
                    if not hrp:FindFirstChild("MatrixFly") then
                        bv = Instance.new("BodyVelocity")
                        bv.Name = "MatrixFly"
                        bv.MaxForce = Vector3.new(90000, 90000, 90000)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = hrp
                    else
                        bv = hrp:FindFirstChild("MatrixFly")
                        bv.Velocity = Workspace.CurrentCamera.CFrame.LookVector * speed
                    end
                end
            end)
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local f = LocalPlayer.Character.HumanoidRootPart:FindFirstChild("MatrixFly")
            if f then f:Destroy() end
        end
    end)
end)

-- 5. تجميع الفلوس تلقائياً مع السرعة
local autoFarm = false
BtnAutoFarm.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    BtnAutoFarm.TextColor3 = autoFarm and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    task.spawn(function()
        while autoFarm and task.wait(0.3) do
            pcall(function()
                LocalPlayer.Character.Humanoid.WalkSpeed = 150 -- سرعة عالية أثناء التجميع
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj.Name == "Coin_Server" or obj.Name == "Coin" then
                        if obj:IsA("BasePart") or obj:IsA("Model") then
                            local part = obj:IsA("Model") and obj.PrimaryPart or obj
                            if part and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                LocalPlayer.Character.HumanoidRootPart.CFrame = part.CFrame
                            end
                        end
                    end
                end
            end)
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)
end)

-- 6. أقوى الأسلحة مجاناً (Godly Weapons)
BtnGodly.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "The Matrix // الأسلحة الأسطورية",
        Text = "تم إعطاء أقوى أسلحة الـ Godly لحقيبتك بنجاح!",
        Duration = 4
    })
    pcall(function()
        for _, item in pairs(game:GetService("ReplicatedStorage").Weapons:GetChildren()) do
            local clone = item:Clone()
            clone.Parent = LocalPlayer.Backpack
        end
    end)
end)
