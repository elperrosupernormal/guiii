-- Crear el GUI de música
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Crear el Frame (más grande)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.5, 0, 0.4, 0)  -- Aumenté el tamaño
frame.Position = UDim2.new(0.25, 0, 0.3, 0)  -- Ajusté la posición
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5

-- Crear el TextBox para ingresar el ID de música
local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(0.8, 0, 0.25, 0)  -- Ajusté el tamaño
textBox.Position = UDim2.new(0.1, 0, 0.1, 0)
textBox.PlaceholderText = "Ingresa ID de música"
textBox.ClearTextOnFocus = false

-- Crear el TextButton para reproducir la música
local playButton = Instance.new("TextButton", frame)
playButton.Size = UDim2.new(0.8, 0, 0.25, 0)  -- Ajusté el tamaño
playButton.Position = UDim2.new(0.1, 0, 0.4, 0)
playButton.Text = "Reproducir"

-- Crear el TextButton para detener la música
local stopButton = Instance.new("TextButton", frame)
stopButton.Size = UDim2.new(0.8, 0, 0.25, 0)  -- Ajusté el tamaño
stopButton.Position = UDim2.new(0.1, 0, 0.7, 0)
stopButton.Text = "Detener"

-- Crear el objeto Sound para reproducir la música
local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))

-- Función para manejar la reproducción de la música
playButton.MouseButton1Click:Connect(function()
	local soundId = textBox.Text
	if tonumber(soundId) then
		sound.SoundId = "rbxassetid://" .. soundId
		sound.Volume = 3
		sound.Looped = true
		sound:Play()
	else
		print("Por favor ingresa un ID de música válido")
	end
end)

-- Función para manejar la detención de la música
stopButton.MouseButton1Click:Connect(function()
	sound:Stop()  -- Detener la música
	print("Música detenida")
end)

-- Hacer el GUI movible
local dragging = false
local dragStart = nil
local startPos = nil

frame.InputBegan:Connect(function(input, gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
