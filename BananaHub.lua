repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
if not getgenv().NewBanana then 
	loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-Beta.lua"))()
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua"))()
end
