local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local blackHoleActive = true

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                Attachment1.WorldCFrame = humanoidRootPart.CFrame
            end
        end)
    end
end

-- Ativa o buraco negro inicialmente
toggleBlackHole()

-- Escuta o pressionamento de tecla para ativar/desativar o buraco negro
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.B then -- Você pode mudar a tecla para o que preferir
            toggleBlackHole()
        end
    end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Criar uma ScreenGui se não existir
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Criar um Frame para a notificação
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.3, 0)
frame.Position = UDim2.new(0.25, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Título da notificação
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Bring all parts! - Alert ⚠️"
titleLabel.TextScaled = true
titleLabel.Parent = frame

-- Texto da notificação
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.5, 0)
textLabel.Position = UDim2.new(0, 0, 0.2, 0)
textLabel.Text = "Por favor, use um teclado virtual script se você estiver no celular e aperte a tecla B para ativar. No computador, aperte a tecla B."
textLabel.TextScaled = true
textLabel.Parent = frame

-- Botão OK
local okButton = Instance.new("TextButton")
okButton.Size = UDim2.new(0.4, 0, 0.2, 0)
okButton.Position = UDim2.new(0.3, 0, 0.75, 0)
okButton.Text = "OK"
okButton.TextScaled = true
okButton.Parent = frame

-- Função para fechar a notificação
okButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Variáveis principais
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local godMode = false -- Começa desativado

-- Criar a interface de usuário do botão
local ScreenGui = Instance.new("ScreenGui")
local Button = Instance.new("TextButton")

-- Configurar o ScreenGui e o botão
ScreenGui.Parent = game.CoreGui -- Coloca a GUI na interface do jogador
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.5, -25)
Button.Text = "God Mode: OFF"
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Cor vermelha para OFF

-- Função para alternar o modo god
local function toggleGodMode()
    godMode = not godMode
    if godMode then
        Button.Text = "God Mode: ON"
        Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Cor verde para ON
    else
        Button.Text = "God Mode: OFF"
        Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Cor vermelha para OFF
    end
end

-- Conectar a mudança de saúde
character.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
    if godMode then
        character.Humanoid.Health = character.Humanoid.MaxHealth
    end
end)

-- Conectar o botão à função de alternância
Button.MouseButton1Click:Connect(toggleGodMode)

-- Função para arrastar o botão (PC e Mobile)
local dragging = false
local dragStart, startPos

-- Função para iniciar o arrasto
local function onInputBegan(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

-- Função para atualizar a posição do botão durante o arrasto
local function onInputChanged(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

-- Conectar os eventos
Button.InputBegan:Connect(onInputBegan)
Button.InputChanged:Connect(onInputChanged)
