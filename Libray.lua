local Library = {}

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Configurações de estilo
local STYLE = {
    COLORS = {
        PRIMARY = Color3.fromRGB(0, 120, 215),
        SECONDARY = Color3.fromRGB(70, 70, 70),
        ACCENT = Color3.fromRGB(255, 82, 82),
        TEXT = Color3.fromRGB(240, 240, 240)
    },
    EASING = Enum.EasingStyle.Quint,
    DURATION = 0.3
}

-- Função para criar elementos com estilos padrão
function Library:CreateElement(props)
    local element = Instance.new(props.Type)
    element.Name = props.Name or "Element"
    element.Size = props.Size or UDim2.new(0, 200, 0, 40)
    element.Position = props.Position
    element.AnchorPoint = props.AnchorPoint
    element.BackgroundColor3 = props.BackgroundColor3 or STYLE.COLORS.SECONDARY
    element.BorderSizePixel = 0
    
    if props.Text then
        element.Text = props.Text
        element.TextColor3 = STYLE.COLORS.TEXT
        element.Font = Enum.Font.GothamMedium
        element.TextSize = 14
    end
    
    if props.Parent then
        element.Parent = props.Parent
    end
    
    -- Efeito de sombra
    local shadow = Instance.new("UIStroke")
    shadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    shadow.Color = Color3.new(0, 0, 0)
    shadow.Transparency = 0.8
    shadow.Thickness = 2
    shadow.Parent = element
    
    -- Borda arredondada
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = element
    
    return element
end

-- Função para criar um título
function Library:CreateTitle(props)
    local title = self:CreateElement({
        Type = "TextLabel",
        Name = "Title",
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0, 0),
        Text = props.Text or "Title",
        BackgroundColor3 = STYLE.COLORS.PRIMARY,
        Parent = props.Parent
    })
    
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = STYLE.COLORS.TEXT
    
    return title
end

-- Função para habilitar o arrasto de uma GUI
function Library:EnableDrag(gui)
    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- Componente Botão com Efeito de Onda
function Library:CreateButton(props)
    local button = self:CreateElement({
        Type = "TextButton",
        Name = "Button",
        Size = UDim2.new(0, 120, 0, 40),
        Text = props.Text or "Button",
        Parent = props.Parent
    })
    
    local ripple = Instance.new("Frame")
    ripple.Name = "RippleEffect"
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    ripple.BackgroundColor3 = Color3.new(1, 1, 1)
    ripple.BackgroundTransparency = 0.9
    ripple.ZIndex = 2
    ripple.Parent = button
    
    local rippleCorner = Instance.new("UICorner")
    rippleCorner.CornerRadius = UDim.new(1, 0)
    rippleCorner.Parent = ripple
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = STYLE.COLORS.PRIMARY:Lerp(Color3.new(1,1,1), 0.1)
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.4), {
            BackgroundColor3 = STYLE.COLORS.SECONDARY
        }):Play()
    end)
    
    button.MouseButton1Down:Connect(function(x, y)
        local pos = button.AbsolutePosition
        local mouse = Vector2.new(x - pos.X, y - pos.Y)
        
        ripple.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
        
        TweenService:Create(ripple, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
            Size = UDim2.new(3, 0, 3, 0),
            BackgroundTransparency = 1
        }):Play()
    end)
    
    button.Activated:Connect(function()
        if props.Callback then
            props.Callback()
        end
    end)
    
    return button
end

