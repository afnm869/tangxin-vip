local NotificationLib = loadstring(game:HttpGet("https://pastefy.app/E7lh5Lk3/raw"))()

NotificationLib:Notification({
    Title = "NOL | 森林中的99夜",
    Text = "欢迎使用NOL脚本",
    Duration = 5
})

wait(1)

NotificationLib:Notification({
    Title = "NOL | 森林中的99夜",
    Text = "此服务器为森林中的99夜",
    Duration = 5
})

wait(1)
local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
NotificationLib:Notification({
    Title = "NOL | 森林中的99夜",
    Text = "已自动开启防挂机",
    Duration = 5
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local XXXIIIIPPPRRROOO = 0

local toolsDamageIDs = {
    ["Old Axe"] = "3_7367831688",
    ["Good Axe"] = "112_7367831688",
    ["Strong Axe"] = "116_7367831688",
    ["Chainsaw"] = "647_8992824875",
    ["Spear"] = "196_8999010016"
}

local autoFeedxipro = false
local ShenChouFood = "Carrot"
local hungerThreshold = 75
local alwaysFeedXXIIPPRROOItems = {}
local alimentos = {
    "Apple",
    "Berry",
    "Carrot",
    "Cake",
    "Chili",
    "Cooked Morsel",
    "Cooked Steak"
}

local ie = {
    "Bandage", "Bolt", "Broken Fan", "Broken Microwave", "Cake", "Carrot", "Chair", "Coal", "Coin Stack",
    "Cooked Morsel", "Cooked Steak", "Fuel Canister", "Iron Body", "Leather Armor", "Log", "MadKit", "Metal Chair",
    "MedKit", "Old Car Engine", "Old Flashlight", "Old Radio", "Revolver", "Revolver Ammo", "Rifle", "Rifle Ammo",
    "Morsel", "Sheet Metal", "Steak", "Tyre", "Washing Machine"
}
local me = {"Bunny", "Wolf", "Alpha Wolf", "Bear", "Cultist", "Crossbow Cultist", "Alien"}

local junkItems = {"Tyre", "Bolt", "Broken Fan", "Broken Microwave", "Sheet Metal", "Old Radio", "Washing Machine", "Old Car Engine"}
local ShenChouJunkItems = {}
local fuelItems = {"Log", "Chair", "Coal", "Fuel Canister", "Oil Barrel"}
local ShenChouFuelItems = {}
local foodItems = {"Cake", "Cooked Steak", "Cooked Morsel", "Steak", "Morsel", "Berry", "Carrot"}
local ShenChouFoodItems = {}
local medicalItems = {"Bandage", "MedKit"}
local ShenChouMedicalItems = {}
local equipmentItems = {"Revolver", "Rifle", "Leather Body", "Iron Body", "Revolver Ammo", "Rifle Ammo", "Giant Sack", "Good Sack", "Strong Axe", "Good Axe"}
local ShenChouEquipmentItems = {}

local campfireFuelItems = {"Log", "Coal", "Fuel Canister", "Oil Barrel", "Biofuel"}
local campfireDropPos = Vector3.new(0, 19, 0)

local autocookItems = {"Morsel", "Steak"}
local autoCookxiproItems = {}
local autoCookxipro = false

function wiki(nome)
    local c = 0
    for _, i in ipairs(Workspace.Items:GetChildren()) do
        if i.Name == nome then
            c = c + 1
        end
    end
    return c
end

function ghn()
    return math.floor(LocalPlayer.PlayerGui.Interface.StatBars.HungerBar.Bar.Size.X.Scale * 100)
end

function feed(nome)
    for _, item in ipairs(Workspace.Items:GetChildren()) do
        if item.Name == nome then
            ReplicatedStorage.RemoteEvents.RequestConsumeItem:InvokeServer(item)
            break
        end
    end
end

function notifeed(nome)
    WindUI:Notify({
        Title = "自动食物停止",
        Content = "原因食物没了",
        Duration = 3
    })
end

local function moveItemToPos(item, position)
    if not item or not item:IsDescendantOf(workspace) or not item:IsA("BasePart") and not item:IsA("Model") then return end
    local part = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart") or item:FindFirstChild("Handle")) or item
    if not part or not part:IsA("BasePart") then return end

    if item:IsA("Model") and not item.PrimaryPart then
        pcall(function() item.PrimaryPart = part end)
    end

    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").RequestStartDraggingItem:FireServer(item)
        if item:IsA("Model") then
            item:SetPrimaryPartCFrame(CFrame.new(position))
        else
            part.CFrame = CFrame.new(position)
        end
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents").StopDraggingItem:FireServer(item)
    end)
end

local function getChests()
    local chests = {}
    local chestNames = {}
    local index = 1
    for _, item in ipairs(workspace:WaitForChild("Items"):GetChildren()) do
        if item.Name:match("^Item Chest") and not item:GetAttribute("8721081708Opened") then
            table.insert(chests, item)
            table.insert(chestNames, "Chest " .. index)
            index = index + 1
        end
    end
    return chests, chestNames
end

local currentChests, currentChestNames = getChests()
local ShenChouChest = currentChestNames[1] or nil

local function getMobs()
    local mobs = {}
    local mobNames = {}
    local index = 1
    for _, character in ipairs(workspace:WaitForChild("Characters"):GetChildren()) do
        if character.Name:match("^Lost Child") and character:GetAttribute("Lost") == true then
            table.insert(mobs, character)
            table.insert(mobNames, character.Name)
            index = index + 1
        end
    end
    return mobs, mobNames
end

local currentMobs, currentMobNames = getMobs()
local ShenChouMob = currentMobNames[1] or nil

function tp1()
	(game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame =
CFrame.new(0.43132782, 15.77634621, -1.88620758, -0.270917892, 0.102997094, 0.957076371, 0.639657021, 0.762253821, 0.0990355015, -0.719334781, 0.639031112, -0.272391081)
end

local function tp2()
    local targetPart = workspace:FindFirstChild("Map")
        and workspace.Map:FindFirstChild("Landmarks")
        and workspace.Map.Landmarks:FindFirstChild("Stronghold")
        and workspace.Map.Landmarks.Stronghold:FindFirstChild("Functional")
        and workspace.Map.Landmarks.Stronghold.Functional:FindFirstChild("EntryDoors")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors:FindFirstChild("DoorRight")
        and workspace.Map.Landmarks.Stronghold.Functional.EntryDoors.DoorRight:FindFirstChild("Model")
    if targetPart then
        local children = targetPart:GetChildren()
        local destination = children[5]
        if destination and destination:IsA("BasePart") then
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = destination.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end

local flyToggle = false
local flySpeed = 1
local FLYING = false
local flyKeyDown, flyKeyUp, mfly1, mfly2
local IYMouse = game:GetService("UserInputService")

local function sFLY()
    repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat task.wait() until IYMouse
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect(); flyKeyUp:Disconnect() end

    local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = flySpeed

    local function FLY()
        FLYING = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.CFrame = T.CFrame
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            while FLYING do
                task.wait()
                if not flyToggle and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = flySpeed
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.Velocity = Vector3.new(0, 0, 0)
                end
                BG.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = IYMouse.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = flySpeed
            elseif KEY == "S" then
                CONTROL.B = -flySpeed
            elseif KEY == "A" then
                CONTROL.L = -flySpeed
            elseif KEY == "D" then 
                CONTROL.R = flySpeed
            elseif KEY == "E" then
                CONTROL.Q = flySpeed * 2
            elseif KEY == "Q" then
                CONTROL.E = -flySpeed * 2
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end
    end)
    flyKeyUp = IYMouse.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = 0
            elseif KEY == "S" then
                CONTROL.B = 0
            elseif KEY == "A" then
                CONTROL.L = 0
            elseif KEY == "D" then
                CONTROL.R = 0
            elseif KEY == "E" then
                CONTROL.Q = 0
            elseif KEY == "Q" then
                CONTROL.E = 0
            end
        end
    end)
    FLY()
