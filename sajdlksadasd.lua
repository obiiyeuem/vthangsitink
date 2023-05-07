getgenv().Setting = {
    ["Team"] = "Marines", --Marines,Pirates
    ["Webhook"] = {
        ["Enabled"] = false,
        ["Url Webhook"] = "", --Your Url
    },
    ["Misc"] = {
        ["AutoBuyRandomandStoreFruit"] = true,
        ["AutoBuySurprise"] = true,
    },
    ["Click"] = {
        ["Enable"] = true,
        ["Click Gun"] = true,
		["OnLowHealthDisable"] = false,
        ["LowHealth"] = 8000,
    }, --- Click Melee
	["SafeZone"] = {
		["Enable"] = true,
		["LowHealth"] = 5000,
		["MaxHealth"] = 8000,
		["Teleport Y"] = 1000
	},
    ["Race V4"] = {
        ["Enable"] = false,
    },
    ["Invisible"] = true,
    ["White Screen"]  =false,
    ["GunMethod"] = true, --Support Only Melee And Gun,Not Invisible, Turn On Enabled Gun and Melee Please
    ["SpamSkill"] = true, -- Will use all skills as fast as possbile ignore holding skills
    ["Weapons"] = {
        ["Melee"] = {
            ["Enable"] = true,
            ["Delay"] = 2,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
               [ "X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },

                ["C"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
            },
        },
        ["Blox Fruit"] = {
            ["Enable"] = false,
            ["Delay"] = 3,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 2,
                },
                ["X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },

                ["C"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
                ["V"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
                ["F"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
            },
        },
        ["Gun"] = {
            ["Enable"] = true,
            ["Delay"] = 3,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 1,
                },
                ["X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
            },
        },
        ["Sword"] = {
            ["Enable"] = false,
            ["Delay"] = 1,
            ["Skills"] = {
                ["Z"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 1,
                },
                ["X"] = {
                    ["Enable"] = true,
                    ["HoldTime"] = 0,
                },
            },
        },
    }
}
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
wait(5)
repeat wait()
    pcall(function()
        if getgenv().Setting["Team"] == "Pirates" then
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        else
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        end
    end)
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") and  ((game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") and  not game:GetService("Players").LocalPlayer.PlayerGui.Main:WaitForChild("ChooseTeam").Visible) or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam"))
repeat wait()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Beli.Text == "$ ..." then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
until game:GetService("Players").LocalPlayer:FindFirstChild("WeaponAssetCache")
if not  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/sakjdlasd.lua", true))()  then 
    game.Players.LocalPlayer:Kick("not Support bye")
    return 
end
if not getgenv().Setting["Misc"] then
    game.Players.LocalPlayer:Kick("Join Server, Get new config")
end
local SkipPlayer = Instance.new("TextButton")
SkipPlayer.Name = "SkipPlayer"
SkipPlayer.Parent = game:GetService("Players").LocalPlayer.PlayerGui.Main
SkipPlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SkipPlayer.Position = UDim2.new(0.45, 0, -0, 10);
SkipPlayer.Size = UDim2.new(0, 200, 0, 50)
SkipPlayer.Font = Enum.Font.SourceSans
SkipPlayer.Text = "Skip Player"
SkipPlayer.TextColor3 = Color3.fromRGB(0, 0, 0)
SkipPlayer.TextScaled = true
SkipPlayer.TextSize = 14.000
SkipPlayer.TextWrapped = true
SkipPlayer.MouseButton1Click:Connect(function()
	getgenv().SkipPlayer = true
    wait()
	getgenv().SkipPlayer = false
end)
platform = Instance.new("Part")
platform.Name = "WaterWalk"
platform.Size = Vector3.new(math.huge, 1, math.huge)
platform.Transparency = 1
platform.Anchored = true
platform.Parent = game.workspace

spawn(function()
    while wait() do
        pcall(function()
            platform.CanCollide = true
            platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -5, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end)
    end
end)
spawn(function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/memaybeohub/me-may-beo-hub/main/bbepoetnihejertsetse5ergdfthf2.lua')()
end)
local plr = game.Players.LocalPlayer
function StoreFruit(path)
    for i,v in pairs(path:GetChildren()) do
        if string.find(v.Name,"Fruit") and not v:FindFirstChild("Ignored")  then
            local test  = string.gsub(v.Name, " Fruit","")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",string.gsub(v.Name, " Fruit","-"..test),path:FindFirstChild(v.Name))
            local Ignored = Instance.new("IntValue", v)
            Ignored.Name = "Ignored"
        end
    end
