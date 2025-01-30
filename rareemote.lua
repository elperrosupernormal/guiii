local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local starterGui = game:GetService("StarterGui")

-- Enviar notificación al aparecer el GUI
starterGui:SetCore("SendNotification", {
	Title = "this script is absurd",
	Text = "Who found this joke for a rare emote script???",
	Duration = 3
})

wait(2)

starterGui:SetCore("SendNotification", {
	Title = "carrying this thing that took me one night...",
	Text = "loading!!!",
	Duration = 10
})

wait(10)

starterGui:SetCore("SendNotification", {
	Title = "already",
	Text = "don't waste your time pls",
	Duration = 3
})

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MegaEmoteGui"
screenGui.Parent = playerGui

-- Crear el Frame para mover el GUI
local moveFrame = Instance.new("Frame")
moveFrame.Size = UDim2.new(0, 150, 0, 50)
moveFrame.Position = UDim2.new(0.5, -75, 0.2, 0)
moveFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
moveFrame.BackgroundTransparency = 0.5
moveFrame.Active = true
moveFrame.Draggable = true -- Permite mover el GUI
moveFrame.Parent = screenGui

-- Crear el botón Mega Emote
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 1, 0)
button.Text = "Mega Emote"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.Parent = moveFrame

-- Función para reproducir la animación y eliminar el GUI
local function playEmote()
	local character = player.Character
	if character and character:FindFirstChild("Humanoid") then
		local humanoid = character:FindFirstChild("Humanoid")

		-- Eliminar animaciones idle para que no interrumpan
		for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
			track:Stop()
		end

		-- Crear y reproducir la animación
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://129359052926326"
		local animator = humanoid:FindFirstChild("Animator")
		if not animator then
			animator = Instance.new("Animator")
			animator.Parent = humanoid
		end
		local animationTrack = animator:LoadAnimation(animation)
		animationTrack:Play()

		-- Eliminar todo el GUI después de presionar el botón
		screenGui:Destroy()
	end
end

button.MouseButton1Click:Connect(playEmote)