end

local function NOFLY()
    FLYING = false
    if flyKeyDown then flyKeyDown:Disconnect() end
    if flyKeyUp then flyKeyUp:Disconnect() end
    if mfly1 then mfly1:Disconnect() end
    if mfly2 then mfly2:Disconnect() end
    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local function UnMobileFly()
    pcall(function()
        FLYING = false
        local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        if root:FindFirstChild("BodyVelocity") then root:FindFirstChild("BodyVelocity"):Destroy() end
        if root:FindFirstChild("BodyGyro") then root:FindFirstChild("BodyGyro"):Destroy() end
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
            Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
        end
        if mfly1 then mfly1:Disconnect() end
        if mfly2 then mfly2:Disconnect() end
    end)
end

local function MobileFly()
    UnMobileFly()
    FLYING = true

    local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    local v3none = Vector3.new()
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

    local controlModule = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local bv = Instance.new("BodyVelocity")
    bv.Name = "BodyVelocity"
    bv.Parent = root
    bv.MaxForce = v3zero
    bv.Velocity = v3zero

    local bg = Instance.new("BodyGyro")
    bg.Name = "BodyGyro"
    bg.Parent = root
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    mfly1 = Players.LocalPlayer.CharacterAdded:Connect(function()
        local newRoot = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local newBv = Instance.new("BodyVelocity")
        newBv.Name = "BodyVelocity"
        newBv.Parent = newRoot
        newBv.MaxForce = v3zero
        newBv.Velocity = v3zero

        local newBg = Instance.new("BodyGyro")
        newBg.Name = "BodyGyro"
        newBg.Parent = newRoot
        newBg.MaxTorque = v3inf
        newBg.P = 1000
        newBg.D = 50
    end)

    mfly2 = game:GetService("RunService").RenderStepped:Connect(function()
        root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        camera = workspace.CurrentCamera
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild("BodyVelocity") and root:FindFirstChild("BodyGyro") then
            local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local VelocityHandler = root:FindFirstChild("BodyVelocity")
            local GyroHandler = root:FindFirstChild("BodyGyro")

            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            humanoid.PlatformStand = true
            GyroHandler.CFrame = camera.CoordinateFrame
            VelocityHandler.Velocity = v3none

            local direction = controlModule:GetMoveVector()
            if direction.X > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (flySpeed * 50))
            end
            if direction.X < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (flySpeed * 50))
            end
            if direction.Z > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed * 50))
            end
            if direction.Z < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (flySpeed * 50))
            end
        end
    end)
