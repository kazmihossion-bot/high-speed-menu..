-- HIGH SPEED GUI (for your own Roblox experience / testing)
-- This file is not hosted on GitHub automatically.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local DEFAULT_SPEED = 16
local SPEED = 100
local enabled = false

local gui = Instance.new("ScreenGui")
gui.Name = "HighSpeedMenu"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(230, 165)
frame.Position = UDim2.new(0.5, -115, 0.5, -82)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -16, 0, 38)
title.Position = UDim2.fromOffset(8, 5)
title.BackgroundTransparency = 1
title.Text = "⚡ HIGH SPEED"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, -20, 0, 25)
speedLabel.Position = UDim2.fromOffset(10, 45)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: " .. SPEED
speedLabel.TextColor3 = Color3.fromRGB(210, 220, 255)
speedLabel.TextScaled = true
speedLabel.Parent = frame

local slower = Instance.new("TextButton")
slower.Size = UDim2.fromOffset(45, 32)
slower.Position = UDim2.fromOffset(18, 75)
slower.Text = "-"
slower.TextScaled = true
slower.Parent = frame

local faster = Instance.new("TextButton")
faster.Size = UDim2.fromOffset(45, 32)
faster.Position = UDim2.fromOffset(167, 75)
faster.Text = "+"
faster.TextScaled = true
faster.Parent = frame

local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1, -84, 0, 32)
toggle.Position = UDim2.fromOffset(60, 75)
toggle.Text = "SPEED: OFF"
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(80, 70, 110)
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.Parent = frame

local function applySpeed()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = enabled and SPEED or DEFAULT_SPEED
    end
end

slower.Activated:Connect(function()
    SPEED = math.max(16, SPEED - 25)
    speedLabel.Text = "Speed: " .. SPEED
    applySpeed()
end)

faster.Activated:Connect(function()
    SPEED = math.min(500, SPEED + 25)
    speedLabel.Text = "Speed: " .. SPEED
    applySpeed()
end)

toggle.Activated:Connect(function()
    enabled = not enabled
    toggle.Text = enabled and "SPEED: ON" or "SPEED: OFF"
    toggle.BackgroundColor3 = enabled and Color3.fromRGB(25, 150, 90) or Color3.fromRGB(80, 70, 110)
    applySpeed()
end)

player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.2)
    applySpeed()
end)

print("High Speed GUI loaded. Use only in your own experience/testing.")
