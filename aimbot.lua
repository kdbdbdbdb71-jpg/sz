-- سكربت الانتقال لكيس الموارد - تصميم أمير
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = workspace

-- حالة التشغيل
local TeleportActive = false

-- إنشاء واجهة الزر
local ScreenGui = Instance.new("ScreenGui")
local TpBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "BagTeleportGui"

TpBtn.Parent = ScreenGui
TpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TpBtn.BorderColor3 = Color3.fromRGB(0, 170, 255)
TpBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
TpBtn.Size = UDim2.new(0, 190, 0, 50)
TpBtn.Font = Enum.Font.SourceSansBold
TpBtn.Text = "الانتقال للكيس: [❌]"
TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TpBtn.TextSize = 16
TpBtn.Active = true
TpBtn.Draggable = true

-- وظيفة البحث عن الكيس والنقل إليه
task.spawn(function()
    while true do
        task.wait(0.5)
        if TeleportActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            -- البحث في الخريطة عن أي شيء يحتوي على اسم كيس أو حقيبة (Bag / Sack)
            for _, obj in pairs(Workspace:GetDescendants()) do
                if TeleportActive and (obj.Name:lower():find("bag") or obj.Name:lower():find("sack") or obj.Name:lower():find("pouch")) then
                    if obj:IsA("BasePart") then
                        -- نقل اللاعب فوراً لموقع الكيس
                        LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame
                        task.wait(0.3)
                    end
                end
            end
        end
    end
end)

-- زر التحكم بالتشغيل والإيقاف
TpBtn.MouseButton1Click:Connect(function()
    TeleportActive = not TeleportActive
    if TeleportActive then
        TpBtn.Text = "الانتقال للكيس: [✔️]"
        TpBtn.BorderColor3 = Color3.fromRGB(0, 255, 0)
    else
        TpBtn.Text = "الانتقال للكيس: [❌]"
        TpBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