end

local WindUI = loadstring(game:HttpGet("https://pastefy.app/3QIMigH9/raw"))()

local Window =
    WindUI:CreateWindow(
    {
        Title = "<font color='#00FF00'>NOL</font> / 在森林的99夜",
        IconThemed = true,
        Author = "NOL  |  Team",
        Folder = "NOL",
        Size = UDim2.fromOffset(300, 270),
        Transparent = true,
        Theme = "Dark",
        User = {
            Enabled = true,
            Callback = function()
            end,
            Anonymous = false
        },
        SideBarWidth = 200,
        HideSearchBar = true,
        ScrollBarEnabled = true,
        Background = "rbxassetid://112405024892558"
    }
)

Window:EditOpenButton({
    Title = "NOL SCRIPT",
    Icon = "monitor",
    CornerRadius = UDim.new(3,20),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
        ColorSequenceKeypoint.new(0.16, Color3.fromHex("FF7F00")),
        ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
        ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
        ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("9400D3"))
    }),
    Draggable = true,
})
})



local MainSection = Window:Section({
    Title = "打开/关闭功能栏",
    Opened = true
})

local about = MainSection:Tab({ 
       Title = "人物调节", 
       PremiumOnly = true
})

-- 速度控制模块
local speedControl = {
    connections = {},
    speed = Instance.new("NumberValue"),
    enabled = false
}

-- 初始化速度值
speedControl.speed.Value = 16

-- 应用速度函数
function speedControl:applySpeed()
    pcall(function()
        if self.character and self.character:FindFirstChildOfClass("Humanoid") then
            self.character.Humanoid.WalkSpeed = self.speed.Value
        end
    end)
end

about:Slider({
    Title = "设置速度",
    Description = "SpeedSlider",
    Value = { Min = 16, Max = 400, Default = 16 },
    Callback = function(Value)
        speedControl.speed.Value = Value
    end
})

-- 速度开关
about:Toggle({
    Title = "速度(开/关)",
    Description = "SpeedToggle",
    Default = false,
    Callback = function(state)
        speedControl.enabled = state
        
        -- 清理旧连接
        for _, conn in pairs(speedControl.connections) do
            conn:Disconnect()
        end
        speedControl.connections = {}
        
        if state then
            -- 获取当前角色
            speedControl.character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
            
            -- 速度变化监听
            table.insert(speedControl.connections, speedControl.speed.Changed:Connect(function()
                speedControl:applySpeed()
            end))
            
            -- 角色变化监听
            table.insert(speedControl.connections, game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
                speedControl.character = char
                char:WaitForChild("Humanoid")
                speedControl:applySpeed()
                
                -- 速度属性变化监听
                table.insert(speedControl.connections, char.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if speedControl.enabled then
                        speedControl:applySpeed()
                    end
                end))
            end))
            
            -- 初始应用速度
            speedControl:applySpeed()
            
            -- 当前角色的速度属性监听
            if speedControl.character:FindFirstChildOfClass("Humanoid") then
                table.insert(speedControl.connections, 
                    speedControl.character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                        if speedControl.enabled then
                            speedControl:applySpeed()
                        end
                    end))
            end
        else
            -- 关闭时恢复默认速度
            pcall(function()
                if speedControl.character and speedControl.character:FindFirstChildOfClass("Humanoid") then
                    speedControl.character.Humanoid.WalkSpeed = 16
                end
            end)
        end
    end
})

-- Enhanced Night Vision System
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- Configuration
local NightVision = {
    Active = false,
    Brightness = 1,
    UpdateInterval = 0.2,
    OriginalSettings = {
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime
    },
    Connection = nil
}

-- Brightness Control
about:Slider({
    Title = "夜视亮度调节",
    Description = "NV_Brightness",
    Value = { Min = 1, Max = 20, Default = 1 },
    Callback = function(Value)
        NightVision.Brightness = Value
        if NightVision.Active then
            Lighting.Brightness = Value
        end
    end
})

-- Night Vision Toggle
about:Toggle({
    Title = "夜视(开/关)",
    Description = "NV_Toggle",
    Default = false,
    Callback = function(Enabled)
        -- Cleanup previous connection
        if NightVision.Connection then
            NightVision.Connection:Disconnect()
            NightVision.Connection = nil
        end

        NightVision.Active = Enabled

        if Enabled then
            -- Apply immediately
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            Lighting.Brightness = NightVision.Brightness
            Lighting.ClockTime = 12 -- Set to midday for best visibility

            -- Maintain settings against game resets
            NightVision.Connection = RunService.Heartbeat:Connect(function()
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
                Lighting.Brightness = NightVision.Brightness
            end)
        else
            -- Restore original settings
            for setting, value in pairs(NightVision.OriginalSettings) do
                Lighting[setting] = value
            end
        end
    end
})
about:Slider({
    Title = "飞行速度",
    Value = { Min = 1, Max = 20, Default = 1 },
    Callback = function(value)
        flySpeed = value
        if FLYING then
            task.spawn(function()
                while FLYING do
                    task.wait(0.1)
                    if game:GetService("UserInputService").TouchEnabled then
                        local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if root and root:FindFirstChild("BodyVelocity") then
                            local bv = root:FindFirstChild("BodyVelocity")
                            bv.Velocity = bv.Velocity.Unit * (flySpeed * 50)
                        end
                    end
                end
            end)
        end
    end
})

