-- UI Library Module
local UILibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

function UILibrary.new(title)
    local library = {}
    local tabs = {}
    local activeTab = nil
    
    -- Main GUI Setup
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CloseButton = Instance.new("TextButton")
    local MinimizeButton = Instance.new("TextButton")
    local TabList = Instance.new("Frame")
    local TabListButton = Instance.new("TextButton")
    local TabContainer = Instance.new("ScrollingFrame")
    
    -- GUI Properties
    ScreenGui.Name = "UILibrary"
    ScreenGui.Parent = game.CoreGui
    
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 30)
    TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    Title.Name = "Title"
    Title.Text = title or "UI Library"
    Title.Size = UDim2.new(1, -100, 1, 0)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Parent = TopBar
    
    -- Close and Minimize Buttons
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Parent = TopBar
    
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Parent = TopBar
    
    -- Tab System
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, 0, 1, -30)
    TabContainer.Position = UDim2.new(0, 0, 0, 30)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 4
    TabContainer.Parent = MainFrame
    
    -- Create Tab Function
    function library:CreateTab(name)
        local tab = {}
        local TabFrame = Instance.new("Frame")
        TabFrame.Name = name
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.Parent = TabContainer
        
        -- Elements Container
        local ElementsContainer = Instance.new("Frame")
        ElementsContainer.Size = UDim2.new(1, -20, 1, -10)
        ElementsContainer.Position = UDim2.new(0, 10, 0, 5)
        ElementsContainer.BackgroundTransparency = 1
        ElementsContainer.Parent = TabFrame
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = ElementsContainer
        UIListLayout.Padding = UDim.new(0, 5)
        
        -- Create Toggle Function
        function tab:CreateToggle(text, default, callback)
            local Toggle = Instance.new("Frame")
            local ToggleButton = Instance.new("TextButton")
            local ToggleInner = Instance.new("Frame")
            local ToggleDot = Instance.new("Frame")
            local ToggleLabel = Instance.new("TextLabel")
            
            Toggle.Size = UDim2.new(1, 0, 0, 30)
            Toggle.BackgroundTransparency = 1
            Toggle.Parent = ElementsContainer
            
            ToggleLabel.Text = text
            ToggleLabel.Size = UDim2.new(1, -60, 1, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = Toggle
            
            ToggleButton.Size = UDim2.new(0, 40, 0, 20)
            ToggleButton.Position = UDim2.new(1, -45, 0, 5)
            ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Text = ""
            ToggleButton.Parent = Toggle
            
            ToggleInner.Size = UDim2.new(1, -4, 1, -4)
            ToggleInner.Position = UDim2.new(0, 2, 0, 2)
            ToggleInner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            ToggleInner.BorderSizePixel = 0
            ToggleInner.Parent = ToggleButton
            
            ToggleDot.Size = UDim2.new(0, 16, 0, 16)
            ToggleDot.Position = UDim2.new(0, 0, 0, 0)
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.BorderSizePixel = 0
            ToggleDot.Parent = ToggleInner
            
            local toggled = default or false
            local function updateToggle()
                local goal = {
                    Position = toggled and UDim2.new(1, -16, 0, 0) or UDim2.new(0, 0, 0, 0),
                }
                local goalColor = {
                    BackgroundColor3 = toggled and Color3.fromRGB(0, 120, 255) or Color3.fromRGB(0, 0, 0),
                }
                
                TweenService:Create(ToggleDot, TweenInfo.new(0.2), goal):Play()
                TweenService:Create(ToggleInner, TweenInfo.new(0.2), goalColor):Play()
                
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
        
        -- Create Button Function
        function tab:CreateButton(text, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 0, 30)
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderSizePixel = 0
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Parent = ElementsContainer
            
            Button.MouseButton1Click:Connect(function()
                if callback then callback() end
            end)
            
            return Button
        end
        
        -- Create Textbox Function
        function tab:CreateTextbox(placeholder, callback)
            local Textbox = Instance.new("TextBox")
            Textbox.Size = UDim2.new(1, 0, 0, 30)
            Textbox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Textbox.BorderSizePixel = 0
            Textbox.PlaceholderText = placeholder
            Textbox.Text = ""
            Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.Parent = ElementsContainer
            
            Textbox.FocusLost:Connect(function(enterPressed)
                if enterPressed and callback then
                    callback(Textbox.Text)
                end
            end)
            
            return Textbox
        end
        
        -- Create Dropdown Function
        function tab:CreateDropdown(text, options, callback)
            local Dropdown = Instance.new("Frame")
            local DropdownButton = Instance.new("TextButton")
            local DropdownContainer = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            
            Dropdown.Size = UDim2.new(1, 0, 0, 30)
            Dropdown.BackgroundTransparency = 1
            Dropdown.Parent = ElementsContainer
            
            DropdownButton.Size = UDim2.new(1, 0, 0, 30)
            DropdownButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Text = text
            DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton.Parent = Dropdown
            
            DropdownContainer.Size = UDim2.new(1, 0, 0, 0)
            DropdownContainer.Position = UDim2.new(0, 0, 0, 30)
            DropdownContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            DropdownContainer.BorderSizePixel = 0
            DropdownContainer.ClipsDescendants = true
            DropdownContainer.Parent = Dropdown
            
            UIListLayout.Parent = DropdownContainer
            
            local open = false
            
            for _, option in ipairs(options) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Size = UDim2.new(1, 0, 0, 25)
                OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                OptionButton.BorderSizePixel = 0
                OptionButton.Text = option
                OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton.Parent = DropdownContainer
                
                OptionButton.MouseButton1Click:Connect(function()
                    if callback then callback(option) end
                    DropdownButton.Text = text .. ": " .. option
                    open = false
                    TweenService:Create(DropdownContainer, TweenInfo.new(0.2), {
                        Size = UDim2.new(1, 0, 0, 0)
                    }):Play()
                end)
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                open = not open
                TweenService:Create(DropdownContainer, TweenInfo.new(0.2), {
                    Size = UDim2.new(1, 0, 0, open and UIListLayout.AbsoluteContentSize.Y or 0)
                }):Play()
            end)
            
            return Dropdown
        end
        
        return tab
    end
    
    -- Dragging functionality
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    TopBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("RunService").RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    -- Close and Minimize functionality
    local minimized = false
    
    MinimizeButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {
            Size = minimized and UDim2.new(0, 400, 0, 30) or UDim2.new(0, 400, 0, 300)
        }):Play()
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 400, 0, 0)
        }):Play()
        wait(0.3)
        ScreenGui:Destroy()
    end)
    
    -- Keybind to toggle GUI
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.B then
            MainFrame.Visible = not MainFrame.Visible
            if MainFrame.Visible then
                TweenService:Create(MainFrame, TweenInfo.new(0.3), {
                    Size = UDim2.new(0, 400, 0, 300)
                }):Play()
            end
        end
    end)
    
    return library
end

return UILibrary
