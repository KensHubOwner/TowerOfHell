local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera

--------------------------------------------------
-- SCREEN GUI
--------------------------------------------------

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KensHub"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

--------------------------------------------------
-- INTRO
--------------------------------------------------

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.fromScale(1,1)
IntroFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
IntroFrame.BorderSizePixel = 0
IntroFrame.Parent = ScreenGui

local IntroText = Instance.new("TextLabel")
IntroText.AnchorPoint = Vector2.new(0.5,0.5)
IntroText.Size = UDim2.new(0,700,0,120)
IntroText.Position = UDim2.new(-0.5,0,0.5,0)
IntroText.BackgroundTransparency = 1
IntroText.Text = ""
IntroText.Font = Enum.Font.GothamBlack
IntroText.TextScaled = true
IntroText.Parent = IntroFrame

local IntroGradient = Instance.new("UIGradient")
IntroGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
IntroGradient.Parent = IntroText

local IntroStroke = Instance.new("UIStroke")
IntroStroke.Thickness = 1
IntroStroke.Color = Color3.fromRGB(255,255,255)
IntroStroke.Parent = IntroText

local IntroTween = TweenService:Create(
    IntroText,
    TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    { Position = UDim2.new(0.5,0,0.5,0) }
)

IntroTween:Play()

local HubName = "Ken's Hub"

for i = 1,#HubName do
    IntroText.Text = string.sub(HubName,1,i)
    task.wait(0.1)
end

IntroTween.Completed:Wait()
task.wait(1)

local FadeText = TweenService:Create(IntroText, TweenInfo.new(1), {TextTransparency = 1})
local FadeFrame = TweenService:Create(IntroFrame, TweenInfo.new(1), {BackgroundTransparency = 1})

FadeText:Play()
FadeFrame:Play()

FadeFrame.Completed:Wait()
IntroFrame:Destroy()

--------------------------------------------------
-- HUB MAIN FRAME
--------------------------------------------------

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0,650,0,400)
MainFrame.Position = UDim2.new(0.5,-325,0.5,-200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(120,0,255)
MainStroke.Parent = MainFrame

--------------------------------------------------
-- TOP BAR
--------------------------------------------------

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,60)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

--------------------------------------------------
-- TITLE BOX
--------------------------------------------------

local TitleBox = Instance.new("Frame")
TitleBox.Size = UDim2.new(0,220,0,45)
TitleBox.Position = UDim2.new(0,15,0,8)
TitleBox.BackgroundTransparency = 1
TitleBox.Parent = TopBar

local TitleBoxCorner = Instance.new("UICorner")
TitleBoxCorner.CornerRadius = UDim.new(0,8)
TitleBoxCorner.Parent = TitleBox

local TitleBoxStroke = Instance.new("UIStroke")
TitleBoxStroke.Thickness = 2
TitleBoxStroke.Parent = TitleBox

local TitleBoxGradient = Instance.new("UIGradient")
TitleBoxGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
TitleBoxGradient.Parent = TitleBoxStroke

--------------------------------------------------
-- TITLE
--------------------------------------------------

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Text = "Ken's Hub"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 30
Title.Font = Enum.Font.GothamBlack
Title.Parent = TitleBox

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
TitleGradient.Parent = Title

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Thickness = 2
TitleStroke.Parent = Title

local TitleStrokeGradient = Instance.new("UIGradient")
TitleStrokeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
TitleStrokeGradient.Parent = TitleStroke

--------------------------------------------------
-- CLOSE BUTTON
--------------------------------------------------

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0,38,0,38)
CloseButton.AnchorPoint = Vector2.new(1,0)
CloseButton.Position = UDim2.new(1,-15,0,11)
CloseButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255,255,255)
CloseButton.TextSize = 24
CloseButton.Font = Enum.Font.GothamBlack
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1,0)
CloseCorner.Parent = CloseButton

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Thickness = 2
CloseStroke.Parent = CloseButton

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
CloseGradient.Parent = CloseStroke

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

--------------------------------------------------
-- MINIMIZE BUTTON
--------------------------------------------------

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0,38,0,38)
MinButton.AnchorPoint = Vector2.new(1,0)
MinButton.Position = UDim2.new(1,-60,0,11)
MinButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
MinButton.Text = "-"
MinButton.TextColor3 = Color3.fromRGB(255,255,255)
MinButton.TextSize = 28
MinButton.Font = Enum.Font.GothamBlack
MinButton.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1,0)
MinCorner.Parent = MinButton

