local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local playerGui = player:WaitForChild("PlayerGui")

-- Função para criar distorção na UI
local function distortUI()
    -- Acessa todos os elementos da interface
    for _, guiObject in pairs(playerGui:GetDescendants()) do
        if guiObject:IsA("GuiObject") then
            -- Criar o efeito de distorção movendo a posição e alterando a escala
            local randomOffset = UDim2.new(math.random(-50, 50) / 100, 0, math.random(-50, 50) / 100, 0)
            local randomScale = UDim2.new(math.random(80, 120) / 100, 0, math.random(80, 120) / 100, 0)
            
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, true)
            local goal = {Position = guiObject.Position + randomOffset, Size = randomScale}
            
            local tween = TweenService:Create(guiObject, tweenInfo, goal)
            tween:Play()
        end
    end
end

-- Função para simular um efeito mais glitchy na câmera
local function simulateDrunk()
    while true do
        -- Movimentos aleatórios para a câmera (posição e rotação)
        local randomX = math.random(-10, 10)
        local randomY = math.random(-5, 5)
        local randomZ = math.random(-10, 10)

        -- Movimentos de rotação aleatórios
        local randomRotX = math.random(-50, 50)
        local randomRotY = math.random(-50, 50)
        local randomRotZ = math.random(-50, 50)

        -- Aplica os movimentos e rotações aleatórias
        local goalPosition = camera.CFrame * CFrame.new(randomX, randomY, randomZ)
        local goalRotation = CFrame.Angles(math.rad(randomRotX), math.rad(randomRotY), math.rad(randomRotZ))

        -- Combina a rotação e a posição
        local goalCFrame = goalPosition * goalRotation

        -- Cria o tween para aplicar o movimento e rotação
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local tween = TweenService:Create(camera, tweenInfo, {CFrame = goalCFrame})
        
        tween:Play()

        -- Intervalo entre os movimentos (mais rápido e imprevisível)
        wait(math.random(0.1, 0.3))
    end
end

-- Inicia a distorção na UI
distortUI()

-- Inicia a simulação de efeito glitchy na câmera
simulateDrunk()

wait(0.1)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:FindFirstChild("HumanoidRootPart")

if not root then return end

local camera = workspace.CurrentCamera

for i = 1, 20 do
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6549021381"
    sound.Volume = 1000
    sound.Looped = false
    sound.Parent = root
    sound:Play()

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not sound.IsPlaying then
            connection:Disconnect()
            return
        end

        local loudness = math.clamp(sound.PlaybackLoudness / 100, 0, 5)
        local shakeX = (math.random() - 0.5) * loudness
        local shakeY = (math.random() - 0.5) * loudness
        camera.CFrame = camera.CFrame * CFrame.new(shakeX, shakeY, 0)
    end)
end
