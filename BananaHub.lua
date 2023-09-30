
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
if game.PlaceId == 14433762945 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/ACS.lua"))()
else
  loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BloxFruits.lua"))()
end