local MinStroke = Instance.new("UIStroke")
MinStroke.Thickness = 2
MinStroke.Parent = MinButton

local MinGradient = Instance.new("UIGradient")
MinGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(170,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,170,255))
}
MinGradient.Parent = MinStroke

local MinMessage = Instance.new("TextLabel")
MinMessage.Size = UDim2.new(0,300,0,50)
MinMessage.Position = UDim2.new(0.5,-150,0.9,-25)
MinMessage.BackgroundTransparency = 1
MinMessage.Text = ""
MinMessage.TextColor3 = Color3.fromRGB(255,255,255)
MinMessage.TextSize = 22
MinMessage.Font = Enum.Font.GothamBlack
MinMessage.Parent = ScreenGui

MinButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinMessage.Text = "Press K to reopen the hub"

    task.delay(10, function()
        if MinMessage.Text ~= "" then
            MinMessage.Text = ""
        end
    end)
end)

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.K then
        MainFrame.Visible = true
        MinMessage.Text = ""
    end
end)

--------------------------------------------------
-- DRAG SYSTEM
--------------------------------------------------

local Dragging = false
local DragStart
local StartPos

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = Input.Position
        StartPos = MainFrame.Position

        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(Input)
    if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(
            StartPos.X.Scale,
            StartPos.X.Offset + Delta.X,
            StartPos.Y.Scale,
            StartPos.Y.Offset + Delta.Y
        )
    end
end)

--------------------------------------------------
-- CENTER DIVIDER LINE
--------------------------------------------------

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0,4,1,0)
Divider.Position = UDim2.new(0.5,-2,0,0)
Divider.BackgroundColor3 = Color3.fromRGB(120,0,255)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

--------------------------------------------------
-- DISCORD BUTTON (RIGHT SIDE)
--------------------------------------------------

local DiscordButton = Instance.new("TextButton")
DiscordButton.Size = UDim2.new(0,200,0,40)
DiscordButton.Position = UDim2.new(1,-220,0,80)
DiscordButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
DiscordButton.Text = "Discord"
DiscordButton.TextColor3 = Color3.fromRGB(255,255,255)
DiscordButton.Font = Enum.Font.GothamBlack
DiscordButton.TextSize = 22
DiscordButton.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0,8)
DiscordCorner.Parent = DiscordButton

DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/Bge5s3CQzq")

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Discord Invite",
        Text = "Invite copied! Paste it in your browser or Discord.",
        Duration = 4
    })
end)



--------------------------------------------------
-- FLY SYSTEM
--------------------------------------------------

local flying = false
local flySpeed = 50
local bodyGyro
local bodyVelocity

local function startFly()
    local char = Player.Character
    if not char then return end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")

    if not hrp or not hum then return end

    hum.PlatformStand = true

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 15000
    bodyGyro.MaxTorque = Vector3.new(15000,15000,15000)
    bodyGyro.CFrame = hrp.CFrame
    bodyGyro.Parent = hrp

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(15000,15000,15000)
    bodyVelocity.Velocity = Vector3.zero
    bodyVelocity.Parent = hrp

    flying = true
end

local function stopFly()
    flying = false

    local char = Player.Character
    if not char then return end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.PlatformStand = false
    end

    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
end

RunService.Heartbeat:Connect(function()
    if flying then
        local char = Player.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local camCF = cam.CFrame
        local move = Vector3.zero

        if UIS:IsKeyDown(Enum.KeyCode.W) then
            move = move + camCF.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            move = move - camCF.LookVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            move = move - camCF.RightVector
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            move = move + camCF.RightVector
        end

        bodyGyro.CFrame = camCF
        bodyVelocity.Velocity = move * flySpeed
    end
end)

--------------------------------------------------
-- F KEY TOGGLE (SYNC FIXED)
--------------------------------------------------

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        flying = not flying

        if flying then
            startFly()
        else
            stopFly()
        end

        if FlyButton then
            FlyButton.Text = flying and "Fly: ON" or "Fly: OFF"
        end
    end
end)

--------------------------------------------------
-- FLY BUTTON
--------------------------------------------------

local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0,200,0,40)
FlyButton.Position = UDim2.new(0,20,0,80)
FlyButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
FlyButton.Text = "Fly: OFF"
FlyButton.TextColor3 = Color3.fromRGB(255,255,255)
FlyButton.Font = Enum.Font.GothamBlack
FlyButton.TextSize = 20
FlyButton.Parent = MainFrame