end
if getgenv().Setting["Misc"]["AutoBuyRandomandStoreFruit"] then 
    game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("Cousin", "Buy")
    StoreFruit(plr.Backpack)
    StoreFruit(plr.Character)
end
spawn(function()
    while wait() do 
        pcall(function()
            if getgenv().Setting["Misc"]["AutoBuySurprise"] then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end)
    end
end)
local tableDFBL = {
    "Human-Human",
    }
getgenv().tableblacklistplayer = {}
function ClosestPlayerFarmBounty()
    local dist = math.huge
    local a 
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        if v:IsA("Model") and v.Name ~= game.Players.LocalPlayer.Name and not table.find(getgenv().tableblacklistplayer,v.Name) and game.Players:FindFirstChild(v.Name) and not table.find(tableDFBL,game:GetService("Players")[v.Name].Data.DevilFruit.Value)  and (game.Players.LocalPlayer.Team == game.Teams.Marines and game.Players[v.Name].Team ~= game.Teams.Marines or game.Players.LocalPlayer.Team ~= game.Teams.Marines) and plr.Data.Level.Value-game:GetService("Players")[v.Name].Data.Level.Value < 500  then
            local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                a = v.Name
            end
        end
    end
    return a
end
function checkraidbounty(p)
    for i,v in pairs(game.Workspace["_WorldOrigin"].Locations:GetChildren()) do
        if string.find(v.Name, "Island") then
            if game.Workspace["_WorldOrigin"].Locations:FindFirstChild(v.Name) then
                if (v.Position-p.HumanoidRootPart.Position).Magnitude <= 1000 then
                    Library.CreateNoti({Title = 'Sitink Noti',Desc = p.Name..": Raid", ShowTime = 5})
                    return true
                end
            end
        end
    end
    return false
end
function checksafezone(p)
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if (v.Position-p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90/100 then
                Library.CreateNoti({Title = 'Sitink Noti',Desc = p.Name..": SafeZone", ShowTime = 5})
                return true
            end
        end
    end
    return false
end
function checkattackplayuer(v)
    for i,k in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetDescendants()) do
        if k:IsA("TextLabel") then
            if string.find(k.Text,"attack") and not k:FindFirstChild(v.Name) then
                local BV = Instance.new("TextBox")
                BV.Parent = k.Parent
                BV.Name = v.Name
                k:Destroy()
                return true
            end
        end
    end
end


local WpMelee = true 
local WpSword = true 
local WpGun = true 
local WpDF = true 
local namewp
local PathPlayer 
function NameWeapon(x)
    local a 
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    return a 
end
local Rerollwpp = true
local DelayTpMethodGun = false
function RerollNameWp()
    local a = getgenv().Setting["Weapons"]
    if a["Melee"].Enable and WpMelee then
        TpSafeCdSkill = false
        namewp = "Melee"
        local TimeDelay = tick()
        repeat wait() until tick()-TimeDelay >= a["Melee"].Delay and Rerollwpp
        WpMelee = false 
    elseif a["Blox Fruit"].Enable and WpDF then
        TpSafeCdSkill = false
        namewp = "Blox Fruit"
        local TimeDelay = tick()
        repeat wait() until tick()-TimeDelay >= a["Blox Fruit"].Delay and Rerollwpp
        WpDF = false 
    elseif a["Gun"].Enable and WpGun then
        if getgenv().Setting["GunMethod"] then 
            DelayTpMethodGun = true 
        else
            TpSafeCdSkill = false
        end
        namewp = "Gun"
        local TimeDelay = tick()
        repeat wait() until tick()-TimeDelay >= a["Gun"].Delay and Rerollwpp
        WpGun = false 
    elseif a["Sword"].Enable and WpSword then
        TpSafeCdSkill = false
        namewp = "Sword"
        local TimeDelay = tick()
        repeat wait() until tick()-TimeDelay >= a["Sword"].Delay and Rerollwpp
        WpSword = false 
    else
        WpMelee = true 
        WpSword = true 
        WpGun = true 
        WpDF = true 
    end