about:Toggle({
    Title = "飞行(开/关)",
    Value = false,
    Callback = function(state)
        flyToggle = state
        if flyToggle then
            if game:GetService("UserInputService").TouchEnabled then
                MobileFly()
            else
                sFLY()
            end
        else
            NOFLY()
            UnMobileFly()
        end
    end
})
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- 雾效控制器模块
local FogController = {
    _originalFogEnd = Lighting.FogEnd,
    _originalAtmospheres = {},
    _active = false,
    _connection = nil
}

-- 初始化保存原始大气效果
for _, obj in pairs(Lighting:GetDescendants()) do
    if obj:IsA("Atmosphere") then
        table.insert(FogController._originalAtmospheres, obj:Clone())
    end
end

-- 更新雾效状态
function FogController:UpdateFog(state)
    if state then
        -- 启用无雾模式
        Lighting.FogEnd = 100000
        
        -- 移除所有大气效果
        for _, obj in pairs(Lighting:GetDescendants()) do
            if obj:IsA("Atmosphere") then
                obj:Destroy()
            end
        end
    else
        -- 恢复原始设置
        Lighting.FogEnd = self._originalFogEnd
        
        -- 恢复大气效果
        for _, atmosphere in pairs(self._originalAtmospheres) do
            atmosphere:Clone().Parent = Lighting
        end
    end
end

-- 设置激活状态
function FogController:SetActive(state)
    self._active = state
    
    -- 清理现有连接
    if self._connection then
        self._connection:Disconnect()
        self._connection = nil
    end
    
    -- 立即应用状态
    self:UpdateFog(state)
    
    -- 持续保护模式
    if state then
        self._connection = RunService.Heartbeat:Connect(function()
            if Lighting.FogEnd ~= 100000 then
                Lighting.FogEnd = 100000
            end
            
            -- 检查并移除新生成的大气效果
            for _, obj in pairs(Lighting:GetDescendants()) do
                if obj:IsA("Atmosphere") then
                    obj:Destroy()
                end
            end
        end)
    end
end

about:Toggle({
    Title = "除雾",
    Description = "demist",
    Default = false,
    Callback = function(state)
        FogController:SetActive(state)
    end
})

