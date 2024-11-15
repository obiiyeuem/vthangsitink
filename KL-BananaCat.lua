local start = tick()
repeat task.wait() 
    repeat task.wait() pcall(function() game.ReplicatedStorage.Chest.Remotes.Functions.EtcFunction:InvokeServer("EnterTheGame", {}) end) until not game:GetService("Lighting"):FindFirstChild("TeamBlur") 
until game.Players.LocalPlayer
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
            "Ms. Mother [Lv. 7500]", "Ghost Ship", "SeaKing", "HydraSeaKing", "AbyssalSeaKing", "Deepsea Crusher", "SkullSeaking" }, --> Focus on these bosses!
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

if not _G.FX_Options then
    _G.FX_Options = {
        Enabled = false,
        Textures = true,
        VisualEffects = true,
        Invisible = false, --> For parts
        Parts = false,
        Particles = true,
        Sky = false,
        FullBright = true
    }
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/RedGamer12/TNNP-SYSTEM/refs/heads/main/client/King%20Legacy/main-obfuscated.lua"))()
