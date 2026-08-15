--[[
    Luxy Hub Loader - M A T R I X Edition
    Developer: أمير
]]--

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- تعديل بيانات التحميل لتظهر باسم الماتريكس
local HubName = "Matrix Hub"
local OriginalScript = game:HttpGet("https://www.luxyhub.space/api/loader/luxyhub")

-- طباعة رسالة الترحيب باسم المطور أمير
print("--------------------------------------------------")
print("🔥 تم تحميل " .. HubName .. " بنجاح!")
print("👤 المطور: أمير | Matrix")
print("--------------------------------------------------")

-- تشغيل السكربت الأصلي كاملاً دون تغيير أي وظيفة فيه
loadstring(OriginalScript)()