local FlyCorner = Instance.new("UICorner")
FlyCorner.CornerRadius = UDim.new(0,8)
FlyCorner.Parent = FlyButton

FlyButton.MouseButton1Click:Connect(function()
    flying = not flying

    if flying then
        startFly()
    else
        stopFly()
    end

    FlyButton.Text = flying and "Fly: ON" or "Fly: OFF"
end)

--------------------------------------------------
-- SPEED SLIDER
--------------------------------------------------

local SpeedSlider = Instance.new("TextBox")
SpeedSlider.Size = UDim2.new(0,200,0,40)
SpeedSlider.Position = UDim2.new(0,20,0,130)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(30,30,30)
SpeedSlider.Text = "Speed: 50"
SpeedSlider.TextColor3 = Color3.fromRGB(255,255,255)
SpeedSlider.Font = Enum.Font.GothamBlack
SpeedSlider.TextSize = 20
SpeedSlider.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0,8)
SpeedCorner.Parent = SpeedSlider

SpeedSlider.FocusLost:Connect(function()
    local num = tonumber(SpeedSlider.Text:match("%d+"))
    if num then
        flySpeed = num
        SpeedSlider.Text = "Speed: " .. num
    else
        SpeedSlider.Text = "Speed: " .. flySpeed
    end
end)
--------------------------------------------------
-- ANTI-KILLBRICK SYSTEM
--------------------------------------------------

local antiKill = false
local killConnections = {}

local function protectPart(part)
    if part:IsA("BasePart") then
        for _, con in ipairs(getconnections(part.Touched)) do
            con:Disable()
            table.insert(killConnections, con)
        end
    end
end

local function scanWorkspace()
    for _, obj in ipairs(workspace:GetDescendants()) do
        protectPart(obj)
    end
end

local function enableAntiKill()
    antiKill = true

    local char = Player.Character
    if not char then return end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    hum.HealthChanged:Connect(function()
        if antiKill and hum.Health < hum.MaxHealth then
            hum.Health = hum.MaxHealth
        end
    end)

    scanWorkspace()

    workspace.DescendantAdded:Connect(function(obj)
        if antiKill then
            protectPart(obj)
        end
    end)
end

local function disableAntiKill()
    antiKill = false

    for _, con in ipairs(killConnections) do
        pcall(function()
            con:Enable()
        end)
    end

    killConnections = {}
end

local AntiButton = Instance.new("TextButton")
AntiButton.Size = UDim2.new(0,200,0,40)
AntiButton.Position = UDim2.new(0,20,0,180)
AntiButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
AntiButton.Text = "Anti-Killbrick: OFF"
AntiButton.TextColor3 = Color3.fromRGB(255,255,255)
AntiButton.Font = Enum.Font.GothamBlack
AntiButton.TextSize = 20
AntiButton.Parent = MainFrame

local AntiCorner = Instance.new("UICorner")
AntiCorner.CornerRadius = UDim.new(0,8)
AntiCorner.Parent = AntiButton

AntiButton.MouseButton1Click:Connect(function()
    antiKill = not antiKill
    AntiButton.Text = antiKill and "Anti-Killbrick: ON" or "Anti-Killbrick: OFF"

    if antiKill then
        enableAntiKill()
    else
        disableAntiKill()
    end
end)
--------------------------------------------------
-- FOLLOW PLAYER SYSTEM
--------------------------------------------------

local followingMode = false
local followedPlayer = nil
local mouse = Player:GetMouse()

--------------------------------------------------
-- HIGHLIGHT SYSTEM
--------------------------------------------------

local function highlightPlayers(state)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = plr.Character.HumanoidRootPart

            if state then
                if not hrp:FindFirstChild("FollowHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "FollowHighlight"
                    hl.FillColor = Color3.fromRGB(255,255,255)
                    hl.FillTransparency = 0.4
                    hl.OutlineTransparency = 0.1
                    hl.Parent = hrp
                end
            else
                local hl = hrp:FindFirstChild("FollowHighlight")
                if hl then hl:Destroy() end
            end
        end
    end
end

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if followingMode then
            task.wait(0.2)
            highlightPlayers(true)
        end
    end)
end)

--------------------------------------------------
-- CLICK TO FOLLOW (ATTACH THEM TO YOU)
--------------------------------------------------

