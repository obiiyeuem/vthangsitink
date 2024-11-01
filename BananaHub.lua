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
    if not _G.Config then
        local k = {
            Enabled = false, --> true: enable or false: disable the script
            Events = {
                SwordChanged = nil,
                FightingStyleChanged = nil,
                EnemiesAdded = nil,
                EnemiesRemoved = nil,
                FlingPrevent = nil,
                WindowFocusReleased = nil,
                WindowFocused = nil,
                RaceChanged = nil,
                TimeElapsed = nil,
                LogService = nil,
            }, --> Necessary for script, do not adjust!
    
            Loops = {
                BringMob = false,
                Attack = false,
                UseSkills = false,
                M1s = false,
                AttackLoop = false,
            },  --> Necessary for script, do not adjust!
    
            Allowed_Actions = {
                FarmingLevel = false, --> Auto farming level
                CollectChests = true, --> Collect all chests!
                TierFruits = {"Uncommon", "Common", "Rare", "Epic", "Legendary"},
                StoreFruits = true, --> Auto store devil fruit!
                BossesAim = { "Expert Swordman [Lv. 3000]", "King Samurai [Lv. 3500]", "Dragon [Lv. 5000]",
                "Ms. Mother [Lv. 7500]", "Ghost Ship", "SeaKing", "HydraSeaKing" }, --> Focus on these bosses!
                SpecificItemsToGet = {"DarkLeg", "Cyborg", "Buso", "Ken", "WaterStyle", "DragonClaw", "Electro"}, --> Get specific items!
    
                M1 = true, --> Auto M1 attack!
                Skills = {
                    Enabled = true,
                    List = {FS = true, SW = true, DF = true},
                    DFList = { Z = true, X = true, C = true, V = true }
                },
    
                Stats = {
                    Melee = { Name = "Melee", Enabled = true }, --> Enable to upgrade!
                    Sword = { Name = "sword", Enabled = true },
                    Defense = { Name = "Defense", Enabled = true },
                    Fruit = { Name = "DF", Enabled = false }
                }, --> Upgrade order: Melee --> Sword --> Defense --> Fruit
    
                FindSeaMonster = true, --> Auto find sea monsters!
    
                Sea2Unlock = false, --> Auto unlock Sea 2!
                Sea3Unlock = false, --> Auto unlock Sea 3!
    
                Aimlock = false,
                MouseLock = false,
    
                Protect = false,
    
                Webhook = {
                    Enabled = false,
                    Level = 10,
                    Logs = {PlayerStatus = true, Bosses = true, Console = true},
                    URL = ""--"https://discord.com/api/webhooks/id/token",
                },
            },
    
            OnlyFarm = { ["Dragon [Lv. 5000]"] = { Enabled = false, At = 5000, Keep = 100 } }, --> Focus on Dragon [Lv. 5000]!, Keep 100 orbs then spawn
    
            Farm = CFrame.Angles(math.pi / -2, 0, 0) * CFrame.new(0, 0, 7), --> Efficient farming!
    
            -- Optimize farming
            Options_Disable = {
                Textures = true,
                VisualEffects = true,
                Parts = true,
                Particles = true,
                Sky = true,
                FullBright = false
            },
    
            Performance = {
                SetFPS = 20, --> Useful for low cpu usage, while using in long time!
                WhiteScreen = false, --> Not recommended to use
            }
        }
        _G.Config = k
    end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/KL-BananaCat.lua"))()
elseif game.PlaceId == 18901165922 or game.PlaceId == 19006211286 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/PetsGo.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AV-BananaCat.lua"))()
end
