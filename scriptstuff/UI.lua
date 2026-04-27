local function getImage(path)
	if getcustomasset then
		return getcustomasset(path)
	elseif getsynasset then
		return getsynasset(path)
	else
		warn("Executor tidak support image")
		return ""
	end
end

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local cover = Instance.new("ImageLabel", frame)
cover.Size = UDim2.new(0,120,0,120)
cover.Position = UDim2.new(0.5,-60,0,10)
cover.BackgroundTransparency = 1
cover.Image = getImage("scriptstuff/Images/cover.png")

local playBtn = Instance.new("ImageButton", frame)
playBtn.Size = UDim2.new(0,50,0,50)
playBtn.Position = UDim2.new(0.2,0,1,-60)
playBtn.Image = getImage("scriptstuff/Images/play.png")

local nextBtn = Instance.new("ImageButton", frame)
nextBtn.Size = UDim2.new(0,50,0,50)
nextBtn.Position = UDim2.new(0.6,0,1,-60)
nextBtn.Image = getImage("scriptstuff/Images/next.png")

playBtn.MouseButton1Click:Connect(function()
	print("Play clicked")
end)

nextBtn.MouseButton1Click:Connect(function()
	print("Next clicked")
end)