
if not getgenv().Setting["Misc"] or not getgenv().Setting["Auto Skip Player"] then
    game.Players.LocalPlayer:Kick("Join Server, Get new config")
end
local dotehookold
dotehookold = hookfunction(require(game:GetService("ReplicatedStorage").Notification).new,function(...)
    local Args = {...}
    if Args[1] and string.find(Args[1],"killing") and getgenv().Setting["Webhook"]["Enabled"]  then 
        local Tiltebounty = string.split(Args[1],"killing")
        sendmsgbounty(getgenv().Setting["Webhook"]["Url Webhook"],string.gsub(Tiltebounty[1],"%D",""),Tiltebounty[2])
    end
    return dotehookold(...)
end)