end
function checkskill(x)
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(x)]:GetChildren() do 
        if v:IsA("Frame") and getgenv().Setting["Weapons"][x]["Skills"][v.Name] and getgenv().Setting["Weapons"][x]["Skills"][v.Name].Enable then
            if v.Name ~= "Template" and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
loadstring([[
local ExpectedArguments = {
    FindPartOnRayWithIgnoreList = {
        ArgCountRequired = 3,
        Args = {
            "Instance", "Ray", "table", "boolean", "boolean"
        }
    },
}
function CalculateChance(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100
    return chance <= Percentage / 100
end
local function ValidateArguments(Args, RayMethod)
    local Matches = 0
    if #Args < RayMethod.ArgCountRequired then
        return false
    end
    for Pos, Argument in next, Args do
        if typeof(Argument) == RayMethod.Args[Pos] then
            Matches = Matches + 1
        end
    end
    return Matches >= RayMethod.ArgCountRequired
end
local function getDirection(Origin, Position)
    return (Position - Origin).Unit * 1000
end
local oldNamecall2
oldNamecall2 = hookmetamethod(game, "__namecall", newcclosure(function(...)
    if  getgenv().targetbounty and getgenv().Setting["GunMethod"] then
        local Method = getnamecallmethod()
        local Arguments = {...}
        local self = Arguments[1]
        local chance = CalculateChance(100)
        if  self == workspace and not checkcaller() and chance == true  then
            if Method == "FindPartOnRayWithIgnoreList"  then
                if ValidateArguments(Arguments, ExpectedArguments.FindPartOnRayWithIgnoreList) then
                    local A_Ray = Arguments[2]
                    local HitPart = game.Players[getgenv().targetbounty.Name].Character.HumanoidRootPart
                    if HitPart then
                        local Origin = A_Ray.Origin
                        local Direction = getDirection(Origin, HitPart.Position)
                        Arguments[2] = Ray.new(Origin, Direction)
                        return oldNamecall2(unpack(Arguments))
                    end
                end
            end
        end
    end
    return oldNamecall2(...)
end))
]])()
loadstring([[
    local MT = getrawmetatable(game)
    local OldNameCall = MT.__namecall
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()
        local Args = {...}
        if getgenv().psskill then
            if Method == 'FireServer' and self.Name == 'RemoteEvent' then
                if  #Args == 1 and typeof(Args[1]) == "Vector3" then
                    Args[1] = getgenv().psskill.Position
                end
                if #Args == 1 and typeof(Args[1]) == "CFrame" then
                    Args[1] = getgenv().psskill
                end
            end
        end
        return OldNameCall(self, unpack(Args))
    end)

    setreadonly(MT, true)
]])()

function toTarget(pos, targetPos, targetCFrame)
    local aaa = Speedtween or 150
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/aaa, Enum.EasingStyle.Quad)
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Sit then
        for i,v in pairs(game.workspace:GetDescendants()) do
            if v:IsA("Seat") then
                v:Destroy()
            end
        end
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
        getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = targetCFrame})
        getgenv().noclip = true
        getgenv().Tween:Play()
    end
end
if syn then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
    game:GetService('RunService').Stepped:connect(function()
        if getgenv().noclip and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0    then
            plr.Character.Humanoid:ChangeState(11)
        end 
    end)
else
    function CreateTweenFloat()
        if not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
            local BV = Instance.new("BodyVelocity")
            BV.Parent = plr.Character.HumanoidRootPart
            BV.Name = "EffectsSY"
            BV.MaxForce = Vector3.new(0, 100000, 0)
            BV.Velocity = Vector3.new(0, 0, 0)
        end
    end
    local LocalPlayer = game:GetService("Players").LocalPlayer   
    local function getTorso(LocalPlayer)
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character:FindFirstChild('UpperTorso') then
                return LocalPlayer.Character.UpperTorso
            else
                return LocalPlayer.Character.Torso
            end
        end
    end    
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().noclip and  LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
            getTorso(LocalPlayer).CanCollide = false
            LocalPlayer.Character.Head.CanCollide = false
            LocalPlayer.Character.HumanoidRootPart.CanCollide = false
            if LocalPlayer.Character.UpperTorso then
                LocalPlayer.Character.LowerTorso.CanCollide = false
            end
        end
    end)
    game:GetService('RunService').Stepped:connect(function()
        if getgenv().noclip and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0 then
            spawn(function()
                CreateTweenFloat()
            end)
        end
    end)
end

