local LP = game.Players.LocalPlayer
    local Mouse = LP:GetMouse()
    toggler = Fly
    local SPEED = 0
    FLYING = false
    getgenv().iyflyspeed = 3
    
    function sFLY() 
        repeat wait() until LP and LP.Character and LP.Character:FindFirstChild('HumanoidRootPart') and LP.Character:FindFirstChild('Humanoid')
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
        repeat wait() until Mouse
            local T = game.Players.LocalPlayer.Character.HumanoidRootPart
            local CONTROL = {F = 0, B = 0, L = 0, R = 0}
            local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
            
            local function FLY()
                FLYING = true
                local BG = Instance.new('BodyGyro', T)
                local BV = Instance.new('BodyVelocity', T)
                BG.P = 9e4
                BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                BG.cframe = T.CFrame
                BV.velocity = Vector3.new(0, 0.1, 0)
                BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
                spawn(function()
                repeat wait()
                
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                SPEED = 50
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
                SPEED = 0
                end
        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
        elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
        else
        BV.velocity = Vector3.new(0, 0.1, 0)
        end
        BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not FLYING
                CONTROL = {F = 0, B = 0, L = 0, R = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                SPEED = 0
                BG:destroy()
                BV:destroy()
            end)
        end
    
        Mouse.KeyDown:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = iyflyspeed
            elseif KEY:lower() == 's' then
                CONTROL.B = -iyflyspeed
            elseif KEY:lower() == 'a' then
                CONTROL.L = -iyflyspeed 
            elseif KEY:lower() == 'd' then 
                CONTROL.R = iyflyspeed
            end
        end)
    
        Mouse.KeyUp:Connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            end
        end)
        FLY()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end
        
        
    function NOFLY()
        FLYING = false
    end
        
    function startflying()
        wait()
        sFLY()
        wait(0.1)
        local Float = Instance.new('Part', game.Players.LocalPlayer.Character)
        Float.Name = 'Float'
        Float.Transparency = 1
        Float.Size = Vector3.new(6,1,6)
        Float.Anchored = true
    end

local tablefind = table.find
local SpoofTable = {
    WalkSpeed = 16,
    JumpPower = 50
}

local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        return SpoofTable[k]
    end
    return __index(t, k)
end)

local __newindex
__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        SpoofTable[k] = v
        return
    end
    return __newindex(t, k, v)
end)

function notify(text,dur)
	game.StarterGui:SetCore("SendNotification", {
		Title = "DG Community"; 
		Text = text; 
		Duration = dur; 
	})
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local main = library:Load{
    Name = "DG community",
    SizeX = 480,
    SizeY = 300,
    Theme = "Midnight",
    Extension = "json", 
    Folder = "vozoid ui or something" 
}

local LocalThingsTab = main:Tab("LocalThings")
local VisualsTab = main:Tab("Visuals")
local BindsTab = main:Tab("Binds")
local CreditsTab = main:Tab("Credits")
getgenv().Fly = false
getgenv().CFrameWalkSpeed = false 
local Movement = LocalThingsTab:Section{
    Name = "Movement",
    Side = "Left"
}

local Extra = LocalThingsTab:Section{
    Name = "Extra",
    Side = "Right"
}

local Visuals = VisualsTab:Section{
    Name = "ESP",
    Side = "Left"
}

local CreditsRoblox = CreditsTab:Section{
    Name = "Roblox Credits",
    Side = "Left"
}

local CreditsDiscord = CreditsTab:Section{
    Name = "Discord Credits",
    Side = "Right"
}

local WalkSpeed = Movement:Toggle{
    Name = "WalkSpeed",
    Flag = "WalkSpeed",
    Callback = function(bool)
        while bool do wait() 
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = ws  
    end
end 
}

WalkSpeed:Slider{
    Text = "[value]/500",
    Min = 0,
    Max = 500,
    Float = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(value)
        getgenv().ws = value 
    end
}

local CFrameWalkSpeed = Movement:Toggle{
    Name = "CFrameWalkSpeed",
    Flag = "CFrameWalkSpeed",
    Callback = function(bool)
    getgenv().CFrameWalkSpeed = bool 
    while CFrameWalkSpeed do wait() 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * CFrameWalkSpeedValue)
    end 
end 
}

