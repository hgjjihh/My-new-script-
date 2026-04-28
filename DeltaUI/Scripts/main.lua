local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DeltaUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- 🔧 FUNCTION AMBIL GAMBAR (ANTI NIL)
local function getImage(pathList)
	for _, path in ipairs(pathList) do
		local success, result = pcall(function()
			return getcustomasset(path)
		end)
		
		if success and result then
			print("Loaded image:", path)
			return result
		end
	end
	
	warn("Gagal load semua path gambar!")
	return ""
end

-- FRAME
local frame = Instance.new("ImageLabel")
frame.Parent = gui
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundTransparency = 1

frame.Image = getImage({
	"DeltaUI/Images/frame.png",
	"DeltaUI/images/frame.png",
	"Images/frame.png",
	"frame.png"
})

-- BUTTON
local button = Instance.new("ImageButton")
button.Parent = frame
button.Size = UDim2.new(0, 200, 0, 80)
button.Position = UDim2.new(0.5, -100, 0.6, 0)
button.BackgroundTransparency = 1

button.Image = getImage({
	"DeltaUI/Images/button.png",
	"DeltaUI/images/button.png",
	"Images/button.png",
	"button.png"
})

-- 🔥 WOBBLE EFFECT
local function wobble(ui)
	local originalSize = ui.Size
	
	local t1 = TweenService:Create(ui, TweenInfo.new(0.1), {
		Rotation = 8,
		Size = originalSize + UDim2.new(0, 10, 0, 5)
	})
	
	local t2 = TweenService:Create(ui, TweenInfo.new(0.1), {
		Rotation = -8
	})
	
	local t3 = TweenService:Create(ui, TweenInfo.new(0.1), {
		Rotation = 0,
		Size = originalSize
	})

	t1:Play()
	t1.Completed:Wait()
	
	t2:Play()
	t2.Completed:Wait()
	
	t3:Play()
end

-- EVENT
button.MouseButton1Click:Connect(function()
	wobble(button)
	print("UI kamu jalan 😎")
end)
