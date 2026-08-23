--[========================================================]
--[    🚀 AMIR SCRIPT HUB - V.3.0 (MM2 EDITION) 🚀        ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("AmirScriptHubMM2") then
    CoreGui.AmirScriptHubMM2:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AmirScriptHubMM2"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (لتسهيل فتح وإغلاق الواجهة في أي وقت)
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 100)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646"
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 12)
BtnCorner.Parent = ToggleBtn

-- الواجهة الرئيسة (المطابقة لتصميمك الفخم)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 320)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 22, 33)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 100)
MainFrame.BorderSizePixel = 1
MainFrame.Visible = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- شريط العنوان العلوي
local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(24, 30, 45)
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.Text = "  🚀 AMIR SCRIPT HUB - V.3.0 🚀"
TitleBar.TextSize = 15
TitleBar.Font = Enum.Font.GothamBold
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- زر إغلاق الواجهة (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Text = "X"
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- القائمة الجانبية (الأزرار)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, -45)
Sidebar.Position = UDim2.new(0, 5, 0, 42)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.Parent = Sidebar

local function createTab(name, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(28, 35, 52)
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Text = name
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamSemibold
    btn.Parent = Sidebar
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    return btn
end

local TabPlayer = createTab("👤 Player", 1)
local TabESP = createTab("👀 ESP Roles", 2)
local TabWeapon = createTab("🔫 Weapon / Gun", 3)

-- حاويات الصفحات الداخلية
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -145, 1, -50)
Container.Position = UDim2.new(0, 140, 0, 45)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local PagePlayer = Instance.new("ScrollingFrame")
PagePlayer.Size = UDim2.new(1, 0, 1, 0)
PagePlayer.BackgroundTransparency = 1
PagePlayer.Visible = true
PagePlayer.Parent = Container

local PageESP = Instance.new("ScrollingFrame")
PageESP.Size = UDim2.new(1, 0, 1, 0)
PageESP.BackgroundTransparency = 1
PageESP.Visible = false
PageESP.Parent = Container

local PageWeapon = Instance.new("ScrollingFrame")
PageWeapon.Size = UDim2.new(1, 0, 1, 0)
PageWeapon.BackgroundTransparency = 1
PageWeapon.Visible = false
PageWeapon.Parent = Container

-- تبديل الصفحات عند الضغط
TabPlayer.MouseButton1Click:Connect(function()
    PagePlayer.Visible = true
    PageESP.Visible = false
    PageWeapon.Visible = false
end)

TabESP.MouseButton1Click:Connect(function()
    PagePlayer.Visible = false
    PageESP.Visible = true
    PageWeapon.Visible = false
end)

TabWeapon.MouseButton1Click:Connect(function()
    PagePlayer.Visible = false
    PageESP.Visible = false
    PageWeapon.Visible = true
end)

-- --- 1. صفحة اللاعب والسرعة الخارقة (1 إلى 10,000,000) ---
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, -10, 0, 25)
SpeedLabel.Position = UDim2.new(0, 5, 0, 10)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
SpeedLabel.Text = "سرعة اللاعب (من 1 إلى 10,000,000):"
SpeedLabel.TextSize = 13
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = PagePlayer

local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(1, -10, 0, 40)
SpeedBox.Position = UDim2.new(0, 5, 0, 40)
SpeedBox.BackgroundColor3 = Color3.fromRGB(28, 35, 52)
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.PlaceholderText = "اكتب السرعة هنا (مثال: 100 أو 5000)"
SpeedBox.Text = ""
SpeedBox.TextSize = 13
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.Parent = PagePlayer

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = SpeedBox

SpeedBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local spd = tonumber(SpeedBox.Text)
        if spd and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = spd
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "AMIR HUB // سرعة",
                Text = "تم ضبط السرعة إلى: " .. tostring(spd),
                Duration = 2
            })
        end
    end
end)

-- --- 2. صفحة كشف الأدوار (القاتل، الشريف، البريء) ---
local ESPToggleBtn = Instance.new("TextButton")
ESPToggleBtn.Size = UDim2.new(1, -10, 0, 45)
ESPToggleBtn.Position = UDim2.new(0, 5, 0, 15)
ESPToggleBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 52)
ESPToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 100)
ESPToggleBtn.Text = "تشغيل كشف القاتل والشريف والبريء (ESP Roles)"
ESPToggleBtn.TextSize = 13
ESPToggleBtn.Font = Enum.Font.GothamBold
ESPToggleBtn.Parent = PageESP

