local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId
if game.PlaceId == 1537690962 or game.PlaceId == 4079902982 then
    if getgenv().betabss then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/bssrewrite-obfuscated.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BSS-BananaCat.lua"))()
    end
elseif game.PlaceId == 10260193230 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Seahuhu-BananaCat.lua"))()
elseif game.PlaceId == 7449423635 or game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua"))()
elseif game.PlaceId == 4520749081 or  game.PlaceId == 6381829480 or game.PlaceId == 15759515082 or game.PlaceId == 5931540094 then 
    local start = tick()
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer:FindFirstChild("DataLoaded").Value
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/KL-BananaCat.lua"))()
elseif game.PlaceId == 18901165922 or game.PlaceId == 19006211286 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/PetsGo.lua"))()
elseif game.PlaceId == 16732694052 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Banana-Cat-Hub/main/Fisch.lua"))()
elseif UniverseID == 5844593548  then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AnimeReborn.lua"))()
elseif UniverseID == 6325068386 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Bluelock.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AV-BananaCat.lua"))()
end
