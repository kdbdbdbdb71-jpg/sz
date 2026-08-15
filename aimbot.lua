-- سكربت عدم الموت (God Mode) - تصميم أمير
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local GodModeEnabled = false

-- إنشاء زر تحكم خاص بعدم الموت
local ScreenGui = Instance.new("ScreenGui")
local GodBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "GodModeGui"

GodBtn.Parent = ScreenGui
GodBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GodBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
GodBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
GodBtn.Size = UDim2.new(0, 190, 0, 50)
GodBtn.Font = Enum.Font.SourceSansBold
GodBtn.Text = "عدم الموت: [❌]"
GodBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GodBtn.TextSize = 16
GodBtn.Active = true
GodBtn.Draggable = true

-- وظيفة حماية الشخصية وتثبيت الدم
task.spawn(function()
    while true do
        task.wait(0.2)
        if GodModeEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- تثبيت الصحة والدم لأقصى حد دائماً لمنع الموت
                humanoid.Health = humanoid.MaxHealth
            end
        end
    end
end)

-- زر التفعيل والإيقاف
GodBtn.MouseButton1Click:Connect(function()
    GodModeEnabled = not GodModeEnabled
    if GodModeEnabled then
        GodBtn.Text = "عدم الموت: [✔️]"
        GodBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
    else
        GodBtn.Text = "عدم الموت: [❌]"
        GodBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
