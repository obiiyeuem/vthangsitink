
repeat task.wait() until game:IsLoaded()

local function ReturnBF(U)
return {getgenv().OldBanana, U == 994732206}
end

local function Run(A1)
loadstring(game:HttpGet(A1))()
end

local Games = {
[4986566693] = "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/ACS.lua",
[994732206] = {[true] = "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/OldBanana.lua", [false] = "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-Beta.lua"},
[4777817887] = "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BladeBall.lua"
}

local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId

local Old = not not ReturnBF(UniverseID)[1] and ReturnBF(UniverseID)[1] or false

if ReturnBF(UniverseID)[2] == false then
Run(Games[UniverseID])
else
Run(Games[UniverseID][Old])
end
