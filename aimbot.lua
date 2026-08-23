--[========================================================]
--[    MATRIX // INFINITE YIELD ADMIN HUB                  ]
--[    Developer: أمير                                     ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تنظيف الواجهة القديمة لمنع التكرار
if CoreGui:FindFirstChild("MatrixAdminHub") then
    CoreGui.MatrixAdminHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixAdminHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- زر النينجا الصغير العائم (قابل للسحب والإفلات بإصبعك في أي مكان بالشاشة)
local ToggleBtn = Instance.new("ImageButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 30, 0, 150)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
ToggleBtn.BorderColor3 = Color3.fromRGB(0, 255, 65)
ToggleBtn.BorderSizePixel = 2
ToggleBtn.Image = "rbxassetid://10723349646" -- أيقونة النينجا
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = ToggleBtn

-- القائمة المصغرة لأوامر الأدمن السريعة
local SmallFrame = Instance.new("Frame")
SmallFrame.Name = "SmallFrame"
SmallFrame.Size = UDim2.new(0, 220, 0, 260)
SmallFrame.Position = UDim2.new(0, 90, 0, 150)
SmallFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
SmallFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
SmallFrame.Visible = false
SmallFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = SmallFrame

-- عنوان القائمة
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
Title.TextColor3 = Color3.fromRGB(0, 255, 65)
Title.Text = "⚡ MATRIX ADMIN PANEL ⚡"
Title.TextSize = 12
Title.Font = Enum.Font.GothamBold
Title.Parent = SmallFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- زر تشغيل سكربت الأدمن الكامل (Infinite Yield الأساسي)
local MainAdminBtn = Instance.new("TextButton")
MainAdminBtn.Size = UDim2.new(1, -16, 0, 35)
MainAdminBtn.Position = UDim2.new(0, 8, 0, 45)
MainAdminBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 50)
MainAdminBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MainAdminBtn.Text = "فتح لوحة أدمن Infinite Yield"
MainAdminBtn.TextSize = 12
MainAdminBtn.Parent = SmallFrame

local BtnC1 = Instance.new("UICorner")
BtnC1.CornerRadius = UDim.new(0, 6)
BtnC1.Parent = MainAdminBtn

-- زر الطيران (Fly)
local FlyBtn = Instance.new("TextButton")
FlyBtn.Size = UDim2.new(1, -16, 0, 35)
FlyBtn.Position = UDim2.new(0, 8, 0, 88)
FlyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
FlyBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
FlyBtn.Text = "تفعيل طيران الأدمن (Fly)"
FlyBtn.TextSize = 12
FlyBtn.Parent = SmallFrame

local BtnC2 = Instance.new("UICorner")
BtnC2.CornerRadius = UDim.new(0, 6)
BtnC2.Parent = FlyBtn

-- زر اختراق الجدران (Noclip)
local NoclipBtn = Instance.new("TextButton")
NoclipBtn.Size = UDim2.new(1, -16, 0, 35)
NoclipBtn.Position = UDim2.new(0, 8, 0, 131)
NoclipBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
NoclipBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
NoclipBtn.Text = "اختراق الجدران (Noclip)"
NoclipBtn.TextSize = 12
NoclipBtn.Parent = SmallFrame

local BtnC3 = Instance.new("UICorner")
BtnC3.CornerRadius = UDim.new(0, 6)
BtnC3.Parent = NoclipBtn

-- زر السرعة الخارقة (Speed)
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, -16, 0, 35)
SpeedBtn.Position = UDim2.new(0, 8, 0, 174)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 65)
SpeedBtn.Text = "سرعة خارقة (Speed 100)"
SpeedBtn.TextSize = 12
SpeedBtn.Parent = SmallFrame

local BtnC4 = Instance.new("UICorner")
BtnC4.CornerRadius = UDim.new(0, 6)
BtnC4.Parent = SpeedBtn

-- زر إعادة ضبط الشخصية (Respawn)
local RespawnBtn = Instance.new("TextButton")
RespawnBtn.Size = UDim2.new(1, -16, 0, 35)
RespawnBtn.Position = UDim2.new(0, 8, 0, 217)
RespawnBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
RespawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RespawnBtn.RespawnText = "إعادة توليد الشخصية (Respawn)"
RespawnBtn.Text = "إعادة توليد الشخصية (Respawn)"
RespawnBtn.TextSize = 12
RespawnBtn.Parent = SmallFrame

local BtnC5 = Instance.new("UICorner")
BtnC5.CornerRadius = UDim.new(0, 6)
RespawnBtn.Parent = RespawnBtn

-- فتح وإغلاق القائمة عند الضغط على زر النينجا
local isOpen = false
ToggleBtn.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    SmallFileVisible = isOpen
    SmallFrame.Visible = isOpen
end)

-- تحميل سكربت الأدمن العالمي الشهير (Infinite Yield)
MainAdminBtn.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Matrix // الأدمن",
        Text = "جاري تفعيل لوحة تحكم Infinite Yield...",
        Duration = 3
    })
    pcall(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end)

-- وظيفة الطيران السريع
local flying = false
FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    FlyBtn.TextColor3 = flying and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 255, 255)
    pcall(function()
        local ch = LocalPlayer.Character
        local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
        if flying and hrp then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "MatrixAdminFly"
            bv.MaxForce = Vector3.new(90000, 90000, 90000)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Parent = hrp
            
            task.spawn(function()
                while flying do
                    task.wait()
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 70
                end
            end)
        else
            if hrp and hrp:FindFirstChild("MatrixAdminFly") then
                hrp.MatrixAdminFly:Destroy()
            end
        end
    end)
end)

-- وظيفة اختراق الجدران (Noclip)
local noclip = false
NoclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    NoclipBtn.TextColor3 = noclip and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 215, 0)
    game:GetService("RunService").Stepped:Connect(function()
        if noclip and LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

-- وظيفة السرعة
SpeedBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Matrix // سرعة",
            Text = "تم ضبط السرعة إلى 100!",
            Duration = 2
        })
    end
end)

-- إعادة توليد الشخصية
RespawnBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = 0
    end
end)