-- Toggle Super Animado
function Library:CreateToggle(props)
    local toggle = self:CreateElement({
        Type = "Frame",
        Name = "Toggle",
        Size = UDim2.new(0, 60, 0, 30),
        Parent = props.Parent
    })
    
    local track = self:CreateElement({
        Type = "Frame",
        Name = "Track",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = STYLE.COLORS.SECONDARY,
        Parent = toggle
    })
    
    local thumb = self:CreateElement({
        Type = "Frame",
        Name = "Thumb",
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 5, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.new(1,1,1),
        Parent = track
    })
    
    thumb.UIStroke:Destroy()
    track.UIStroke:Destroy()
    
    -- Efeito de brilho
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Size = UDim2.new(1.5, 0, 1.5, 0)
    glow.Position = UDim2.new(-0.25, 0, -0.25, 0)
    glow.Image = "rbxassetid://8992234271" -- ID de textura de brilho
    glow.ImageTransparency = 1
    glow.BackgroundTransparency = 1
    glow.Parent = thumb
    
    local state = false
    local debounce = false
    
    local function animate()
        if debounce then return end
        debounce = true
        
        state = not state
        
        local tweenInfo = TweenInfo.new(
            STYLE.DURATION,
            STYLE.EASING,
            Enum.EasingDirection.Out
        )
        
        local goals = {
            ThumbPosition = state and UDim2.new(1, -25, 0.5, 0) or UDim2.new(0, 5, 0.5, 0),
            TrackColor = state and STYLE.COLORS.PRIMARY or STYLE.COLORS.SECONDARY,
            GlowTransparency = state and 0.5 or 1
        }
        
        TweenService:Create(thumb, tweenInfo, {Position = goals.ThumbPosition}):Play()
        TweenService:Create(track, tweenInfo, {BackgroundColor3 = goals.TrackColor}):Play()
        TweenService:Create(glow, tweenInfo, {ImageTransparency = goals.GlowTransparency}):Play()
        
        task.wait(STYLE.DURATION)
        debounce = false
    end
    
    toggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            animate()
            if props.Callback then
                props.Callback(state)
            end
        end
    end)
    
    return toggle
end

-- Dropdown com Animação de Abertura
function Library:CreateDropdown(props)
    local dropdown = self:CreateElement({
        Type = "Frame",
        Name = "Dropdown",
        Size = UDim2.new(0, 200, 0, 40),
        Parent = props.Parent
    })
    
    local header = self:CreateElement({
        Type = "TextButton",
        Name = "Header",
        Size = UDim2.new(1, 0, 0, 40),
        Text = props.Title or "Select",
        Parent = dropdown
    })
    
    local optionsFrame = self:CreateElement({
        Type = "ScrollingFrame",
        Name = "Options",
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 45),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 3,
        Parent = dropdown
    })
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.Padding = UDim.new(0, 5)
    listLayout.Parent = optionsFrame
    
    local isOpen = false
    
    local function toggleDropdown()
        isOpen = not isOpen
        
        TweenService:Create(optionsFrame, TweenInfo.new(STYLE.DURATION, STYLE.EASING), {
            Size = isOpen and UDim2.new(1, 0, 0, math.min(#props.Options * 45, 200)) or UDim2.new(1, 0, 0, 0),
            CanvasSize = isOpen and UDim2.new(0, 0, 0, #props.Options * 45) or UDim2.new(0, 0, 0, 0)
        }):Play()
    end
    
    header.MouseButton1Click:Connect(toggleDropdown)
    
    for _, option in pairs(props.Options) do
        local optionButton = self:CreateButton({
            Text = option,
            Parent = optionsFrame,
            Size = UDim2.new(1, -10, 0, 40),
            Callback = function()
                header.Text = option
                toggleDropdown()
                if props.Callback then
                    props.Callback(option)
                end
            end
        })
        
        optionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        optionButton.TextColor3 = STYLE.COLORS.TEXT
    end
    
    return dropdown
end

-- Animação de Entrada da GUI
function Library:AnimateEntrance(gui)
    gui.Position = UDim2.new(0.5, 0, 0, -50)
    gui.AnchorPoint = Vector2.new(0.5, 0)
    
    TweenService:Create(gui, TweenInfo.new(1, Enum.EasingStyle.Elastic), {
        Position = UDim2.new(0.5, 0, 0.1, 0)
    }):Play()
end

return Library
