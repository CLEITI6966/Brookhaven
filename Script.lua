-- Carregar a biblioteca (substitua o link se necessário)
local Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/RedzLibV5/main/Source.lua"))() :MakeWindow({
    Title = "CLEITI6966 HUBS: BROOKHAVEN RP 🏡 BETA V1 Executor: " .. getexecutorname(),
    SubTitle = "BY CLEITI6966",
    SaveFolder = "CLEITI6966 HUBS 2"
})

-----------------------------------------------------------
-- Aba 1: Menu
-----------------------------------------------------------
local TabMenu = Window:MakeTab({
    Title = "Menu",
    Icon = "settings"
})

TabMenu:AddDiscordInvite({
    Title = "CLEITI6966 HUBS",
    Desc = "Entre no meu server",
    Logo = "",
    Invite = "https://discord.gg/Wykb3MKqgz"
})

TabMenu:AddSlider({
    Title = "Velocidade",
    Min = 1,
    Max = 1000,
    Default = 16,
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = Value
        end
    end
})

TabMenu:AddSlider({
    Title = "Gravidade",
    Min = 1,
    Max = 1000,
    Default = 196.2,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

TabMenu:AddSlider({
    Title = "Altura do Pulo",
    Min = 1,
    Max = 1000,
    Default = 50,
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.JumpPower = Value
        end
    end
})

TabMenu:AddButton({
    Title = "Redefinir",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.WalkSpeed = 16
            character.Humanoid.JumpPower = 50
        end
        game.Workspace.Gravity = 196.2
    end
})

-----------------------------------------------------------
-- Aba 2: Bio-Nome
-----------------------------------------------------------
local TabBioNome = Window:MakeTab({
    Title = "Bio-Nome",
    Icon = "user"
})

TabBioNome:AddTextBox({
    Title = "Inserir Nome para RolePlay",
    Default = "",
    Callback = function(value)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayName", value)
    end
})

TabBioNome:AddTextBox({
    Title = "Inserir Nome para Bio",
    Default = "",
    Callback = function(value)
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayBio", value)
    end
})

-- Função para gerar nome aleatório
local function generateRandomName(minLength, maxLength)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local name = ""
    local length = math.random(minLength, maxLength)
    for i = 1, length do
        local index = math.random(1, #chars)
        name = name .. chars:sub(index, index)
    end
    return name
end

-- Cores pré-definidas (usando Color3.fromHSV)
local cores = {
    vermelho = Color3.fromHSV(0/360, 0.37, 1),
    verde    = Color3.fromHSV(120/360, 0.37, 1),
    azul     = Color3.fromHSV(240/360, 0.37, 1),
    amarelo  = Color3.fromHSV(60/360, 0.37, 1),
    laranja  = Color3.fromHSV(30/360, 0.37, 1)
}

-- Variáveis para controle dos toggles
local randomNameRPActive = false
local randomNameBioActive  = false
local colorNameRPActive    = false
local colorNameBioActive   = false

TabBioNome:AddToggle({
    Title = "Girar Nome Aleatório RP",
    Default = false,
    Callback = function(state)
        randomNameRPActive = state
        if state then
            spawn(function()
                while randomNameRPActive do
                    local rn = generateRandomName(4, 12)
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayName", rn)
                    wait(0.1)
                end
            end)
        end
    end
})

TabBioNome:AddToggle({
    Title = "Girar Nome Aleatório Bio",
    Default = false,
    Callback = function(state)
        randomNameBioActive = state
        if state then
            spawn(function()
                while randomNameBioActive do
                    local rn = generateRandomName(4, 12)
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer("RolePlayBio", rn)
                    wait(0.1)
                end
            end)
        end
    end
})

TabBioNome:AddToggle({
    Title = "Girar Cor Nome RP",
    Default = false,
    Callback = function(state)
        colorNameRPActive = state
        if state then
            spawn(function()
                local listaCores = { cores.vermelho, cores.verde, cores.azul, cores.amarelo, cores.laranja }
                local i = 1
                while colorNameRPActive do
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer("PickingRPNameColor", listaCores[i])
                    i = i % #listaCores + 1
                    wait(0.37)
                end
            end)
        end
    end
})

TabBioNome:AddToggle({
    Title = "Girar Cor Nome Bio",
    Default = false,
    Callback = function(state)
        colorNameBioActive = state
        if state then
            spawn(function()
                local listaCores = { cores.vermelho, cores.verde, cores.azul, cores.amarelo, cores.laranja }
                local i = 1
                while colorNameBioActive do
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer("PickingRPBioColor", listaCores[i])
                    i = i % #listaCores + 1
                    wait(0.37)
                end
            end)
        end
    end
})

-----------------------------------------------------------
-- Aba 3: Casas
-----------------------------------------------------------
local TabCasas = Window:MakeTab({
    Title = "Casas",
    Icon = "rbxassetid://10723407389"
})

TabCasas:AddDropdown({
    Title = "Pegar Permissão",
    Options = {
        "1","2","3","4","5","6","7","8","9","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37"
    },
    Default = "1",
    Callback = function(selected)
        local permission = tonumber(selected)
        if permission then
            local args = {
                [1] = "GivePermissionLoopToServer",
                [2] = game.Players.LocalPlayer,
                [3] = permission
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
        end
    end
})

local function removerBans()
    local lots = game.Workspace:FindFirstChild("001_Lots")
    if not lots then
        print("Pasta 001_Lots não encontrada!")
        return
    end

    local bannedBlocks = {}
    for i = 1, 37 do
        bannedBlocks[i] = "BannedBlock" .. i
    end

    for _, child in ipairs(lots:GetChildren()) do
        if table.find(bannedBlocks, child.Name) then
            child:Destroy()
            print("Ban removido:", child.Name)
        end
    end
    print("Remoção de bans concluída.")
end

TabCasas:AddButton({
    Title = "Tirar Ban de Todas as Casas",
    Callback = removerBans
})

local function iniciarAutoRemoveBans()
    local lots = game.Workspace:FindFirstChild("001_Lots")
    if not lots then
        print("Pasta 001_Lots não encontrada!")
        return
    end

    local bannedBlocks = {}
    for i = 1, 37 do
        bannedBlocks[i] = "BannedBlock" .. i
    end

    lots.ChildAdded:Connect(function(child)
        if table.find(bannedBlocks, child.Name) then
            child:Destroy()
            print("Ban removido:", child.Name)
        end
    end)

    for _, child in ipairs(lots:GetChildren()) do
        if table.find(bannedBlocks, child.Name) then
            child:Destroy()
            print("Ban removido:", child.Name)
        end
    end

    print("Remoção automática de bans iniciada.")
end

local autoBansAtivo = false
TabCasas:AddToggle({
    Title = "Tirar Ban de Todas as Casas Automáticamente",
    Default = false,
    Callback = function(state)
        if state then
            autoBansAtivo = true
            iniciarAutoRemoveBans()
        else
            autoBansAtivo = false
            print("Remoção automática de bans parada.")
        end
    end
})

-----------------------------------------------------------
-- Aba 4: Ferramentas
-----------------------------------------------------------
local TabFerramentas = Window:MakeTab({
    Title = "Ferramentas",
    Icon = "rbxassetid://10723407389"
})

TabFerramentas:AddButton({
    Title = "Pegar Sofá",
    Callback = function()
        local args = { "PickingTools", "Couch" }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end
})

TabFerramentas:AddButton({
    Title = "Pegar Tp Tool",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "tp tool"
        tool.Activated:Connect(function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.Position)
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

-----------------------------------------------------------
-- Aba 5: Anti
-----------------------------------------------------------
local TabAnti = Window:MakeTab({
    Title = "Anti",
    Icon = "rbxassetid://10723407389"
})

TabAnti:AddToggle({
    Title = "Anti Sit",
    Default = false,
    Callback = function(state)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:SetStateEnabled("Seated", not state)
        else
            print("Erro: Personagem não encontrado.")
        end
    end
})

local voidProtectionEnabled = false
local function ativarAntiVoid()
    voidProtectionEnabled = true
    game.Workspace.FallenPartsDestroyHeight = 0/0  -- Forçando NaN
end

TabAnti:AddButton({
    Title = "Ativar Anti Void",
    Callback = ativarAntiVoid
})

-----------------------------------------------------------
-- Aba 6: Auto
-----------------------------------------------------------
local TabAuto = Window:MakeTab({
    Title = "Auto",
    Icon = "user"
})

local function autoRenjon()
    local GuiService = game:GetService("GuiService")
    local TeleportService = game:GetService("TeleportService")
    local player = game.Players.LocalPlayer

    GuiService.ErrorMessageChanged:Connect(function(errorMessage)
        if errorMessage and errorMessage ~= "" then
            print("Error detected: " .. errorMessage)
            wait()
            TeleportService:Teleport(game.PlaceId, player)
        end
    end)
end

TabAuto:AddButton({
    Title = "Auto Renjon",
    Callback = autoRenjon
})

-----------------------------------------------------------
-- Aba 7: Lag
-----------------------------------------------------------
local TabLag = Window:MakeTab({
    Title = "Lag",
    Icon = "lag"
})

TabLag:AddButton({
    Title = "Lag Server",
    Callback = function()
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local BtnScript = Instance.new("TextButton")
        local CloseBtn = Instance.new("TextButton")
        local LabelCount = Instance.new("TextLabel")
        
        ScreenGui.Parent = game.CoreGui
        
        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.Size = UDim2.new(0, 200, 0, 120)
        Frame.Position = UDim2.new(0.5, -100, 0.5, -60)
        Frame.Active = true
        Frame.Draggable = true
        
        BtnScript.Parent = Frame
        BtnScript.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        BtnScript.Size = UDim2.new(1, 0, 0.4, 0)
        BtnScript.Text = "Iniciar Script"
        BtnScript.Font = Enum.Font.SourceSansBold
        BtnScript.TextSize = 20
        BtnScript.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        CloseBtn.Parent = Frame
        CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        CloseBtn.Size = UDim2.new(0, 30, 0, 30)
        CloseBtn.Position = UDim2.new(1, -30, 0, 0)
        CloseBtn.Text = "X"
        CloseBtn.TextSize = 20
        CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        LabelCount.Parent = Frame
        LabelCount.BackgroundTransparency = 1
        LabelCount.Size = UDim2.new(1, 0, 0.6, 0)
        LabelCount.Position = UDim2.new(0, 0, 0.4, 0)
        LabelCount.Text = "Itens Coletados: 0"
        LabelCount.TextSize = 16
        LabelCount.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelCount.TextYAlignment = Enum.TextYAlignment.Top
        
        CloseBtn.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)
        
        local itemName = "iPhone"
        local ghostMeterName = "GhostMeter"
        local scriptRunning = false
        local itemCount = 0
        
        local function clickDetectorTrigger(object)
            local cd = object:FindFirstChildWhichIsA("ClickDetector")
            if cd then fireclickdetector(cd) end
        end
        
        local function findItem(pathName, nome)
            local path = workspace:FindFirstChild(pathName)
            if path then
                path = path:FindFirstChild("001_GiveTools")
                if path then return path:FindFirstChild(nome) end
            end
            return nil
        end
        
        local function stopScript()
            scriptRunning = false
        end
        
        local function startScript()
            local itemObj = findItem("WorkspaceCom", itemName)
            local ghostObj = findItem("WorkspaceCom", ghostMeterName)
            if itemObj then
                while scriptRunning do
                    if itemCount >= 9999 then
                        stopScript()
                        BtnScript.Text = "Iniciar Script"
                        break
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = itemObj.CFrame
                    clickDetectorTrigger(itemObj)
                    itemCount = itemCount + 1
                    LabelCount.Text = "Itens Coletados: " .. itemCount
                    wait(0.1)
                end
            elseif ghostObj then
                while scriptRunning do
                    if itemCount >= 999999 then
                        stopScript()
                        BtnScript.Text = "Iniciar Script"
                        break
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ghostObj.CFrame
                    clickDetectorTrigger(ghostObj)
                    itemCount = itemCount + 1
                    LabelCount.Text = "Itens Coletados: " .. itemCount
                    wait(0.1)
                end
            else
                warn("Item '" .. itemName .. "' e '" .. ghostMeterName .. "' não encontrados.")
            end
        end
        
        BtnScript.MouseButton1Click:Connect(function()
            if scriptRunning then
                stopScript()
                BtnScript.Text = "Iniciar Script"
            else
                scriptRunning = true
                BtnScript.Text = "Parar Script"
                startScript()
            end
        end)
        
        game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
            if not processed and input.KeyCode == Enum.KeyCode.B then
                for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    item:Destroy()
                end
            end
        end)
    end
})

TabLag:AddButton({
    Title = "Esvaziar Inventário",
    Callback = function()
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            item:Destroy()
        end
    end
})

-----------------------------------------------------------
-- Aba 8: Visual/Cliente
-----------------------------------------------------------
local TabVisual = Window:MakeTab({
    Title = "Visual/Cliente",
    Icon = "user"
})

local espEnabled = false

local function createESP(player)
    if not (player.Character and player.Character:FindFirstChild("Head")) then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = player.Character.Head
    billboard.Size = UDim2.new(5, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.Adornee = player.Character.Head
    billboard.AlwaysOnTop = true

    local infoLabel = Instance.new("TextLabel")
    infoLabel.Parent = billboard
    infoLabel.Size = UDim2.new(1, 0, 1, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextStrokeTransparency = 0.5
    infoLabel.TextColor3 = Color3.new(1,1,1)
    infoLabel.Font = Enum.Font.SourceSansBold
    infoLabel.TextSize = 15

    local function updateLabel()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            infoLabel.Text = string.format("%s - %d studs - %d dias", player.Name, math.floor(dist), player.AccountAge)
        end
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        if espEnabled then
            updateLabel()
        else
            billboard:Destroy()
        end
    end)
end

local function toggleESP(state)
    espEnabled = state
    if espEnabled then
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer then
                createESP(plr)
            end
        end
    else
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
                local bill = plr.Character.Head:FindFirstChildOfClass("BillboardGui")
                if bill then bill:Destroy() end
            end
        end
    end
end

TabVisual:AddToggle({
    Title = "ESP CLEITI6966",
    Default = false,
    Callback = toggleESP
})

TabVisual:AddButton({
    Title = "Bring All Parts",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/Brookhaven/refs/heads/main/bring%20all%20parts.lua"))()
    end
})

-----------------------------------------------------------
-- Aba 10: Outros
-----------------------------------------------------------
local TabOutros = Window:MakeTab({
    Title = "Outros",
    Icon = "settings"
})

TabOutros:AddButton({
    Title = "Fly (Mobile)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/fly.lua"))()
    end
})

TabOutros:AddButton({
    Title = "Vfly (Mobile)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/vfly.lua"))()
    end
})
