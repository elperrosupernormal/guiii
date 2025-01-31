local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Función para mostrar notificaciones
local function showNotification(title, text, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = duration
	})
end

-- Función que muestra las notificaciones solo al inicio
local function showStartNotifications()
	showNotification("Script by: fdfvfvfff", "This script was created by fdfvfvfff", 3)
	wait(2)
	showNotification("Loading script...", "Please wait while the script is loading.", 5)
	wait(5)
	showNotification("Thank you for using my script!", "Enjoy using this script!", 5)
	wait(0)
	showNotification("Enjoy it!", "Have fun with the script!", 5)
end

-- Mostrar las notificaciones al inicio
showStartNotifications()

-- Función para detectar si el ejecutor está presente
local function detectExecutor()
	-- Aquí verificamos si hay ciertos signos de un executor, como la presencia de ciertos objetos o variables
	local executorDetected = false
	local executorName = "Unknown"

	-- Lista de ejecutores conocidos
	local knownExecutors = {
		"Synapse",       -- PC
		"Krnl",          -- PC (aunque ya está algo inactivo, aún se usa en algunos casos)
		"JJsploit",      -- PC
		"Fluxus",        -- PC
		"Delta",         -- PC
		"ArceusX",       -- Android
		"ScriptWare",    -- PC
		"WeAreDevs",     -- PC
		"Electron",      -- PC
		"Proxo",         -- PC
		"Titanium",      -- PC
		"RogueX",        -- PC
		"ScriptExecutor",-- PC
		"Cytus",         -- PC
		"ExploitsHub",   -- PC
		"Feather",       -- PC
		"RobloxRage",    -- PC
		"Fates",         -- PC
		"Xenon",         -- PC
		"WindScript",    -- PC
		"DarkDex",       -- PC
		"IYF",           -- PC
		"Solara",        -- PC (nuevo)
	}

	-- Verifica si alguno de los *executors* está presente en el cliente
	for _, executor in pairs(knownExecutors) do
		if pcall(function()
				return getexecutorname() == executor
			end) then
			executorDetected = true
			executorName = executor
			break
		end
	end

	if executorDetected then
		showNotification("Executor Detected", "You are using " .. executorName, 3)
		print("Executor detected: " .. executorName)
	else
		showNotification("Executor Unknown", "No recognized executor detected.", 3)
		print("Executor Unknown")
	end
end

-- Mensaje al intentar cargar el script
print("Attempting to load script...")

-- Detectar ejecutor
detectExecutor()

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Crear Frame principal del GUI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.5, -60)
frame.BackgroundColor3 = Color3.new(0, 0, 0) -- Negro
frame.BackgroundTransparency = 0.5 -- Transparencia 0.5
frame.Parent = screenGui

-- Crear Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Speed GUI Script"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = frame

-- Crear TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 180, 0, 30)
textBox.Position = UDim2.new(0, 10, 0, 30)
textBox.PlaceholderText = "Enter your speed amount"
textBox.BackgroundColor3 = Color3.new(1, 1, 1)
textBox.TextColor3 = Color3.new(0, 0, 0)
textBox.Parent = frame

-- Crear Botón
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 30)
button.Position = UDim2.new(0, 10, 0, 70)
button.Text = "Set Speed"
button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
button.TextColor3 = Color3.new(1, 1, 1)
button.Parent = frame

-- Hacer el Frame movible
local dragging, dragStart, startPos

frame.InputBegan:Connect(function(input)
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

-- Cambiar la velocidad del jugador
button.MouseButton1Click:Connect(function()
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	local newSpeed = tonumber(textBox.Text)

	-- Verificar si la entrada es un número válido
	if not newSpeed then
		showNotification("Invalid Speed", "Unknown speed entered. Please enter a valid number.", 3)
		print("Error: Invalid speed input entered.")
		return
	end

	-- Aplicar la nueva velocidad sin límite
	if humanoid then
		humanoid.WalkSpeed = newSpeed
		showNotification("Speed Set", "Your speed is now: " .. newSpeed, 3)
		print("Speed set successfully: " .. newSpeed)
	else
		print("Error: Humanoid not found.")
	end
end)

-- Añadir un indicador de velocidad
local speedIndicator = Instance.new("TextLabel")
speedIndicator.Size = UDim2.new(0, 200, 0, 20)
speedIndicator.Position = UDim2.new(0, 0, 0, 100)
speedIndicator.BackgroundTransparency = 1
speedIndicator.Text = "Current Speed: " .. (player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed or 16)
speedIndicator.TextColor3 = Color3.new(1, 1, 1)
speedIndicator.TextScaled = true
speedIndicator.Font = Enum.Font.SourceSansBold
speedIndicator.Parent = frame

-- Actualizar el indicador de velocidad
game:GetService("RunService").Heartbeat:Connect(function()
	local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		speedIndicator.Text = "Current Speed: " .. humanoid.WalkSpeed
	end
end)

-- Evitar que el GUI se borre al morir el jugador
player.CharacterAdded:Connect(function()
	-- Asegurarse de que el GUI siempre esté presente después de la muerte
	if not screenGui.Parent then
		screenGui.Parent = playerGui
	end
end)

-- Mensaje de éxito al cargar el script correctamente
print("Script loaded and executed successfully.")