mouse.Button1Down:Connect(function()
    if not followingMode then return end
    if followedPlayer then return end

    local target = mouse.Target
    if not target then return end

    local char = target:FindFirstAncestorOfClass("Model")
    if not char then return end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end

    local plr = Players:GetPlayerFromCharacter(char)
    if not plr or plr == Player then return end

    followedPlayer = plr

    local hrp = char:FindFirstChild("HumanoidRootPart")
    local mychar = Player.Character
    if not mychar then return end
    local myhrp = mychar:FindFirstChild("HumanoidRootPart")

    if hrp and myhrp then
        hum.PlatformStand = true
        hum.AutoRotate = false

        -- remove old constraints
        for _, obj in ipairs(hrp:GetChildren()) do
            if obj:IsA("AlignPosition") or obj:IsA("AlignOrientation") then
                obj:Destroy()
            end
        end

        -- attachment on YOU
        local att0 = Instance.new("Attachment")
        att0.Parent = myhrp
        att0.Position = Vector3.new(0, 2, -3)

        -- attachment on THEM
        local att1 = Instance.new("Attachment")
        att1.Parent = hrp

        -- follow position
        local ap = Instance.new("AlignPosition")
        ap.MaxForce = 200000
        ap.Responsiveness = 100
        ap.RigidityEnabled = true
        ap.Attachment0 = att0
        ap.Attachment1 = att1
        ap.Parent = hrp

        -- follow rotation
        local ao = Instance.new("AlignOrientation")
        ao.MaxTorque = 200000
        ao.Responsiveness = 100
        ao.RigidityEnabled = true
        ao.Attachment0 = att0
        ao.Attachment1 = att1
        ao.Parent = hrp

        hrp:SetAttribute("FollowAttachments", {att0, att1, ap, ao})
    end
end)

--------------------------------------------------
-- FOLLOW BUTTON
--------------------------------------------------

local FollowButton = Instance.new("TextButton")
FollowButton.Size = UDim2.new(0,200,0,40)
FollowButton.Position = UDim2.new(0,20,0,230)
FollowButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
FollowButton.Text = "Follow Player: OFF"
FollowButton.TextColor3 = Color3.fromRGB(255,255,255)
FollowButton.Font = Enum.Font.GothamBlack
FollowButton.TextSize = 20
FollowButton.Parent = MainFrame

local FollowCorner = Instance.new("UICorner")
FollowCorner.CornerRadius = UDim.new(0,8)
FollowCorner.Parent = FollowButton

FollowButton.MouseButton1Click:Connect(function()
    followingMode = not followingMode
    FollowButton.Text = followingMode and "Follow Player: ON" or "Follow Player: OFF"

    highlightPlayers(followingMode)

    if not followingMode and followedPlayer then
        local char = followedPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local data = hrp and hrp:GetAttribute("FollowAttachments")
            if data then
                for _, obj in ipairs(data) do
                    pcall(function() obj:Destroy() end)
                end
            end

            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.PlatformStand = false
                hum.AutoRotate = true
            end
        end
        followedPlayer = nil
    end
end)

--------------------------------------------------
-- STOP FOLLOWING BUTTON (RESET)
--------------------------------------------------

local StopButton = Instance.new("TextButton")
StopButton.Size = UDim2.new(0,200,0,40)
StopButton.Position = UDim2.new(0,20,0,280)
StopButton.BackgroundColor3 = Color3.fromRGB(30,30,30)
StopButton.Text = "Stop Following"
StopButton.TextColor3 = Color3.fromRGB(255,255,255)
StopButton.Font = Enum.Font.GothamBlack
StopButton.TextSize = 20
StopButton.Parent = MainFrame

local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0,8)
StopCorner.Parent = StopButton

StopButton.MouseButton1Click:Connect(function()
    -- reset your character
    local char = Player.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Health = 0
        end
    end

    -- reset follow system
    followedPlayer = nil
    followingMode = false
    FollowButton.Text = "Follow Player: OFF"
end)

--------------------------------------------------
-- INSTRUCTION LABEL
--------------------------------------------------

local FollowInfo = Instance.new("TextLabel")
FollowInfo.Size = UDim2.new(0,200,0,60)
FollowInfo.Position = UDim2.new(0,20,0,330)
FollowInfo.BackgroundTransparency = 1
FollowInfo.TextColor3 = Color3.fromRGB(255,255,255)
FollowInfo.Font = Enum.Font.Gotham
FollowInfo.TextSize = 16
FollowInfo.TextWrapped = true
FollowInfo.Text = "When Follow Player is ON, click a player to follow them."
FollowInfo.Parent = MainFrame
