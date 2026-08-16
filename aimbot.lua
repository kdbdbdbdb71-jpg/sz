--[========================================================]
--[           MATRIX HUB // ULTIMATE CONTROL PANEL         ]
--[           Developer: أمير - [FAKE ADMIN EDITION]      ]
--[========================================================]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- إنشاء واجهة التحكم الرئيسية
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "MatrixAdminPanel"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 65)
MainFrame.Active = true
MainFrame.Draggable = true

-- وظيفة الأدمن الوهمي (تظهر في الشات للآخرين)
local function FakeAdminCommand(cmd)
    local args = {
        [1] = "[MATRIX-ADMIN]: Executing " .. cmd .. "..."
    }
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end

-- دالة إضافة زر للأوامر
local function AddButton(text, command)
    local btn = Instance.new("TextButton", MainFrame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0, #MainFrame:GetChildren() * 45)
    btn.BackgroundColor3 = Color3.fromRGB(15, 30, 15)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(0, 255, 65)
    btn.Font = Enum.Font.Code
    
    btn.MouseButton1Click:Connect(function()
        FakeAdminCommand(command)
        -- هنا يمكنك إضافة وظيفة السكربت الفعلية إذا أردت
    end)
end

-- إضافة الأوامر الوهمية
AddButton("Matrix Fly [Admin]", "FLY")
AddButton("Matrix Speed [Admin]", "SPEED 100")
AddButton("Matrix Noclip [Admin]", "NOCLIP")
AddButton("Matrix Kill All [Admin]", "KILL_SERVER")
AddButton("Matrix Ban [Admin]", "BAN_ALL")

-- التفعيل النهائي
local LoadBtn = Instance.new("TextButton", MainFrame)
LoadBtn.Size = UDim2.new(0.9, 0, 0, 50)
LoadBtn.Position = UDim2.new(0.05, 0, 0.85, 0)
LoadBtn.Text = "LOAD MATRIX CORE"
LoadBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 20)
LoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

LoadBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
end)

-- إضافة إطار جانبي للمظهر فقط
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(0, 255, 65)
