local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Freeze player
local originalWalkSpeed = humanoid.WalkSpeed
local originalJumpPower = humanoid.JumpPower
humanoid.WalkSpeed = 0
humanoid.JumpPower = 0

-- Create GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "PetDupeUI"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Pet & Seed Spawner | New Update"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local dupeBtn = Instance.new("TextButton", mainFrame)
dupeBtn.Size = UDim2.new(0.8, 0, 0, 40)
dupeBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
dupeBtn.Text = "Generate Dupe Script"
dupeBtn.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
dupeBtn.TextColor3 = Color3.new(1, 1, 1)
dupeBtn.Font = Enum.Font.SourceSansBold
dupeBtn.TextScaled = true

local barBack = Instance.new("Frame", mainFrame)
barBack.Size = UDim2.new(0.8, 0, 0, 30)
barBack.Position = UDim2.new(0.1, 0, 0.5, 0)
barBack.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
barBack.BorderSizePixel = 0

local barFill = Instance.new("Frame", barBack)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
barFill.BorderSizePixel = 0

local loadingText = Instance.new("TextLabel", barBack)
loadingText.Size = UDim2.new(1, 0, 1, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.new(0, 0, 0)
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextScaled = true
loadingText.Text = "0%"

local status = Instance.new("TextLabel", mainFrame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.7, 0)
status.BackgroundTransparency = 1
status.Text = "Checking Pet Database..."
status.TextColor3 = Color3.fromRGB(0, 255, 0)
status.Font = Enum.Font.SourceSans
status.TextScaled = true

local noLagBtn = Instance.new("TextButton", mainFrame)
noLagBtn.Size = UDim2.new(0.4, 0, 0, 30)
noLagBtn.Position = UDim2.new(0.55, 0, 0.85, 0)
noLagBtn.Text = "NO-Lag Script"
noLagBtn.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
noLagBtn.TextColor3 = Color3.new(1, 1, 1)
noLagBtn.Font = Enum.Font.SourceSansBold
noLagBtn.TextScaled = true

-- Fake Loading with Freeze
local progress = 0
while progress <= 100 do
	barFill.Size = UDim2.new(progress / 100, 0, 1, 0)
	loadingText.Text = progress .. "%"
	progress += 1
	wait(5)
end

-- Unfreeze player
humanoid.WalkSpeed = originalWalkSpeed
humanoid.JumpPower = originalJumpPower

screenGui:Destroy()