CFrameWalkSpeed:Slider{
    Text = "[value]/20",
    Min = 0,
    Max = 20,
    Float = 2,
    Flag = "CFrameWalkSpeed",
    Callback = function(value)
       getgenv().CFrameWalkSpeedValue = value 
    end
}

local JumpPower = Movement:Toggle{
    Name = "JumpPower",
    Flag = "JumpPower",
    Callback = function(bool)
        while bool do wait()
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = js  
    end
end 
}

JumpPower:Slider{
    Text = "[value]/500",
    Min = 0,
    Max = 500,
    Float = 50,
    Flag = "JumpPowerSlider",
    Callback = function(value)
        getgenv().js = value 
    end
}

local HipHeight = Movement:Toggle{
    Name = "HipHeight",
    Flag = "HipHeight",
    Callback = function(bool)
        while bool do wait()
		game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").HipHeight = hh  
    end
end 
}

HipHeight:Slider{
    Text = "[value]/500",
    Min = 0,
    Max = 500,
    Float = 1,
    Flag = "HipHeightSlider",
    Callback = function(value)
        getgenv().hh = value 
    end
}

local Fly = Movement:Toggle{
    Name = "Fly",
    Flag = "Fly",
    Callback = function(bool)
    getgenv().Fly = bool 
    if Fly == true then 
    startflying()
    elseif Fly == false then 
        NOFLY()
        if game.Players.LocalPlayer.Character then
              if game.Players.LocalPlayer.Character:FindFirstChild("Float") then
                  game.Players.LocalPlayer.Character:FindFirstChild("Float"):Destroy()
              end
          end
    end 
    end 
    }
