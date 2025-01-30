local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- Crear el Frame (fondo)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.3, 0, 0.4, 0)  -- Aumentar la altura para que quepan todos los elementos
frame.Position = UDim2.new(0.35, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.2
frame.Active = true -- Habilitar movimiento
frame.Draggable = true -- Permitir arrastrar

-- Crear el TextLabel para el título
local titleLabel = Instance.new("TextLabel", frame)
titleLabel.Size = UDim2.new(1, 0, 0.2, 0) -- Ocupa toda la parte superior
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Chat Text"
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1 -- Sin fondo
titleLabel.TextXAlignment = Enum.TextXAlignment.Center  -- Corregido
titleLabel.TextYAlignment = Enum.TextYAlignment.Center  -- Corregido

-- Crear el TextBox para ingresar el mensaje
local textBox = Instance.new("TextBox", frame)
textBox.Size = UDim2.new(0.8, 0, 0.4, 0)
textBox.Position = UDim2.new(0.1, 0, 0.25, 0) -- Ajustado para que no se sobreponga al título
textBox.PlaceholderText = "Escribe tu mensaje"
textBox.ClearTextOnFocus = false
textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Agregar color para ver si aparece

-- Crear el botón para enviar el mensaje
local sendButton = Instance.new("TextButton", frame)
sendButton.Size = UDim2.new(0.8, 0, 0.3, 0)
sendButton.Position = UDim2.new(0.1, 0, 0.7, 0) -- Ajustado para que no se sobreponga al TextBox
sendButton.Text = "Enviar Mensaje"
sendButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Agregar color para ver si aparece

-- Función para enviar el mensaje al chat
local function SendChatMessage(message)
	local TextChatService = game:GetService("TextChatService")
	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local textChannel = TextChatService.TextChannels.RBXGeneral
		textChannel:SendAsync(message)
	else
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
	end
end

-- Conectar el botón con la función de envío
sendButton.MouseButton1Click:Connect(function()
	if textBox.Text ~= "" then
		SendChatMessage(textBox.Text)
		textBox.Text = "" -- Limpiar el TextBox después de enviar
	end
end)
