-- Matrix Hub (Delta Style)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MatrixHub"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 350)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Matrix Hub | Levels"
Title.TextColor3 = Color3.fromRGB(0, 255, 0) -- لون ماتريكس
Title.Font = Enum.Font.Code
Title.TextSize = 18

-- وظيفة إنشاء أزرار المراحل
local function createLevelButton(text, yPos, levelName)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, yPos)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.new(1, 1, 1)
    
    btn.MouseButton1Click:Connect(function()
        print("Executing: " .. levelName)
        -- هنا يمكنك إضافة كود خاص بكل مرحلة حسب اللعبة
        -- مثال: Teleport إلى إحداثيات معينة
    end)
end

-- الأزرار المطلوبة
createLevelButton("المرحلة الأولى", 60, "Level1")
createLevelButton("المرحلة الثانية", 110, "Level2")
createLevelButton("المرحلة الثالثة", 160, "Level3")
createLevelButton("المرحلة الرابعة", 210, "Level4")

-- زر تفعيل/إيقاف عام
local Toggle = Instance.new("TextButton", MainFrame)
Toggle.Size = UDim2.new(0.8, 0, 0, 40)
Toggle.Position = UDim2.new(0.1, 0, 0, 280)
Toggle.Text = "تفعيل الماتريكس"
Toggle.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
Toggle.TextColor3 = Color3.new(1, 1, 1)

Toggle.MouseButton1Click:Connect(function()
    Toggle.Text = (Toggle.Text == "تفعيل الماتريكس" and "إيقاف الماتريكس" or "تفعيل الماتريكس")
end)