local ESPCorner = Instance.new("UICorner")
ESPCorner.CornerRadius = UDim.new(0, 6)
ESPCorner.Parent = ESPToggleBtn

local espEnabled = false
ESPToggleBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        ESPToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        ESPToggleBtn.Text = "✔ تم تفعيل كشف الأدوار بنجاح"
    else
        ESPToggleBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
        ESPToggleBtn.Text = "❌ تم إيقاف كشف الأدوار"
    end
end)

-- نظام كشف الأدوار الحقيقي في MM2 وتلوين الأسماء فوق اللاعبين
task.spawn(function()
    while task.wait(0.5) do
        if espEnabled then
            pcall(function()
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                        local head = plr.Character.Head
                        local billboard = head:FindFirstChild("AmirESPTag")
                        
                        if not billboard then
                            billboard = Instance.new("BillboardGui")
                            billboard.Name = "AmirESPTag"
                            billboard.Size = UDim2.new(0, 100, 0, 40)
                            billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = head
                            
                            local txt = Instance.new("TextLabel")
                            txt.Name = "RoleText"
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.BackgroundTransparency = 1
                            txt.TextSize = 12
                            txt.Font = Enum.Font.GothamBold
                            txt.TextStrokeTransparency = 0
                            txt.Parent = billboard
                        end
                        
                        local roleText = billboard:FindFirstChild("RoleText")
                        if roleText then
                            local backpack = plr:FindFirstChild("Backpack")
                            local char = plr.Character
                            local role = "بريء 🟢 (Innocent)"
                            local roleColor = Color3.fromRGB(0, 255, 0)
                            
                            -- فحص هل يملك سكين (قاتل) أو مسريف (شريف)
                            if (backpack and (backpack:FindFirstChild("Knife") or backpack:FindFirstChild("Gun"))) or 
                               (char and (char:FindFirstChild("Knife") or char:FindFirstChild("Gun"))) then
                                
                                if (backpack and backpack:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then
                                    role = "قاتل 🔴 (Murderer)"
                                    roleColor = Color3.fromRGB(255, 0, 0)
                                else
                                    role = "شريف 🔵 (Sheriff)"
                                    roleColor = Color3.fromRGB(0, 150, 255)
                                end
                            end
                            
                            roleText.Text = plr.Name .. "\n[" .. role .. "]"
                            roleText.TextColor3 = roleColor
                        end
                    end
                end
            end)
        else
            -- مسح الـ ESP عند الإيقاف
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("Head") then
                    local tag = plr.Character.Head:FindFirstChild("AmirESPTag")
                    if tag then tag:Destroy() end
                end
            end
        end
    end
end)

-- --- 3. صفحة الأسلحة والمسدس (مجاناً) ---
local GunBtn = Instance.new("TextButton")
GunBtn.Size = UDim2.new(1, -10, 0, 45)
GunBtn.Position = UDim2.new(0, 5, 0, 15)
GunBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 52)
GunBtn.TextColor3 = Color3.fromRGB(0, 150, 255)
GunBtn.Text = "الحصول على المسدس تلقائياً (Gun Drop)"
GunBtn.TextSize = 13
GunBtn.Font = Enum.Font.GothamBold
GunBtn.Parent = PageWeapon

local GunCorner = Instance.new("UICorner")
GunCorner.CornerRadius = UDim.new(0, 6)
GunCorner.Parent = GunBtn

GunBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "AMIR HUB // أسلحة",
        Text = "جاري البحث عن المسدس الساقط في الخريطة...",
        Duration = 3
    })
    
    task.spawn(function()
        pcall(function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name == "GunDrop" or obj.Name == "Gun" then
                    if obj:IsA("BasePart") or obj:IsA("Model") then
                        local targetPart = obj:IsA("Model") and obj.PrimaryPart or obj
                        if targetPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPart.CFrame
                        end
                    end
                end
            end
        end)
    end)
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🚀 AMIR SCRIPT HUB - V.3.0",
    Text = "تم تحميل الواجهة بنجاح، اضغط على زر النينجا للإظهار والإخفاء!",
    Duration = 4
})