about:Toggle({
    Title = "无阴影",
    Description = "",
    Default = false,
    Callback = function(v)
        game:GetService("Lighting").GlobalShadows = not v and true or false
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local noclipConnection

about:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(state)
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = Players.LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local infJumpConnection

about:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(state)
        if state then
            infJumpConnection = UserInputService.JumpRequest:Connect(function()
                local char = Players.LocalPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if infJumpConnection then
                infJumpConnection:Disconnect()
                infJumpConnection = nil
            end
        end
    end
})

local instantInteractxipro = false
local instantInteractConnection
local originalHoldDurations = {}

about:Toggle({
    Title = "秒互动",
    Value = false,
    Callback = function(state)
        instantInteractxipro = state

        if state then
            originalHoldDurations = {}
            instantInteractConnection = task.spawn(function()
                while instantInteractxipro do
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") then
                            if originalHoldDurations[obj] == nil then
                                originalHoldDurations[obj] = obj.HoldDuration
                            end
                            obj.HoldDuration = 0
                        end
                    end
                    task.wait(0.5)
                end
            end)
        else
            if instantInteractConnection then
                instantInteractxipro = false
            end
            for obj, value in pairs(originalHoldDurations) do
                if obj and obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = value
                end
            end
            originalHoldDurations = {}
        end
    end
})

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local torchxipro = nil

about:Toggle({
    Title = "自动眩晕鹿",
    Value = false,
    Callback = function(state)
        if state then
            torchxipro = RunService.RenderStepped:Connect(function()
                pcall(function()
                    local remote = ReplicatedStorage:FindFirstChild("RemoteEvents")
                        and ReplicatedStorage.RemoteEvents:FindFirstChild("DeerHitByTorch")
                    local deer = workspace:FindFirstChild("Characters")
                        and workspace.Characters:FindFirstChild("Deer")
                    if remote and deer then
                        remote:InvokeServer(deer)
                    end
                end)
                task.wait(0.1)
            end)
        else
            if torchxipro then
                torchxipro:Disconnect()
                torchxipro = nil
            end
        end
    end
})
local about = MainSection:Tab({ 
       Title = "光环功能", 
       PremiumOnly = true
})

-- 设置默认值
local DefaultChopTreeDistance = 20
local DefaultKillAuraDistance = 20

-- 初始化变量
if not DistanceForAutoChopTree then
    DistanceForAutoChopTree = DefaultChopTreeDistance
end
if not DistanceForKillAura then
    DistanceForKillAura = DefaultKillAuraDistance
end

about:Input({
    Title = "自动砍树范围",
    Value = tostring(DefaultChopTreeDistance),
    Callback = function(value)
        -- 将输入值转换为数字类型
        local numValue = tonumber(value)
        if numValue then
            DistanceForAutoChopTree = numValue
        else
            warn("请输入有效的数字！")
        end
    end
})

about:Toggle({
    Title = "自动砍树",
    Description = "少羽牛逼",
    Default = false,
    Callback = function(Value)
        ActiveAutoChopTree = Value
        task.spawn(function()
            while ActiveAutoChopTree do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
                local weapon = (player.Inventory:FindFirstChild("Old Axe") or player.Inventory:FindFirstChild("Good Axe") or player.Inventory:FindFirstChild("Strong Axe") or player.Inventory:FindFirstChild("Chainsaw"))
                
                task.spawn(function()
                    for _, tree in pairs(workspace.Map.Foliage:GetChildren()) do
                        if tree:IsA("Model") and (tree.Name == "Small Tree" or tree.Name == "TreeBig1" or tree.Name == "TreeBig2") and tree.PrimaryPart then
                            local distance = (tree.PrimaryPart.Position - hrp.Position).Magnitude
                            if distance <= DistanceForAutoChopTree then
                                game:GetService("ReplicatedStorage").RemoteEvents.ToolDamageObject:InvokeServer(tree, weapon, 999, hrp.CFrame)
                            end
                        end
                    end
                end)
                
                task.spawn(function()
                    for _, tree in pairs(workspace.Map.Landmarks:GetChildren()) do
                        if tree:IsA("Model") and (tree.Name == "Small Tree" or tree.Name == "TreeBig1" or tree.Name == "TreeBig2") and tree.PrimaryPart then
                            local distance = (tree.PrimaryPart.Position - hrp.Position).Magnitude
                            if distance <= DistanceForAutoChopTree then
                                game:GetService("ReplicatedStorage").RemoteEvents.ToolDamageObject:InvokeServer(tree, weapon, 999, hrp.CFrame)
                            end
                        end
                    end
                end)
                
                task.wait(0.1)
            end
        end)
    end
})

about:Input({
    Title = "杀戮光环攻击范围",
    Value = tostring(DefaultKillAuraDistance),
    Callback = function(value)
        -- 将输入值转换为数字类型
        local numValue = tonumber(value)
        if numValue then
            DistanceForKillAura = numValue
        else
            warn("请输入有效的数字！")
        end
    end
})

about:Toggle({
    Title = "杀戮光环",
    Description = "少羽牛逼",
    Default = false,
    Callback = function(Value)
        ActiveKillAura = Value
        task.spawn(function()
            while ActiveKillAura do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local hrp = character:WaitForChild("HumanoidRootPart")
                local weapon = (player.Inventory:FindFirstChild("Old Axe") or 
                               player.Inventory:FindFirstChild("Good Axe") or 
                               player.Inventory:FindFirstChild("Strong Axe") or 
                               player.Inventory:FindFirstChild("Chainsaw") or 
                               player.Inventory:FindFirstChild("Morningstar") or 
                               player.Inventory:FindFirstChild("Spear"))
                
                task.spawn(function()
                    for _, enemy in pairs(workspace.Characters:GetChildren()) do
                        if enemy:IsA("Model") and enemy.PrimaryPart then
                            local distance = (enemy.PrimaryPart.Position - hrp.Position).Magnitude
                            if distance <= DistanceForKillAura then
                                game:GetService("ReplicatedStorage").RemoteEvents.ToolDamageObject:InvokeServer(enemy, weapon, 999, hrp.CFrame)
                            end
                        end
                    end
                end)
                
                task.wait(0.1)
            end
        end)
    end
})

local about = MainSection:Tab({ 
       Title = "透视功能", 
       PremiumOnly = true
})

local hitboxSettings = {
    Wolf = false,
    Bunny = false,
    Cultist = false,
    All = false,
    Show = false,
    Size = 10
}

local function updateHitboxForModel(model)
    local root = model:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local name = model.Name:lower()

    if hitboxSettings.All then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = hitboxSettings.Show and 0.5 or 1
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
        return
    end

    local shouldResize =
        (hitboxSettings.Wolf and (name:find("wolf") or name:find("alpha"))) or
        (hitboxSettings.Bunny and name:find("bunny")) or
        (hitboxSettings.Cultist and (name:find("cultist") or name:find("cross")))

    if shouldResize then
        root.Size = Vector3.new(hitboxSettings.Size, hitboxSettings.Size, hitboxSettings.Size)
        root.Transparency = hitboxSettings.Show and 0.5 or 1
        root.Color = Color3.fromRGB(255, 255, 255)
        root.Material = Enum.Material.Neon
        root.CanCollide = false
    end
end

task.spawn(function()
    while true do
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
                updateHitboxForModel(model)
            end
        end
        task.wait(2)
    end
end)


function createESPText(part, text, color)
    if part:FindFirstChild("ESPTexto") then return end

    local esp = Instance.new("BillboardGui")
    esp.Name = "ESPTexto"
    esp.Adornee = part
    esp.Size = UDim2.new(0, 100, 0, 20)
    esp.StudsOffset = Vector3.new(0, 2.5, 0)
    esp.AlwaysOnTop = true
    esp.MaxDistance = 300

    local label = Instance.new("TextLabel")
    label.Parent = esp
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255,255,0)
    label.TextStrokeTransparency = 0.2
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold

    esp.Parent = part
