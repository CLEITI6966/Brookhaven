local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Configurações
local Speed = 100
local BackDistance = 5
local TargetName = ""
local ScriptEnabled = false

-- Função para criar a GUI
local function CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 300, 0, 150)
    MainFrame.Position = UDim2.new(0.5, -150, 0, -200) -- Começa acima da tela
    MainFrame.AnchorPoint = Vector2.new(0.5, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Text = "Player Tracker"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Parent = MainFrame

    -- Botão de fechar (X)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Text = "X"
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 18
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = MainFrame

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton

    -- Fecha a GUI ao clicar no botão X
    CloseButton.MouseButton1Click:Connect(function()
        local ExitTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -150, 0, -200)})
        ExitTween:Play()
        ExitTween.Completed:Wait()
        ScreenGui:Destroy()
    end)

    local TextBox = Instance.new("TextBox")
    TextBox.PlaceholderText = "Digite o nome do player"
    TextBox.Size = UDim2.new(0.8, 0, 0, 30)
    TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = false
    TextBox.Parent = MainFrame

    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0, 50, 0, 25)
    ToggleFrame.Position = UDim2.new(0.5, -25, 0.7, 0)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = MainFrame

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 25, 0, 25)
    ToggleButton.Position = UDim2.new(0, 0, 0, 0)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.Parent = ToggleFrame

    local ToggleCornerButton = Instance.new("UICorner")
    ToggleCornerButton.CornerRadius = UDim.new(1, 0)
    ToggleCornerButton.Parent = ToggleButton

    -- Animações
    local TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

    -- Animação de entrada
    local EnterTween = TweenService:Create(MainFrame, TweenInfo, {Position = UDim2.new(0, 0, 0, -75)}) -- Vai para o centro
    EnterTween:Play()

    -- Função do Toggle
    ToggleButton.MouseButton1Click:Connect(function()
        ScriptEnabled = not ScriptEnabled
        if ScriptEnabled then
            TweenService:Create(ToggleButton, TweenInfo, {Position = UDim2.new(1, -25, 0, 0), BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
        else
            TweenService:Create(ToggleButton, TweenInfo, {Position = UDim2.new(0, 0, 0, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end
    end)

    -- Atualiza o nome do alvo
    TextBox:GetPropertyChangedSignal("Text"):Connect(function()
        TargetName = TextBox.Text
    end)

    -- Função para arrastar a GUI
    local Dragging = false
    local DragStartPos
    local FrameStartPos

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStartPos = Vector2.new(input.Position.X, input.Position.Y)
            FrameStartPos = MainFrame.Position
        end
    end)

    MainFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local Delta = Vector2.new(input.Position.X, input.Position.Y) - DragStartPos
            MainFrame.Position = UDim2.new(FrameStartPos.X.Scale, FrameStartPos.X.Offset + Delta.X, FrameStartPos.Y.Scale, FrameStartPos.Y.Offset + Delta.Y)
        end
    end)
end

-- Função para mover o personagem
local function MoveToPosition(position, duration)
    local BodyVelocity = Instance.new("BodyVelocity", Character:FindFirstChild("HumanoidRootPart"))
    BodyVelocity.Velocity = (position - Character.HumanoidRootPart.Position).Unit * Speed
    BodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    task.wait(duration)
    BodyVelocity:Destroy()
end

-- Função para olhar para o alvo
local function LookAtTarget(targetPosition)
    local direction = (targetPosition - Character.HumanoidRootPart.Position).Unit
    local lookCFrame = CFrame.lookAt(Character.HumanoidRootPart.Position, Character.HumanoidRootPart.Position + direction)
    Character:SetPrimaryPartCFrame(lookCFrame)
end

-- Função para encontrar o jogador alvo
local function GetTargetPlayer(name)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and string.find(player.Name:lower(), name:lower()) then
            return player
        end
    end
    return nil
end

-- Loop principal
RunService.Heartbeat:Connect(function()
    if ScriptEnabled then
        local Target = GetTargetPlayer(TargetName)
        if Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
            local TargetPosition = Target.Character.HumanoidRootPart.Position

            local BackPosition = Character.HumanoidRootPart.Position - Character.HumanoidRootPart.CFrame.LookVector * BackDistance
            MoveToPosition(BackPosition, 0.2)

            while (Character.HumanoidRootPart.Position - TargetPosition).Magnitude > 2 do
                LookAtTarget(TargetPosition)
                MoveToPosition(TargetPosition, 0.05)
                TargetPosition = Target.Character.HumanoidRootPart.Position
            end

            MoveToPosition(BackPosition, 0.2)
        end
    end
end)

-- Cria a GUI
CreateGUI()
