-- UI Library Module
local UILibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Animation settings
local TWEEN_TIME = 0.3
local TWEEN_STYLE = Enum.EasingStyle.Quad
local TWEEN_DIR = Enum.EasingDirection.Out

function UILibrary.new(title)
    local gui = {}
    
    -- Create main GUI elements
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local MinimizeBtn = Instance.new("TextButton")
    local CloseBtn = Instance.new("TextButton")
    local TabMenu = Instance.new("Frame")
    local TabList = Instance.new("Frame")
    local TabListLayout = Instance.new("UIListLayout")
    local ContentFrame = Instance.new("Frame")
    local TabArrow = Instance.new("TextButton")
    
    -- Configure ScreenGui
    ScreenGui.Name = "UILibrary"
    ScreenGui.Parent = game.CoreGui
    
    -- Configure MainFrame
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 300, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    
    -- Configure TopBar
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TopBar.BorderSizePixel = 0
    
    -- Configure Title
    Title.Text = title or "UI Library"
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.SourceSansBold
    
    -- Configure buttons
    MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
    MinimizeBtn.Position = UDim2.new(1, -60, 0, 0)
    MinimizeBtn.Text = "-"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeBtn.BorderSizePixel = 0
    
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -30, 0, 0)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    CloseBtn.BorderSizePixel = 0
    
    -- Configure TabMenu
    TabMenu.Size = UDim2.new(0, 150, 1, -30)
    TabMenu.Position = UDim2.new(0, -150, 0, 30)
    TabMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabMenu.BorderSizePixel = 0
    
    TabArrow.Size = UDim2.new(0, 20, 0, 60)
    TabArrow.Position = UDim2.new(1, 0, 0.5, -30)
    TabArrow.Text = ">"
    TabArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabArrow.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabArrow.BorderSizePixel = 0
    
    -- Configure ContentFrame
    ContentFrame.Size = UDim2.new(1, 0, 1, -30)
    ContentFrame.Position = UDim2.new(0, 0, 0, 30)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentFrame.BorderSizePixel = 0
    
    -- Parent elements
    MainFrame.Parent = ScreenGui
    TopBar.Parent = MainFrame
    Title.Parent = TopBar
    MinimizeBtn.Parent = TopBar
    CloseBtn.Parent = TopBar
    TabMenu.Parent = MainFrame
    TabArrow.Parent = TabMenu
    ContentFrame.Parent = MainFrame
    
    -- Tab system
    local tabs = {}
    local currentTab = nil
    local tabMenuOpen = false
    
    -- Create new tab
    function gui:CreateTab(name)
        local tab = {}
        local TabButton = Instance.new("TextButton")
        local TabContent = Instance.new("ScrollingFrame")
        local TabLayout = Instance.new("UIListLayout")
        
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabButton.BorderSizePixel = 0
        TabButton.Parent = TabList
        
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 4
        TabContent.Visible = false
        TabContent.Parent = ContentFrame
        
        TabLayout.Parent = TabContent
        TabLayout.Padding = UDim.new(0, 5)
        
        -- Create Toggle
        function tab:CreateToggle(text, default, callback)
            local Toggle = Instance.new("Frame")
            local ToggleButton = Instance.new("TextButton")
            local ToggleIndicator = Instance.new("Frame")
            local ToggleDot = Instance.new("Frame")
            local ToggleLabel = Instance.new("TextLabel")
            
            Toggle.Size = UDim2.new(1, -20, 0, 30)
            Toggle.BackgroundTransparency = 1
            
            ToggleButton.Size = UDim2.new(0, 44, 0, 24)
            ToggleButton.Position = UDim2.new(1, -44, 0.5, -12)
            ToggleButton.BackgroundTransparency = 1
            ToggleButton.Text = ""
            
            ToggleIndicator.Size = UDim2.new(1, 0, 1, 0)
            ToggleIndicator.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ToggleIndicator.BorderSizePixel = 0
            
            ToggleDot.Size = UDim2.new(0, 20, 0, 20)
            ToggleDot.Position = UDim2.new(0, 2, 0.5, -10)
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.BorderSizePixel = 0
            
            ToggleLabel.Text = text
            ToggleLabel.Size = UDim2.new(1, -54, 1, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            
            Toggle.Parent = TabContent
            ToggleButton.Parent = Toggle
            ToggleIndicator.Parent = ToggleButton
            ToggleDot.Parent = ToggleIndicator
            ToggleLabel.Parent = Toggle
            
            local toggled = default or false
            
            local function updateToggle()
                local dotPosition = toggled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
                local backgroundColor = toggled and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(30, 30, 30)
                
                local dotTween = TweenService:Create(ToggleDot, 
                    TweenInfo.new(TWEEN_TIME, TWEEN_STYLE, TWEEN_DIR),
                    {Position = dotPosition}
                )
                
                local colorTween = TweenService:Create(ToggleIndicator,
                    TweenInfo.new(TWEEN_TIME, TWEEN_STYLE, TWEEN_DIR),
                    {BackgroundColor3 = backgroundColor}
                )
                
                dotTween:Play()
                colorTween:Play()
                
                if callback then
                    callback(toggled)
                end
            end
            
            ToggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                updateToggle()
            end)
            
            updateToggle()
            return Toggle
        end
        
        -- Add tab to tabs table
        tabs[name] = {
            button = TabButton,
            content = TabContent
        }
        
        -- Tab button click handler
        TabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.content.Visible = false
            end
            currentTab = tabs[name]
            currentTab.content.Visible = true
        end)
        
        -- Select first tab by default
        if not currentTab then
            currentTab = tabs[name]
            currentTab.content.Visible = true
        end
        
        return tab
    end
    
    -- Dragging functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Tab menu animation
    TabArrow.MouseButton1Click:Connect(function()
        tabMenuOpen = not tabMenuOpen
        local targetPos = tabMenuOpen and UDim2.new(0, 0, 0, 30) or UDim2.new(0, -150, 0, 30)
        local arrowText = tabMenuOpen and "<" or ">"
        
        local menuTween = TweenService:Create(TabMenu,
            TweenInfo.new(TWEEN_TIME, TWEEN_STYLE, TWEEN_DIR),
            {Position = targetPos}
        )
        
        TabArrow.Text = arrowText
        menuTween:Play()
    end)
    
    -- Minimize/maximize animation
    local minimized = false
    MinimizeBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        local targetSize = minimized and UDim2.new(0, 300, 0, 30) or UDim2.new(0, 300, 0, 350)
        
        local sizeTween = TweenService:Create(MainFrame,
            TweenInfo.new(TWEEN_TIME, TWEEN_STYLE, TWEEN_DIR),
            {Size = targetSize}
        )
        
        sizeTween:Play()
    end)
    
    -- Close animation
    CloseBtn.MouseButton1Click:Connect(function()
        local closeTween = TweenService:Create(MainFrame,
            TweenInfo.new(TWEEN_TIME, TWEEN_STYLE, TWEEN_DIR),
            {Size = UDim2.new(0, 0, 0, 0)}
        )
        
        closeTween:Play()
        closeTween.Completed:Connect(function()
            ScreenGui:Destroy()
        end)
    end)
    
    -- Toggle with B key
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.B then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
    end)
    
    return gui
end

return UILibrary
