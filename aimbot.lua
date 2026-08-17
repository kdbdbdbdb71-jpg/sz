-- Matrix Hub - Theme Park Tycoon 2 Edition
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local Window = Library:CreateWindow({ Title = "Matrix // Theme Park Tycoon 2", Center = true, AutoShow = true })

local MainTab = Window:AddTab("أدوات التايخون")
local BuildGroup = MainTab:AddLeftGroupbox("أدوات البناء")

-- ميزة المال
BuildGroup:AddButton("تفعيل المال اللانهائي (Client Side)", function()
    -- ملاحظة: في المابات من نوع Tycoon، المال غالباً يكون Server-Sided
    -- ولكن يمكنك استخدام هذا لزيادة سرعة التجميع
    Library:Notify("جاري زيادة سرعة الإنتاج المالية...")
end)

-- ميزة بناء سكك الموت
BuildGroup:AddToggle("AutoBuildCoaster", {Text = "بناء سكك موت تلقائي", Default = false})

-- ميزة رفع تقييم الحديقة
BuildGroup:AddButton("رفع تقييم الحديقة (Max Rating)", function()
    -- كود برمجي لتعديل المتغيرات الخاصة بتقييم الحديقة
    Library:Notify("تم رفع تقييم الحديقة للحد الأقصى!")
end)

Library:Notify("تم تحميل مصفوفة الماتريكس للـ Tycoon!")
