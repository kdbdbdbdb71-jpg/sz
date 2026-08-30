-- [TERMINAL_2099: THE_MATRIX_HUB_V9]
-- Code Key: 112299000ammer
-- Developer: الماتريكس

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- التحقق من المفتاح الأمني
local KEY_CODE = "112299000ammer"
print("SYSTEM_READY: النظام يعمل. المطور: الماتريكس | Play")

-- بناء واجهة الماتريكس المتكاملة حسب المواصفات المطلوبة
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TheMatrixHub"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainContainer = Instance.new("Frame")
MainContainer.Name = "MainContainer"
MainContainer.Parent = ScreenGui
MainContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainContainer.Position = UDim2.new(0.5, -200, 0.5, -175)
MainContainer.Size = UDim2.new(0, 400, 0, 350)
MainContainer.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainContainer

-- شريط العنوان والاعتماد
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainContainer
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "The Matrix Hub - Play (المطور: الماتريكس)"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
TitleLabel.TextSize = 14

-- وظيفة تعديل سرعة اللاعب (0 إلى 999999999)
local function setPlayerSpeed(val)
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.WalkSpeed = math.clamp(val, 0, 999999999)
end

-- وظيفة الطيران (0 إلى 9999999)
local function setFly(val)
    local char = LocalPlayer.Character
    if not char then return end
    local rootPart = char:FindFirstChild("HumanoidRootPart")
    if rootPart then
        if val > 0 then
            local bv = Instance.new("BodyVelocity")
            bv.Name = "MatrixFly"
            bv.MaxForce = Vector3.new(99999, 99999, 99999)
            bv.Velocity = Vector3.new(0, val, 0)
            bv.Parent = rootPart
        else
            if rootPart:FindFirstChild("MatrixFly") then
                rootPart.MatrixFly:Destroy()
            end
        end
    end
end

-- وظيفة عدم الموت (Godmode)
local function setGodMode(state)
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if state then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        else
            humanoid.MaxHealth = 100
            humanoid.Health = 100
        end
    end
end

-- وظيفة الاختفاء
local function setInvisibility(state)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = state and 1 or 0
        end
    end
end

print("SYSTEM_LOG: تم تحميل سكربت الماتريكس بنجاح وقيد التشغيل.")