tableincombt = {
    "⚔️In Combat - Honor at risk!⚔️",
    "⚔️In Combat - Bounty at risk!⚔️"
}
function poscheckspawn(pos)
    dist = math.huge
    local name
    for i,v in next,game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren() do
        if v:IsA("Model") then
            local magnitude = (v.Part.Position - pos).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
local Reset = 0
local CountSafezone = 0
local Starthop = false
local Starthop1 = false
local dontreset = false
local StartSafezone = false
spawn(function()
    while wait() do 
        pcall(function()
            if Starthop1 then 
                return 
            end
            for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
                if v.Name == ClosestPlayerFarmBounty() then
                    if not table.find(getgenv().tableblacklistplayer,v.Name) then
                        table.insert(getgenv().tableblacklistplayer,v.Name)
                    end
                    WpMelee = true 
                    WpSword = true 
                    WpGun = true 
                    WpDF = true 
                    dontreset = false
                    print(v.Name)
                    PathPlayer = v
                    getgenv().targetbounty = v 
                    local TimdelayPlayer = tick()
                    local TimdelayPlayer2 = tick()
                    Reset = 0
                    CountSafezone = 0
                    repeat wait()
                        if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                            if namewp and NameWeapon(namewp) and not game.Players.LocalPlayer.Character:FindFirstChild(NameWeapon(namewp)) then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(NameWeapon(namewp)))
                            end
                            Starthop = false
                            if  plr.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then
                                TimdelayPlayer = tick()
                            end
                            if v:FindFirstChild("HumanoidRootPart") then
                                getgenv().psskill = CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/0.5)
                            end
                        end
                    until tick()-TimdelayPlayer2 >= 60 or  getgenv().SkipPlayer or (tick()-TimdelayPlayer >= 15 and v.Humanoid.Health/v.Humanoid.MaxHealth >= 90/100)  or (v:FindFirstChild("Humanoid") and v.Humanoid.Health <= 0)  or Starthop1 or not v or not v.Parent or checkraidbounty(v) or checksafezone(v) or checkattackplayuer(v)
                    wait()
                end
            end
            Starthop = true
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if PathPlayer then
                getgenv().psskill = CFrame.new(PathPlayer.HumanoidRootPart.CFrame.p, PathPlayer.HumanoidRootPart.Position + PathPlayer.HumanoidRootPart.Velocity/0.5)
            end
        end)
    end
end)
TableLocations = {
    ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
    ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
    ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
    ["Great Tree"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
}
local TweenPlayer = true
local SafeZone = false
local Resettp = false
spawn(function()
    while wait() do 
        pcall(function()
            if SafeZone or Starthop1 then 
                return 
            end
            for i,v2 in pairs(TableLocations) do
                if  (PathPlayer.HumanoidRootPart.Position-v2).Magnitude <= 5000 and  (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 5000 then
                    args = {
                        "requestEntrance",
                        v2,
                    }
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                    TweenPlayer = false
                    return 
                end
            end
            TweenPlayer = true
            plr.Character.LastSpawnPoint.Disabled = true
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", poscheckspawn(PathPlayer.HumanoidRootPart.Position).Name)
            if  not game:GetService("Players").LocalPlayer.PlayerGui.TransformationHUD.ImageLabel.Visible and not dontreset  and PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 3000   and ((plr.PlayerGui.Main.InCombat.Visible and not plr.PlayerGui.Main.InCombat.Bottom.Visible) or not plr.PlayerGui.Main.InCombat.Visible) then 
                if poscheckspawn(PathPlayer.HumanoidRootPart.Position).Name ~= game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value then
                    TweenPlayer = false
                    plr.Character.LastSpawnPoint.Disabled = true
                    repeat wait()
                        if getgenv().Tween then
                            getgenv().Tween:Pause()
                            getgenv().Tween:Cancel()
                        end
                        plr.Character.LastSpawnPoint.Disabled = true
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", poscheckspawn(PathPlayer.HumanoidRootPart.Position).Name)
                        plr.Character.HumanoidRootPart.CFrame = poscheckspawn(PathPlayer.HumanoidRootPart.Position).Part.CFrame
                        plr.Character.Humanoid.Health = 0
                    until poscheckspawn(PathPlayer.HumanoidRootPart.Position).Name == game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value
                    plr.Character.Humanoid.Health = 0
                    TweenPlayer = true
                end
            end
        end)
    end
end)
local TpSafeCdSkill = false
spawn(function()
    while wait() do 
        pcall(function()
            if Starthop1 then 
                return 
            end
            if Resettp then 
                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end
                return 
            end
            if TweenPlayer and plr.Character.Humanoid.Health > 0  and  plr.Character:FindFirstChild("HumanoidRootPart") then
                if TpSafeCdSkill and (not getgenv().Setting["GunMethod"] or (getgenv().Setting["GunMethod"] and namewp ~= "Gun")) and not (getgenv().Setting["Click"]["Enable"] and ((not getgenv().Setting["Click"]["OnLowHealthDisable"] and PathPlayer.Humanoid.Health > getgenv().Setting["Click"]["LowHealth"]) or getgenv().Setting["Click"]["OnLowHealthDisable"]) and namewp == "Melee")  then
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.CFrame*CFrame.new(0,200,0))
                    return 
                end
                if   (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 100 then
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.CFrame)
                else
                    StartSafezone = true
                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                    if getgenv().Setting["GunMethod"] and namewp == "Gun" then
                        if DelayTpMethodGun then 
                            plr.Character.HumanoidRootPart.CFrame = PathPlayer.HumanoidRootPart.CFrame*CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(-90))+Vector3.new(0,2,0)
                            DelayTpMethodGun =  false 
                            return
                        end
                        plr.Character.HumanoidRootPart.CFrame = PathPlayer.HumanoidRootPart.CFrame*CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(-90))+Vector3.new(0,20,0)
                    else
                        plr.Character.HumanoidRootPart.CFrame = PathPlayer.HumanoidRootPart.CFrame*CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(-90))+Vector3.new(0,2,0)
                    end
                    plr.Character.Humanoid.AutoRotate = false 
                end
            end
        end)
    end