Fly:Slider{
        Text = "[value]/300",
        Min = 0,
        Max = 300,
        Float = 50,
        Flag = "FlySpeed",
        Callback = function(value)
           getgenv().iyflyspeed = value/10
        end
    }

    local InfinityJump = Movement:Toggle{
        Name = "InfinityJump",
        Flag = "InfinityJump",
        Callback = function(bool)
        getgenv().InfinityJump = bool 
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if InfinityJump == true then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")       
            end
        end)
    end 
    }


    Extra:Button{
        Name = "Disable Lasers",
        Callback = function()
        for e, q in pairs(game:GetService("Workspace"):GetDescendants()) do
        if q.Name == 'laser' or q.Name ==  'NightLaser' or q.Name == 'Laser' or q.Name == 'TopLasers' or q.Name == 'Spotlight'  or q.Name == "MovingLasers" or q.Name == "Lasers" then 
        q:Destroy()
        end
        end 
    end
    }
    
    Extra:Button{
    Name = "Disable Lasers[2]",
    Callback = function()
    for e,q in pairs(game:GetService("Workspace").Heists.Casino.Stealthy.Items.Detectors:GetChildren()) do 
        if  q.Name == "20" or q.Name == "Part" then 
            q:Destroy()
            end 
    end 
    game:GetService("Workspace").Heists.Club.Level3.Items.RotatingPlatform.Rotate:Destroy()
          notify("Lasers disabled!",3)
          end 
    }
    Extra:Button{
        Name = "Disable Troops",
        Callback = function()
        for e,q in pairs(game:GetService("Workspace").Heists.Pyramid.Level2:GetChildren()) do 
        if q.Name == "Lava" or q.Name == "RockWall" or q.Name == "RoofTrap" or q.Name == "Flamethrowers" or q.Name == "PressurePlates" then 
            q:Destroy()
            notify("Troops disabled!",3)
            end 
    end 
    end 
    }
    
    Extra:Button{
        Name = "Disable Troops[2]",
        Callback = function()
        for e,q in pairs(game:GetService("Workspace").Heists.Pyramid.Level1:GetChildren()) do 
        if q.Name == "Lava" or q.Name == "Balls" or q.Name == "Saws" or q.Name == "Flamethrowers" or q.Name == "SpikeTraps" then 
            q:Destroy()
            notify("Troops disabled!",3)
            end 
    end 
    end 
    }    


    local MovementBind = BindsTab:Section{
        Name = "MovementBinds",
        Side = "Left"
    }

    local FlyBind = MovementBind:Keybind{
        Name = "Fly",
        Flag = "FlyKeyBind",
        Callback = function(key, fromsetting)
            if fromsetting then
            getgenv().FlyBind = tostring(key)
                    else
            Fly = not Fly
    
            if Fly then
                notify("Fly Enabled",3)
            else
                notify("Fly Disabled",3)
            end
    
            if Fly then
                startflying() 
                elseif Fly == false then 
                NOFLY()
                if game.Players.LocalPlayer.Character then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Float") then
                        game.Players.LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                    end
                    end
                end
            end
            end
    }

    local ESPa = Visuals:Toggle{
        Name = "ESP",
        Flag = "ESP",
        Callback = function(bool)
        getgenv().esp = bool 
        if esp then 
        notify("esp enabled!",3)
        else
            notify("esp disabled!",3)
        end 
    end 
    }
    local ESPShowStats = Visuals:Toggle{
        Name = "ESP showstats",
        Flag = "ESP showstats",
        Callback = function(bool)
        getgenv().showstats = bool 
        if showstats then 
            notify("showstats enabled!",3)
            else
            notify("showstats disabled!",3)
            end 
    end 
    }
    function round(num, numDecimalPlaces)
        local mult = 10^(numDecimalPlaces or 0)
        return math.floor(num * mult + 0.5) / mult
    end
    function addesp(espparent, color, Text)
        local BillboardGui = Instance.new("BillboardGui")
        local TextLabel = Instance.new("TextLabel")
        BillboardGui.Adornee = espparent
        BillboardGui.Name = "esp"
        BillboardGui.Parent = espparent
        BillboardGui.Size = UDim2.new(0, 100, 0, 150)
        BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
        BillboardGui.AlwaysOnTop = true
        TextLabel.Parent = BillboardGui
        TextLabel.BackgroundTransparency = 1
        TextLabel.Position = UDim2.new(0, 0, 0, -50)
        TextLabel.Size = UDim2.new(0, 100, 0, 100)
        TextLabel.Font = Enum.Font.SourceSansSemibold
        TextLabel.TextSize = 20
        TextLabel.TextColor3 = color
        TextLabel.TextStrokeTransparency = 0
        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        TextLabel.Text = Text
        TextLabel.ZIndex = 10
    end
    game:GetService("RunService").RenderStepped:connect(function()
    if esp == true then 
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
    if v ~= game:GetService("Players").LocalPlayer then 
    if v.Character:FindFirstChild("Humanoid") ~= nil then
        if v.Character.Humanoid.Health > 0 then 
            if v.Character:FindFirstChild("Head") ~= nil then 
           if v.Character.Head:FindFirstChild("esp") == nil then 
            if showstats == true then 
                local pos = math.floor((game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - v.Character:WaitForChild("HumanoidRootPart").Position).magnitude)
             addesp(v.Character.Head, v.TeamColor.Color, 'Name: '..v.Name..' | Health: '..round(v.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos)
            elseif showstats == false then 
                addesp(v.Character.Head, v.TeamColor.Color, v.Name)
           end 
        end 
        end 
    end 
    end 
    end 
    end 
    end 
    if esp == false then 
        for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
            if v ~= game:GetService("Players").LocalPlayer then 
            if v.Character:FindFirstChild("Humanoid") ~= nil then
                if v.Character.Humanoid.Health > 0 then 
                    if v.Character:FindFirstChild("Head") ~= nil then 
                   if v.Character.Head:FindFirstChild("esp") ~= nil then
                    v.Character.Head.esp:Destroy()
                   end
                end
            end
        end
    end
    end
    end 
    end)

    
local rbCredits1 = CreditsRoblox:Label("Current Devs :")
local rbCredits = CreditsRoblox:Label("Margman9is9nothing")
local rbCredits1 = CreditsRoblox:Label("Current Testers :")
local rbCredits = CreditsRoblox:Label("STALKER3406")
local rbCredits = CreditsRoblox:Label("Flwness")

CreditsDiscord:Button{
    Name = "DG community discord server",
    Callback  = function()
    local req = request 
	local synreq = syn
		if req ~= nil then
		request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "F38s7385Tb"
				},
				nonce = game:GetService("HttpService"):GenerateGUID(false)
			}),
		})
	end
	if synreq ~= nil then
		syn.request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com"
			},
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "F38s7385Tb"
				},
				nonce = game:GetService("HttpService"):GenerateGUID(false)
			}),
		})
	end
    end
}