end

local function Aesp(nome, tipo)
    local container
    local color
    if tipo == "item" then
        container = workspace:FindFirstChild("Items")
        color = Color3.fromRGB(0, 255, 0)
    elseif tipo == "mob" then
        container = workspace:FindFirstChild("Characters")
        color = Color3.fromRGB(255, 255, 0)
    else
        return
    end
    if not container then return end

    for _, obj in ipairs(container:GetChildren()) do
        if obj.Name == nome then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                createESPText(part, obj.Name, color)
            end
        end
    end
end

local function Desp(nome, tipo)
    local container
    if tipo == "item" then
        container = workspace:FindFirstChild("Items")
    elseif tipo == "mob" then
        container = workspace:FindFirstChild("Characters")
    else
        return
    end
    if not container then return end

    for _, obj in ipairs(container:GetChildren()) do
        if obj.Name == nome then
            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
            if part then
                for _, gui in ipairs(part:GetChildren()) do
                    if gui:IsA("BillboardGui") and gui.Name == "ESPTexto" then
                        gui:Destroy()
                    end
                end
            end
        end
    end
end

local ShenChouItems = {}
local ShenChouMobs = {}
local espItemsxipro = false
local espMobsxipro = false
local espConnections = {}

about:Dropdown({
    Title = "选择你要透视的物品",
    Values = ie,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouItems = options
        if espItemsxipro then
            for _, name in ipairs(ie) do
                if table.find(ShenChouItems, name) then
                    Aesp(name, "item")
                else
                    Desp(name, "item")
                end
            end
        else
            for _, name in ipairs(ie) do
                Desp(name, "item")
            end
        end
    end
})

about:Toggle({
    Title = "透视物品",
    Value = false,
    Callback = function(state)
        espItemsxipro = state
        for _, name in ipairs(ie) do
            if state and table.find(ShenChouItems, name) then
                Aesp(name, "item")
            else
                Desp(name, "item")
            end
        end

        if state then
            if not espConnections["Items"] then
                local container = workspace:FindFirstChild("Items")
                if container then
                    espConnections["Items"] = container.ChildAdded:Connect(function(obj)
                        if table.find(ShenChouItems, obj.Name) then
                            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if part then
                                createESP(part, obj.Name, Color3.fromRGB(0, 255, 0))
                            end
                        end
                    end)
                end
            end
        else
            if espConnections["Items"] then
                espConnections["Items"]:Disconnect()
                espConnections["Items"] = nil
            end
        end
    end
})

about:Dropdown({
    Title = "选择你要透视的实体",
    Values = me,
    Value = {},
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouMobs = options
        if espMobsxipro then
            for _, name in ipairs(me) do
                if table.find(ShenChouMobs, name) then
                    Aesp(name, "mob")
                else
                    Desp(name, "mob")
                end
            end
        else
            for _, name in ipairs(me) do
                Desp(name, "mob")
            end
        end
    end
})

about:Toggle({
    Title = "透视实体",
    Value = false,
    Callback = function(state)
        espMobsxipro = state
        for _, name in ipairs(me) do
            if state and table.find(ShenChouMobs, name) then
                Aesp(name, "mob")
            else
                Desp(name, "mob")
            end
        end

        if state then
            if not espConnections["Mobs"] then
                local container = workspace:FindFirstChild("Characters")
                if container then
                    espConnections["Mobs"] = container.ChildAdded:Connect(function(obj)
                        if table.find(ShenChouMobs, obj.Name) then
                            local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                            if part then
                                createESP(part, obj.Name, Color3.fromRGB(255, 255, 0))
                            end
                        end
                    end)
                end
            end
        else
            if espConnections["Mobs"] then
                espConnections["Mobs"]:Disconnect()
                espConnections["Mobs"] = nil
            end
        end
    end
})
local shaoyu = MainSection:Tab({ 
       Title = "进食功能", 
       PremiumOnly = true
})
shaoyu:Dropdown({
    Title = "选择自动进食的食物",
    Values = alimentos,
    Value = ShenChouFood,
    Multi = false,
    Callback = function(value)
        ShenChouFood = value
    end
})

shaoyu:Input({
    Title = "请输入饥饿到多少%时开始自动进食",
    Value = tostring(hungerThreshold),
    Placeholder = "Ex: 75",
    Numeric = true,
    Callback = function(value)
        local n = tonumber(value)
        if n then
            hungerThreshold = math.clamp(n, 0, 100)
        end
    end
})