end)
local Safezonetrue  = false
spawn(function()
    while wait() do 
        pcall(function()
            if Starthop1 then 
                return 
            end
            if getgenv().Setting["SafeZone"]["Enable"] then 
                if plr.Character.Humanoid.Health <= getgenv().Setting["SafeZone"]["LowHealth"] and not SafeZone  then 
                    SafeZone = true
                elseif plr.Character.Humanoid.Health >= getgenv().Setting["SafeZone"]["MaxHealth"] and SafeZone then 
                    SafeZone = false
                end
                if SafeZone then 
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.Position,PathPlayer.HumanoidRootPart.CFrame*CFrame.new(0,getgenv().Setting["SafeZone"]["Teleport Y"],0))
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 100 then
                RerollNameWp()
            end
        end)
    end
end)
local Useskill = false

spawn(function()
    while wait() do
        if namewp and Useskill then
            pcall(function()
                if Starthop1 then 
                    return 
                end
                local DistanceUseskill = 30
                if namewp == "Gun" then 
                    DistanceUseskill = 100
                end 
                if PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < DistanceUseskill then
                    local NameWpSkill = namewp
                    if  game.Players.LocalPlayer.Character:FindFirstChild(NameWeapon(NameWpSkill)) then
                        local condimebeo = checkskill(NameWpSkill)
                        if condimebeo then
                            Rerollwpp = false
                            game.VirtualInputManager:SendKeyEvent(true, condimebeo, false, game)
                            local ticktime = tick()
                            repeat wait() until tick()-ticktime >= ((getgenv().Setting["SpamSkill"] and 0) or getgenv().Setting["Weapons"][NameWpSkill]["Skills"][condimebeo].HoldTime)  
                            game.VirtualInputManager:SendKeyEvent(false, condimebeo, false, game)
                            wait()
                            Rerollwpp = true
                        else
                            TpSafeCdSkill = true
                            repeat wait()
                            until checkskill(NameWpSkill) or NameWpSkill ~= namewp
                            TpSafeCdSkill = false
                        end    
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if namewp then
            pcall(function()
                if PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 100 then 
                    local TimeDelayyy = tick()
                    repeat wait()
                    until tick()-TimeDelayyy >= 0.5
                    Useskill = true
                else
                    Useskill = false
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if game.Players.LocalPlayer.Character.LowerTorso:FindFirstChild("Root") and not getgenv().Setting["GunMethod"] and getgenv().Setting["Invisible"] then 
                game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
            end
        end)
    end
end)
function checkhakikenprovip()
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        return true
    else
        return false
    end
end
function FFCMatch(Ins, Name)
    for k, v in pairs(Ins:GetChildren()) do
        if string.match(v.Name, Name) then
            return v
        end
    end
    return nil
end
require(game:GetService("ReplicatedStorage").Util.CameraShaker):Stop()
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
    while wait() do
        pcall(function()   
            if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("CharacterReady") then
                game.Players.LocalPlayer.Character.CharacterReady:Destroy()
            end
            spawn(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end)
            if not checkhakikenprovip()  then
                game.Players.LocalPlayer.VisionRadius.Value = math.huge
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                wait(2)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if not FFCMatch(plr.Character, "_BusoLayer1") and not plr.Character:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                wait(2)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            getgenv().psskill = CFrame.new(plr.Character.HumanoidRootPart.CFrame.p, plr.Character.HumanoidRootPart.Position + plr.Character.HumanoidRootPart.Velocity/0.5)
        end)
    end
end)

