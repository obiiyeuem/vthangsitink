function DetectMob(x)
    for i,v in next,workspace.entities:GetChildren() do 
        if v:IsA("Model") and v.Name == x and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v 
        end
    end
end

local plr = game.Players.LocalPlayer
_G.on = not _G.on 
while _G.on and wait() do 
    
    local v = DetectMob(getgenv().Mob)
    pcall(function()
        if plr.PlayerGui.main.pinnedQuests.Visible then 
            repeat wait()
                plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,0,7)
                game:GetService("ReplicatedStorage").remotes.combat:FireServer("M1")

            until not v or not v.Parent or v.Humanoid.Health <= 0 or not _G.on or not plr.PlayerGui.main.pinnedQuests.Visible
        else
            local args = {
                [1] = "createQuest",
                [2] = getgenv().Mob
            }
            
            game:GetService("ReplicatedStorage").remotes.quest:FireServer(unpack(args))
        end
    end)
end


