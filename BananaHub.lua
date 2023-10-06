
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
if game.PlaceId == 14433762945 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/ACS.lua"))()
elseif game.PlaceId == 13772394625 or game.PlaceId == 14732610803 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BladeBall.lua"))()
else
  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BloxFruits.lua"))()
end
