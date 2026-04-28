local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "DeltaUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- FRAME
local frame = Instance.new("ImageLabel")
frame.Parent = gui
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundTransparency = 1
frame.Image = getcustomasset("DeltaUI/images/frame.png")

-- BUTTON
local button = Instance.new("ImageButton")
button.Parent = frame
button.Size = UDim2.new(0, 200, 0, 80)
button.Position = UDim2.new(0.5, -100, 0.6, 0)
button.BackgroundTransparency = 1
button.Image = getcustomasset("DeltaUI/images/button.png")

-- 🔥 WOBBLE EFFECT FUNCTION
local function wobble(ui)
    local tween1 = TweenService:Create(ui, TweenInfo.new(0.1), {
        Rotation = 10,
        Size = ui.Size + UDim2.new(0, 10, 0, 5)
    })
    
    local tween2 = TweenService:Create(ui, TweenInfo.new(0.1), {
        Rotation = -10
    })
    
    local tween3 = TweenService:Create(ui, TweenInfo.new(0.1), {
        Rotation = 0,
        Size = UDim2.new(0, 200, 0, 80)
    })

    tween1:Play()
    tween1.Completed:Wait()

    tween2:Play()
    tween2.Completed:Wait()

    tween3:Play()
end

-- EVENT
button.MouseButton1Click:Connect(function()
    wobble(button)
    print("Button ditekan 😎")
end)