shaoyu:Toggle({
    Title = "自动进食",
    Value = false,
    Callback = function(state)
        autoFeedxipro = state
        if state then
            task.spawn(function()
                while autoFeedxipro do
                    task.wait(0.075)
                    if wiki(ShenChouFood) == 0 then
                        autoFeedxipro = false
                        Tabs.Combat:Find("Auto Feed"):SetValue(false)
                        notifeed(ShenChouFood)
                        break
                    end
                    if ghn() <= hungerThreshold then
                        feed(ShenChouFood)
                    end
                end
            end)
        end
    end
})

local nb = MainSection:Tab({ 
       Title = "篝火功能", 
       PremiumOnly = true
})

local autoUpgradeCampfireXIPRO = false

nb:Dropdown({
    Title = "选择自动升级篝火使用的物品",
    Values = campfireFuelItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        for _, itemName in ipairs(campfireFuelItems) do
            alwaysFeedXXIIPPRROOItems[itemName] = table.find(options, itemName) ~= nil
        end
    end
})

nb:Toggle({
    Title = "自动升级篝火",
    Value = false,
    Callback = function(checked)
        autoUpgradeCampfireXIPRO = checked
        if checked then
            task.spawn(function()
                while autoUpgradeCampfireXIPRO do
                    for itemName, enabled in pairs(alwaysFeedXXIIPPRROOItems) do
                        if enabled then
                            for _, item in ipairs(workspace:WaitForChild("Items"):GetChildren()) do
                                if item.Name == itemName then
                                    moveItemToPos(item, campfireDropPos)
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
            end)
        end
    end
})

local about = MainSection:Tab({ 
       Title = "烹饪功能", 
       PremiumOnly = true
})

about:Dropdown({
    Title = "选择需要自动烹饪的食物",
    Values = autocookItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        for _, itemName in ipairs(autocookItems) do
            autoCookxiproItems[itemName] = table.find(options, itemName) ~= nil
        end
    end
})

about:Toggle({
    Title = "自动烹饪食物",
    Value = false,
    Callback = function(state)
        autoCookxipro = state
    end
})

coroutine.wrap(function()
    while true do
        if autoCookxipro then
            for itemName, enabled in pairs(autoCookxiproItems) do
                if enabled then
                    for _, item in ipairs(Workspace:WaitForChild("Items"):GetChildren()) do
                        if item.Name == itemName then
                            moveItemToPos(item, campfireDropPos)
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)()

local nb = MainSection:Tab({ 
       Title = "收集功能", 
       PremiumOnly = true
})

nb:Dropdown({
    Title = "选择需要收集的物品",
    Values = junkItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouJunkItems = options
    end
})

