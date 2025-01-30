local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.7, 0) -- Aumentado
frame.Position = UDim2.new(0.2, 0, 0.15, 0)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Draggable = true -- Permite mover el GUI
frame.Active = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.15, 0)
title.BackgroundTransparency = 1
title.Text = "pansit0gui"
title.TextScaled = true
title.TextColor3 = Color3.new(1, 1, 1)
title.Parent = frame

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0.8, 0, 0.12, 0)
button1.Position = UDim2.new(0.1, 0, 0.18, 0)
button1.Text = "Cambiar cielo"
button1.TextScaled = true
button1.Parent = frame

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0.8, 0, 0.12, 0)
button2.Position = UDim2.new(0.1, 0, 0.32, 0)
button2.Text = "Cambiar texturas del mapa"
button2.TextScaled = true
button2.Parent = frame

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0.8, 0, 0.12, 0)
button3.Position = UDim2.new(0.1, 0, 0.46, 0)
button3.Text = "Añadir partículas a jugadores"
button3.TextScaled = true
button3.Parent = frame

local button4 = Instance.new("TextButton")
button4.Size = UDim2.new(0.8, 0, 0.12, 0)
button4.Position = UDim2.new(0.1, 0, 0.6, 0)
button4.Text = "Aplicar textura a jugadores"
button4.TextScaled = true
button4.Parent = frame

local button5 = Instance.new("TextButton")
button5.Size = UDim2.new(0.8, 0, 0.12, 0)
button5.Position = UDim2.new(0.1, 0, 0.74, 0)
button5.Text = "Reproducir música perturbadora"
button5.TextScaled = true
button5.Parent = frame

button1.MouseButton1Click:Connect(function()
	local sky = game.Lighting:FindFirstChildOfClass("Sky")
	if not sky then
		sky = Instance.new("Sky")
		sky.Parent = game.Lighting
	end
	sky.SkyboxBk = "rbxassetid://129183005261751"
	sky.SkyboxDn = "rbxassetid://129183005261751"
	sky.SkyboxFt = "rbxassetid://129183005261751"
	sky.SkyboxLf = "rbxassetid://129183005261751"
	sky.SkyboxRt = "rbxassetid://129183005261751"
	sky.SkyboxUp = "rbxassetid://129183005261751"
end)

button2.MouseButton1Click:Connect(function()
	for _, part in pairs(workspace:GetDescendants()) do
		if part:IsA("Part") or part:IsA("MeshPart") then
			for _, child in pairs(part:GetChildren()) do
				if child:IsA("Texture") then
					child:Destroy()
				end
			end
			local texture = Instance.new("Texture")
			texture.Texture = "rbxassetid://129183005261751"
			texture.StudsPerTileU = 4
			texture.StudsPerTileV = 4
			texture.Face = Enum.NormalId.Top
			texture.Parent = part
		end
	end
end)

button3.MouseButton1Click:Connect(function()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local particle = Instance.new("ParticleEmitter")
			particle.Texture = "rbxassetid://129183005261751"
			particle.Rate = 20
			particle.Lifetime = NumberRange.new(1, 2)
			particle.Speed = NumberRange.new(2, 5)
			particle.Parent = player.Character.HumanoidRootPart
		end
	end
end)

button4.MouseButton1Click:Connect(function()
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Head") then
			local head = player.Character.Head
			-- Eliminar decal existente si existe
			for _, child in pairs(head:GetChildren()) do
				if child:IsA("Decal") then
					child:Destroy()
				end
			end
			-- Crear nuevo decal
			local faceDecal = Instance.new("Decal")
			faceDecal.Texture = "rbxassetid://129183005261751"
			faceDecal.Parent = head
		end
	end
end)

button5.MouseButton1Click:Connect(function()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://142376088"
	sound.Looped = true
	sound.Volume = 1
	sound.PlaybackSpeed = 0.8 -- Hacerlo más perturbador
	sound.Parent = game.Workspace
	sound:Play()
end)
