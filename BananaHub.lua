repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
if not getgenv().NewBanana then 
	game.Players.LocalPlayer:Kick("Use new banana goto #command-bot use slash /script get new script)
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua"))()
end
