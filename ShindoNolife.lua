local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]

function autoattack()
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
            local p13 = ret.activeController
            for i=1,1 do 
                local bladehit =
                require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                game.Players.LocalPlayer.Character,
                {game.Players.LocalPlayer.Character.HumanoidRootPart},
                50
            )
            local cac = {}
            local hash = {}
            for k, v in pairs(bladehit) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    if v.Parent.Parent.Name == "Enemies" then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
            end
            bladehit = cac
            if #bladehit > 0 then
                local u8 = debug.getupvalue(p13.attack, 5)
                local u9 = debug.getupvalue(p13.attack, 6)
                local u7 = debug.getupvalue(p13.attack, 4)
                local u10 = debug.getupvalue(p13.attack, 7)
    
                local u12 = (u8 * 798405 + u7 * 727595) % u9
                local u13 = u7 * 798405
                (function()
                    u12 = (u12 * u9 + u13) % 1099511627776
                    u8 = math.floor(u12 / u9)
                    u7 = u12 - u8 * u9
                end)()
                u10 = u10 + 1
                debug.setupvalue(p13.attack, 5, u8)
                debug.setupvalue(p13.attack, 6, u9)
                debug.setupvalue(p13.attack, 4, u7)
                debug.setupvalue(p13.attack, 7, u10)
                pcall(
                    function()
                        for k, v in pairs(p13.animator.anims.basic) do
                        -- print(v)
                        v:Play()
                        -- v:AdjustSpeed(0/0)
                        end	
                    end
                )
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and p13.blades and p13.blades[1]  then
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",p13.blades[1].Parent.Parent.Name)
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
                end
            end
        end
    end
end
while wait() do 
    autoattack()
end
