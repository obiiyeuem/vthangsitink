local dotehookold
dotehookold = hookfunction(require(game:GetService("ReplicatedStorage").Notification).new,function(...)
    local Args = {...}
    if Args[1] and string.find(Args[1],"killing") and getgenv().Setting["Webhook"]["Enabled"]  then 
        local Tiltebounty = string.split(Args[1],"killing")
        sendmsgbounty(getgenv().Setting["Webhook"]["Url Webhook"],string.gsub(Tiltebounty[1],"%D",""),Tiltebounty[2])
    end
    return dotehookold(...)
end)
spawn(function()
    local oldSkill
    oldSkill = hookfunction(require(game.ReplicatedStorage.Util).BodyMover.Create,function(p3,p4, p5)
        if p5.Duration then
            p5.Duration = 0
        end
        if getgenv().psskill then
            p5.CFrame = getgenv().psskill
            p5.Position = getgenv().psskill.Position
        end
        return oldSkill(p3,p4, p5)
    end)
end)