local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]
function attackfarmounbty()               
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
        ret.activeController.hitboxMagnitude = 15
        game:GetService "VirtualUser":CaptureController()
        game:GetService "VirtualUser":Button1Down(Vector2.new(60, 60))
    end
end
local StartAttack = false 

spawn(function()
    while wait() do 
        pcall(function()
            if PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 100 and getgenv().Setting["Click"]["Enable"] and ((not getgenv().Setting["Click"]["OnLowHealthDisable"] and  PathPlayer.Humanoid.Health > getgenv().Setting["Click"]["LowHealth"]) or getgenv().Setting["Click"]["OnLowHealthDisable"]) and namewp == "Melee" then 
                attackfarmounbty()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if getgenv().Setting["GunMethod"] and PathPlayer and (PathPlayer.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500 and WpGun and namewp == "Gun"   then 
                game:GetService "VirtualUser":CaptureController()
                game:GetService "VirtualUser":Button1Down(Vector2.new(60, 60))
            end
        end)
    end
end)

local Racev4Start = false
spawn(function()
    while wait() do 
        pcall(function()
            if getgenv().Setting["Race V4"]["Enable"] then  
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") 
                and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
                and game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and not game.Players.LocalPlayer.Character.RaceTransformed.Value   then
                    local args = {
                        [1] = true
                    }
                    game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and game.Players.LocalPlayer.Character.RaceTransformed.Value and game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then 
                    local args = {
                        [1] = "Dodge",
                        [3] = 0,
                        [4] = true,
                        [5] = 0
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))
                end
            end
        end)
    end
end)

function format(num, digits)
	return string.format("%0" .. digits .. "i", num)
end

function parseDateTime()
	local osDate = os.date("!*t")
	local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
	local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
	return year .. "-" .. format(mon, 2) .. "-" .. format(day, 2) .. "T" .. format(hour, 2) .. ":" .. format(min, 2) .. ":" .. format(sec, 2) .. "Z"
end
local function v165(p24)
	local v166 = p24;
	while true do
		local v167, v168 = string.gsub(v166, "^(-?%d+)(%d%d%d)", "%1,%2");
		v166 = v167;
		if v168 == 0 then
			break;
		end;	
	end;
	return v166;
end;

