_G.on = not _G.on
local plr = game.Players.LocalPlayer
while _G.on and wait() do
    pcall(function()
		if not plr.Character:FindFirstChild("Head") then
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if string.find(v.Name, "Chest") then
					print(v.Name)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
				end
			end
		else
			plr.Character.Head:Destroy()
		end
	end)
end
