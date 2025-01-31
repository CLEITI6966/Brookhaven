local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local executorName = getexecutorname()

local Window = Fluent:CreateWindow({
    Title = "CLEITI6966 HUBS: BROOKHAVEN RP 🏡 BETA V0.7 Executor: " .. executorName,
    SubTitle = "BY CLEITI6966",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

local Tabs = {
    Main = Window:AddTab({ Title = "menu", Icon = "settings" }),
    house = Window:AddTab({ Title = "casa", Icon = "house" }),
    roleplay = Window:AddTab({ Title = "nome-bio roleplay", Icon = "user" }),
    itens = Window:AddTab({ Title = "itens", Icon = "tool" }),
    anti_auto = Window:AddTab({ Title = "anti_auto", Icon = "tool" }),
    fe_audio = Window:AddTab({ Title = "fe_audio", Icon = "tool" }),
}

local Options = Fluent.Options

Tabs.Main:AddParagraph({
    Title = "MEU DISCORD SERVER:https://discord.gg/Wykb3MKqgz",
    Content = "Aperte No Botão Para Copiar Meu Server Do Discord"
})

Tabs.Main:AddButton({
    Title = "Copiar Servidor",
    Description = "Discord Server",
    Callback = function()
        setclipboard("https://discord.gg/Wykb3MKqgz")
    end
})

Tabs.Main:AddParagraph({
    Title = "Configuração do Personagem",
    Content = "As configurações padrão do personagem, como pulo, velocidade e gravidade, não são as do Brookhaven."
})

local Character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local function ResetDefaults()
    Humanoid.WalkSpeed = 16
    game.Workspace.Gravity = 196.2
    Humanoid.JumpHeight = 50
end

Tabs.Main:AddInput("SpeedInput", {
    Title = "Velocidade",
    Default = "16",
    Placeholder = "Insira a velocidade",
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        local speed = tonumber(Value)
        if speed then
            Humanoid.WalkSpeed = speed
        end
    end
})

Tabs.Main:AddInput("GravityInput", {
    Title = "Gravidade",
    Default = "196.2",
    Placeholder = "Insira a gravidade",
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        local gravity = tonumber(Value)
        if gravity then
            game.Workspace.Gravity = gravity
        end
    end
})

Tabs.Main:AddInput("JumpInput", {
    Title = "Pulo",
    Default = "50",
    Placeholder = "Insira a altura do pulo",
    Numeric = true,
    Finished = true,
    Callback = function(Value)
        local jumpHeight = tonumber(Value)
        if jumpHeight then
            Humanoid.JumpHeight = jumpHeight
        end
    end
})

Tabs.Main:AddButton({
    Title = "Redefinir",
    Description = "Redefine a velocidade, gravidade e pulo para os padrões.",
    Callback = function()
        ResetDefaults()
    end
})

Tabs.house:AddParagraph({
    Title = "Casa",
    Content = "Opções de casa, como ser desbanido, pegar permissão etc."
})

Tabs.house:AddDropdown("PegarPermissao", {
    Title = "Pegar Permissão",
    Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
              "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
              "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
              "31", "32", "33", "34", "35", "36", "37"},
    Default = "1",
    Callback = function(selected)
        local permission = tonumber(selected)
        if permission then
            local args = {
                [1] = "GivePermissionLoopToServer",
                [2] = game:GetService("Players").LocalPlayer,
                [3] = permission
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
        end
    end
})

local function pegarPermissaoDeTodasAsCasas()
    for i = 1, 37 do
        local args = {
            [1] = "GivePermissionLoopToServer",
            [2] = game:GetService("Players").LocalPlayer,
            [3] = i
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
    end
end

Tabs.house:AddButton({
    Title = "Pegar Permissão de Todas as Casas",
    Callback = pegarPermissaoDeTodasAsCasas
})

local function removeBannedBlocks()
    local workspace = game:GetService("Workspace")
    local lots = workspace:FindFirstChild("001_Lots")

    if not lots then return end

    local bannedBlocks = {}
    for i = 1, 37 do
        table.insert(bannedBlocks, "BannedBlock" .. i)
    end

    local function checkAndRemove(child)
        if table.find(bannedBlocks, child.Name) then
            child:Destroy()
        end
    end

    lots.ChildAdded:Connect(checkAndRemove)

    for _, child in ipairs(lots:GetChildren()) do
        checkAndRemove(child)
    end
end

Tabs.house:AddButton({
    Title = "Tirar Ban de Todas as Casas",
    Callback = removeBannedBlocks
})

local isRemovingBans = false

Tabs.house:AddToggle("AutoRemoveBans", {
    Title = "Tirar Ban de Todas as Casas Automaticamente",
    Default = false,
    Callback = function(state)
        isRemovingBans = state
        if state then
            removeBannedBlocks()
        end
    end
})

Tabs.Main:AddParagraph({
    Title = "Alterar Nome E Bio",
    Content = "Nome e Bio Personalizadas"
})

-- Função para adicionar caixas de texto para nome e bio
local function addNameTextBox(title, eventName)
    local Input = Tabs.roleplay:AddInput(eventName, {
        Title = title,
        Placeholder = "Digite aqui...",
        Numeric = false,
        Finished = true,
        Callback = function(Value)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(eventName, Value)
        end
    })

    Input:OnChanged(function()
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(eventName, Input.Value)
    end)
end

-- Adicionar caixas de texto na aba RolePlay
addNameTextBox("Inserir Nome para RolePlay", "RolePlayName")
addNameTextBox("Inserir Nome para bio", "RolePlayBio")

-- Função para gerar um nome aleatório
local function generateRandomName(minLength, maxLength)
    local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomName = ""
    local length = math.random(minLength, maxLength)

    for i = 1, length do
        local index = math.random(1, #characters)
        randomName = randomName .. characters:sub(index, index)
    end

    return randomName
end

-- Função para adicionar um toggle para girar nomes aleatórios
local function addRandomNameToggle(name, eventName)
    local isGenerating = false
    local generationThread

    Tabs.roleplay:AddToggle(eventName, {
        Title = name,
        Default = false,
        Callback = function(state)
            if state then
                isGenerating = true
                generationThread = task.spawn(function()
                    while isGenerating do
                        local randomName = generateRandomName(4, 12)
                        local args = {
                            [1] = eventName,
                            [2] = randomName
                        }
                        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
                        task.wait(0.1)
                    end
                end)
            else
                isGenerating = false
                if generationThread then
                    task.cancel(generationThread)
                end
            end
        end
    })
end

-- Adicionar toggles para girar nomes aleatórios na aba RolePlay
addRandomNameToggle("Girar Nome Aleatório RP", "RolePlayName")
addRandomNameToggle("Girar Nome Aleatório bio", "RolePlayBio")

-- Função para adicionar um toggle para nome colorido
local function addColorfulNameToggle(name, eventName)
    local isColorChanging = false
    local colorChangeThread

    Tabs.roleplay:AddToggle(eventName, {
        Title = name,
        Default = false,
        Callback = function(state)
            local replicatedStorage = game:GetService("ReplicatedStorage")
            local event = replicatedStorage.RE:FindFirstChild("1RPNam1eColo1r")

            local colors = {
                Color3.new(1, 0, 0), Color3.new(0, 1, 0), Color3.new(0, 0, 1),
                Color3.new(0, 1, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 0),
                Color3.new(1, 1, 1), Color3.new(0, 0, 0)
            }

            if state then
                isColorChanging = true
                colorChangeThread = task.spawn(function()
                    while isColorChanging do
                        for _, color in ipairs(colors) do
                            local args = {
                                [1] = eventName,
                                [2] = color
                            }
                            event:FireServer(unpack(args))
                            task.wait(0.37)
                        end
                    end
                end)
            else
                isColorChanging = false
                if colorChangeThread then
                    task.cancel(colorChangeThread)
                end
            end
        end
    })
end

-- Adicionar toggles para nome colorido na aba RolePlay
addColorfulNameToggle("Nome Colorido RP", "PickingRPNameColor")
addColorfulNameToggle("Nome Colorido bio", "PickingRPBioColor")

Tabs.itens:AddParagraph({
    Title = "Itens",
    Content = "Aqui Tem Itens Funcional"
})

Tabs.itens:AddButton({
    Title = "Pegar Sofa",
    Description = "",
    Callback = function()
        local args = {
            [1] = "PickingTools",
            [2] = "Couch"
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end
})

Tabs.itens:AddButton({
    Title = "Pegar TP Tool",
    Description = "",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse()
     tool = Instance.new("Tool")
     tool.RequiresHandle = false
     tool.Name = "Tp tool (Equip to Click TP)"
     tool.Activated:connect(function()
     local pos = mouse.Hit+Vector3.new(0,2.5,0)
     pos = CFrame.new(pos.X,pos.Y,pos.Z)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
     end)
     tool.Parent = game.Players.LocalPlayer.Backpack
     end
})

Tabs.anti_auto:AddParagraph({
    Title = "Anti + Auto",
    Content = "Aqui Tem Anti kick etc"
})

Tabs.anti_auto:AddButton({
    Title = "Auto Rejoin",
    Description = "",
    Callback = function()
        local GuiService = game:GetService("GuiService")
        local Players = game:GetService("Players")
        local TeleportService = game:GetService("TeleportService")

        local player = Players.LocalPlayer

        local function onErrorMessageChanged(errorMessage)
            if errorMessage and errorMessage ~= "" then
                print("Error detected: " .. errorMessage)

                if player then
                    wait()
                    TeleportService:Teleport(game.PlaceId, player)
                end
            end
        end

        GuiService.ErrorMessageChanged:Connect(onErrorMessageChanged)
    end
})

Tabs.anti_auto:AddToggle({
    Title = "Anti Sit",
    Default = false,  
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, not Value)
        end
    end    
})

Tabs.anti_auto:AddToggle({
    Title = "Anti Void",
    Default = false,
    Callback = function(state)
        if state then
            -- Ativar proteção contra o vazio
            game.Workspace.FallenPartsDestroyHeight = 0/0
        else
            -- Desativar proteção contra o vazio
            game.Workspace.FallenPartsDestroyHeight = -9999999999999999999999
        end
    end
})

Tabs.fe_audio:AddParagraph({
    Title = "FE ÁUDIOS",
    Content = "Aqui Tem Ferramentas De Áudios"
})

Tabs.fe_audio:AddButton({
    Title = "FE BOOMBOX (Requer Gamepass)",
    Description = "",
    Callback = function()
        local player = game.Players.LocalPlayer

        -- Função que será executada após o renascimento
        local function onCharacterAdded(character)
            -- Aguarda o personagem carregar completamente
            character:WaitForChild("HumanoidRootPart")

            -- Executa a sequência de comandos após renascer
            local args = {
                [1] = "CharacterSizeDown",
                [2] = 4
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
            wait(0.1)

            local args = {
                [1] = "SkateBoard"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
            wait(0.1)

            local args = {
                [1] = "CharacterSizeUp",
                [2] = 1
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
        end

        -- Conecta a função ao evento CharacterAdded
        player.CharacterAdded:Connect(onCharacterAdded)

        -- Caso o jogador já tenha um personagem no momento do script ser executado
        if player.Character then
            onCharacterAdded(player.Character)
        end
        wait(0.1)

        -- Criar a Tool
        local backpack = player:WaitForChild("Backpack")

        local tool = Instance.new("Tool")
        tool.Name = "BoomBox"
        tool.RequiresHandle = true
        tool.Parent = backpack
        tool.TextureId = "rbxassetid://135246786635323"

        -- Criar a Handle invisível
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.Transparency = 1
        handle.CanCollide = false
        handle.Anchored = false
        handle.Parent = tool

        -- Função para enviar comandos
        local function sendUpdateAvatar()
            local args = {
                [1] = "wear",
                [2] = 18756289999
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
        end

        local function sendPickingScooterMusicText(id)
            local args = {
                [1] = "PickingScooterMusicText",
                [2] = id
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        end

        local function sendPickingScooterMusicStop()
            local args = {
                [1] = "PickingScooterMusicStop"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
        end

        -- Variável para armazenar o menu do Boombox
        local boomboxMenu

        -- Menu do Boombox
        local function createMenu()
            boomboxMenu = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
            local frame = Instance.new("Frame", boomboxMenu)
            frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            frame.BackgroundTransparency = 0.5
            frame.Size = UDim2.new(0.3, 0, 0.3, 0)
            frame.Position = UDim2.new(0.35, 0, 0.35, 0)
            frame.BorderSizePixel = 0
            frame.ClipsDescendants = true

            local title = Instance.new("TextLabel", frame)
            title.Text = "Boombox Menu"
            title.Font = Enum.Font.GothamBold
            title.TextSize = 24
            title.Size = UDim2.new(1, 0, 0.2, 0)
            title.BackgroundTransparency = 1
            title.TextColor3 = Color3.fromRGB(255, 255, 255)

            local textBox = Instance.new("TextBox", frame)
            textBox.Size = UDim2.new(0.8, 0, 0.1, 0)
            textBox.Position = UDim2.new(0.1, 0, 0.25, 0)
            textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            textBox.BackgroundTransparency = 0.5
            textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            textBox.BorderSizePixel = 0
            textBox.Text = ""

            local submitButton = Instance.new("TextButton", frame)
            submitButton.Size = UDim2.new(0.8, 0, 0.1, 0)
            submitButton.Position = UDim2.new(0.1, 0, 0.4, 0)
            submitButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            submitButton.BackgroundTransparency = 0.5
            submitButton.Text = "Tocar Áudio"
            submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            submitButton.BorderSizePixel = 0

            local stopButton = Instance.new("TextButton", frame)
            stopButton.Size = UDim2.new(0.8, 0, 0.1, 0)
            stopButton.Position = UDim2.new(0.1, 0, 0.55, 0) -- Abaixo do botão Tocar Áudio
            stopButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            stopButton.BackgroundTransparency = 0.5
            stopButton.Text = "Parar Áudio"
            stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            stopButton.BorderSizePixel = 0

            local closeButton = Instance.new("TextButton", frame)
            closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
            closeButton.Position = UDim2.new(0.9, 0, 0, 0)
            closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            closeButton.BackgroundTransparency = 0.5
            closeButton.Text = "X"
            closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            closeButton.BorderSizePixel = 0

            closeButton.MouseButton1Click:Connect(function()
                boomboxMenu:Destroy() -- Destrói o menu ao clicar no botão "X"
                boomboxMenu = nil -- Limpa a referência
            end)

            submitButton.MouseButton1Click:Connect(function()
                local inputId = textBox.Text
                if tonumber(inputId) then
                    sendPickingScooterMusicText(inputId)
                else
                    print("Por favor, insira um número válido.")
                end
            end)

            stopButton.MouseButton1Click:Connect(function()
                sendPickingScooterMusicStop() -- Chama a função para parar o áudio
            end)
        end

        -- Função para alternar entre abrir e fechar o menu do Boombox
        local function toggleMenu()
            if boomboxMenu then
                boomboxMenu:Destroy() -- Se o menu já existe, destrua-o
                boomboxMenu = nil -- Limpa a referência
            else
                createMenu() -- Se o menu não existe, crie-o
            end
        end

        -- Criar botão para abrir o menu do Boombox
        local function createOpenButton()
            local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
            local openButton = Instance.new("TextButton", screenGui)
            openButton.Size = UDim2.new(0, 50, 0, 50)  -- Tamanho quadrado
            openButton.Position = UDim2.new(0.01, 0, 0.01, 0)  -- Canto superior esquerdo
            openButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            openButton.BackgroundTransparency = 0.5
            openButton.BorderSizePixel = 0
            openButton.Text = ""
            openButton.AutoButtonColor = false
            openButton.AnchorPoint = Vector2.new(0, 0) -- Garante que o botão fique no canto

            -- Bordas arredondadas
            local corner = Instance.new("UICorner", openButton)
            corner.CornerRadius = UDim.new(0.25, 0) -- Borda arredondada

            local imageLabel = Instance.new("ImageLabel", openButton)
            imageLabel.Size = UDim2.new(1, 0, 1, 0)
            imageLabel.Image = "rbxassetid://135246786635323"
            imageLabel.BackgroundTransparency = 1

            openButton.MouseButton1Click:Connect(function()
                toggleMenu() -- Alterna entre abrir e fechar o menu do Boombox
            end)

            return openButton
        end

        local openButton -- Variável para armazenar o botão

        -- Conectar funções de equipar e desequipar
        tool.Equipped:Connect(function()
            sendUpdateAvatar()
            openButton = createOpenButton() -- Cria o botão quando a ferramenta é equipada
        end)

        tool.Unequipped:Connect(function()
            sendUpdateAvatar()
            sendPickingScooterMusicStop() -- Para o áudio ao desequipar a ferramenta
            if openButton then
                openButton.Parent:Destroy() -- Remove o botão quando a ferramenta é desequipada
                openButton = nil
            end
            if boomboxMenu then
                boomboxMenu:Destroy() -- Remove o menu do Boombox quando a ferramenta é desequipada
                boomboxMenu = nil -- Limpa a referência
            end
        end)
    end
})

Tabs.fe_audio:AddParagraph({
    Title = "FE ÁUDIOS GUN",
    Content = ""
})

Tabs.fe_audio:AddInput("IDGunInput", {
    Title = "ID Gun",
    Default = "17373737",  -- ID padrão
    Placeholder = "Insira o ID da gun",
    Numeric = false,  -- Não é necessário ser numérico
    Finished = true,
    Callback = function(inputID)
        -- Define o ID da gun para o valor inserido
        local gunID = inputID
        print("ID da gun definido como: " .. gunID)
        
        -- Adicionando o botão para tocar o áudio
        Tabs.fe_audio:AddButton({
            Title = "Tocar Áudio",
            Callback = function()
                -- Obtém o serviço ReplicatedStorage
                local ReplicatedStorage = game:GetService("ReplicatedStorage")

                -- Função para pegar e equipar a Sniper
                local function equiparSniper()
                    -- Argumentos para pegar a Sniper
                    local args = {
                        [1] = "PickingTools",
                        [2] = "Sniper"
                    }

                    -- Chama o RemoteEvent para pegar a Sniper
                    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

                    -- Espera a Sniper ser adicionada à mochila
                    local player = game:GetService("Players").LocalPlayer
                    local backpack = player:WaitForChild("Backpack")
                    local sniper = backpack:WaitForChild("Sniper")

                    -- Equipa a Sniper
                    player.Character.Humanoid:EquipTool(sniper)

                    -- Bloqueia a possibilidade de desquipar a Sniper
                    local humanoid = player.Character.Humanoid
                    local originalUnequip = humanoid.Unequipped
                    humanoid.Unequipped = function() end  -- Impede desquipar
                end

                -- Chama a função para equipar a Sniper
                equiparSniper()

                -- Comando adicional para tocar o áudio com o ID da gun inserido
                wait(1)

                local args = {
                    [1] = "workpace",  -- Substitua com o argumento correto
                    [2] = gunID,      -- Usa o ID da gun inserido
                    [3] = 1
                }

                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

                wait(4)

                -- Restaura a função original para desquipar
                local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
                humanoid.Unequipped = humanoid.Unequipped

                -- Desquita a Sniper após 4 segundos
                humanoid:UnequipTools()
            end
        })
    end
})