function sendmsgbounty(url,x,xx)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  
	msg = {
		["content"] = "",
		["embeds"] = {
			{
                ["author"] = {
                    ["name"] = "Obii Auto Bounty.Exe",
                    ["url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg"
                },
				["color"] = tonumber(0x000000),
				["title"] = "Skider so 1 viet nam : Obii#3012",
                ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097971676353937448/banner.png",
				["fields"] = {
					{
						["name"] = "Name :",
						["value"] = "||"..game.Players.LocalPlayer.Name.."||",
						["inline"] = true
					},
                    {
						["name"] = "Current Bounty :",
						["value"] = "```"..v165(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value).."```",
						["inline"] = true
					},
                    {
						["name"] = "Bounty Check :",
						["value"] = "```Earned : "..x.."```",
						["inline"] = false
					},
                    {
						["name"] = "Targeted :",
						["value"] = "```"..xx.."```",
						["inline"] = false
					},
				},
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097970280023990422/gabimaru-anime.gif"
                },
                ["image"] = {
                    ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["footer"] = {
                    ["text"] = "discord.gg/ymf",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/asdasdasdasccc.lua", true))()
end)
--[[local args = {
    [1] = "Dodge",
    [3] = 0,
    [4] = true,
    [5] = 0
}

game:GetService("ReplicatedStorage").Remotes.CommE:FireServer(unpack(args))
local args = {
    [1] = true
}

game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))

]]
local demsofarmbounty = 0
local SettingHopServer
local DefaultSettingHopServer = {}
if not isfolder('Obii-BloxFruit-BountyFarm') then
    makefolder('Obii-BloxFruit-BountyFarm')
end
if not pcall(function() readfile("Obii-BloxFruit-BountyFarm/JobHopServers.json") end) then
    writefile("Obii-BloxFruit-BountyFarm/JobHopServers.json", game:GetService("HttpService"):JSONEncode(DefaultSettingHopServer))
end
local xxxxxxx, jkhkjkjlkjoiu = pcall(function()
    SettingHopServer = game:GetService("HttpService"):JSONDecode(readfile("Obii-BloxFruit-BountyFarm/JobHopServers.json"))
end)
if not xxxxxxx then
    SettingHopServer = DefaultSettingHopServer
end
function CheckJobIdServer()
    local mmb = {}
    for i,v in next,game:GetService("HttpService"):JSONDecode(readfile("Obii-BloxFruit-BountyFarm/JobHopServers.json")) do
        table.insert(mmb,i) 
    end
    return mmb 
end
SettingHopServer[game.JobId] = true
function HopServer()
    local function Hop()
        for i=1,100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k,v in pairs(huhu) do
                if k ~= game.JobId and not table.find(CheckJobIdServer(),k) and v.Count >= 10 then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                    writefile("Obii-BloxFruit-BountyFarm/JobHopServers.json", game:GetService("HttpService"):JSONEncode(SettingHopServer))
                end
            end
        end
    end
    while wait() do
        pcall(function() 
            Hop()
        end)
    end
end
local SiteHopServerLess;
local lessfoundAnything = ""
function Hopserverless()
    while wait() do
        pcall(function()
            if lessfoundAnything == "" then
                SiteHopServerLess = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                SiteHopServerLess = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. lessfoundAnything))
            end
            if SiteHopServerLess.nextPageCursor and SiteHopServerLess.nextPageCursor ~= "null" and SiteHopServerLess.nextPageCursor ~= nil then
                lessfoundAnything = SiteHopServerLess.nextPageCursor
            end
            for i,v in pairs(SiteHopServerLess.data) do
                if v.playing and tonumber(v.playing) >= 10 and not table.find(CheckJobIdServer(),v.id) then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, tostring(v.id), game.Players.LocalPlayer)
                end
            end
        end)
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if not ClosestPlayerFarmBounty() and not Starthop1 and Starthop  then 
                Starthop1 = true
            end
            if  Starthop1  then 
                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end
                if plr.PlayerGui.Main.InCombat.Visible and plr.PlayerGui.Main.InCombat.Bottom.Visible then
                    for i,v2 in pairs(TableLocations) do
                        args = {
                            "requestEntrance",
                            v2,
                        }
                        game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                        if getgenv().Tween then
                            getgenv().Tween:Pause()
                            getgenv().Tween:Cancel()
                        end
                    end
                    return 
                end
                delay(3,function()
                    local v14 = require(game:GetService("ReplicatedStorage").Notification)
                    v14.new("<Color=Red>Hop Server <Color=/>"):Display()
                end)
                spawn(function()
                    HopServer()
                end)
                spawn(function()
                    Hopserverless()
                end)
                spawn(function()
                    args = {
                        "requestEntrance",
                        Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
                    }
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                end)
                wait(1)
            end
        end)
    end
end)

spawn(function()
    while wait() do 
        pcall(function()
            local v14 = require(game:GetService("ReplicatedStorage").Notification)
            v14.new("<Color=Yellow>Report bugs Or Suggests Dms<Color=/>"):Display()
            v14.new("<Color=Yellow>Discord :obii#3012<Color=/>"):Display()
            v14.new("<Color=Yellow>ID Discord : 326989210697465857<Color=/>"):Display()
            v14.new("<Color=Yellow>Server Discord : discord.gg/ymf<Color=/>"):Display()
            v14.new("<Color=Yellow>Join Server Check Update<Color=/>"):Display()
            wait(20)
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().Setting["White Screen"] then
                local RunService = game:GetService("RunService")
                RunService:Set3dRenderingEnabled(false)
            end
        end)
    end
end)