nb:Button({
    Title = "收集物品",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouJunkItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

local fuelItems = {"Log", "Chair", "Coal", "Fuel Canister", "Oil Barrel"}
local ShenChouFuelItems = {}

nb:Dropdown({
    Title = "选择燃料物品",
    Values = fuelItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouFuelItems = options
    end
})

nb:Button({
    Title = "点击收集",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        local broughtItems = 0
        for _, itemName in ipairs(ShenChouFuelItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) then
                    moveItemToPos(item, targetPos)
                    broughtItems = broughtItems + 1
                end
            end
        end
    end
})

local foodItems = {"Cake", "Cooked Steak", "Cooked Morsel", "Steak", "Morsel", "Berry", "Carrot"}
local ShenChouFoodItems = {}

nb:Dropdown({
    Title = "选择食物物品",
    Values = foodItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouFoodItems = options
    end
})

nb:Button({
    Title = "收集食物物品",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouFoodItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

nb:Dropdown({
    Title = "选择医疗物品",
    Values = medicalItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouMedicalItems = options
    end
})

nb:Button({
    Title = "点击收集",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouMedicalItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

local equipmentItems = {"Revolver", "Rifle", "Leather Body", "Iron Body", "Revolver Ammo", "Rifle Ammo", "Giant Sack", "Good Sack", "Strong Axe", "Good Axe"}
local ShenChouEquipmentItems = {}

nb:Dropdown({
    Title = "选择要装备的物品",
    Values = equipmentItems,
    Multi = true,
    AllowNone = true,
    Callback = function(options)
        ShenChouEquipmentItems = options
    end
})

nb:Button({
    Title = "点击收集",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        local hrp = player.Character.HumanoidRootPart
        local targetPos = hrp.Position + Vector3.new(2, 0, 0)
        for _, itemName in ipairs(ShenChouEquipmentItems) do
            for _, item in ipairs(workspace:GetDescendants()) do
                if item.Name == itemName and (item:IsA("BasePart") or item:IsA("Model")) and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) then
                    moveItemToPos(item, targetPos)
                end
            end
        end
    end
})

local about = MainSection:Tab({ 
       Title = "种树功能", 
       PremiumOnly = true
})
local plantShape = "圆形" 
local radius = 40 --这个是初始大小
local spacing = 1--每棵树的半径
local isPlanting = false

about:Dropdown({ 
    Title = "选择种植形状", 
    Values = {"圆形", "正方形"}, 
    Value = "圆形", 
    Callback = function(value) 
        plantShape = value 
    end 
})

about:Slider({
    Title = "种植半径大小",
    Value = { Min = 1, Max = 150, Default = 50 },
    Callback = function(value)
     radius = value
     end
})

about:Toggle({
    Title = "自动种植",
    Value = false,
    Callback = function(state)
        isPlanting = state
        if state then
            local Players = game:GetService("Players") 
            local ReplicatedStorage = game:GetService("ReplicatedStorage") 
            local RequestPlantItem = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("RequestPlantItem") 
            local Sapling = workspace:WaitForChild("Items"):WaitForChild("Sapling")
            
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local fixedY = 1.216280221939087

            if plantShape == "圆形" then
                local circumference = 2 * math.pi * radius
                local numTrees = math.floor(circumference / spacing)
                local angleStep = 360 / numTrees
                
                local function plantAtAngle(angle)
                    if not isPlanting then return end
                    local angleRad = math.rad(angle)
                    local x = rootPart.Position.X + radius * math.cos(angleRad)
                    local z = rootPart.Position.Z + radius * math.sin(angleRad)
                    local position = Vector3.new(x, fixedY, z)
                    RequestPlantItem:InvokeServer(Sapling, position)
                end

                for i = 0, numTrees - 1 do
                    if not isPlanting then break end
                    local angle = i * angleStep
                    plantAtAngle(angle)
                    task.wait(0.1)
                end
            else
                local sideLength = radius * 2
                local numTreesPerSide = math.floor(sideLength / spacing)
                local step = sideLength / numTreesPerSide
                local halfSide = sideLength / 2
                
                for i = 0, numTreesPerSide do
                    if not isPlanting then break end
                    local x = rootPart.Position.X - halfSide + i * step
                    local z1 = rootPart.Position.Z - halfSide
                    local z2 = rootPart.Position.Z + halfSide
                    
                    RequestPlantItem:InvokeServer(Sapling, Vector3.new(x, fixedY, z1))
                    RequestPlantItem:InvokeServer(Sapling, Vector3.new(x, fixedY, z2))
                    task.wait(0.1)
                end
                
                for i = 1, numTreesPerSide - 1 do
                    if not isPlanting then break end
                    local z = rootPart.Position.Z - halfSide + i * step
                    local x1 = rootPart.Position.X - halfSide
                    local x2 = rootPart.Position.X + halfSide
                    
                    RequestPlantItem:InvokeServer(Sapling, Vector3.new(x1, fixedY, z))
                    RequestPlantItem:InvokeServer(Sapling, Vector3.new(x2, fixedY, z))
                    task.wait(0.1)
                end
            end
        end
    end
})
local about = MainSection:Tab({ 
       Title = "传送功能", 
       PremiumOnly = true
})

local MobDropdown = about:Dropdown({
    Title = "选择孩子",
    Values = currentMobNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        ShenChouMob = options[#options] or currentMobNames[1] or nil
    end
})

about:Button({
    Title = "刷新列表",
    Locked = false,
    Callback = function()
        currentMobs, currentMobNames = getMobs()
        if #currentMobNames > 0 then
            ShenChouMob = currentMobNames[1]
            MobDropdown:Refresh(currentMobNames)
        else
            ShenChouMob = nil
            MobDropdown:Refresh({ "没有孩子选择" })
        end
    end
})

about:Button({
    Title = "传送到孩子",
    Locked = false,
    Callback = function()
        if ShenChouMob and currentMobs then
            for i, name in ipairs(currentMobNames) do
                if name == ShenChouMob then
                    local targetMob = currentMobs[i]
                    if targetMob then
                        local part = targetMob.PrimaryPart or targetMob:FindFirstChildWhichIsA("BasePart")
                        if part and game.Players.LocalPlayer.Character then
                            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                            end
                        end
                    end
                    break
                end
            end
        end
    end
})


local ChestDropdown = about:Dropdown({
    Title = "选择宝箱",
    Values = currentChestNames,
    Multi = false,
    AllowNone = true,
    Callback = function(options)
        ShenChouChest = options[#options] or currentChestNames[1] or nil
    end
})

about:Button({
    Title = "刷新列表",
    Locked = false,
    Callback = function()
        currentChests, currentChestNames = getChests()
        if #currentChestNames > 0 then
            ShenChouChest = currentChestNames[1]
            ChestDropdown:Refresh(currentChestNames)
        else
            ShenChouChest = nil
            ChestDropdown:Refresh({ "没有宝箱选择" })
        end
    end
})

about:Button({
    Title = "传送到宝箱",
    Locked = false,
    Callback = function()
        if ShenChouChest and currentChests then
            local chestIndex = 1
            for i, name in ipairs(currentChestNames) do
                if name == ShenChouChest then
                    chestIndex = i
                    break
                end
            end
            local targetChest = currentChests[chestIndex]
            if targetChest then
                local part = targetChest.PrimaryPart or targetChest:FindFirstChildWhichIsA("BasePart")
                if part and game.Players.LocalPlayer.Character then
                    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = part.CFrame + Vector3.new(0, 5, 0)
                    end
                end
            end
        end
    end
})


about:Button({
    Title = "传送到营火",
    Locked = false,
    Callback = function()
        tp1()
    end
})

about:Button({
    Title = "传送到要塞",
    Locked = false,
    Callback = function()
        tp2()
    end
})