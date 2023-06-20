
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
local BananaMain = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local cornerMainFrame = Instance.new("UICorner")
local titleFrame = Instance.new("Frame")
local titleText = Instance.new("TextLabel")
local lineFrame = Instance.new("Frame")
local gradientLineFrame = Instance.new("UIGradient")
local keyFrame = Instance.new("Frame")
local keyBox = Instance.new("TextBox")
local actionFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local checkKeyFrame = Instance.new("Frame")
local cornerCheckKey = Instance.new("UICorner")
local buttonCheckKey = Instance.new("TextButton")
local getKeyFrame = Instance.new("Frame")
local cornerGetKey = Instance.new("UICorner")
local buttonGetKey = Instance.new("TextButton")
local strokeKeyFrame = Instance.new('UIStroke', keyFrame)
local strokeGetKey = Instance.new('UIStroke', getKeyFrame)


BananaMain.Name = "[Banana] Main"
BananaMain.Parent = game:GetService('CoreGui')

mainFrame.Name = "mainFrame"
mainFrame.Parent = BananaMain
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 350, 0, 120)

cornerMainFrame.CornerRadius = UDim.new(0, 4)
cornerMainFrame.Name = "cornerMainFrame"
cornerMainFrame.Parent = mainFrame

titleFrame.Name = "titleFrame"
titleFrame.Parent = mainFrame
titleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleFrame.BackgroundTransparency = 1.000
titleFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
titleFrame.Size = UDim2.new(1, 0, 0, 27)

titleText.Name = "titleText"
titleText.Parent = titleFrame
titleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1.000
titleText.Position = UDim2.new(0, 5, 0, 0)
titleText.Size = UDim2.new(0, 0, 0, 25)
titleText.Font = Enum.Font.GothamBold
titleText.Text = "Banana Hub                "
titleText.TextColor3 = Color3.fromRGB(255, 218, 85)
titleText.TextSize = 14.000
titleText.TextXAlignment = Enum.TextXAlignment.Left

lineFrame.Name = "lineFrame"
lineFrame.Parent = titleFrame
lineFrame.BackgroundColor3 = Color3.fromRGB(255, 218, 85)
lineFrame.BorderSizePixel = 0
lineFrame.Position = UDim2.new(0, 5, 0, 25)
lineFrame.Size = UDim2.new(0, 80, 0, 2)

gradientLineFrame.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.44), NumberSequenceKeypoint.new(0.90, 0.70), NumberSequenceKeypoint.new(1.00, 1.00)}
gradientLineFrame.Name = "gradientLineFrame"
gradientLineFrame.Parent = lineFrame

keyFrame.Name = "keyFrame"
keyFrame.Parent = mainFrame
keyFrame.Active = true
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyFrame.BorderSizePixel = 0
keyFrame.ClipsDescendants = true
keyFrame.Position = UDim2.new(0.5, 0, 0.5, -5)
keyFrame.Selectable = true
keyFrame.Size = UDim2.new(1, -20, 0, 25)

strokeKeyFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeKeyFrame.Color = Color3.fromRGB(255,255,255)
strokeKeyFrame.LineJoinMode = Enum.LineJoinMode.Round
strokeKeyFrame.Thickness = 2

keyBox.Name = "keyBox"
keyBox.Parent = keyFrame
keyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundTransparency = 1.000
keyBox.ClipsDescendants = true
keyBox.Position = UDim2.new(0, 5, 0, 0)
keyBox.Size = UDim2.new(1, -10, 1, 0)
keyBox.ClearTextOnFocus = false
keyBox.Font = Enum.Font.GothamBold
keyBox.PlaceholderText = "Key Here"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 14.000
keyBox.TextXAlignment = Enum.TextXAlignment.Left

actionFrame.Name = "actionFrame"
actionFrame.Parent = mainFrame
actionFrame.AnchorPoint = Vector2.new(0.5, 1)
actionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
actionFrame.BackgroundTransparency = 1.000
actionFrame.Position = UDim2.new(0.5, 0, 1, -10)
actionFrame.Size = UDim2.new(1, -10, 0, 25)

UIListLayout.Parent = actionFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 30)

checkKeyFrame.Name = "checkKeyFrame"
checkKeyFrame.Parent = actionFrame
checkKeyFrame.BackgroundColor3 = Color3.fromRGB(255, 218, 85)
checkKeyFrame.Size = UDim2.new(0, 150, 0, 25)

cornerCheckKey.CornerRadius = UDim.new(0, 4)
cornerCheckKey.Name = "cornerCheckKey"
cornerCheckKey.Parent = checkKeyFrame

buttonCheckKey.Name = "buttonCheckKey"
buttonCheckKey.Parent = checkKeyFrame
buttonCheckKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonCheckKey.BackgroundTransparency = 1.000
buttonCheckKey.Size = UDim2.new(1, 0, 1, 0)
buttonCheckKey.Font = Enum.Font.GothamBold
buttonCheckKey.Text = "Check Key"
buttonCheckKey.TextColor3 = Color3.fromRGB(35, 35, 35)
buttonCheckKey.TextSize = 14.000

getKeyFrame.Name = "getKeyFrame"
getKeyFrame.Parent = actionFrame
getKeyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKeyFrame.Size = UDim2.new(0, 150, 0, 25)

strokeGetKey.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeGetKey.Color = Color3.fromRGB(255,255,255)
strokeGetKey.LineJoinMode = Enum.LineJoinMode.Round
strokeGetKey.Thickness = 1


cornerGetKey.CornerRadius = UDim.new(0, 4)
cornerGetKey.Name = "cornerGetKey"
cornerGetKey.Parent = getKeyFrame

buttonGetKey.Name = "buttonGetKey"
buttonGetKey.Parent = getKeyFrame
buttonGetKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonGetKey.BackgroundTransparency = 1.000
buttonGetKey.Size = UDim2.new(1, 0, 1, 0)
buttonGetKey.Font = Enum.Font.GothamBold
buttonGetKey.Text = "Get Key"
buttonGetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonGetKey.TextSize = 14.000

local URL = 'https://banana-hub.xyz'
local REQ = (syn and syn.request) or (identifyexecutor() == 'Fluxus' and request) or http_request or http.request or requests
local HttpService = game:GetService("HttpService")

local custom_sqrt = function(x)
    return x^(1/2)
end

local is_prime = function(n)
    if n == 2 or n == 3 then
        return true
    end

    if n == 1 or n % 2 == 0 then
        return false
    end

    for i = 3, custom_sqrt(n), 2 do
        if n % i == 0 then
            return false
        end
    end

    return true
end

local genPrimes = function()
    while true do
        local p = Random.new():NextNumber(100, 99999)
        if is_prime(p) then
            return p
        end
        wait(.25)
    end
end

local custom_floor = function(x)
    return x - x % 1
end

local mod = function(a, b, m)
    local result = 1

    while b > 0 do
        if b % 2 == 1 then
            result = (result * a) % m
        end

        a = (a * a) % m
        b = custom_floor(b / 2)
    end

    return result
end

local tablefind = function(x, z)
    for i, v in next, x do
        if (v == z) then
            return true
        end
    end
    return false
end

spawn(function()
    local start = os.time()
    task.wait(2.2)
    if os.time() - start < .3 then
        warn('Error: Freeze OT')
        return
    end
    local q = Random.new():NextNumber(100, 99999)
    local p = Random.new():NextNumber(100, 99999)
    if q == p then
        warn('Error: Loop Rand')
        return
    end
end)

local char, byte, format, rep, sub = string.char, string.byte, string.format, string.rep, string.sub
local bit_or, bit_and, bit_not, bit_xor, bit_rshift, bit_lshift

do
    bit_not = bit.bnot

    local tobit = function(n)
        return n <= 0x7fffffff and n or -(bit_not(n) + 1)
    end

    local normalize = function(f)
        return function(a, b)
            return tobit(f(tobit(a), tobit(b)))
        end
    end

    bit_or, bit_and, bit_xor = normalize(bit.bor), normalize(bit.band), normalize(bit.bxor)
    bit_rshift, bit_lshift = normalize(bit.rshift), normalize(bit.lshift)
end

local function lei2str(i)
    local f = function(s)
        return char(bit_and(bit_rshift(i, s), 255))
    end
    return f(0) .. f(8) .. f(16) .. f(24)
end

local function str2bei(s)
    local v = 0
    for i = 1, #s do
        v = v * 256 + byte(s, i)
    end
    return v
end

local function str2lei(s)
    local v = 0
    for i = #s, 1, -1 do
        v = v * 256 + byte(s, i)
    end
    return v
end

local function cut_le_str(s, ...)
    local o, r = 1, {}
    local args = {...}
    for i = 1, #args do
        table.insert(r, str2lei(sub(s, o, o + args[i] - 1)))
        o = o + args[i]
    end
    return r
end

local swap = function(w)
    return str2bei(lei2str(w))
end

local CONSTS = { 0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee, 0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501, 0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be, 0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821, 0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa, 0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8, 0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed, 0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a, 0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c, 0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70, 0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05, 0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665, 0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039, 0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1, 0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1, 0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391, 0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476 }

local f = function(x, y, z)
    return bit_or(bit_and(x, y), bit_and(-x - 1, z))
end
local g = function(x, y, z)
    return bit_or(bit_and(x, z), bit_and(y, -z - 1))
end
local h = function(x, y, z)
    return bit_xor(x, bit_xor(y, z))
end
local i = function(x, y, z)
    return bit_xor(y, bit_or(x, -z - 1))
end
local z = function(ff, a, b, c, d, x, s, ac)
    a = bit_and(a + ff(b, c, d) + x + ac, 0xFFFFFFFF)
    return bit_or(bit_lshift(bit_and(a, bit_rshift(0xFFFFFFFF, s)), s), bit_rshift(a, 32 - s)) + b
end

local function transform(A, B, C, D, X)
    local a, b, c, d = A, B, C, D
    local t = CONSTS

    a = z(f, a, b, c, d, X[0], 7, t[1])
    d = z(f, d, a, b, c, X[1], 12, t[2])
    c = z(f, c, d, a, b, X[2], 17, t[3])
    b = z(f, b, c, d, a, X[3], 22, t[4])
    a = z(f, a, b, c, d, X[4], 7, t[5])
    d = z(f, d, a, b, c, X[5], 12, t[6])
    c = z(f, c, d, a, b, X[6], 17, t[7])
    b = z(f, b, c, d, a, X[7], 22, t[8])
    a = z(f, a, b, c, d, X[8], 7, t[9])
    d = z(f, d, a, b, c, X[9], 12, t[10])
    c = z(f, c, d, a, b, X[10], 17, t[11])
    b = z(f, b, c, d, a, X[11], 22, t[12])
    a = z(f, a, b, c, d, X[12], 7, t[13])
    d = z(f, d, a, b, c, X[13], 12, t[14])
    c = z(f, c, d, a, b, X[14], 17, t[15])
    b = z(f, b, c, d, a, X[15], 22, t[16])

    a = z(g, a, b, c, d, X[1], 5, t[17])
    d = z(g, d, a, b, c, X[6], 9, t[18])
    c = z(g, c, d, a, b, X[11], 14, t[19])
    b = z(g, b, c, d, a, X[0], 20, t[20])
    a = z(g, a, b, c, d, X[5], 5, t[21])
    d = z(g, d, a, b, c, X[10], 9, t[22])
    c = z(g, c, d, a, b, X[15], 14, t[23])
    b = z(g, b, c, d, a, X[4], 20, t[24])
    a = z(g, a, b, c, d, X[9], 5, t[25])
    d = z(g, d, a, b, c, X[14], 9, t[26])
    c = z(g, c, d, a, b, X[3], 14, t[27])
    b = z(g, b, c, d, a, X[8], 20, t[28])
    a = z(g, a, b, c, d, X[13], 5, t[29])
    d = z(g, d, a, b, c, X[2], 9, t[30])
    c = z(g, c, d, a, b, X[7], 14, t[31])
    b = z(g, b, c, d, a, X[12], 20, t[32])

    a = z(h, a, b, c, d, X[5], 4, t[33])
    d = z(h, d, a, b, c, X[8], 11, t[34])
    c = z(h, c, d, a, b, X[11], 16, t[35])
    b = z(h, b, c, d, a, X[14], 23, t[36])
    a = z(h, a, b, c, d, X[1], 4, t[37])
    d = z(h, d, a, b, c, X[4], 11, t[38])
    c = z(h, c, d, a, b, X[7], 16, t[39])
    b = z(h, b, c, d, a, X[10], 23, t[40])
    a = z(h, a, b, c, d, X[13], 4, t[41])
    d = z(h, d, a, b, c, X[0], 11, t[42])
    c = z(h, c, d, a, b, X[3], 16, t[43])
    b = z(h, b, c, d, a, X[6], 23, t[44])
    a = z(h, a, b, c, d, X[9], 4, t[45])
    d = z(h, d, a, b, c, X[12], 11, t[46])
    c = z(h, c, d, a, b, X[15], 16, t[47])
    b = z(h, b, c, d, a, X[2], 23, t[48])

    a = z(i, a, b, c, d, X[0], 6, t[49])
    d = z(i, d, a, b, c, X[7], 10, t[50])
    c = z(i, c, d, a, b, X[14], 15, t[51])
    b = z(i, b, c, d, a, X[5], 21, t[52])
    a = z(i, a, b, c, d, X[12], 6, t[53])
    d = z(i, d, a, b, c, X[3], 10, t[54])
    c = z(i, c, d, a, b, X[10], 15, t[55])
    b = z(i, b, c, d, a, X[1], 21, t[56])
    a = z(i, a, b, c, d, X[8], 6, t[57])
    d = z(i, d, a, b, c, X[15], 10, t[58])
    c = z(i, c, d, a, b, X[6], 15, t[59])
    b = z(i, b, c, d, a, X[13], 21, t[60])
    a = z(i, a, b, c, d, X[4], 6, t[61])
    d = z(i, d, a, b, c, X[11], 10, t[62])
    c = z(i, c, d, a, b, X[2], 15, t[63])
    b = z(i, b, c, d, a, X[9], 21, t[64])

    return bit_and(A + a, 0xFFFFFFFF), bit_and(B + b, 0xFFFFFFFF), bit_and(C + c, 0xFFFFFFFF), bit_and(
        D + d,
        0xFFFFFFFF
    )
end

local function md5_update(self, s)
    self.pos = self.pos + #s
    s = self.buf .. s
    for ii = 1, #s - 63, 64 do
        local X = cut_le_str(sub(s, ii, ii + 63), 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
        assert(#X == 16)
        X[0] = table.remove(X, 1) -- zero based!
        self.a, self.b, self.c, self.d = transform(self.a, self.b, self.c, self.d, X)
    end
    self.buf = sub(s, math.floor(#s / 64) * 64 + 1, #s)
    return self
end

local function md5_finish(self)
    local msgLen = self.pos
    local padLen = 56 - msgLen % 64

    if msgLen % 64 > 56 then
        padLen = padLen + 64
    end

    if padLen == 0 then
        padLen = 64
    end

    local s =
        char(128) ..
        rep(char(0), padLen - 1) .. lei2str(bit_and(8 * msgLen, 0xFFFFFFFF)) .. lei2str(math.floor(msgLen / 0x20000000))
    md5_update(self, s)

    assert(self.pos % 64 == 0)
    return lei2str(self.a) .. lei2str(self.b) .. lei2str(self.c) .. lei2str(self.d)
end

local function md5new()
    return {
        a = CONSTS[65],
        b = CONSTS[66],
        c = CONSTS[67],
        d = CONSTS[68],
        pos = 0,
        buf = "",
        update = md5_update,
        finish = md5_finish
    }
end

local function md5tohex(s)
    return format(
        "%08x%08x%08x%08x",
        str2bei(sub(s, 1, 4)),
        str2bei(sub(s, 5, 8)),
        str2bei(sub(s, 9, 12)),
        str2bei(sub(s, 13, 16))
    )
end

local function md5sum(s)
    return md5new():update(s):finish()
end

local function md5sumhexa(s)
    return md5tohex(md5sum(s))
end

local RandomString = function()
    local out = ""
    for i=1,5 do
        out = out..(string.sub(tostring({}),18, math.random(-5,-2)))
    end
    return out
end

local split = function(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

local requests = function(urls)
    local c = 0
    local mt = setmetatable({}, {__index = function(Self, ...)
        local jp = {...}
        table.foreach(jp, print)
        if tablefind(jp, "Url") then
            c = c + 1
            if c ~= 1 then
                print('a')
                --while true do end
                return
            end
        end
        --[[if tablefind(jp, "Method") then
            return 'GET'
        end]]--
        return {
        	Url = urls,
        	Method = 'GET'
        }
    end})
    local stcheck = tick()
    local data
    local s, e = pcall(function()
        data = REQ({
        	Url = urls,
        	Method = 'GET'
        })
        if data.StatusCode ~= 200 then
            while true do end
            return
        end

        if not data.Success then
            while true do end
            return
        end

        if not data.Headers then
            while true do end
            return
        end
    end)
    if not s then
        while true do end
        return
    end
    if s and tick() - stcheck < 0.001 then
        while true do end
        return
    end
    return data
end

local function getkey()
    return (keyBox.Text ~= '' and keyBox.Text)
end

local function savekey()
    local s, e = pcall(function()
        if not isfile('auth.bin') then
            writefile('auth.bin', getkey())
        end
    end)
end

local function removekey()
    local s, e = pcall(function()
        if isfile('auth.bin') then
            delfile('auth.bin')
        end
    end)
end

local function readkey()
    local KEY;
    local s, e = pcall(function()
        if isfile('auth.bin') then
            KEY = readfile('auth.bin')
        end
    end)
    return KEY
end
local  whitelistsuccess = false
local function checkingwl(KEY)
    print(KEY)
    print('[Whitelist#1]: checking...')
    local publicKEY1 = 3547
    local publicKEY2 = 73387
    local FakeOT = os.time()
    local ServerTime = math.floor(tonumber(game:HttpGet(URL..'/stime')) / 1000)
    print('[Whitelist#1]: create key diffie-hellman')
    local PrivateKeyClient = genPrimes()
    print('[Whitelist#1]: hash key diffie-hellman')
    local PublicKeyClient = mod(publicKEY1, PrivateKeyClient, publicKEY2)

    local Success, Hwid = pcall(requests, URL..'/header')
    local HwidDecode = HttpService:JSONDecode(Hwid.Body)
    local HwidUser = HwidDecode['syn-fingerprint'] or HwidDecode['flux-fingerprint'] or HwidDecode['krnl-fingerprint'] or HwidDecode['sw-fingerprint']

    local Rand = RandomString()

    local Sign = md5sumhexa(HwidUser..PublicKeyClient..tostring(ServerTime):sub(1, -4)..Rand)

    local Success, Respone = pcall(requests, URL.."/auth?key="..KEY.."&nonce="..Rand.."&sign="..Sign.."&id="..PublicKeyClient)

    if Respone.Body:find('key ur expired') then
        removekey()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Banana Hub Notification";
            Text = "Invalid Key or Key Expired\n goto https://banana-hub.xyz/getkey get new key";
            Duration = 5;
        })
        titleText.Text = "Banana Hub        nvalid Key or Key Expired"
        return
    end

    if Respone.Body == 'Invalid Key' then
        removekey()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Banana Hub Notification";
            Text = "Invalid Key or Key Expired\n goto https://banana-hub.xyz/getkey get new key";
            Duration = 5;
        })
        titleText.Text = "Banana Hub         Invalid Key or Key Expired"
        return
    end
        
    if Respone.Body == HwidUser then
        removekey()
        titleText.Text = "Banana Hub         Invalid Hwid!"
        return
    end
        
    if Respone.Body == 'retry again!' then
        removekey()
        titleText.Text = "Banana Hub         Invalid Signature!"
        return
    end

    local Data
    local s, e = pcall(function()
        Data = split(Respone.Body, '-')
    end)
    print('[Whitelist#1]: check key diffie-hellman')
    local SecureKeyPrivate = mod(Data[2], PrivateKeyClient, publicKEY2)

    if Respone.Body ~= md5sumhexa(SecureKeyPrivate..PublicKeyClient..KEY..tostring(ServerTime):sub(1, -4)..HwidUser)..'-'..Data[2] then
        removekey()
        titleText.Text = "Banana Hub                Invalid Signature!"
        return
    end
    print('[Whitelist#1]: check response')
    if Data[1] == md5sumhexa(SecureKeyPrivate..PublicKeyClient..KEY..tostring(ServerTime):sub(1, -4)..HwidUser) then
        savekey()
        titleText.Text = "Banana Hub                whitelist success"
        mainFrame:Destroy()
        print('whitelist success')
        whitelistsuccess = true
    end
end

if getgenv().Key then
    checkingwl(getgenv().Key)
end

if readkey() then
    checkingwl(readkey())
end

buttonCheckKey.MouseButton1Click:Connect(function()
    if Fluxus then 
        checkingwl(getkey())
    else 
        titleText.Text = "Banana Hub                Use Fluxus Please"
    end 
end)

buttonGetKey.MouseButton1Click:Connect(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Banana Hub Notification";
        Text = "Open folder Exploit goto /workspace/ open getkey.txt \n copy link get key";
        Duration = 5;
    })
    titleText.Text = "Goto https://banana-hub.xyz/getkey"
    setclipboard("https://banana-hub.xyz/getkey")
    writefile('getkey.txt', 'https://banana-hub.xyz/getkey')
end)
repeat wait() until whitelistsuccess
repeat wait()
until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")
repeat wait()
    pcall(function()
        if getgenv().Marines then
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        else
            for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                v.Function()
            end
        end
    end)
until game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") and   not  game:GetService("Players").LocalPlayer.PlayerGui.Main:WaitForChild("ChooseTeam").Visible or not game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam")
repeat wait()
until game:GetService("Players").LocalPlayer:FindFirstChild("WeaponAssetCache")

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
getgenv().OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/skidcongaimetuimay.lua')))()
local Window = OrionLib:MakeWindow({Name = "Banana Hub",IntroText = "Banana Library"})
local Tab7 = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab11 = Window:MakeTab({
	Name = "Local Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab3 = Window:MakeTab({
	Name = "DF and Raid",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab8 = Window:MakeTab({
	Name = "Status and Server",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab9 = Window:MakeTab({
	Name = "Upgrade Race",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab4 = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab5 = Window:MakeTab({
	Name = "Get Items",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab6 = Window:MakeTab({
	Name = "PVP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab10 = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local plr = game.Players.LocalPlayer
local CommF = game.ReplicatedStorage.Remotes["CommF_"]
local Settings = {}
local HttpService = game:GetService("HttpService")
local FolderName = "Banana Hub"
local SaveFileNameGame = "-BloxFruit.json"
local SaveFileName = game.Players.LocalPlayer.Name..SaveFileNameGame
local SettingHopServer = {}
local DefaultSettingHopServer = {}
function SaveSettings(fff,fff2)
    if fff~=nil then
        Settings[fff] = fff2
    end
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    writefile(FolderName.."/" .. SaveFileName, HttpService:JSONEncode(Settings))
end

function ReadSetting()
local s,e = pcall(function()
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    return HttpService:JSONDecode(readfile(FolderName.."/" .. SaveFileName))
end)
if s then return e
else
    SaveSettings()
    return ReadSetting()
end
end
Settings = ReadSetting()
if not pcall(function() readfile(FolderName.."/" .. "Jobid.json") end) then
    writefile(FolderName.."/" .. "Jobid.json", game:GetService("HttpService"):JSONEncode(DefaultSettingHopServer))
end
function CheckJobIdServer()
    local mmb = {}
    for i,v in next,game:GetService("HttpService"):JSONDecode(readfile(FolderName.."/" .. "Jobid.json")) do
        table.insert(mmb,i) 
    end
    return mmb 
end
function HopServer()
    local function Hop()
        for i=1,100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k,v in pairs(huhu) do
                if v.Count >= 10 and k ~= game.JobId and not table.find(CheckJobIdServer(),k) then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                    writefile(FolderName.."/" .. "Jobid.json", game:GetService("HttpService"):JSONEncode(SettingHopServer))
                end
            end
        end
    end
    local v14 = require(game:GetService("ReplicatedStorage").Notification)
    v14.new("<Color=Red>Banana Hub : Wait "..(tostring(Settings["Delay HopServer"]) or "15").."s[Hop Server]<Color=/>"):Display()
    while wait(Settings["Delay HopServer"] or 15) do
        local v14 = require(game:GetService("ReplicatedStorage").Notification)
        v14.new("<Color=Red>Banana Hub : Hop Server<Color=/>"):Display()
        Hop()
    end
end
SettingHopServer = HttpService:JSONDecode(readfile(FolderName.."/" .. "Jobid.json"))
SettingHopServer[game.JobId] = true
local Section = Tab:AddSection({
	Name = "Setting Farm"
})
Tab:AddDropdown({
	Name = "Select Weapon",
	Default =  Settings["Select Weapon"] or "Melee",
	Options = {'Blox Fruit', 'Sword', 'Melee'},
    Flag = "Select Weapon",
	Callback = function(Value)
		SaveSettings("Select Weapon",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Buso",
	Default = Settings["Auto Buso"] or true,
    Flag = "Auto Buso",
    Callback = function(Value)
        SaveSettings("Auto Buso",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Turn On Haki Observation",
	Default = Settings["Auto Turn On Haki Observation"] or false,
    Flag = "Auto Turn On Haki Observation",
    Callback = function(Value)
        SaveSettings("Auto Turn On Haki Observation",Value)
	end    
})
Tab:AddToggle({
	Name = "Double Quest",
	Default = Settings["Double Quest"] or true,
    Flag = "Double Quest",
	Callback = function(Value)
        SaveSettings("Double Quest",Value)
	end    
})

Tab:AddToggle({
	Name = "Reset Teleport[Not Use Get Item Or ...]",
	Default = Settings["Reset Teleport"] or false,
    Flag = "Reset Teleport",
	Callback = function(Value)
        SaveSettings("Reset Teleport",Value)
	end    
})


function FFCMatch(Ins, Name)
    for k, v in pairs(Ins:GetChildren()) do
        if string.match(v.Name, Name) then
            return v
        end
    end
    return nil
end

spawn(function()
    while task.wait() do
        if OrionLib.Flags["Auto Buso"].Value then
            pcall(function() 
                if not FFCMatch(plr.Character, "_BusoLayer1") and not plr.Character:FindFirstChild("HasBuso") then
                    CommF:InvokeServer("Buso")
                    task.wait(2)
                end
            end)
        end
    end
end)
spawn(function()
    while  task.wait() do
        if OrionLib.Flags["Auto Turn On Haki Observation"].Value then
            pcall(function() 
                if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    task.wait(3)
                end
            end)
        end
    end
end)
Tab:AddToggle({
    Name = "Auto Turn On Race v4",
    Default = Settings["Auto Turn On Race v4"] or false,
    Flag = "Auto Turn On Race v4",
    Callback = function(Value)
        SaveSettings("Auto Turn On Race v4",Value)
    end    
})
spawn(function()
    while  task.wait() do
        if OrionLib.Flags["Auto Turn On Race v4"].Value then
            pcall(function() 
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") 
                and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
                and game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and not game.Players.LocalPlayer.Character.RaceTransformed.Value   then
                    local args = {
                        [1] = true
                    }
                    game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
Tab:AddToggle({
    Name = "Fast Attack",
    Default = Settings["Fast Attack"] or true,
    Flag = "Fast Attack",
    Callback = function(Value)
        SaveSettings("Fast Attack",Value)
    end    
})
Tab:AddToggle({
    Name = "Auto Click",
    Default = Settings["Auto Click"] or false,
    Flag = "Auto Click",
    Callback = function(Value)
        SaveSettings("Auto Click",Value)
    end    
})
Tab:AddDropdown({
	Name = "Select Speed Attack",
	Default =  Settings["Select Speed Attack"] or 0.1,
	Options = { 0,0.1,0.15,0.2},
    Flag = "Select Speed Attack",
	Callback = function(Value)
		SaveSettings("Select Speed Attack",Value)
	end    
})

spawn(function()
    loadstring([[
        local env = getgenv()
        local oldSkill
        oldSkill = hookfunction(require(game.ReplicatedStorage.Util).BodyMover.Create,function(p3,p4, p5)
            if p5.ID and env.OrionLib.Flags["No Stun"].Value then
                p5.Duration = 0
            end
            return oldSkill(p3,p4, p5)
        end)
        require(game:GetService("ReplicatedStorage").Util.CameraShaker):Stop()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    ]])()
end)
loadstring([[
    local MT = getrawmetatable(game)
    local OldNameCall = MT.__namecall
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local Args = {...}
    if Method == 'FireServer' and self.Name == 'RemoteEvent' and getgenv().psskill and (getgenv().OrionLib.Flags["Auto Mastery"].Value or getgenv().OrionLib.Flags["Auto Seabeast"].Value or OrionLib.Flags["Auto Aimbot"].Value or SeabeastAim or autospamskillTrial ) then
        if  #Args == 1 and typeof(Args[1]) == "Vector3" then
            Args[1] = getgenv().psskill.Position
        end
        if #Args == 1 and typeof(Args[1]) == "CFrame" then
            Args[1] = getgenv().psskill
        end
    end
    return OldNameCall(self, unpack(Args))
end)
setreadonly(MT, true)]])()
loadstring([[
    local olddd
    olddd = hookmetamethod(game, "__index", function(self, key)
        if tostring(key):lower()== 'hit' and getgenv().psskill and ((getgenv().OrionLib.Flags["Select Method Mastery"].Value == "Gun" and getgenv().OrionLib.Flags["Auto Mastery"].Value) or OrionLib.Flags["Auto Aimbot"].Value) then
            return getgenv().psskill
        end
    return olddd(self, key)
end)]])()
getgenv().CountAttack = 0
loadstring([[
    local env = getgenv()
    local old
    old = hookfunction(require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).getBladeHits,function(...) 
        local a,b = ...
        local Magnitude = 50
        if not env.Fastattack and not env.StartAutoAttack then 
            Magnitude = 5
        end
        local returned = old(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},Magnitude)
        if env.StartAutoAttack then
            local cac = {}
            local hash = {}
            for k, v in pairs(returned) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    if v.Parent.Parent.Name == "Enemies" then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
            end
            returned = cac
        end
        if #returned > 0  and env.Fastattack  then 
            if env.CountAttack == 0  then
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",b[1].Parent.Parent.Name)
                env.CountAttack = 1
            else 
                env.CountAttack = 0
            end
        end
        return returned
    end)
]])()


local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]
function autoattack()
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
        spawn(function()
            ret.activeController:attack()
            ret.activeController.timeToNextAttack = 0
            ret.activeController.attacking = false
            ret.activeController.increment = 3
        end)
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Fast Attack"].Value then 
                getgenv().Fastattack = true 
            else
                getgenv().Fastattack = false
            end 
        end)
    end
end)
function DetectFastAttack()
    getgenv().StartAutoAttack = true
end
local CountAttack = 0

spawn(function()
    --[[while task.task.wait() do 
        pcall(function()
            if getgenv().StartAutoAttack  then
                autoattack()
                task.task.wait(OrionLib.Flags["Select Speed Attack"].Value+0.02)
                getgenv().StartAutoAttack = false 
            end
        end)
    end]]
    game:GetService("RunService").RenderStepped:connect(function()
        if getgenv().StartAutoAttack  then
            autoattack()
            task.task.wait(OrionLib.Flags["Select Speed Attack"].Value+0.01)
            getgenv().StartAutoAttack = false 
        end
    end)
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Click"].Value  then
                autoattack()
            end
        end)
    end
end)

function poscheckspawn(pos)
    dist = math.huge
    local name
    for i,v in next,game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren() do
        if v:IsA("Model") then
            local magnitude = (v.Part.Position - pos).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
if game.PlaceId == 7449423635 then 
    TableLocations = {
        ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
        ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
        ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
        ["Great Tree"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
        ["Temple Clock"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
    }
elseif game.PlaceId == 2753915549 then
    TableLocations = {
        ["FishmanSea1"] =  game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position,
        ["Island Sky 2"] =   game:GetService("Workspace").Map.SkyArea2.PathwayHouse.EntrancePoint.Position,
        ["Island Sky 1"] = game:GetService("Workspace").Map.SkyArea1.PathwayTemple.ExitPoint.Position,
    }
elseif game.PlaceId == 4442272183 then
    TableLocations = {
        ["GhostShipInterior"] = game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position
    }
end
function toTarget(pos, targetPos, targetCFrame,TpInstant)
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Sit then
        getgenv().noclip = false
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
        plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,10,0)
        return 
    end
    local aaa = Settings["Tween Speed"] or 160
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/aaa, Enum.EasingStyle.Quad)
    if game.PlaceId == 7449423635 and  (targetPos-Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)).Magnitude > 3000 and  (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then 
        getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new((Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586) - plr.Character.HumanoidRootPart.Position).Magnitude/aaa, Enum.EasingStyle.Quad), {CFrame = CFrame.new(28609.392578125, 14896.533203125, 106.4216537475586)})
        getgenv().noclip = true
        getgenv().Tween:Play()
        if (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then 
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","TeleportBack")
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
        end
        return
    end
    if game.PlaceId == 2753915549 and (targetPos-game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position).Magnitude > 3000 and  (game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
        return 
    elseif game.PlaceId == 4442272183 and (targetPos-game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position).Magnitude > 3000 and  (game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",game:GetService("Workspace").Map.GhostShip.TeleportSpawn.Position)
        return 
    end
    if TableLocations then
        for i,v2 in pairs(TableLocations) do
            if  (targetPos-v2).Magnitude <= 3000 and  (targetPos-plr.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end
                args = {
                    "requestEntrance",
                    v2,
                }
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                return 
            end
        end
    end
    if (not OrionLib.Flags["Auto Raid and Find DF"].Value)  and (targetPos-pos).Magnitude >= 3000 and  OrionLib.Flags["Reset Teleport"].Value and poscheckspawn(targetPos).Name ~= game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value   then
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
        plr.Character.LastSpawnPoint.Disabled = true
        local TimeReset = tick()
        repeat task.wait()
            plr.Character.LastSpawnPoint.Disabled = true
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", poscheckspawn(targetPos).Name)
            plr.Character.HumanoidRootPart.CFrame = poscheckspawn(targetPos).Part.CFrame
            if tick()-TimeReset >= 3 and plr.Character.Humanoid.Health > 0 then
                plr.Character.Humanoid.Health = 0
                task.wait()
                TimeReset = tick()
            end
        until poscheckspawn(targetPos).Name == game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value or not OrionLib.Flags["Reset Teleport"].Value
        plr.Character.Humanoid.Health = 0
        repeat task.wait()
        until plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 
        return
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
        if (targetPos-pos).Magnitude <= 200 and not OrionLib.Flags["Auto Chest"].Value  and not TpInstant then
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
            getgenv().noclip = true
            plr.Character.HumanoidRootPart.CFrame = targetCFrame
        else
            local a = Vector3.new(0,plr.Character:FindFirstChild("HumanoidRootPart").Position.Y,0) 
            local b = Vector3.new(0,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,0)
            if (a-b).Magnitude <= 60 then
                plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,20,0)
            end
            getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = targetCFrame})
            getgenv().noclip = true
            getgenv().Tween:Play()
        end
    end
end

function sizepart(v)
    v.HumanoidRootPart.CanCollide = false
    if syn or Fluxus then
        v.Humanoid:ChangeState(11)
    else
        for i,x in next,v:GetDescendants() do 
            if (x:IsA("Part") or x:IsA("MeshPart")) and not string.find(v.Name,"Leg") and  x.CanCollide then 
                x.CanCollide = false 
            end
        end
    end
    if not v.HumanoidRootPart:FindFirstChild("vando") then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(100000, 100000, 100000)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end
game:GetService("RunService").RenderStepped:connect(function()
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end)
getgenv().ButtonRipIndra = false
function ToggleNoclip()
    if OrionLib.Flags["Auto Farm"].Value
    or OrionLib.Flags["Elite Hunter"].Value 
    or OrionLib.Flags["Raid Castle"].Value
    or OrionLib.Flags["Auto Boss"].Value 
    or OrionLib.Flags["Auto Dough King"].Value
    or OrionLib.Flags["Citizen Quest"].Value 
    or OrionLib.Flags["Auto Seabeast"].Value
    or OrionLib.Flags["Soul Guitar"].Value
    or OrionLib.Flags["Cursed Dual Katana"].Value
    or OrionLib.Flags["Canvander"].Value
    or OrionLib.Flags["Buddy Sword"].Value
    or OrionLib.Flags["Yama"].Value
    or OrionLib.Flags["Tushita"].Value
    or OrionLib.Flags["Auto Raid and Find DF"].Value
    or OrionLib.Flags["Auto Rip Indra"].Value
    or  OrionLib.Flags["Auto Spawn Rip Indra"].Value
    or OrionLib.Flags["Auto Chest"].Value
    or OrionLib.Flags["Auto Get Blue Gear"].Value 
    or OrionLib.Flags["Pull Lever"].Value  
    or OrionLib.Flags["Upgrade Race V2-V3"].Value 
    or OrionLib.Flags["Auto Trial"].Value
    or OrionLib.Flags["Auto New World"].Value 
    or OrionLib.Flags["Auto Third Sea"].Value
    or NoclipButton  
    or OrionLib.Flags["Dragon Talon"].Value 
    or OrionLib.Flags["Electric Claw"].Value 
    or OrionLib.Flags["Sharkman Karate"].Value 
    or OrionLib.Flags["DeathStep"].Value
    or OrionLib.Flags["SuperHuman"].Value
    or OrionLib.Flags["Teleport Island"].Value
    or OrionLib.Flags["Auto Kill Player When complete Trial"].Value
    or OrionLib.Flags["Find DF"].Value
    or OrionLib.Flags["Auto Next Island"].Value
    or OrionLib.Flags["Teleport Mirage"].Value
    or OrionLib.Flags["Farm Observation"].Value
    or OrionLib.Flags["Auto Factory"].Value
    or OrionLib.Flags["Saber Sword"].Value
    or OrionLib.Flags["Farm Select Mob"].Value
    or OrionLib.Flags["Auto Get Cyborg"].Value
    or OrionLib.Flags["Auto Get Ghoul"].Value then
        return true 
    end
end

if syn   then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")

    game:GetService('RunService').Stepped:connect(function()
        pcall(function()
            if getgenv().noclip and ToggleNoclip()  then
                if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0    then
                    plr.Character.Humanoid:ChangeState(11)
                end 
            end
        end)
    end)
else
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
    if Fluxus then 
        function isnetworkowner2(p1)
            for i,v in next,game.Workspace.Characters:GetChildren() do 
                if v.Name ~= plr.Name and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-p1.Position).Magnitude <= 300 then 
                    return false 
                end
            end
            return true
        end
        function isnetworkowner(p1)
            local A = gethiddenproperty(plr,"SimulationRadius")
            local B = plr.Character or Wait(plr.CharacterAdded)
            local C = game.WaitForChild(B, "HumanoidRootPart", 300)
            if C then
                if p1.Anchored then
                    return false
                end
                if game.IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A then
                    return true
                end
            end
            return false
        end
    end
    function CreateTweenFloat()
        if not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
            local BV = Instance.new("BodyVelocity")
            BV.Parent = plr.Character.HumanoidRootPart
            BV.Name = "EffectsSY"
            BV.MaxForce = Vector3.new(0, 100000, 0)
            BV.Velocity = Vector3.new(0, 0, 0)
        end
    end
    local LocalPlayer = game:GetService("Players").LocalPlayer   
    local function getTorso(LocalPlayer)
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character:FindFirstChild('UpperTorso') then
                return LocalPlayer.Character.UpperTorso
            else
                return LocalPlayer.Character.Torso
            end
        end
    end    
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().noclip and ToggleNoclip() then
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
                for i,v in next,LocalPlayer.Character:GetDescendants() do 
                    if (v:IsA("Part") or v:IsA("MeshPart")) and  v.CanCollide then 
                        v.CanCollide = false 
                    end
                end
            end
        end
    end)
    game:GetService('RunService').Stepped:connect(function()
        pcall(function()
            if getgenv().noclip and ToggleNoclip() then
                if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0 then
                    spawn(function()
                        CreateTweenFloat()
                    end)
                end
            end
            spawn(function()
                pcall(function()
                    if not ToggleNoclip() then
                        if plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                            plr.Character.HumanoidRootPart.EffectsSY:Destroy()
                        end
                    end
                end)
            end)
        end)
    end)
end
function getcenter(name)
    local count = 0
    local vec
    if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            if v.Name == name  then  
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
        for i, v in pairs(getnilinstances()) do
            if v:IsA("Part") and v.Name == name  then  
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
    else
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do 
            if  v.Name == tostring(name:gsub(" %pLv. %d+%p", "")) then
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
        for i, v in pairs(getnilinstances()) do 
            if v:IsA("Part") and  v.Name == tostring(name:gsub(" %pLv. %d+%p", "")) then
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
    end
    vec = vec / count
    return CFrame.new(vec)
end
function DetectPartMobBring(name,a,b,c)
    local Mob = {}
    local name1 
    if string.find(name,"Lv.") then 
        name1 = name:gsub(" %pLv. %d+%p", "")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if  v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            table.insert(Mob,v)
        end
    end
    for i, v in pairs(getnilinstances()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            table.insert(Mob,v)
        end
    end
    if b then
        local dist = math.huge
        local Closest
        for i,v in next,Mob do 
            local conconcac = (a.HumanoidRootPart.Position-v.Position).Magnitude
            if dist > conconcac then 
                dist = conconcac 
                Closest = v 
            end
        end
        return Closest
    else
        local mob2 = {}
        for i,v in next,Mob do 
            if (c.Position-v.Position).Magnitude <= 300 then 
                table.insert(mob2,v)
            end
        end
        if #mob2 < #Mob then 
            print("condimemay")
            return true 
        end
    end
end

local CenterMob
local NameMobBring 
local PosBring
local PositionBring

function DeleteIgnoredMob()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Ignored")  then 
            v.Ignored:Destroy()
        end
    end
end
function BringMob(a)
    --[[
    if a and not NameMobBring then 
        if (a.HumanoidRootPart.Position-getcenter(a.Name)).Magnitude < 250  then 
            PosBring = getcenter(a.Name)
        else
            PosBring = a.HumanoidRootPart.Position
        end
        NameMobBring = a.Name 
        return 
    elseif NameMobBring ~= a.Name then 
        if (a.HumanoidRootPart.Position-getcenter(a.Name)).Magnitude < 250  then 
            PosBring = getcenter(a.Name)
        else
            PosBring = a.HumanoidRootPart.Position
        end
        NameMobBring = a.Name 
        return 
    end
    if (plr.Character.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 100 then
        for i,v in pairs(game.workspace.Enemies:GetChildren()) do
            if v.Name == a.Name  and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart)  then 
                if PosBring  and v.Name == "Chief Petty Officer [Lv. 120]" and (v.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 250 then
                    v.HumanoidRootPart.CFrame = CFrame.new(a.HumanoidRootPart.Position)
                    sizepart(v)
                elseif (v.HumanoidRootPart.Position-PosBring).Magnitude <= 250 then
                    v.HumanoidRootPart.CFrame = CFrame.new(PosBring)
                    sizepart(v)
                end
            end
        end
    end]]
    if a and NameMobBring ~= a then
        NameMobBring = a 
        --PositionBring = DetectPartMobBring(a.Name,a).CFrame
        PositionBring = getcenter(a.Name)
        if DetectPartMobBring(a.Name,a,false,PositionBring) then
            PositionBring = DetectPartMobBring(a.Name,a,true).CFrame
        end
        DeleteIgnoredMob()
    end
    if (plr.Character.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 100 then
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == a.Name and not v:FindFirstChild("Ignored") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart) and isnetworkowner2(v.HumanoidRootPart) then 
                if  (v.HumanoidRootPart.Position-PositionBring.Position).Magnitude <= 350 then
                    v.HumanoidRootPart.CFrame = PositionBring 
                    sizepart(v)
                end
            end
        end
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == a.Name and not v:FindFirstChild("Ignored") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart) and isnetworkowner2(v.HumanoidRootPart) then 
                if  (v.HumanoidRootPart.Position-PositionBring.Position).Magnitude <= 350 then
                    local oldhealthmob = v.Humanoid.Health
                    task.wait(3.5)
                    if v.Humanoid.Health == oldhealthmob then 
                        local Ignored = Instance.new("IntValue", v)
                        Ignored.Name = "Ignored"
                        task.wait(0.3)
                    end
                end
            end
        end
    end
end
function checkcountitem(x,xx)
    for i,v in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Name == x and v.Count >= xx then
            return true
        end
    end
    return false
end
function CheckNameBoss(a)
    for i,v in next,game.ReplicatedStorage:GetChildren() do
        if v:IsA("Model") and  ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in next,game.Workspace.Enemies:GetChildren() do
        if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a)  and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function equiptool(toolname,x)
    if not x then
        if  OrionLib.Flags["Dragon Talon"].Value 
        or OrionLib.Flags["Electric Claw"].Value 
        or OrionLib.Flags["Sharkman Karate"].Value 
        or OrionLib.Flags["DeathStep"].Value
        or OrionLib.Flags["SuperHuman"].Value then 
            if plr.Backpack:FindFirstChild(NameWeapon("Melee"))  then
                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(NameWeapon("Melee")))
            end
        else
            if plr.Backpack:FindFirstChild(toolname)  then
                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(toolname))
            end
        end
    else
        if plr.Backpack:FindFirstChild(toolname)  then
            plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(toolname))
        end
    end
end
function NameWeapon(x)
    local a 
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    return a 
end
local MobKatakuri = {
    "Baking Staff [Lv. 2250]",
    "Head Baker [Lv. 2275]",
    "Cake Guard [Lv. 2225]",
    "Cookie Crafter [Lv. 2200]"
}
local MobConjuredCocoa = {
    "Cocoa Warrior [Lv. 2300]",
    "Chocolate Bar Battler [Lv. 2325]",
    "Candy Rebel [Lv. 2375]",
    "Sweet Thief [Lv. 2350]",
}
local TableEliteHunter = {
    "Deandre [Lv. 1750]",
    "Urban [Lv. 1750]",
    "Diablo [Lv. 1750]",
}
local TableMobBones = {
    "Reborn Skeleton [Lv. 1975]",
    "Demonic Soul [Lv. 2025]",
    "Living Zombie [Lv. 2000]",
    "Posessed Mummy [Lv. 2050]",
}
local MobBlacklist = {}
function DetectPartSpawnMob(name)
    local name1 
    if string.find(name,"Lv.") then 
        name1 = name:gsub(" %pLv. %d+%p", "")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if  v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
    for i, v in pairs(getnilinstances()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
end
function TeleportSpawnMob(Path,value)
    if typeof(Path) == "table" then
        if #MobBlacklist >= 4 then 
            MobBlacklist = {}
            return 
        end
        local GetPart
        for i,v in next,Path do
            if not table.find(MobBlacklist,v) then
                GetPart = DetectPartSpawnMob(v)
                repeat task.wait()
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
                until  (GetPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(Path) or not value
            end
        end
    else
        GetPart = DetectPartSpawnMob(Path)
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
    end
end
function DetectMob(c)
    local dist = math.huge
    local name 
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        if  ((typeof(c) == "table" and (table.find(c, v.Name) or table.find(c, stringgsub))) or (v.Name == c or c == stringgsub)) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
local Section = Tab:AddSection({
	Name = "Farm Main"
})
Tab:AddDropdown({
	Name = "Select Method Farm",
	Default =  Settings["Select Method Farm"] or "Level Farm",
	Options = { 'Level Farm', 'Farm Bones', 'Farm Katakuri'},
    Flag = "Select Method Farm",
	Callback = function(Value)
		SaveSettings("Select Method Farm",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Farm",
	Default = Settings["Auto Farm"] or false,
    Flag = "Auto Farm",
	Callback = function(Value)
        SaveSettings("Auto Farm",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto New World",
	Default = Settings["Auto New World"] or false,
    Flag = "Auto New World",
	Callback = function(Value)
        SaveSettings("Auto New World",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Third Sea",
	Default = Settings["Auto Third Sea"] or false,
    Flag = "Auto Third Sea",
	Callback = function(Value)
        SaveSettings("Auto Third Sea",Value)
	end    
})
local TabMastery =  Tab:AddToggle({
	Name = "Auto Mastery",
	Default =  false,
    Flag = "Auto Mastery",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Farm"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Farm, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end    
})
print(TabMastery)
Tab:AddDropdown({
	Name = "Select Method Mastery",
	Default =  "Blox Fruit",
	Options = {"Blox Fruit","Gun"},
    Flag = "Select Method Mastery",
	Callback = function(Value)
	end    
})
Tab:AddSlider({
    Name = "% Health Mob",
    Min = 0,
    Max = 100,
    Default = 40,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "% Health Mob",
    Flag = "% Health Mob",
    Callback = function(Value)
    end    
})
Tab:AddToggle({
	Name = "Use Skill Z",
	Default =  false,
    Flag = "Z",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill X",
	Default =  false,
    Flag = "X",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill C",
	Default =  false,
    Flag = "C",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill V",
	Default =  false,
    Flag = "V",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill F",
	Default =  false,
    Flag = "F",
	Callback = function(Value)
	end    
})
function CFrameQuest()
    getgenv().QuestPoses = {}
    for i, v in pairs(getnilinstances()) do 
        if v:IsA("Model")
        and v:FindFirstChild("Head")
        and v.Head:FindFirstChild("QuestBBG")
        and v.Head.QuestBBG.Title.Text == "QUEST" then
            getgenv().QuestPoses[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)    
        end
    end

    for i, v in pairs(game.Workspace.NPCs:GetDescendants()) do 
        if v.Name == "QuestBBG"
        and v.Title.Text == "QUEST" then
            getgenv().QuestPoses[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)    
        end
    end

    getgenv().DialoguesList = {}
    for i, v in pairs(require(game.ReplicatedStorage.DialoguesList)) do
        getgenv().DialoguesList[v] = i
    end

    local kiet = getscriptclosure(game:GetService("Players").LocalPlayer.PlayerScripts.NPC)

    local listremote = {}
    for k,v in pairs(debug.getprotos(kiet)) do 
        if #debug.getconstants(v)==1 then 
            table.insert(listremote, debug.getconstant(v,1))    
        end 
    end
    local start=false
    local listtvk = {}
    for k,v in pairs(debug.getconstants(kiet)) do
        if type(v) == "string" then 
            if v == "Players" then 
                start = false
            end
            if not start then 
                if v == "Blox Fruit Dealer" then 
                    start = true    
                end  
            else
            end
            if start then 
                table.insert(listtvk,v)    
            end
        end   
    end
    local questpoint1 = {}
    getgenv().questpoint = {}

    for k,v in pairs(listtvk) do 
        if QuestPoses[v] then 
            questpoint1[listremote[k]]=listtvk[k]    
        end
    end

    for i,v in next, questpoint1 do
        getgenv().questpoint[i] = QuestPoses[v]
    end
    getgenv().questpoint["SkyExp1Quest"] = CFrame.new(-7857.28516, 5544.34033, -382.321503, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
end
CFrameQuest()
local UselessQuest = {
    "BartiloQuest",
    "Trainees",
    "MarineQuest",
    "CitizenQuest"
}
local MobsList = {}
getgenv().mob = ''
getgenv().mobv = ""
local Quest = require(game.ReplicatedStorage.Quests)
local function checkquest()
    local lvlPl = plr.Data.Level.Value
    local min = 0
    if lvlPl >= 1450 and game.PlaceId == 4442272183 then 
        getgenv().mobv = "Water Fighter"
        getgenv().mobvv = "ForgottenQuest"
        getgenv().mobvvv = 2
    elseif lvlPl >= 700 and game.PlaceId == 2753915549 then
        getgenv().mobv = "Galley Captain"
        getgenv().mobvv = "FountainQuest"
        getgenv().mobvvv = 2
    else
        for i,v in pairs(Quest) do
            for i1,v1 in pairs(v) do
                local lvlreq = v1.LevelReq
                for i2,v2 in pairs(v1.Task) do
                    if lvlPl >= lvlreq and lvlreq >= min and v1.Task[i2] > 1 and not table.find(UselessQuest, tostring(i)) then
                        min = lvlreq
                        getgenv().mobv = tostring(i2)
                        getgenv().mobvv = i
                        getgenv().mobvvv = i1
                    end
                end
            end
        end
    end
end
function checkdoublquest()
    local a = {}
    for i,v in pairs(Quest) do
        for i1,v1 in pairs(v) do
            local lvlreq = v1.LevelReq
            for i2,v2 in pairs(v1.Task) do
                if i2 == getgenv().mobv then
                    for i3,v3 in next,v do
                        if v3.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and v3.Name ~= "Town Raid" then
                            for i4,v4 in next,v3.Task do
                                if v4 > 1 then
                                    table.insert(a,i4)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return a 
end
local v17 = require(game.ReplicatedStorage:WaitForChild("GuideModule"));
function checkquestdata()
    for i,v in next,v17.Data do
        if i == "QuestData" then
            return true
        end
    end
    return false
end
function checknamedoublquest()
    local a 
    if checkquestdata() then
        for i,v in next,v17.Data.QuestData.Task do
            a = i 
        end
    end
    return a 
end
function doublequestdeptrai()
    checkquest()
    local aa = {}
    if OrionLib.Flags["Double Quest"].Value and checkquestdata() and  checknamedoublquest() == getgenv().mobv  and #checkdoublquest() >= 2 then
        for i,v in pairs(Quest) do
            for i1,v1 in pairs(v) do
                for i2,v2 in pairs(v1.Task) do
                    if tostring(i2) == getgenv().mobv then
                        for quest1,quest2 in next,v do
                            for quest3,quest4 in next,quest2.Task do
                                if  quest3 ~= getgenv().mobv and quest4 > 1 then
                                    aa["Name"] = tostring(quest3)
                                    aa["NameQuest"] = i
                                    aa["ID"] = quest1
                                    return aa
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        aa["Name"] = getgenv().mobv
        aa["NameQuest"] = getgenv().mobvv
        aa["ID"] = getgenv().mobvvv
        return aa
    end
end
function teleportquestdeptrai(i)
    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getgenv().questpoint[tostring(i)].Position,getgenv().questpoint[tostring(i)]*CFrame.new(0,4,2),true)
end
function getquest()
    if not getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)] then
        CFrameQuest()
        return 
    end
    if (getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
        task.wait(1)
        if plr.Character.Humanoid.Health > 0 then 
            CommF:InvokeServer("StartQuest", tostring(doublequestdeptrai().NameQuest), doublequestdeptrai().ID)
        end
    else
        teleportquestdeptrai(doublequestdeptrai().NameQuest)
    end
end
function checkskillMastery(x)
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[x]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and OrionLib.Flags[v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function WeaponsMastery()
    local a
    for i,v in next,plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == OrionLib.Flags["Select Method Mastery"].Value then
            a = v.Name 
        end
    end
    for i,v in next,plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == OrionLib.Flags["Select Method Mastery"].Value then
            a = v.Name 
        end
    end
    return a 
end
local StartFarm = true
local RaidCastleStart = false
local EletrciClawStart = false
function StopFarm()
    if OrionLib.Flags["Find DF"].Value and GetPathFruit() then StartFarm = false return end
    if  CheckNameBoss("Core")  and game.PlaceId == 4442272183 and OrionLib.Flags["Auto Factory"].Value then StartFarm = false  return  end
    if RaidStart then StartFarm = false return end
    if StopThirdSea() then StartFarm = false return end
    if game.PlaceId == 2753915549 and plr.Data.Level.Value >= 700 and OrionLib.Flags["Auto New World"].Value then StartFarm = false return end
    if OrionLib.Flags["Raid Castle"].Value and RaidCastleStart  then StartFarm = false  return end  
    if OrionLib.Flags["Elite Hunter"].Value and DetectEliteHunter()  then StartFarm = false return  end  
    if EletrciClawStart then return end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then  StartFarm = false return end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then StartFarm = false return end
    StartFarm = true
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Farm"].Value then 
                StopFarm()
            end
        end)
    end
end)
local QuestKillPlayer = false
blnamequest = {}
function DetectKillPlayerQuest()
    local namequest = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat ","")
    namequest = string.gsub(namequest," %p(0/1)%p","")
    if plr.PlayerGui.Main:FindFirstChild("Quest").Visible  and not game:GetService("Workspace").Characters:FindFirstChild(namequest) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        print(namequest)
    end
    if game.Players[namequest].Data.Level.Value >= 20 and game.Players[namequest].Data.Level.Value >= 150 then 
        table.insert(blnamequest,namequest)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        print(namequest,game.Players[namequest].Data.Level.Value)
        return 
    end
end
function checksafezone(p)
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if (v.Position-p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90/100 then
                return true
            end
        end
    end
    return false
end
function FarmMethod()
    if not StartFarm then 
        return 
    end
    local MethodFarm 
    local LevelQuest
    local NameQuest 
    local IDQuest = 2
    if OrionLib.Flags["Select Method Farm"].Value == "Farm Katakuri" then
        MethodFarm = MobKatakuri
        NameQuest = "CakeQuest2"
        LevelQuest = 2275
    elseif OrionLib.Flags["Select Method Farm"].Value == "Farm Bones" then
        MethodFarm = TableMobBones
        NameQuest = "HauntedQuest2"
        LevelQuest = 2050
    end
    if MethodFarm then
        if plr.Data.Level.Value >= LevelQuest and not plr.PlayerGui.Main:FindFirstChild("Quest").Visible then  
            if not getgenv().questpoint[NameQuest] then
                CFrameQuest()
                return 
            end
            if (getgenv().questpoint[NameQuest].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
                task.wait(1)
                if plr.Character.Humanoid.Health > 0 then 
                    CommF:InvokeServer("StartQuest", NameQuest, IDQuest)
                end
            else
                teleportquestdeptrai(NameQuest)
            end
            return 
        end
        if  OrionLib.Flags["Select Method Farm"].Value == "Farm Katakuri"  then 
            if CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]")  then
                local v = CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]")
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,-20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value
                return
            else
                local v204 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                if v204:find("open the portal now") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                end 
            end
        end
        if not DetectMob(MethodFarm) then 
            TeleportSpawnMob(MethodFarm, ( not StartFarm  or OrionLib.Flags["Auto Farm"].Value))
        else
            local v = DetectMob(MethodFarm)
            repeat task.wait()
                task.spawn(function()
                    BringMob(v)
                end)
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if OrionLib.Flags["Auto Mastery"].Value then
                    getgenv().psskill = v.HumanoidRootPart.CFrame
                    if v.Humanoid.Health / v.Humanoid.MaxHealth > OrionLib.Flags["% Health Mob"].Value/100  then 
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    else
                        if OrionLib.Flags["Select Method Mastery"].Value == "Gun" then 
                            game:GetService "VirtualUser":CaptureController()
                            game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                        end
                        equiptool(WeaponsMastery())
                        local condimebeo = checkskillMastery(WeaponsMastery())
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
                        task.wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
                        return 
                    end 
                else
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                end
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
            until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value or not StartFarm
        end
    else
        local MobLevelFarm = checknamedoublquest() or ""
        if game.PlaceId == 2753915549 then 
            --[[if #blnamequest >= 6  then
                    HopServer()
                return
            end
            QuestKillPlayer = false
            local namequest = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat ","")
            namequest = string.gsub(namequest," %p(0/1)%p","")
            if not QuestKillPlayer and plr.Data.Level.Value >= 35 then 
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PlayerHunter")
            end
            if plr.PlayerGui.Main:FindFirstChild("Quest").Visible and namequest and  game:GetService("Workspace").Characters:FindFirstChild(namequest) then
                QuestKillPlayer = true
                DetectKillPlayerQuest()
                for i,v in next,game:GetService("Workspace").Characters:GetChildren() do
                    if v:IsA("Model") and v.Name == namequest then
                        repeat task.wait()
                            if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible  then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                            end
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        until not v or not v.Parent or v.Humanoid.Health <= 0 or not OrionLib.Flags["Auto Farm"].Value or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or checksafezone(v) or StartFarm
                    end
                end
                return 
            end]]
            if  plr.Data.Level.Value < 120 and plr.Data.Level.Value >= 10 then
                MobLevelFarm = {"Royal Squad [Lv. 525]","Shanda [Lv. 475]"}
            end
        end
        --[[if QuestKillPlayer then 
            return 
        end]]
        if not plr.PlayerGui.Main:FindFirstChild("Quest").Visible and typeof(MobLevelFarm) ==  "string" then
            getquest()
        else
            if not DetectMob(MobLevelFarm) then
                TeleportSpawnMob(MobLevelFarm,(not StartFarm  or OrionLib.Flags["Auto Farm"].Value))
            else
                local v = DetectMob(MobLevelFarm)
                repeat task.wait()
                    task.spawn(function()
                        BringMob(v)
                    end)
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if OrionLib.Flags["Auto Mastery"].Value then
                        getgenv().psskill = v.HumanoidRootPart.CFrame
                        if v.Humanoid.Health / v.Humanoid.MaxHealth > OrionLib.Flags["% Health Mob"].Value/100  then 
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        else
                            if OrionLib.Flags["Select Method Mastery"].Value == "Gun" then 
                                game:GetService "VirtualUser":CaptureController()
                                game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                            end
                            equiptool(WeaponsMastery())
                            local condimebeo = checkskillMastery(WeaponsMastery())
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
                            task.wait(0.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
                            return 
                        end 
                    else
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    end
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value or not StartFarm
            end
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Farm"].Value then 
                FarmMethod()
            end
        end)
    end
end)

function NewWorld()
    if game.PlaceId == 2753915549 and plr.Data.Level.Value >= 700 then
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
            if game.Workspace.Map.Ice.Door.CanCollide then
                if not plr.Character:FindFirstChild("Key") and not plr.Backpack:FindFirstChild("Key") then 
                    if (CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359).Position - plr.Character.HumanoidRootPart.Position).magnitude < 5 then
                        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("DressrosaQuestProgress", "Detective")
                        equiptool("Key",true)
                    else
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(4852.2895507813, 5.651451587677, 718.53070068359),CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
                    end
                else
                    equiptool("Key",true)
                    if plr.Character:FindFirstChild("Key") then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game.Workspace.Map.Ice.Door.Position,game.Workspace.Map.Ice.Door.CFrame)
                    end
                end
            else
                local folder = game.workspace.Enemies
                if game.ReplicatedStorage:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                    folder = game.ReplicatedStorage
                end
                for i,v in pairs(folder:GetChildren()) do
                    if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                        if v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 then
                            repeat task.wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until v.Humanoid.Health <= 0 or not OrionLib.Flags["Auto New World"].Value 
                        end
                    end
                end
            end
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    end
end
function checkplatebarito()
    local a  
    if game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.BrickColor == BrickColor.new("Sand yellow") then 
        a = "Plate1"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate2"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate3"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate4"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate5"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate6"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate7"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate8"
    end
    return a 
end
local StopStoreFruit = false
cframethangdaubuoiredhead = CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, -0, -0.292404652, 0, 1, -0, 0.292404652, 0, 0.956294656)
function StopThirdSea()
    if OrionLib.Flags["Auto Third Sea"].Value  and game.PlaceId == 4442272183 and plr.Data.Level.Value >= 1500 then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then 
                if #getbackpack() >= 1 then
                    return true
                elseif not checkdevilfruit()  and getfruitstore()  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore())
                end
            elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then 
                if CheckNameBoss("Don Swan [Lv. 1000] [Boss]") then
                    return true
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                return true
            end
        else
            if (OrionLib.Flags["Sharkman Karate"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 3) 
            or (OrionLib.Flags["DeathStep"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 3)
            or (OrionLib.Flags["Superhuman"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) ~= 1) then 
                return true
            end
            return 
        end
    end
end
function SeaThird()
    if game.PlaceId == 4442272183 and plr.Data.Level.Value >= 1500 and StopThirdSea() then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then 
                if #getbackpack() >= 1 then
                    toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938),CFrame.new(-339.79840087891, 331.86065673828, 643.83178710938))
                    if (Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938)-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 1 then
                            for i,v in next, getbackpack() do
                                plr.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(v))
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
                            StopStoreFruit = false                     
                        end
                    end
                elseif not checkdevilfruit()  and getfruitstore()  then
                    StopStoreFruit = true 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore())
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then
                if CheckNameBoss("Don Swan [Lv. 1000] [Boss]") then
                    local v = CheckNameBoss("Don Swan [Lv. 1000] [Boss]")
                    repeat task.wait()
                        if game.ReplicatedStorage:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then 
                            if getgenv().Tween then
                                getgenv().Tween:Pause()
                                getgenv().Tween:Cancel()
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                            return 
                        end
                        plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until v.Humanoid.Health <= 0 or not v
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map.IndraIsland.Part.Position).Magnitude > 1000 then
                    toTarget(plr.Character.HumanoidRootPart.Position,cframethangdaubuoiredhead.p,cframethangdaubuoiredhead)
                    if (cframethangdaubuoiredhead.p-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                    end
                else
                    for i,v in next, workspace.Enemies:GetChildren() do
                        if v.Name == "rip_indra [Lv. 1500] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 300 then
                                toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
                            else
                                repeat task.wait()
                                    DetectFastAttack()
                                    plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                                until not workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]")
                            end
                        end
                    end
                end
            end
        else
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") 
                and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible  then
                    if not DetectMob("Swan Pirate [Lv. 775]") then 
                        TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Auto Third Sea"].Value)
                    else
                        local v = DetectMob("Swan Pirate [Lv. 775]")
                        repeat task.wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            task.spawn(function()
                                BringMob(v)
                            end)
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Third Sea"].Value
                    end
                else
                    if (plr.Character.HumanoidRootPart.Position-CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
                    else
                        local args = {
                            [1] = "StartQuest",
                            [2] = "BartiloQuest",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                local v = CheckNameBoss("Jeremy [Lv. 850] [Boss]")
                if v then
                    repeat task.wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Third Sea"].Value
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                repeat task.wait()
                    if (plr.Character.HumanoidRootPart.Position-Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
                        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-1835.65, 10.4325, 1679.75),CFrame.new(-1835.65, 10.4325, 1679.75))
                    else
                        plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
                        task.wait()
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3
            end
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto New World"].Value then 
                NewWorld()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Third Sea"].Value then 
                SeaThird()
            end
        end)
    end
end)
local Section = Tab:AddSection({
	Name = "Farm Main"
})
Tab:AddToggle({
	Name = "Auto Factory",
	Default = Settings["Auto Factory"] or false,
    Flag = "Auto Factory",
	Callback = function(Value)
        SaveSettings("Auto Factory",Value)
	end
})
local ToggleEliteHunter =Tab:AddToggle({
	Name = "Elite Hunter",
	Default = Settings["Elite Hunter"] or false,
    Flag = "Elite Hunter",
	Callback = function(Value)
        SaveSettings("Elite Hunter",Value)
	end
})
Tab:AddToggle({
	Name = "Raid Castle",
	Default = Settings["Raid Castle"] or false,
    Flag = "Raid Castle",
	Callback = function(Value)
        SaveSettings("Raid Castle",Value)
	end
})
function DetectEliteHunter()
    for i,v in next,game:GetService("ReplicatedStorage"):GetChildren() do
        if v:IsA("Model") and table.find(TableEliteHunter,v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v 
        end
    end
    for i,v in next,game:GetService("Workspace").Enemies:GetChildren() do
        if v:IsA("Model") and table.find(TableEliteHunter,v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v 
        end
    end
end
function AutoEliteHunter()
    if StartTeleportSafe() then 
        return 
    end
    if RaidStart then return end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then   return end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then  return end
    if  DetectEliteHunter() then 
        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,DetectEliteHunter().Name:gsub(" %pLv. %d+%p", "")) 
        or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
        else
            local v = DetectEliteHunter()
            repeat task.wait()
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
            until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Elite Hunter"].Value or (OrionLib.Flags["Raid Castle"].Value and DetectMobRaidCastle()) or RaidStart
        end
    else
        if OrionLib.Flags["Hop Cup"].Value and not plr.Backpack:FindFirstChild("God's Chalice") and not plr.Character:FindFirstChild("God's Chalice") then
            HopServer()
        end
    end
end
function DetectMobRaidCastle()
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart")
        and (v.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 1000
        and not string.find(v.Name, "Boss") and v.Humanoid.Health > 0 then
            return v 
        end
    end
end
function RaidCastle()
    if StartTeleportSafe() then 
        return 
    end
    if RaidStart then return end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then   return end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then  return end
    if DetectMobRaidCastle() then
        local v = DetectMobRaidCastle()
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Raid Castle"].Value or RaidStart
    end
end
function Factory()
    if StopThirdSea()  then  return end 
    if RaidStart then return end 
    if CheckNameBoss("Core") then 
        local v = CheckNameBoss("Core")
        repeat task.wait()
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HmanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Auto Factory"].Value or StopThirdSea() 
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Raid Castle"].Value then 
                if DetectMobRaidCastle() then 
                    RaidCastleStart = true
                    local timedelaya = tick()
                    repeat task.wait()
                        if DetectMobRaidCastle() then 
                            timedelaya = tick()
                        end
                    until tick()-timedelaya >= 20 or not OrionLib.Flags["Raid Castle"].Value
                    RaidCastleStart = false 
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Raid Castle"].Value then 
                if OrionLib.Flags["Find DF"].Value and GetPathFruit() then  return end
                RaidCastle()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function() 
            if OrionLib.Flags["Elite Hunter"].Value then 
                if OrionLib.Flags["Find DF"].Value and GetPathFruit() then  return end
                if OrionLib.Flags["Raid Castle"].Value and RaidCastleStart then return end 
                AutoEliteHunter()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function() 
            if OrionLib.Flags["Auto Factory"].Value then 
                Factory()
            end
        end)
    end
end)

local Section = Tab:AddSection({
	Name = "Get Melee"
})

Tab:AddToggle({
	Name = "SuperHuman",
	Default = Settings["SuperHuman"] or false,
    Flag = "SuperHuman",
	Callback = function(Value)
        SaveSettings("SuperHuman",Value)
	end
})
Tab:AddToggle({
	Name = "DeathStep",
	Default = Settings["DeathStep"] or false,
    Flag = "DeathStep",
	Callback = function(Value)
        SaveSettings("DeathStep",Value)
	end
})

Tab:AddToggle({
	Name = "Sharkman Karate",
	Default = Settings["Sharkman Karate"] or false,
    Flag = "Sharkman Karate",
	Callback = function(Value)
        SaveSettings("Sharkman Karate",Value)
	end
})
Tab:AddToggle({
	Name = "Electric Claw",
	Default = Settings["Electric Claw"] or false,
    Flag = "Electric Claw",
	Callback = function(Value)
        SaveSettings("Electric Claw",Value)
	end
})

Tab:AddToggle({
	Name = "Dragon Talon",
	Default = Settings["Dragon Talon"] or false,
    Flag = "Dragon Talon",
	Callback = function(Value)
        SaveSettings("Dragon Talon",Value)
	end
})

--[[Tab:AddToggle({
	Name = "GodHuman",
	Default = Settings["GodHuman"] or false,
    Flag = "GodHuman",
	Callback = function(Value)
        SaveSettings("GodHuman",Value)
	end
})]]
local TableMeleeSuperhuman = {
    ["Black Leg"] = 1,
    ["Fishman Karate"] = 2 ,
    ["Electro"] = 3,
    ["Dragon Claw"] = 4,
}
local BlMeleeSuperHuman = {}
function DetectMeleeSuperhuman()
    local a
    local dist = math.huge
    for i,v in next,TableMeleeSuperhuman do 
        if not table.find(BlMeleeSuperHuman,i) then 
            if dist > v then 
                dist = v 
                a = i
            end
        end
    end
    return a 
end
function CheckMasteryMelee(x)
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and (x and v.Name == x or not x and  v.ToolTip == "Melee") then
            return  v.Level.Value
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and (x and v.Name == x or not x and  v.ToolTip == "Melee") then
            return   v.Level.Value
        end
    end
end
function AutoSuperhuman()
    local Path = DetectMeleeSuperhuman()
    if not Path then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman")
        return 
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(Path) and not game.Players.LocalPlayer.Backpack:FindFirstChild(Path) then
        if Path == "Dragon Claw" then
            if game.Players.LocalPlayer.Data.Fragments.Value >= 1500 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") == 1  then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
            end
            if game.Players.LocalPlayer.Data.Level.Value >= 1100 and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") ~= 1  then
                AutoRaidsfully()
            end
            return
        end
        local Gsub = string.gsub(Path, " ","")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buy"..Gsub)
    else
        if CheckMasteryMelee(Path) >= 300 then 
            table.insert(BlMeleeSuperHuman,Path) 
        end
    end
end
function DetectKey(x)
    local a 
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == x then
            a = v.Name
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == x then
            a = v.Name
        end
    end
    return a
end
local Tablefishmananddarkleg = {
    ["fishman"] = false,
    ["darkleg"] = false,
}
function EquipSharkmanorDeadthstep()
    if not Tablefishmananddarkleg["darkleg"] and OrionLib.Flags["DeathStep"].Value  then 
        if not plr.Backpack:FindFirstChild("Black Leg") and not plr.Character:FindFirstChild("Black Leg") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBlackLeg")
        else
            if CheckMasteryMelee("Black Leg") >= 400 then
                Tablefishmananddarkleg["darkleg"] = true
            end
        end
    elseif not Tablefishmananddarkleg["fishman"] and OrionLib.Flags["Sharkman Karate"].Value then 
        if not plr.Backpack:FindFirstChild("Fishman Karate") and not plr.Character:FindFirstChild("Fishman Karate") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        else
            if CheckMasteryMelee("Fishman Karate") >= 400 then
                Tablefishmananddarkleg["fishman"] = true
            end
        end
    end
end
function DeadthStepAndSharkman()
    if OrionLib.Flags["DeathStep"].Value and DetectKey("Library Key") 
    and game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") 
    and  game.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide  then
        repeat task.wait()
            if (CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 5 then
                game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                task.wait(0.2)
                game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
            end
            equiptool(DetectKey("Library Key"),true)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814).Position,CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814))
        until not DetectKey("Library Key")  or (game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") and not game.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide  or not game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor")) 
        return 
    end
    if DetectKey("Water Key") and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)  == 3 then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
    if OrionLib.Flags["SuperHuman"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then 
        if OrionLib.Flags["Sharkman Karate"].Value and plr.Data.Fragments.Value >= 5000 and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        elseif OrionLib.Flags["DeathStep"].Value and  plr.Data.Fragments.Value >= 5000 and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep")
        elseif plr.Data.Fragments.Value < 5000 then 
            AutoRaidsfully()
        end 
    end
    local namemob = (OrionLib.Flags["Sharkman Karate"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)  == 3 and CheckNameBoss("Tide Keeper [Lv. 1475] [Boss]")) or (OrionLib.Flags["DeathStep"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 3 and CheckNameBoss("Awakened Ice Admiral [Lv. 1400] [Boss]")) 
    if namemob then
        local v = namemob
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until v.Humanoid.Health <= 0  or not v or (v.Name == "Tide Keeper [Lv. 1475] [Boss]" and not OrionLib.Flags["Sharkman Karate"].Value) or (v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" and not OrionLib.Flags["DeathStep"].Value)  or RaidStart
    end
end
local truefullyclaw = true
function ElectricClaw()
    if  not  plr.Backpack:FindFirstChild("Electro") and  not  plr.Character:FindFirstChild("Electro")   then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectro")
    end
    if game:GetService("Players").LocalPlayer.Data.Fragments.Value < 5000 then 
        AutoRaidsfully()
        return 
    end
    if CheckMasteryMelee("Electro") >= 400 and plr.Data.Beli.Value >= 3000000 and game:GetService("Players").LocalPlayer.Data.Fragments.Value >= 5000 and game.PlaceId == 7449423635 then 
        if (plr.Character.HumanoidRootPart.Position-Vector3.new(-10371.5, 330.764, -10131.4)).Magnitude > 8 and truefullyclaw then
            EletrciClawStart = true
            toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-10371.5, 330.764, -10131.4),CFrame.new(-10371.5, 330.764, -10131.4))
        else
            if truefullyclaw then
                EletrciClawStart = true
                local args = {
                    [1] = "BuyElectricClaw",
                    [2] = "Start"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                truefullyclaw = false
            else
                if (plr.Character.HumanoidRootPart.Position-Vector3.new(-12548.8, 332.378, -7617.77)).Magnitude > 8 then
                    toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-12548.8, 332.378, -7617.77),CFrame.new(-12548.8, 332.378, -7617.77))
                else
                    EletrciClawStart = false
                    game.ReplicatedStorage.Remotes['CommF_']:InvokeServer('BuyElectricClaw')
                end
            end
        end
    end
end
function DragonTalon()
    if  not  plr.Backpack:FindFirstChild("Dragon Claw") and  not  plr.Character:FindFirstChild("Dragon Claw")   then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
    if plr.Data.Level.Value >= 1975 then
        if plr.Character:FindFirstChild("Fire Essence") or plr.Backpack:FindFirstChild("Fire Essence") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        else
            if CheckMasteryMelee("Dragon Claw") >= 400 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 0 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
            end
            local v251, v252, v253, v254 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check");
            if v251 >= 50 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
    end
    if   plr.Data.Level.Value >= 1100 and game:GetService("Players").localPlayer.Data.Fragments.Value < 5000    then
        AutoRaidsfully()
    end
end

spawn(function()
    while task.wait() do 
        pcall(function()
            if StopThirdSea() then return end 
            if OrionLib.Flags["SuperHuman"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) ~= 1  then
                AutoSuperhuman()
                DeadthStepAndSharkman()
            elseif (OrionLib.Flags["DeathStep"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) ~= 1) 
            or (OrionLib.Flags["Sharkman Karate"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) ~= 1) then 
                EquipSharkmanorDeadthstep()
                DeadthStepAndSharkman()

            elseif OrionLib.Flags["Electric Claw"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true)  ~= 1  then
                ElectricClaw()
            elseif OrionLib.Flags["Dragon Talon"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)  ~= 1 then 
                DragonTalon()
            end
        end)
    end
end)
local Section = Tab2:AddSection({
	Name = "Boss"
})
function tableboss()
    local a = {"Deo Co boss"}
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if string.find(v.Name, ' %pBoss%p') or string.find(v.Name, ' %pRaid Boss%p') then
            table.insert(a, v.Name)
            if table.find(a,"Deo Co boss") then
                table.remove(a,1)
            end
        end
    end
    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if string.find(v.Name, ' %pBoss%p') or string.find(v.Name, ' %pRaid Boss%p') then
            table.insert(a, v.Name)
            if table.find(a,"Deo Co boss") then
                table.remove(a,1)
            end
        end
    end
    return a
end
local DropdownBoss = Tab2:AddDropdown({
	Name = "Select Boss",
	Default =  "",
	Options = tableboss(),
    Flag = "Select Boss",
	Callback = function(Value)
	end    
})
Tab2:AddButton({
	Name = "Refresh Boss",
	Callback = function()
        DropdownBoss:Refresh(tableboss(),true)
  	end    
})
Tab2:AddToggle({
	Name = "Auto Boss",
	Default =  false,
    Flag = "Auto Boss",
	Callback = function(Value)
	end
})
Tab2:AddToggle({
	Name = "Get Quest Boss",
	Default =  false,
    Flag = "Get Quest Boss",
	Callback = function(Value)
	end
})
function TableMob()
    local tablemob = {}
    local tablefoldermmb = {}
    for i,v in next,require(game:GetService("ReplicatedStorage").Quests) do
        for i1,v1 in next,v do
            for i2,v2 in next,v1.Task do
                if v2 > 1 then
                    table.insert(tablefoldermmb,i2)
                end
            end
        end
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        if not table.find(tablemob,v.Name) then
            table.insert(tablemob,v.Name)
        end
    end
    if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(getnilinstances()) do 
            if  table.find(tablefoldermmb,tostring(v.Name:gsub(" %pLv. %d+%p", ""))) and not table.find(tablemob,v.Name) then
                table.insert(tablemob,v.Name)
            end
        end
    else
        for i, v in pairs(getnilinstances()) do 
            if  table.find(tablefoldermmb,v.Name) and not table.find(tablemob,v.Name) then
                table.insert(tablemob,v.Name)
            end
        end
    end
    return tablemob
end
local TableSetectMob = {}
Tab2:AddDropdown({
	Name = "Select Mobs",
	Default =  "",
	Options = TableMob(),
    Flag = "Select Mob",
	Callback = function(Value)
        if Value then
            if not table.find(TableSetectMob,Value) then 
                table.insert(TableSetectMob,Value)
            else
                for i,v in next,TableSetectMob do 
                    if v == Value then 
                        table.remove(TableSetectMob,i)
                    end
                end
            end
            if getgenv().StatusSelectMob then 
                local b = ""
                for i,v in next,TableSetectMob do
                    local c = v
                    if string.find(v,"Lv.") then 
                        c = string.gsub(v," %pLv. %d+%p","")
                    end
                    b = b..c..", "
                end
                getgenv().StatusSelectMob:Set("Mob Select :"..b)
            end
        end
	end    
})
Tab2:AddButton({
	Name = "Refresh Select Mobs",
	Callback = function()
        TableSetectMob = {}
        getgenv().StatusSelectMob:Set("Mob Select :")
  	end    
})
getgenv().StatusSelectMob = Tab2:AddLabel("Mob Select :")
Tab2:AddToggle({
	Name = "Farm Select Mob",
	Default =  false,
    Flag = "Farm Select Mob",
	Callback = function(Value)
	end
})
function checkquestboss(d)
    local x = d
    local a 
    local b
    if string.find(x,' %pRaid Boss%p') then
        a = string.gsub(x,"%pLv. %d+%p", "")
        b = string.gsub(a,"  %pRaid Boss%p","")
    else
        a = string.gsub(x,"%pLv. %d+%p", "")
        b = string.gsub(a,"  %pBoss%p","")
    end
    for i,v in next,require(game:GetService("ReplicatedStorage").Quests) do
        for i1,v1 in next,v do
            for i2,v2 in next,v1.Task do
                if i2 == b then
                    return true
                end
            end
        end
    end
    return false
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Boss"].Value then 
                local x = OrionLib.Flags["Select Boss"].Value
                local a 
                local b
                if string.find(x,' %pRaid Boss%p') then
                    a = string.gsub(x,"%pLv. %d+%p", "")
                    b = string.gsub(a,"  %pRaid Boss%p","")
                else
                    a = string.gsub(x,"%pLv. %d+%p", "")
                    b = string.gsub(a,"  %pBoss%p","")
                end
                if (not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, b)))
                and OrionLib.Flags["Get Quest Boss"].Value 
                and checkquestboss(OrionLib.Flags["Select Boss"].Value) then
                    for i,v in pairs(Quest) do
                        for i2, v2 in pairs(v) do
                            if v2.Task[b] then
                                if (getgenv().questpoint[tostring(i)].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
                                    task.wait(1)
                                    if plr.Character.Humanoid.Health > 0 then 
                                        CommF:InvokeServer("StartQuest", tostring(i), i2)
                                    end
                                else
                                    teleportquestdeptrai(i)
                                end
                            end
                        end
                    end
                else 
                    if CheckNameBoss(OrionLib.Flags["Select Boss"].Value)  then
                        local v = CheckNameBoss(OrionLib.Flags["Select Boss"].Value)
                        repeat task.wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Boss"].Value
                    end
                end
            end
        end)
    end
end)
function FarmMobSelect()
    if not DetectMob(TableSetectMob) then 
        TeleportSpawnMob(TableSetectMob,OrionLib.Flags["Farm Select Mob"].Value)
    else
        local v = DetectMob(TableSetectMob)
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
            task.spawn(function()
                BringMob(v)
            end)
        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Farm Select Mob"].Value
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Farm Select Mob"].Value then 
                FarmMobSelect()
            end
        end)
    end
end)
local Section = Tab2:AddSection({
	Name = "Observation haki"
})
local StatusRadius = Tab2:AddLabel("Observation Level :"..game:GetService("Players").LocalPlayer.VisionRadius.Value)
Tab2:AddToggle({
	Name = "Farm Observation",
	Default = Settings["Farm Observation"] or false,
    Flag = "Farm Observation",
	Callback = function(Value)
        SaveSettings("Farm Observation",Value)
	end
})
Tab2:AddToggle({
	Name = "Farm Observation [ Hop ]",
	Default = Settings["Farm Observation [Hop]"] or false,
    Flag = "Farm Observation [Hop]",
	Callback = function(Value)
        SaveSettings("Farm Observation [Hop]",Value)
	end
})

function FarmObservation()
    local mob
    for i,v in next,game.workspace.Enemies:GetChildren() do
        if v:IsA("Model") and v.Name == "Marine Commodore [Lv. 1700]"  and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            mob = v
        end
    end
    if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        if mob then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,mob.HumanoidRootPart.Position,mob.HumanoidRootPart.CFrame*CFrame.new(0,0,50))
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        task.wait(3)
        if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and OrionLib.Flags["Farm Observation [Hop]"].Value then 
            HopServer()
        end
    else
        if not mob then
            GetPart = DetectPartSpawnMob("Marine Commodore [Lv. 1700]")
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
        else
            repeat task.wait()
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,mob.HumanoidRootPart.Position,mob.HumanoidRootPart.CFrame*CFrame.new(0,0,3))
            until not OrionLib.Flags["Farm Observation"].Value or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Farm Observation"].Value then 
                FarmObservation()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            local TurnOn = game:GetService("Players").LocalPlayer.VisionRadius.Value
            if game:GetService("Players").LocalPlayer.VisionRadius.Value == 0 then
                TurnOn = "Turn On Haki Observation, Please"
            end
            StatusRadius:Set("Observation Level :"..TurnOn)
        end)
    end
end)

local Section = Tab2:AddSection({
	Name = "Other"
})
Tab2:AddToggle({
	Name = "Trade Bones",
	Default = Settings["Trade Bones"] or false,
    Flag = "Trade Bones",
	Callback = function(Value)
        SaveSettings("Trade Bones",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Buy Haki Color",
	Default = Settings["Auto Buy Haki Color"] or false,
    Flag = "Auto Buy Haki Color",
	Callback = function(Value)
        SaveSettings("Auto Buy Haki Color",Value)
	end
})

Tab2:AddToggle({
	Name = "Tp Safe When Have God Chalice or Fist of Darkness",
	Default = Settings["Tp Safe When Have God Chalice or Fist of Darkness"] or false,
    Flag = "Tp Safe When Have God Chalice or Fist of Darkness",
	Callback = function(Value)
        SaveSettings("Tp Safe When Have God Chalice or Fist of Darkness",Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Support Only Elite Hunter And Auto Seabeast And Tp Chest",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})
Tab2:AddToggle({
	Name = "Auto Chest",
	Default = Settings["Auto Chest"] or false,
    Flag = "Auto Chest",
	Callback = function(Value)
        SaveSettings("Auto Chest",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Rip Indra",
	Default = Settings["Auto Rip Indra"] or false,
    Flag = "Auto Rip Indra",
	Callback = function(Value)
        if Value then
            if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn Off Tp Safe When Have God Chalice or Fist of Darkness Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end
        SaveSettings("Auto Rip Indra",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Spawn Rip Indra",
	Default = Settings["Auto Spawn Rip Indra"] or false,
    Flag = "Auto Spawn Rip Indra",
	Callback = function(Value)
        if Value then
            if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn Off Tp Safe When Have God Chalice or Fist of Darkness Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end
        SaveSettings("Auto Spawn Rip Indra",Value)
	end
})
function DetectButtons()
    for i,v in next,game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() do
        if v:IsA("Part") and v.Part.BrickColor.Name ~= "Lime green"  then
            return v
        end
    end
end
Tab2:AddButton({
	Name = "Touch Buttons Spawn Rip Indra",
	Callback = function()
        while task.wait() do 
            if DetectButtons().BrickColor.Name == "Hot pink"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            elseif DetectButtons().BrickColor.Name == "Really red"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            elseif DetectButtons().BrickColor.Name == "Oyster"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
            if not DetectButtons() then 
                break; 
            end
        end
  	end    
})

function StartTeleportSafe()
    if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value 
    and (plr.Backpack:FindFirstChild("God's Chalice") 
    or plr.Character:FindFirstChild("God's Chalice") 
    or plr.Character:FindFirstChild("Fist of Darkness") 
    or plr.Backpack:FindFirstChild("Fist of Darkness")) then 
        return true
    end
end
local TeleportY = 1000
function ClosestPlayerTeleportY()
    local dist = math.huge
    local a 
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        for i,v in pairs(game.Workspace.Characters:GetChildren()) do
            if v:IsA("Model") and v.Name ~= plr.Name  then
                local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude <= 1000 then
                    dist = magnitude
                    a = v.Name
                end
            end
        end
    end
    return a
end
spawn(function()
    while task.wait() do
        pcall(function()
            if StartTeleportSafe()  then 
                if game.PlaceId == 4442272183 then  
                    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-385.250916, 73.0458984, 297.388397).Position,CFrame.new(-385.250916, 73.0458984, 297.388397))
                else
                    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125).Position,CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125))
                end
            end
        end)
    end
end)

Tab2:AddToggle({
	Name = "Auto Dough King",
	Default = Settings["Auto Dough King"] or false,
    Flag = "Auto Dough King",
	Callback = function(Value)
        SaveSettings("Auto Dough King",Value)
	end
})
Tab2:AddToggle({
	Name = "Hop Cup",
	Default = Settings["Hop Cup"] or false,
    Flag = "Hop Cup",
	Callback = function(Value)
        SaveSettings("Hop Cup",Value)
	end
})
Tab2:AddToggle({
	Name = "Citizen Quest",
	Default =  false,
    Flag = "Citizen Quest",
	Callback = function(Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Seabeast",
	Default =  false,
    Flag = "Auto Seabeast",
	Callback = function(Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Select Weapons In Setting",
                Image = "rbxassetid://4483345998",
                Time = 5
            })    
        end
	end
})
Tab2:AddToggle({
	Name = "Auto PirateShip",
	Default =  false,
    Flag = "Auto PirateShip",
	Callback = function(Value)
	end
})
function DoughKing()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") or game.Players.LocalPlayer.Character:FindFirstChild("Red Key") then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", "Dough")
        return 
    end
    if CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]") or CheckNameBoss("Dough King [Lv. 2300] [Raid Boss]") then
        local v = CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]") or CheckNameBoss("Dough King [Lv. 2300] [Raid Boss]")
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,-20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Auto Dough King"].Value
        return 
    end
    if not plr.Character:FindFirstChild("Sweet Chalice") and not plr.Backpack:FindFirstChild("Sweet Chalice") then
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")  == "Where are the items?"   then
            if not checkcountitem("Conjured Cocoa",10) then
                if not DetectMob(MobConjuredCocoa) then 
                    TeleportSpawnMob(MobConjuredCocoa,OrionLib.Flags["Auto Dough King"].Value)
                else
                    local v = DetectMob(MobConjuredCocoa)
                    repeat task.wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        task.spawn(function()
                            BringMob(v)
                        end)
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Dough King"].Value
                end
            else
                if not plr.Backpack:FindFirstChild("God's Chalice") and not plr.Character:FindFirstChild("God's Chalice") then
                    if DetectEliteHunter() then 
                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,DetectEliteHunter().Name:gsub(" %pLv. %d+%p", "")) 
                        or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                        else
                            local v = DetectEliteHunter()
                            repeat task.wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Auto Dough King"].Value
                        end
                    else
                        if OrionLib.Flags["Hop Cup"].Value then
                            HopServer()
                        end
                    end
                end
            end
        end
    else
        local v204 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        if v204:find("open the portal now") then
            task.spawn(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            end)
        else
            if not DetectMob(MobKatakuri) then 
                TeleportSpawnMob(MobKatakuri,OrionLib.Flags["Auto Dough King"].Value)
            else
                local v = DetectMob(MobKatakuri)
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    task.spawn(function()
                        BringMob(v)
                    end)
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Dough King"].Value
            end
        end
    end
end
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Auto Dough King"].Value  then
            pcall(function()
                DoughKing()
            end)
        end
    end
end)
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Auto Dough King"].Value   then
            pcall(function()
                if  plr.Character:FindFirstChild("Sweet Chalice") or plr.Backpack:FindFirstChild("Sweet Chalice") then
                    task.spawn(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    end)
                end
            end)
        end
    end
end)
function CitizenQuestt()
    ---11893.650390625, 932.1987915039062, -8760.5927734375
    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible 
    and not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")) then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        return 
    end
    if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
        if (plr.Character.HumanoidRootPart.Position-Vector3.new(-11893.7, 929.661, -8760.59)).Magnitude < 8 then 
            local string_1 = "HornedMan";
            local string_2 = "Bet";
            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
            Target:InvokeServer(string_1, string_2);
            local string_1 = "HornedMan";
            local string_2 = "Bet";
            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
        else
            toTarget(plr.Character.HumanoidRootPart.Position,CFrame.new(-11893.7, 929.661, -8760.59).Position,CFrame.new(-11893.7, 929.661, -8760.59))
        end
    else
        local name
        if checknamedoublquest() == "Stone" then 
            name = "Stone [Lv. 1550] [Boss]"
        elseif checknamedoublquest() == "Island Empress" then 
            name = "Island Empress [Lv. 1675] [Boss]"
        elseif checknamedoublquest() == "Kilo Admiral" then 
            name = "Kilo Admiral [Lv. 1750] [Boss]"
        elseif checknamedoublquest() == "Captain Elephant" then 
            name = "Captain Elephant [Lv. 1875] [Boss]"
        elseif checknamedoublquest() == "Beautiful Pirate" then  
            name = "Beautiful Pirate [Lv. 1950] [Boss]"
        end
        local v = CheckNameBoss(name)
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Citizen Quest"].Value
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Citizen Quest"].Value then 
                CitizenQuestt()
            end
        end)
    end
end)

local tableprirate = {
    "PirateBasic",
    "PirateBrigade",
}

function checkseabeast()
    for i,v in next,game:GetService("Workspace").SeaBeasts:GetChildren() do
        if v.Name == "SeaBeast1" then
            local s = v.HealthBBG.Frame.TextLabel.Text
            local x = s:gsub("/%d+,%d+","")
            local a = v.HealthBBG.Frame.TextLabel.Text
            local b 
            if string.find(x, ",") then
                b = a:gsub("%d+,%d+/","")
            else
                b = a:gsub("%d+/","")
            end
            local c = b:gsub(",","")
            if tonumber(c) >= 90000 then
                return v
            end
        end
    end
    if OrionLib.Flags["Auto PirateShip"].Value  then
        for i,v in next,game:GetService("Workspace").Enemies:GetChildren() do
            if table.find(tableprirate,v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                return v
            end
        end
    end
    return false
end
local plr = game.Players.LocalPlayer
function checkboat()
    for i,v in next,game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if v:FindFirstChild("Owner") and  tostring(v.Owner.Value) == plr.Name and v.Humanoid.Value > 0 then
                return v
            end
        end
    end
    return false
end
function TeleportSeabeast(x)
    if x:FindFirstChild("Engine") then 
        toTarget(plr.Character.HumanoidRootPart.Position,x.Engine.Position,x.Engine.CFrame*CFrame.new(0,-15,0))
        return
    end
    local a = Vector3.new(0,x:FindFirstChild("HumanoidRootPart").Position.Y,0) 
    local b = Vector3.new(0,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,0)
    if (a-b).Magnitude <= 175 then
        toTarget(plr.Character.HumanoidRootPart.Position,x.HumanoidRootPart.Position,x.HumanoidRootPart.CFrame*CFrame.new(0,300,50))
    else
        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(x.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,x.HumanoidRootPart.Position.Z),CFrame.new(x.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,x.HumanoidRootPart.Position.Z))
    end		
end
function checkskillMelee()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value)) then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value))
        return false
    end
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value)]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and  OrionLib.Flags["Seabeast2 "..v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function checkskillDF()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value)) then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value))
        return false
    end
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value)]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and OrionLib.Flags["Seabeast1 "..v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end

function autoskill()
    if checkskillDF() then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value))
        local condimebeo = checkskillDF()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
        task.wait(0.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
    elseif checkskillMelee() then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value))
        local condimebeo = checkskillMelee()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
        task.wait(0.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
    end
end

function Seabeast()
    if not checkseabeast() then
        if not checkboat() then
            local PositionGetBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
            if game.PlaceId == 7449423635 then
                PositionGetBoat = CFrame.new(-6044.32, 15.1151, -2038.66)
            end
            if (PositionGetBoat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 8 then
                toTarget(plr.Character.HumanoidRootPart.Position,PositionGetBoat.Position,PositionGetBoat)
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","PirateBasic")
            end
        else
            local PositionWaitSea = CFrame.new(28.4108+20, 1.2327+10, 3679.99+10)
            if game.PlaceId == 7449423635 then
                PositionWaitSea = CFrame.new(-7551.96, 10.4861, -1537.59)
            end
            if (checkboat().VehicleSeat.Position-PositionWaitSea.Position).Magnitude > 50 then 
                checkboat().VehicleSeat.CFrame = PositionWaitSea
            else
                if not plr.Character.Humanoid.Sit then 
                    toTarget(plr.Character.HumanoidRootPart.Position,checkboat().VehicleSeat.Position,checkboat().VehicleSeat.CFrame)
                end
            end
        end
    else
        local v = checkseabeast()
        repeat task.wait()
            TeleportSeabeast(v)
            spawn(function()
                autoskill()
            end)
            if v:FindFirstChild("Engine") then
                getgenv().psskill = v.Engine.CFrame
            else
                getgenv().psskill = v.HumanoidRootPart.CFrame
            end
        until not v or not v.Parent or v.Health.Value <= 0 or not OrionLib.Flags["Auto Seabeast"].Value
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Seabeast"].Value  then 
                if StartTeleportSafe() then 
                    return 
                end
                Seabeast()
            end
        end)
    end
end)
function AutoRipIndra()
    if StartTeleportSafe() then 
        return 
    end
    local v = CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]")
    if v then 
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Auto Rip Indra"].Value
    else
        if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then
            if  not DetectButtons() then 
                equiptool("God's Chalice",true)
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.Position,game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
            else
                if DetectButtons().BrickColor.Name == "Hot pink"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                elseif DetectButtons().BrickColor.Name == "Really red"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                elseif DetectButtons().BrickColor.Name == "Oyster"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                end
            end
        end
    end
end
function AutoChest()
    if StartTeleportSafe() then 
        return 
    end
    local v = DetectChest()
    repeat task.wait()
        if  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2 then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 5 then 
            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
        end
        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.Position,v.CFrame*CFrame.new(0,1,0),true)
    until not v or not v.Parent or not OrionLib.Flags["Auto Chest"].Value
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Chest"].Value  then 
                AutoChest()
            end
        end)
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Rip Indra"].Value  then 
                AutoRipIndra()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Buy Haki Color"].Value  then 
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("ColorsDealer", "2")
            end
        end)
    end
end)
local Section = Tab3:AddSection({
	Name = "Devil Fruit"
})
Tab3:AddToggle({
	Name = "Buy Random DF",
	Default = Settings["Buy Random DF"] or false,
    Flag = "Buy Random DF",
	Callback = function(Value)
        SaveSettings("Buy Random DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Esp Fruit",
	Default = Settings["Esp Fruit"] or false,
    Flag = "Esp Fruit",
	Callback = function(Value)
        SaveSettings("Esp Fruit",Value)
	end
})
Tab3:AddToggle({
	Name = "Find DF",
	Default = Settings["Find DF"] or false,
    Flag = "Find DF",
	Callback = function(Value)
        SaveSettings("Find DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Hop Find DF",
	Default = Settings["Hop Find DF"] or false,
    Flag = "Hop Find DF",
	Callback = function(Value)
        if Value and not OrionLib.Flags["Find DF"].Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Find DF, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Hop Find DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Store",
	Default = Settings["Auto Store"] or false,
    Flag = "Auto Store",
	Callback = function(Value)
        SaveSettings("Auto Store",Value)
	end
})
getgenv().tablefruitausea3 = {}
local whitelistedfruit = {}
local TableDevilFruit = {}
for i,v in next,game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")) do
    if v.Price >= 1000000 then
        table.insert(whitelistedfruit,string.split(v.Name,"-")[1].." Fruit")
        getgenv().tablefruitausea3[v.Name] = v.Price
    end
    table.insert(TableDevilFruit,v.Name)
end
function getbackpack()
    mybackpack = {}
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and table.find(whitelistedfruit,v.Name) then
            table.insert(mybackpack,v.Name)
        end
    end
    for i1,v1 in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v1:IsA("Tool") and table.find(whitelistedfruit,v1.Name) then
            table.insert(mybackpack,v1.Name)
        end
    end
    return mybackpack
end
function checkdevilfruit()
    local name
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if string.find(v.Name,"Fruit")  then
            name = v.Name
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if string.find(v.Name,"Fruit")  then
            name = v.Name
        end
    end
    return name
end
Tab3:AddDropdown({
	Name = "Blox Fruit Sniper Shop",
	Default =  Settings["Blox Fruit Sniper Shop"] or "",
	Options = TableDevilFruit,
    Flag = "Blox Fruit Sniper Shop",
	Callback = function(Value)
		SaveSettings("Blox Fruit Sniper Shop",Value)
	end    
})
Tab3:AddToggle({
	Name = "Buy Blox Fruit Sniper Shop",
	Default = Settings["Buy Blox Fruit Sniper Shop"] or false,
    Flag = "Buy Blox Fruit Sniper Shop",
	Callback = function(Value)
        SaveSettings("Buy Blox Fruit Sniper Shop",Value)
	end
})
function GetPathFruit()
    for i,v in next,game.Workspace:GetChildren() do
        if v:IsA("Tool") or v:IsA("Model") and string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function HopFindDF()
    if GetPathFruit()  then
        if (GetPathFruit().Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then 
            firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        else          
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPathFruit().Handle.Position,GetPathFruit().Handle.CFrame)
        end
    else
        if OrionLib.Flags["Hop Find DF"].Value then
            HopServer()
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Find DF"].Value  then 
                HopFindDF()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Buy Random DF"].Value  then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
        end)
    end
end)
function StoreFruit(path)
    for i,v in pairs(path:GetChildren()) do
        if string.find(v.Name,"Fruit") and not v:FindFirstChild("Ignored")  then
            if OrionLib.Flags["Webhook Store Fruit"].Value then
                sendmsgStoreFruit(tostring(Settings["Url Webhook"] or ""),v.Name)
            end
            local test  = string.gsub(v.Name, " Fruit","")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",string.gsub(v.Name, " Fruit","-"..test),path:FindFirstChild(v.Name))
            local Ignored = Instance.new("IntValue", v)
            Ignored.Name = "Ignored"
        end
    end
end
spawn(function()
    while task.wait() do
        if OrionLib.Flags["Auto Store"].Value then
            pcall(function()
                if OrionLib.Flags["Auto Raid and Find DF"].Value and DetectCountDF() then return end
                StoreFruit(plr.Backpack)
                StoreFruit(plr.Character)
            end)
        end
    end
end)
function autobuydfshopp()
    for i,v in next,game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")) do
        if v.Name == OrionLib.Flags["Blox Fruit Sniper Shop"].Value then
            if v.OnSale then
                return v.Name 
            end
        end
    end
end

spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Buy Blox Fruit Sniper Shop"].Value  then 
                if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == OrionLib.Flags["Blox Fruit Sniper Shop"].Value and autobuydfshopp() then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",autobuydfshopp())
                end
            end
        end)
    end
end)
function GetEspFruit()
    for i,v in next,game.Workspace:GetChildren() do
        if (v:IsA("Tool") or v:IsA("Model")) and string.find(v.Name, "Fruit") and not v.Handle:FindFirstChild("Ignored") then
            return v
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Esp Fruit"] then
                local v = GetEspFruit()
                if v then
                    local Ignored = Instance.new("IntValue", v.Handle)
                    Ignored.Name = "Ignored"
                    local Text = Drawing.new("Text")
                    Text.Visible = false
                    Text.Transparency = 1
                    Text.Text = v.Name
                    Text.Color = Color3.fromRGB(255, 255, 255)
                    Text.Size = 20
                    Text.Outline = true
                    Text.OutlineColor = Color3.fromRGB(0, 0, 0)
                    Text.Center = true
                    Text.Font = 1
                    spawn(function()
                        repeat task.wait()
                            if v:FindFirstChild("Handle") then
                                local Pos, OnScreen =  game.workspace.CurrentCamera:WorldToViewportPoint(v.Handle.Position)
                                if OnScreen then
                                    Text.Text = v.Name .. " (" .. math.round(plr:DistanceFromCharacter(v.Handle.Position)) .. ")"
                                    Text.Position = Vector2.new(Pos.X, Pos.Y - 20)
                                    Text.Visible = true
                                else
                                    Text.Visible = false
                                end
                            end
                        until not v or not v.Parent or not game.Workspace:FindFirstChild(v.Name)
                        or not OrionLib.Flags["Esp Fruit"].Value
                        Text:Remove()
                        if v then
                            Ignored:Destroy()
                        end
                    end)
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        if OrionLib.Flags["Trade Bones"].Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end)
        end
    end
end)
local Section = Tab3:AddSection({
	Name = "Raids And Awake"
})
local tableraid = {}
for i,v in next,require(game.ReplicatedStorage.Raids) do
    for i1,v1 in next,v do
        table.insert(tableraid,v1)
    end
end
Tab3:AddDropdown({
	Name = "Select Raid",
	Default =  Settings["Select Raid"] or "",
	Options = tableraid,
    Flag = "Select Raid",
	Callback = function(Value)
		SaveSettings("Select Raid",Value)
	end    
})
Tab3:AddToggle({
	Name = "Get Fruit In Store Low Beli",
	Default = Settings["Get Fruit In Store Low Beli"] or false,
    Flag = "Get Fruit In Store Low Beli",
	Callback = function(Value)
        SaveSettings("Get Fruit In Store Low Beli",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Buy Chip",
	Default = Settings["Auto Buy Chip"] or false,
    Flag = "Auto Buy Chip",
	Callback = function(Value)
        SaveSettings("Auto Buy Chip",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Start Raid",
	Default = Settings["Auto Start Raid"] or false,
    Flag = "Auto Start Raid",
	Callback = function(Value)
        SaveSettings("Auto Start Raid",Value)
	end
})

Tab3:AddToggle({
	Name = "Auto Next Island",
	Default = Settings["Auto Next Island"] or false,
    Flag = "Auto Next Island",
	Callback = function(Value)
        SaveSettings("Auto Next Island",Value)
	end
})
Tab3:AddToggle({
	Name = "Kill Aura Mob",
	Default = Settings["Kill Aura Mob"] or false,
    Flag = "Kill Aura Mob",
	Callback = function(Value)
        SaveSettings("Kill Aura Mob",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Awake",
	Default = Settings["Auto Awake"] or false,
    Flag = "Auto Awake",
	Callback = function(Value)
        SaveSettings("Auto Awake",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Raid and Find DF [ Hop ]",
	Default = Settings["Auto Raid and Find DF"] or false,
    Flag = "Auto Raid and Find DF",
	Callback = function(Value)
        SaveSettings("Auto Raid and Find DF",Value)
	end
})
spawn(function()
    while task.wait() do
        if OrionLib.Flags["Auto Awake"].Value then
            pcall(function()
                local args = {
                    [1] = "Awakener",
                    [2] = "Check"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
        end
    end
end)
getgenv().island1 = true
getgenv().island2 = false
getgenv().island3 = false
getgenv().island4 = false
getgenv().island5 = false
getgenv().buychip = true
local RaidStart2 = false
spawn(function()
    while task.wait() do 
        pcall(function()
            for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then
                    if string.find(v.Text,"Island #1")  then
                        getgenv().island2 = true
                    end
                    if string.find(v.Text,"Island #2")  then
                        getgenv().island3 = true
                    end
                    if string.find(v.Text,"Island #3")  then 
                        getgenv().island4 = true
                    end
                    if string.find(v.Text,"Island #4")  then 
                        getgenv().island5 = true
                    end
                    if string.find(v.Text,"1000")  then
                        RaidStart = false
                        RaidStart2 = false
                    end 
                end
            end
            if  plr.PlayerGui.Main.Timer.Visible  then 
                getgenv().buychip = true
            else
                getgenv().island1 = true
                getgenv().island2 = false
                getgenv().island3 = false
                getgenv().island4 = false
                getgenv().island5 = false
            end
        end)
    end
end)
function ClosestPartIsland(xx)
    local dist = math.huge
    local name
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v:IsA("Part") and v.Name == xx then
            local conconcac = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude
            if conconcac < dist then
                dist = conconcac
                name = v
            end
        end
    end
    return name
end
function getfruitstore(x)
    local max = math.huge
    local name 
    for i,v in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Type == "Blox Fruit" then
            if not x then
                for i2, v2 in pairs(getgenv().tablefruitausea3) do
                    if v.Name == i2 then
                        if tonumber(v2) < tonumber(max) then
                            max = v2
                            name = i2
                        end
                    end
                end
            else
                if not getgenv().tablefruitausea3[v.Name] then 
                    return v.Name
                end
            end
        end
    end
    return name
end
function AutoRaids()
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or OrionLib.Flags["Auto Buy Chip"].Value) and getgenv().buychip  and plr.Data.Level.Value >= 1100  and not plr.PlayerGui.Main.Timer.Visible and not plr.Backpack:FindFirstChild("Special Microchip") and not plr.Character:FindFirstChild("Special Microchip") then
        if not checkdevilfruit()   and getfruitstore(true) and OrionLib.Flags["Get Fruit In Store Low Beli"].Value and not OrionLib.Flags["Auto Raid and Find DF"].Value then 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
        end
        if #getbackpack() == 0 then
            task.wait(5)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",OrionLib.Flags["Select Raid"].Value or "Flame")
        end
    end
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or OrionLib.Flags["Auto Start Raid"].Value) and (plr.Backpack:FindFirstChild("Special Microchip") or plr.Character:FindFirstChild("Special Microchip"))  then
        if OrionLib.Flags["Auto Raid and Find DF"].Value then
            RaidStart2 = true
        end
        
        getgenv().buychip = false
        if game.PlaceId == 7449423635 then
            task.wait(2)
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector,0)
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector,1)
        end
        if game.PlaceId == 4442272183 then
            task.wait(2)
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector,0)
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector,1)
        end
    end
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or  OrionLib.Flags["Auto Next Island"].Value) and plr.PlayerGui.Main.Timer.Visible then
        if getgenv().island5 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 5").Position,ClosestPartIsland("Island 5").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island4 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 4").Position,ClosestPartIsland("Island 4").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island3 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 3").Position,ClosestPartIsland("Island 3").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island2 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 2").Position,ClosestPartIsland("Island 2").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island1 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 1").Position,ClosestPartIsland("Island 1").CFrame * CFrame.new(0,60,0))
        end
    end 
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or  OrionLib.Flags["Kill Aura Mob"].Value) and plr.PlayerGui.Main.Timer.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500  and v.Humanoid.Health > 0 then
                v.Humanoid.Health = 0
            end
        end
    end  
end

function AutoRaidsfully(mmb)
    if getgenv().buychip  and plr.Data.Level.Value >= 1100 and not plr.PlayerGui.Notifications:FindFirstChild("NotificationTemplate") and not plr.PlayerGui.Main.Timer.Visible and not plr.Backpack:FindFirstChild("Special Microchip") and not plr.Character:FindFirstChild("Special Microchip") then
        task.wait(5)
        if not checkdevilfruit()   and getfruitstore(true)  then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
        end
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",mmb or "Flame")
    end
    if RaidStart and not plr.PlayerGui.Main.Timer.Visible  then 
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
    end
    if  (plr.Backpack:FindFirstChild("Special Microchip") or plr.Character:FindFirstChild("Special Microchip"))  and not plr.PlayerGui.Main.Timer.Visible then
        RaidStart = true
        getgenv().buychip = false
        if game.PlaceId == 7449423635 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
        if game.PlaceId == 4442272183 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        end
    end
    if plr.PlayerGui.Main.Timer.Visible then
        if getgenv().island5 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 5").Position,ClosestPartIsland("Island 5").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island4 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 4").Position,ClosestPartIsland("Island 4").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island3 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 3").Position,ClosestPartIsland("Island 3").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island2 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 2").Position,ClosestPartIsland("Island 2").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island1 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 1").Position,ClosestPartIsland("Island 1").CFrame * CFrame.new(0,60,0))
        end
    end
    if plr.PlayerGui.Main.Timer.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500  and v.Humanoid.Health > 0 then
                v.Humanoid.Health = 0
            end
        end
    end 
end


spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Next Island"].Value 
            or OrionLib.Flags["Auto Buy Chip"].Value
            or OrionLib.Flags["Auto Start Raid"].Value
            or OrionLib.Flags["Kill Aura Mob"].Value then 
                AutoRaids()
            end
        end)
    end
end)
function DetectCountDF()
    if #getbackpack() > 1 then 
        for i,v in next,getbackpack() do 
            for i1,v1 in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
                if v1.Type == "Blox Fruit" and ((v1.Name == v and v1.Count < game.Players.LocalPlayer.Data.FruitCap.Value) or not v1.Name == v) then
                    return true 
                end
            end
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Raid and Find DF"].Value   then
                if RaidStart2 and not plr.PlayerGui.Main.Timer.Visible  then 
                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                end
                if GetPathFruit()  and not RaidStart2 then
                    if (GetPathFruit().Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then 
                        firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    else          
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPathFruit().Handle.Position,GetPathFruit().Handle.CFrame)
                    end 
                    return 
                end
                if (not DetectCountDF() and checkdevilfruit()) or RaidStart2 then 
                    AutoRaids()
                    if not RaidStart2 then
                       task.wait(5)
                    end
                elseif not checkdevilfruit() and not RaidStart2 then  
                    HopServer()
                end
            end
        end)
    end
end)

local Section = Tab4:AddSection({
	Name = "Webhook"
})
Tab4:AddTextbox({
	Name = "Url Webhook",
	Default = Settings["Url Webhook"] or "",
	TextDisappear = true,
    Flag = "Url Webhook",
	Callback = function(Value)
        SaveSettings("Url Webhook",Value)
	end	  
})
Tab4:AddToggle({
	Name = "Webhook Store Fruit",
	Default = Settings["Webhook Store Fruit"] or false,
    Flag = "Webhook Store Fruit",
	Callback = function(Value)
        SaveSettings("Webhook Store Fruit",Value)
	end
})
Tab4:AddToggle({
	Name = "Webhook Server Full Moon Or Next Night",
	Default = Settings["Webhook Server Full Moon Or Next Night"] or false,
    Flag = "Webhook Server Full Moon Or Next Night",
	Callback = function(Value)
        SaveSettings("Webhook Server Full Moon Or Next Night",Value)
	end
})
Tab4:AddToggle({
	Name = "Webhook Mirage",
	Default = Settings["Webhook Mirage"] or false,
    Flag = "Webhook Mirage",
	Callback = function(Value)
        SaveSettings("Webhook Mirage",Value)
	end
})

function format(num, digits)
	return string.format("%0" .. digits .. "i", num)
end

function parseDateTime()
	local osDate = os.date("!*t")
	local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
	local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
	return year .. "-" .. format(mon, 2) .. "-" .. format(day, 2) .. "T" .. format(hour, 2) .. ":" .. format(min, 2) .. ":" .. format(sec, 2) .. "Z"
end
function sendmsgStoreFruit(url,x)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  

	msg = {
		["content"] = "",
		["embeds"] = {
			{
                ["author"] = {
                    ["name"] = "Store Fruit.Exe",
                    ["url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg"
                },
				["color"] = tonumber(0x000000),
				["title"] = "Skider so 1 viet nam : Obii#3012",
                ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097971676353937448/banner.png",
				["fields"] = {
					{
						["name"] = "Name :",
						["value"] = "||"..game.Players.LocalPlayer.Name.."||",
						["inline"] = true
					},
                    {
						["name"] = "Fruit ",
						["value"] = "```"..x.."```",
						["inline"] = true
					},
				},
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097970280023990422/gabimaru-anime.gif"
                },
                ["image"] = {
                    ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["footer"] = {
                    ["text"] = "discord.gg/chuoihub",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
function sendWebhook(url,xx)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  
    local name = "Mirage"
    local Value = "Spawn"
    if xx then 
        name = "Moon"
        Value = "Moon : "..CheckMoon().."|"..function8()
    end
	msg = {
		["content"] = "",
		["embeds"] = {
			{
                ["author"] = {
                    ["name"] = name..".Exe",
                    ["url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg"
                },
				["color"] = tonumber(0x000000),
				["title"] = "Skider so 1 viet nam : Obii#3012",
                ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097971676353937448/banner.png",
				["fields"] = {
					{
						["name"] = "Name :",
						["value"] = "||"..game.Players.LocalPlayer.Name.."||",
						["inline"] = true
					},
                    {
						["name"] = name.." ",
						["value"] = "```"..Value.."```",
						["inline"] = true
					},
				},
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097970280023990422/gabimaru-anime.gif"
                },
                ["image"] = {
                    ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["footer"] = {
                    ["text"] = "discord.gg/chuoihub",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Webhook Server Full Moon Or Next Night"].Value then 
            pcall(function()
                repeat task.wait() until CheckMoon() == "Full Moon" or CheckMoon() == "Next Night"
                if CheckMoon() == "Full Moon" or CheckMoon() == "Next Night" then
                    sendWebhook(tostring(Settings["Url Webhook"] or ""),true)
                    task.wait(60)
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Webhook Mirage"].Value then 
            pcall(function()
                repeat task.wait() until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    sendWebhook(tostring(Settings["Url Webhook"] or ""),false)
                    task.wait(60)
                end
            end)
        end
    end
end)
local Section = Tab5:AddSection({
	Name = "Soul Guitar And CDK"
})
Tab5:AddToggle({
	Name = "Soul Guitar",
	Default = Settings["Soul Guitar"] or false,
    Flag = "Soul Guitar",
	Callback = function(Value)
        SaveSettings("Soul Guitar",Value)
	end
})
Tab5:AddToggle({
	Name = "Cursed Dual Katana",
	Default = Settings["Cursed Dual Katana"] or false,
    Flag = "Cursed Dual Katana",
	Callback = function(Value)
        SaveSettings("Cursed Dual Katana",Value)
	end
})
local Section = Tab5:AddSection({
	Name = "Other"
})
Tab5:AddToggle({
	Name = "Auto Unlock All Skill Sword In Inventory",
	Default = Settings["Auto Unlock All Skill Sword In Inventory"] or false,
    Flag = "Auto Unlock All Skill Sword In Inventory",
	Callback = function(Value)
        if Value then
            if not OrionLib.Flags["Auto Farm"].Value then
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn On Auto Farm, Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Select Weapon In Main Farm = Sword, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Unlock All Skill Sword In Inventory",Value)
	end
})

Tab5:AddToggle({
	Name = "Auto Buy Legend Sword",
	Default = Settings["Auto Buy Legend Sword"] or false,
    Flag = "Auto Buy Legend Sword",
	Callback = function(Value)
        SaveSettings("Auto Buy Legend Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Auto Buy Legend Sword [ Hop ]",
	Default = Settings["Auto Buy Legend Sword [ Hop ]"] or false,
    Flag = "Auto Buy Legend Sword [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Buy Legend Sword"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Buy Legned Sword, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Buy Legend Sword [ Hop ]",Value)
	end
})
Tab5:AddToggle({
	Name = "Yama",
	Default = Settings["Yama"] or false,
    Flag = "Yama",
	Callback = function(Value)
        SaveSettings("Yama",Value)
	end
})
Tab5:AddToggle({
	Name = "Tushita",
	Default = Settings["Tushita"] or false,
    Flag = "Tushita",
	Callback = function(Value)
        SaveSettings("Tushita",Value)
	end
})
local Section = Tab5:AddSection({
	Name = "Multi Toggle"
})
Tab5:AddToggle({
	Name = "Pole Sword",
	Default = Settings["Pole Sword"] or false,
    Flag = "Pole Sword",
	Callback = function(Value)
        SaveSettings("Pole Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Saber Sword",
	Default = Settings["Saber Sword"] or false,
    Flag = "Saber Sword",
	Callback = function(Value)
        SaveSettings("Saber Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Canvander",
	Default = Settings["Canvander"] or false,
    Flag = "Canvander",
	Callback = function(Value)
        SaveSettings("Canvander",Value)
	end
})
Tab5:AddToggle({
	Name = "Buddy Sword",
	Default = Settings["Buddy Sword"] or false,
    Flag = "Buddy Sword",
	Callback = function(Value)
        SaveSettings("Buddy Sword",Value)
	end
})
local BlankTablets = {
    "Segment6",
    "Segment2",
    "Segment8",
    "Segment9",
    "Segment5"
}
local Trophy = {
    ["Segment1"] = "Trophy1",
    ["Segment3"] = "Trophy2",
    ["Segment4"] = "Trophy3",
    ["Segment7"] = "Trophy4",
    ["Segment10"] = "Trophy5",
}
local Pipes = {
    ["Part1"] = "Really black",
    ["Part2"] = "Really black",
    ["Part3"] = "Dusty Rose",
    ["Part4"] = "Storm blue",
    ["Part5"] = "Really black",
    ["Part6"] = "Parsley green",
    ["Part7"] = "Really black",
    ["Part8"] = "Dusty Rose",
    ["Part9"] = "Really black",
    ["Part10"] = "Storm blue",
}

function DetectRequestSoulGuitar()
    local Mob = {}
    local PlaceId 
    local NameRemote 
    if not checkcountitem("Ectoplasm",250) then
        Mob = {
            "Ship Deckhand [Lv. 1250]",
            "Ship Steward [Lv. 1300]",
            "Ship Officer [Lv. 1325]",
            "Ship Engineer [Lv. 1275]"
        }
        PlaceId = 4442272183
        NameRemote = "TravelDressrosa"
    elseif not checkcountitem("Bones",500) then 
        Mob = {
            "Reborn Skeleton [Lv. 1975]",
            "Demonic Soul [Lv. 2025]",
            "Living Zombie [Lv. 2000]",
            "Posessed Mummy [Lv. 2050]",
        }
        PlaceId = 7449423635
        NameRemote = "TravelZou"
    end
    return Mob, PlaceId, NameRemote
end
function DetectChest()
    local dist = math.huge
    local name
    for k, v in pairs(game.Workspace:GetChildren()) do
        if string.match(v.Name, "Chest")  then
            local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    if not name then 
        for i,v in next,game:GetService("Workspace").Map:GetDescendants() do
            if v:IsA("Part") and string.find(v.Name, "Chest")  then
                local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude < dist then
                    dist = magnitude
                    name = v
                end
            end
        end
    end
    return name 
end
function CountZombie(x)
    local Counter = 0
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if v.Name == "Living Zombie [Lv. 2000]"
        and v.Humanoid.Health > 0 then
            if not x or (v.HumanoidRootPart.Position - Vector3.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).magnitude < 30 then
                Counter = Counter + 1
                v.HumanoidRootPart.CFrame = CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)
            end
        end
    end
    return Counter
end
function GuitarPuzzleProgress()
    if not CommF:InvokeServer("GuitarPuzzleProgress", "Check") then
        if game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431"
        and (game.Lighting.ClockTime > 16
        or game.Lighting.ClockTime < 5) then
            if plr:DistanceFromCharacter(Vector3.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) > 50 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125).Position,CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125))
            end
            CommF:InvokeServer("gravestoneEvent", 2)
            CommF:InvokeServer("gravestoneEvent", 2, true)
            task.wait(1)
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Hop Full Moon",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            HopServer()
        end
    else
        if plr.PlayerGui.Main.Dialogue.Visible then
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
        end
        if not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Swamp then
            if (CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875).Position-plr.Character.HumanoidRootPart.Position).Magnitude > 100 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875).Position,CFrame.new(-10171.7607421875, 138.62667846679688+20, 6008.0654296875))
            else 
                if CountZombie() == 6 then  
                    for i,v in pairs(game.workspace.Enemies:GetChildren()) do
                        if v.Name == "Living Zombie [Lv. 2000]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                end
            end
            return
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones then
            if plr:DistanceFromCharacter(Vector3.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125).Position,CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
            else
                local ClickSigns = {
                    game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
                    game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector
                }
                for i, v in pairs(ClickSigns) do
                    fireclickdetector(v)
                end
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Ghost then
            if plr:DistanceFromCharacter(Vector3.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 50 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375).Position,CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375))
            end
            CommF:InvokeServer("GuitarPuzzleProgress", "Ghost")
            task.wait(3)
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Trophies then
            if plr:DistanceFromCharacter(Vector3.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 50 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375).Position,CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
            end
            local Tablet = game.workspace.Map["Haunted Castle"].Tablet
            for i, v in pairs(BlankTablets) do
                local x = Tablet[v]
                if x.Line.Position.X ~= 0 then
                    repeat task.wait()
                        fireclickdetector(x.ClickDetector)
                    until x.Line.Position.X == 0
                end
            end
            for i, v in pairs(Trophy) do
                local x = game.workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame
                x = tostring(x)
                x = x:split(", ")[4]
                local c = "180"
                if x == "1" or x == "-1" then
                    c = "90"
                end
                if not string.find(tostring(Tablet[i].Line.Rotation.Z), c) then
                    repeat task.wait()
                        fireclickdetector(Tablet[i].ClickDetector)
                    until string.find(tostring(Tablet[i].Line.Rotation.Z), c)
                    print(i, c)
                end
            end
        elseif not CommF:InvokeServer("GuitarPuzzleProgress", "Check").Pipes then
            for i, v in pairs(Pipes) do
                local x = game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i]
                if x.BrickColor.Name ~= v then
                    repeat task.wait()
                        fireclickdetector(x.ClickDetector)
                    until x.BrickColor.Name == v
                end
            end
        end
    end
end
function AutoSoulGuitar()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true) == "[You already own this item.]" then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "[You already own this item.]",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        task.wait(5)
        return 
    end
    if plr.Data.Fragments.Value < 5000 then 
        task.wait(2)
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Fragments >= 5000",
            Image = "rbxassetid://4483345998",
            Time = 5
        })        
        return
    end
    if checkcountitem("Dark Fragment",1) and checkcountitem("Ectoplasm",250) and checkcountitem("Bones",500) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy")
        if game.PlaceId == 7449423635 then 
            GuitarPuzzleProgress()
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
        end
        return 
    end
    if not checkcountitem("Dark Fragment",1)  then
        if game.PlaceId == 4442272183 then
            if CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]") then 
                local v = CheckNameBoss("Darkbeard [Lv. 1000] [Raid Boss]")
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until v.Humanoid.Health <= 0 or not v.Parent
            else
                if  plr.Character:FindFirstChild("Fist of Darkness") or plr.Backpack:FindFirstChild("Fist of Darkness") then
                    if (game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        equiptool("Fist of Darkness",true)
                        firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character["Fist of Darkness"].Handle, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 1)
                        firetouchinterest(plr.Character.HumanoidRootPart, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 0)
                        firetouchinterest(plr.Character.HumanoidRootPart, game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection, 1)
                    else
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.Position,game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
                    end
                else
                    local v = DetectChest()
                    repeat task.wait()
                        if  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2 then
                            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                        end
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 5 then 
                            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                            task.wait()
                            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                        end
                        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.Position,v.CFrame*CFrame.new(0,1,0),true)
                    until not v or not v.Parent or not OrionLib.Flags["Soul Guitar"].Value
                end
            end
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    else
        local Mob,PlaceId,NameRemote = DetectRequestSoulGuitar()
        if game.PlaceId == PlaceId then 
            if not DetectMob(Mob) then 
                TeleportSpawnMob(Mob,OrionLib.Flags["Soul Guitar"].Value)
            else
                local v = DetectMob(Mob)
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    task.spawn(function()
                        BringMob(v)
                    end)
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Soul Guitar"].Value
            end
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(NameRemote)
        end
    end
end

local StartGood = true
function QuestGood3()
    for v50, v51 in pairs(getnilinstances()) do
        if v51.Name:match("Luxury Boat Dealer") then
            plr.Character.HumanoidRootPart.CFrame = v51.HumanoidRootPart.CFrame
            local args = {
                [1] = "CDKQuest",
                [2] = "BoatQuest",
                [3] = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end;
    end;
end

function QuestGood4()
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude > 1000 then
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219),CFrame.new(-5543.5327148438, 313.80062866211, -2964.2585449219))
    else
        if DetectMobRaidCastle() then
            local v = DetectMobRaidCastle()
            repeat task.wait()
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
                equiptool(NameWeapon("Sword"))
            until not v or not v.Parent or v.Humanoid.Health == 0 
        end
    end
end
function TourchGood5()
    local a 
    if not game:GetService("Workspace").Map.HeavenlyDimension.Torch1:FindFirstChild("mmb") then
        a = "1"
    elseif not game:GetService("Workspace").Map.HeavenlyDimension.Torch2:FindFirstChild("mmb") then
        a = "2"
    elseif not game:GetService("Workspace").Map.HeavenlyDimension.Torch3:FindFirstChild("mmb") then
        a = "3"
    end
    return a 
end
function Questgood5()
    if (game:GetService("Workspace")["_WorldOrigin"].Locations["Heavenly Dimension"].Position-plr.Character.HumanoidRootPart.Position).Magnitude < 1000 then
        if game:GetService("Workspace").Map.HeavenlyDimension.Exit.BrickColor == BrickColor.new("Cloudy grey") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame
            toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.HeavenlyDimension.Exit.Position,game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
            return 
        end			
        if game.workspace.Enemies:FindFirstChildWhichIsA("Model") then			
            for i,v in next,game.Workspace.Enemies:GetChildren() do
                if v:IsA("Model") then 
                    v.Humanoid.Health = 0
                    plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,50,0)
                end
            end
        else
            local Tourch = TourchGood5()
            if Tourch then
                repeat task.wait()
                    if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch].Position).Magnitude > 5 then
                        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch].Position,game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch].CFrame)
                    else
                        fireproximityprompt(game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch].ProximityPrompt,0)
                        fireproximityprompt(game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch].ProximityPrompt,1)
                    end 
                until game.workspace.Enemies:FindFirstChildWhichIsA("Model")
                plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,50,0)
                local BV = Instance.new("Part")
                BV.Parent = game:GetService("Workspace").Map.HeavenlyDimension["Torch"..Tourch]
                BV.Name = "mmb"
            end
        end
    else
        if CheckNameBoss("Cake Queen [Lv. 2175] [Boss]")  then
            local v = CheckNameBoss("Cake Queen [Lv. 2175] [Boss]")
            repeat task.wait()
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
                equiptool(NameWeapon("Sword"))
            until not v or not v.Parent or v.Humanoid.Health == 0 
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Waiting BigMom",
                Image = "rbxassetid://4483345998",
                Time = 2
            }) 
            task.wait(3)
        end
    end
end
function QuestEvil3()
    local mob
    for i,v in next,game.workspace.Enemies:GetChildren() do
        if v:IsA("Model") and v.Name == "Marine Commodore [Lv. 1700]"  and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            mob = v
        end
    end
    if not mob then
        GetPart = DetectPartSpawnMob("Marine Commodore [Lv. 1700]")
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
    else
        repeat task.wait()
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,mob.HumanoidRootPart.Position,mob.HumanoidRootPart.CFrame*CFrame.new(0,0,3))
        until plr.Character.Humanoid.Health <= 0
    end
end
function DetectMobPhaze()
    local xx 
    for i,v in next,game.workspace.Enemies:GetChildren() do
        if v:IsA("Model")  and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HazeESP")
        and  v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0  then
            xx = v
        end
    end
    return xx
end
function checknearstpartmobspawn()
    for i,v in next,game:GetService("Players").LocalPlayer.QuestHaze:GetChildren() do
        if v.Value > 0 then
            return v.Name
        end
    end
end

function QuestEvil4()
    if  DetectMob(checknearstpartmobspawn()) then
        local v = DetectMob(checknearstpartmobspawn())
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon("Sword"))
            task.spawn(function()
                BringMob(v)
            end)
        until not v or not v.Parent or v.Humanoid.Health == 0 
    else
        GetPart = DetectPartSpawnMob(checknearstpartmobspawn())
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,15,0))
    end
end
function TourchEvil5()
    local a 
    if not game:GetService("Workspace").Map.HellDimension.Torch1:FindFirstChild("mmb") then
        a = "1"
    elseif not game:GetService("Workspace").Map.HellDimension.Torch2:FindFirstChild("mmb") then
        a = "2"
    elseif not game:GetService("Workspace").Map.HellDimension.Torch3:FindFirstChild("mmb") then
        a = "3"
    end
    return a 
end
function QuestEvil5()
    if (game:GetService("Workspace")["_WorldOrigin"].Locations["Hell Dimension"].Position-plr.Character.HumanoidRootPart.Position).Magnitude > 1000 then
        if not CheckNameBoss("Soul Reaper [Lv. 2100] [Raid Boss]") then
            if not plr.Character:FindFirstChild("Hallow Essence") and not plr.Backpack:FindFirstChild("Hallow Essence") then
                if not DetectMob(TableMobBones) then 
                    TeleportSpawnMob(TableMobBones,OrionLib.Flags["Cursed Dual Katana"].Value)
                else
                    local v = DetectMob(TableMobBones)
                    repeat task.wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon("Sword"))
                        task.spawn(function()
                            BringMob(v)
                        end)
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Cursed Dual Katana"].Value
                end
            else
                if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.Position).Magnitude > 8 then
                    toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.Position,game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
                else
                    equiptool("Hallow Essence",true) 
                end
            end
        else
            local v = CheckNameBoss("Soul Reaper [Lv. 2100] [Raid Boss]")
            repeat task.wait()
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,0,3))
            until   plr.Character.Humanoid.Health <= 0  or (game:GetService("Workspace")["_WorldOrigin"].Locations["Hell Dimension"].Position-plr.Character.HumanoidRootPart.Position).Magnitude < 1000
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
        end
    else
        if game:GetService("Workspace").Map.HellDimension.Exit.BrickColor == BrickColor.new("Olivine") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.HellDimension.Exit.CFrame
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.HellDimension.Exit.Position,game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
            return 
        end	
        if game.workspace.Enemies:FindFirstChildWhichIsA("Model") then			
            for i,v in next,game.Workspace.Enemies:GetChildren() do
                if v:IsA("Model") then 
                    v.Humanoid.Health = 0
                    plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,50,0)
                end
            end
        else
            local Tourch = TourchEvil5()
            if Tourch then
                repeat task.wait()
                    if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map.HellDimension["Torch"..Tourch].Position).Magnitude > 5 then 
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.HellDimension["Torch"..Tourch].Position,game:GetService("Workspace").Map.HellDimension["Torch"..Tourch].CFrame)
                    else
                        fireproximityprompt(game:GetService("Workspace").Map.HellDimension["Torch"..Tourch].ProximityPromptm,0)
                        fireproximityprompt(game:GetService("Workspace").Map.HellDimension["Torch"..Tourch].ProximityPromptm,1)
                    end 
                until game.workspace.Enemies:FindFirstChildWhichIsA("Model")
                plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,50,0)
                local BV = Instance.new("Part")
                BV.Parent = game:GetService("Workspace").Map.HellDimension["Torch"..Tourch]
                BV.Name = "mmb"
            end
        end
    end
end
function checkswordttk(xx,xxx)
    for i,v in next,getupvalues(require(game:GetService("Players").LocalPlayer.PlayerGui.Main.UIController.Inventory).UpdateRender) do
        if i == 4 then
            for i1,v1 in next,v do
                if v1.details.Name == xx and  v1.details.Mastery >= xxx then
                    return true
                end
            end
        end
    end
    return false
end
function CheckItemInventory(b)
    for i,v in pairs(game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == b then
            return true
        end
    end
end
function GetCDK()
    if not CheckItemInventory("Tushita")  or not CheckItemInventory("Yama") then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Get Tushita or Yama Please",
            Image = "rbxassetid://4483345998",
            Time = 2
        }) 
        return 
    end
    if CheckItemInventory("Tushita")  and CheckItemInventory("Yama") then
        if not checkswordttk("Yama",350) or not checkswordttk("Tushita",350) then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Mastery >= 350",
                Image = "rbxassetid://4483345998",
                Time = 2
            }) 
            return 
        end
        if not plr.Character:FindFirstChild("Tushita") 
        and not plr.Backpack:FindFirstChild("Tushita") 
        and not plr.Character:FindFirstChild("Yama") 
        and not plr.Backpack:FindFirstChild("Yama") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem","Tushita")
            return 
        end
        getgenv().Good = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Good
        getgenv().Evil = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good").Evil
        if StartGood then 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
        else
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
        end
        if getgenv().Good == 4 then
            StartGood =  false
        end
        local Pedestal
        if getgenv().Good == 4 
        and  getgenv().Evil == 3 then
            Pedestal = "Pedestal2"
        elseif getgenv().Good == 3 
        and  getgenv().Evil == 4 then
            Pedestal = "Pedestal1"
        end
        if Pedestal  then
            if (game:GetService("Workspace").Map.Turtle.Cursed[Pedestal].Position-plr.Character.HumanoidRootPart.Position).Magnitude < 10 then
                fireproximityprompt(game:GetService("Workspace").Map.Turtle.Cursed[Pedestal].ProximityPrompt)
            else
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.Turtle.Cursed[Pedestal].Position,game:GetService("Workspace").Map.Turtle.Cursed[Pedestal].CFrame)
            end
        end
        if plr.PlayerGui.Main.Dialogue.Visible then
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
            game.VirtualUser:Button1Down(Vector2.new(0, 0))
        end
        if getgenv().Good == 4 
        and getgenv().Evil == 4 then
            if (game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.Position-plr.Character.HumanoidRootPart.Position).Magnitude  > 10 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.Position,game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.CFrame)
            else
                if game:GetService("Workspace").Map.Turtle.Cursed.PlacedGem.Transparency == 0 then
                    if not game.Workspace.Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(-12341.66796875, 603.3455810546875, -6550.6064453125),CFrame.new(-12341.66796875, 603.3455810546875, -6550.6064453125))
                    else
                        for i,v in next,game.Workspace.Enemies:GetChildren() do
                            if v:IsA("Model") and v.Name == "Cursed Skeleton Boss [Lv. 2025] [Boss]" and v.Humanoid.Health > 0 then
                                repeat task.wait()
                                    sizepart(v)
                                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                        DetectFastAttack()
                                    end
                                    equiptool(NameWeapon("Sword"))
                                until  not v or not v.Parent or v.Humanoid.Health <= 0 
                            end
                        end
                    end
                else
                    fireproximityprompt(game:GetService("Workspace").Map.Turtle.Cursed.Pedestal3.ProximityPrompt)
                end
            end
        end
        if StartGood then 
            if getgenv().Good == -3 then
                QuestGood3()
            elseif getgenv().Good == -4 then 
                QuestGood4()
            elseif getgenv().Good == -5 then 
                Questgood5()
            end
        else
            if getgenv().Evil == -3 then 
                QuestEvil3()
            elseif getgenv().Evil == -4 then  
                QuestEvil4()
            elseif getgenv().Evil == -5 then
                spawn(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
                end) 
                QuestEvil5()
            end
        end
    end
end


function GetYama()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30 then 
        if not OrionLib.Flags["Elite Hunter"].Value  then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Kill 30 Elites Please,Turn On Auto Elite Hunter",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            task.wait(2)
        end
    else
        ToggleEliteHunter:Set(false)
        if (game.Workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 50 then
            toTarget(plr.Character.HumanoidRootPart.Position,game.Workspace.Map.Waterfall.SealedKatana.Handle.Position,game.Workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
        else
            if game.Workspace.Enemies:FindFirstChild("Ghost [Lv. 1500]") then
                for i,v in next,game.workspace.Enemies:GetChildren() do
                    if v.Name == "Ghost [Lv. 1500]" and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            DetectEquipWp()
                            task.spawn(function()
                                BringMob(v)
                            end)
                        until not v or not v.Parent or v.Humanoid.Health == 0 
                    end
                end
            else
                fireclickdetector(game.Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
        end
    end
end
function checkTorch()
    local a 
    if not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch1.Particles.Main.Enabled then
        a = "1"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch2.Particles.Main.Enabled then
        a = "2"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch3.Particles.Main.Enabled then
        a = "3"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch4.Particles.Main.Enabled then
        a = "4"
    elseif not game:GetService("Workspace").Map.Turtle.QuestTorches.Torch5.Particles.Main.Enabled then
        a = "5"
    end
    for i,v in next,game:GetService("Workspace").Map.Turtle.QuestTorches:GetChildren() do
        if v:IsA("MeshPart") and  string.find(v.Name, a) and not v.Particles.Main.Enabled then
            return v 
        end
    end
end
function GetTushita()
    if not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
        if CheckNameBoss("Longma [Lv. 2000] [Boss]") then 
            local v = CheckNameBoss("Longma [Lv. 2000] [Boss]")
            repeat task.wait()
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
                DetectEquipWp()
            until not v or not v.Parent or v.Humanoid.Health == 0 
        end
    else
        if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") then
            if not plr.Character:FindFirstChild("Holy Torch") and not plr.Backpack:FindFirstChild("Holy Torch") then
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.Position,game:GetService("Workspace").Map.Waterfall.SecretRoom.Room.Door.Door.Hitbox.CFrame)
            else
                equiptool("Holy Torch")
                if checkTorch() then
                    toTarget(plr.Character.HumanoidRootPart.Position,checkTorch().Position,checkTorch().CFrame)
                end
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Summon Rip Indra Please",
                Image = "rbxassetid://4483345998",
                Time = 2
            }) 
            task.wait(2)
        end
    end
end
function MultiGetItem()
    local namemob = {}
    if OrionLib.Flags["Canvander"].Value then 
        table.insert(namemob,"Beautiful Pirate [Lv. 1950] [Boss]")
    end
    if OrionLib.Flags["Buddy Sword"].Value then 
        table.insert(namemob,"Cake Queen [Lv. 2175] [Boss]")
    end
    if OrionLib.Flags["Pole Sword"].Value then 
        table.insert(namemob,"Thunder God [Lv. 575] [Boss]")
    end
    if CheckNameBoss(namemob)  then
        local v = CheckNameBoss(namemob)
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0  
    end
end
function doortourch()
    for i,v in next,game:GetService("Workspace").Map.Jungle.QuestPlates:GetChildren() do
        if v:IsA("Model") then
            if v.Button:FindFirstChild("TouchInterest") then
            return v 
            end
        end
    end
    return false
end
function doorcup()
    for i,v in next,game:GetService("Workspace").Map.Desert.Burn:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
    return false
end
function doorsaber()
    for i,v in next,game:GetService("Workspace").Map.Jungle.Final:GetChildren() do
        if v:IsA("Part") and not v.CanCollide then
            return true
        end
    end
    return false
end
function SaberSword()
    if plr.Data.Level.Value >= 200 then
        if 	not doorsaber() then
            if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,doortourch().Button.Position,doortourch().Button.CFrame)
            else
                if doorcup() then
                    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 1 then
                        if not plr.Character:FindFirstChild("Cup") and not plr.Backpack:FindFirstChild("Cup") then
                            if (plr.Character.HumanoidRootPart.Position-CFrame.new(1112.46521, 4.92147732, 4364.55469, -0.743286014, -4.82822775e-11, -0.668973804, 4.62103383e-10, 1, -5.85609283e-10, 0.668973804, -7.444102e-10, -0.743286014).Position).Magnitude < 5 then
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1113.66992, 7.5484705, 4365.27832, -0.78613919, -2.19578524e-08, -0.618049502, 1.02977182e-09, 1, -3.68374984e-08, 0.618049502, -2.95958493e-08, -0.78613919).Position,CFrame.new(1113.66992, 7.5484705, 4365.27832, -0.78613919, -2.19578524e-08, -0.618049502, 1.02977182e-09, 1, -3.68374984e-08, 0.618049502, -2.95958493e-08, -0.78613919))
                                firetouchinterest(game:GetService("Workspace").Map.Desert.Cup, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                                firetouchinterest(game:GetService("Workspace").Map.Desert.Cup, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                                return 
                            end			
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1112.46521, 4.92147732, 4364.55469, -0.743286014, -4.82822775e-11, -0.668973804, 4.62103383e-10, 1, -5.85609283e-10, 0.668973804, -7.444102e-10, -0.743286014).Position,CFrame.new(1112.46521, 4.92147732, 4364.55469, -0.743286014, -4.82822775e-11, -0.668973804, 4.62103383e-10, 1, -5.85609283e-10, 0.668973804, -7.444102e-10, -0.743286014))
                        else
                            equiptool("Cup")
                            if plr.Backpack:FindFirstChild("Cup") and  plr.Backpack.Cup.Handle:FindFirstChild("TouchInterest") or plr.Character:FindFirstChild("Cup") and plr.Character.Cup.Handle:FindFirstChild("TouchInterest")  then
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1395.77307, 37.4733238, -1324.34631, -0.999978602, -6.53588605e-09, 0.00654155109, -6.57083277e-09, 1, -5.32077493e-09, -0.00654155109, -5.3636442e-09, -0.999978602).Position,CFrame.new(1395.77307, 37.4733238, -1324.34631, -0.999978602, -6.53588605e-09, 0.00654155109, -6.57083277e-09, 1, -5.32077493e-09, -0.00654155109, -5.3636442e-09, -0.999978602))
                            elseif plr.Backpack:FindFirstChild("Cup") and not  plr.Backpack.Cup.Handle:FindFirstChild("TouchInterest") or plr.Character:FindFirstChild("Cup") and  not plr.Character.Cup.Handle:FindFirstChild("TouchInterest")  then
                                if (plr.Character.HumanoidRootPart.Position-Vector3.new(1457.8768310547, 88.377502441406, -1390.6892089844)).Magnitude > 8 then
                                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844).Position,CFrame.new(1457.8768310547, 88.377502441406, -1390.6892089844))
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                                end
                            end
                        end
                        if getgenv().autofarm then
                            getgenv().autofarm = false
                        end
                    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0 then
                        local v = CheckNameBoss("Mob Leader [Lv. 120] [Boss]")
                        if v then
                            repeat task.wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Saber Sword"].Value
                        end
                    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                        if not plr.Character:FindFirstChild("Relic") and not plr.Backpack:FindFirstChild("Relic") then
                            if (plr.Character.HumanoidRootPart.Position-CFrame.new(-1404.07996, 29.8520069, 5.26677656, 0.888123989, -4.0340602e-09, 0.459603906, 7.5884703e-09, 1, -5.8864642e-09, -0.459603906, 8.71560069e-09, 0.888123989)).Magnitude > 8 then
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-1404.07996, 29.8520069, 5.26677656, 0.888123989, -4.0340602e-09, 0.459603906, 7.5884703e-09, 1, -5.8864642e-09, -0.459603906, 8.71560069e-09, 0.888123989).Position,CFrame.new(-1404.07996, 29.8520069, 5.26677656, 0.888123989, -4.0340602e-09, 0.459603906, 7.5884703e-09, 1, -5.8864642e-09, -0.459603906, 8.71560069e-09, 0.888123989))
                            else
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                            end
                        else
                            equiptool("Relic")
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-1405.3677978516, 29.977333068848, 4.5685839653015).Position,CFrame.new(-1405.3677978516, 29.977333068848, 4.5685839653015))
                        end
                    end
                else
                    if not plr.Character:FindFirstChild("Torch") and not plr.Backpack:FindFirstChild("Torch") then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map.Jungle.Torch.Position,game:GetService("Workspace").Map.Jungle.Torch.CFrame)
                    else
                        equiptool("Torch")
                        if (plr.Character.HumanoidRootPart.Position-CFrame.new(1115.23499, 4.92147732, 4349.36963, -0.670654476, -2.18307523e-08, 0.74176991, -9.06980624e-09, 1, 2.1230365e-08, -0.74176991, 7.51052998e-09, -0.670654476).Position).Magnitude < 5 then
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1114.59863, 4.92147732, 4350.64258, -0.508235395, 1.00975717e-09, 0.861218214, 7.77848985e-09, 1, 3.41788708e-09, -0.861218214, 8.43606784e-09, -0.508235395).Position,CFrame.new(1114.59863, 4.92147732, 4350.64258, -0.508235395, 1.00975717e-09, 0.861218214, 7.77848985e-09, 1, 3.41788708e-09, -0.861218214, 8.43606784e-09, -0.508235395))	
                            firetouchinterest(game.Players.LocalPlayer.Character.Torch.Handle, game:GetService("Workspace").Map.Desert.Burn.Fire, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.Torch.Handle, game:GetService("Workspace").Map.Desert.Burn.Fire, 1)
                            return 
                        end
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(1115.23499, 4.92147732, 4349.36963, -0.670654476, -2.18307523e-08, 0.74176991, -9.06980624e-09, 1, 2.1230365e-08, -0.74176991, 7.51052998e-09, -0.670654476).Position,CFrame.new(1115.23499, 4.92147732, 4349.36963, -0.670654476, -2.18307523e-08, 0.74176991, -9.06980624e-09, 1, 2.1230365e-08, -0.74176991, 7.51052998e-09, -0.670654476))	
                    end
                end
            end
        else
            local v = CheckNameBoss("Saber Expert [Lv. 200] [Boss]")
            if v then
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Saber Sword"].Value
            end
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Saber Sword"].Value  then 
                SaberSword()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Soul Guitar"].Value  then 
                AutoSoulGuitar()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Cursed Dual Katana"].Value  then 
                GetCDK()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Yama"].Value  then 
                GetYama()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Tushita"].Value  then 
                GetTushita()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Buy Legend Sword"].Value  then 
                local args = {
                    [1] = "LegendarySwordDealer",
                    [2] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                if OrionLib.Flags["Auto Buy Legend Sword [ Hop ]"].Value then 
                    HopServer()
                end
            end
        end)
    end
end)
function DetectSwordUnlock()
    local dist = 0
    local name 
    for i,v in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Type == "Sword" and v.MasteryRequirements["X"] > v.Mastery then
            if dist < v.Rarity then 
                dist = v.Rarity
                name = v.Name
            end
        end
    end
    return name
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Unlock All Skill Sword In Inventory"].Value  then
                local Sword = DetectSwordUnlock()
                if Sword and not plr.Backpack:FindFirstChild(Sword) and not plr.Character:FindFirstChild(Sword) then 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem",Sword)
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Canvander"].Value or  OrionLib.Flags["Buddy Sword"].Value then 
                MultiGetItem()
            end
        end)
    end
end)
local Section = Tab6:AddSection({
	Name = "Main"
})
function tableplayeraimbot()
    local tableselectplayer = {"deo co thang nao trong sv"}
    for i,v in next,game:GetService("Workspace").Characters:GetChildren() do
        if v:IsA("Model") and not string.find(v.Name, tostring(game.Players.LocalPlayer.Name)) then
            if table.find(tableselectplayer,"deo co thang nao trong sv") then
                table.remove(tableselectplayer,1)
            end
            table.insert(tableselectplayer,v.Name)
        end
    end
    return tableselectplayer
end
local DropdownPlayer = Tab6:AddDropdown({
	Name = "Select Player Target",
	Default =  tableplayeraimbot()[1],
	Options = tableplayeraimbot(),
    Flag = "Select Player Target",
	Callback = function(Value)
	end    
})
local fovcircle = 180
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = fovcircle or 180
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)
Tab6:AddDropdown({
	Name = "Select Method Aimbot",
	Default =  "Select Player",
	Options = {"Select Player","Target nearest Player","FOV Mouse"},
    Flag = "Select Method Aimbot",
	Callback = function(Value)
	end    
})
Tab6:AddSlider({
    Name = "POV SIZE",
    Min = 0,
    Max = 500,
    Default = 180,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "POV SIZE",
    Flag = "POV SIZE",
    Callback = function(Value)
        fov_circle.Radius = Value
    end
})

Tab6:AddButton({
	Name = "Refresh List",
	Callback = function()
        DropdownPlayer:Refresh(tableplayeraimbot(),true)
  	end    
})
Tab6:AddToggle({
	Name = "Esp Player",
	Default = false,
    Flag = "Esp Player"
})
function GetPlayer()
    for i,v in next,game:GetService("Workspace").Characters:GetChildren() do
        if v:IsA("Model") and not v.HumanoidRootPart:FindFirstChild("Ignored") and not string.find(v.Name, tostring(game.Players.LocalPlayer.Name)) then
            return v 
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Esp Player"].Value then 
                local v = GetPlayer()
                if v then
                    local Ignored = Instance.new("IntValue", v.HumanoidRootPart)
                    Ignored.Name = "Ignored"
                    local Text = Drawing.new("Text")
                    Text.Visible = false
                    Text.Transparency = 1
                    Text.Text = v.Name
                    Text.Color = game.Players[v.Name].TeamColor.Color
                    Text.Size = 20
                    Text.Outline = true
                    Text.OutlineColor = Color3.fromRGB(0, 0, 0)
                    Text.Center = true
                    Text.Font = 1
                    spawn(function()
                        repeat task.wait()
                            if v:FindFirstChild("HumanoidRootPart") then
                                local Pos, OnScreen =  game.workspace.CurrentCamera:WorldToViewportPoint(v.HumanoidRootPart.Position)
                                if OnScreen then
                                    Text.Text = v.Name .. " (" .. math.round(plr:DistanceFromCharacter(v.HumanoidRootPart.Position)) .. ")"
                                    Text.Position = Vector2.new(Pos.X, Pos.Y - 20)
                                    Text.Visible = true
                                    if Targeting
                                    and Settings.SilentAim
                                    and v.Name == Targeting then
                                        Text.Color = Color3.fromRGB(130, 0, 255)
                                    elseif game.Players:FindFirstChild(v.Name) then
                                        Text.Color = game.Players[v.Name].TeamColor.Color
                                    end
                                else
                                    Text.Visible = false
                                end
                            end
                        until not v or not v.Parent or not game.Players:FindFirstChild(v.Name)
                        or not OrionLib.Flags["Esp Player"].Value
                        Text:Remove()
                        if v then
                            Ignored:Destroy()
                        end
                    end)
                end
            end
        end)
    end
end)
Tab6:AddToggle({
	Name = "Auto Aimbot",
	Default = false,
    Flag = "Auto Aimbot"
})
Tab6:AddToggle({
	Name = "No Stun",
	Default = false,
    Flag = "No Stun"
})
local function getPositionOnScreen(Vector)
    local Vec3, OnScreen = game.workspace.CurrentCamera.WorldToScreenPoint(game.workspace.CurrentCamera, Vector)
    return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end
function ClosestPartaimbot()
    local dist = math.huge
    local Closest
    local DistanceToMouse 
    for i,v in pairs(game.Workspace.Characters:GetChildren()) do
        if v:IsA("Model")  then
            if v.Name ~= plr.Name and (game.Players.LocalPlayer.Team == game.Teams.Marines and game.Players[v.Name].Team ~= game.Teams.Marines or game.Players.LocalPlayer.Team ~= game.Teams.Marines)  then
                if OrionLib.Flags["Select Method Aimbot"].Value == "Target nearest Player" then
                    local conconcac = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude
                    if conconcac < dist then
                        dist = conconcac
                        Closest = v
                    end
                else
                    local ScreenPosition, OnScreen = getPositionOnScreen(v.HumanoidRootPart.Position)
                    local Distance = (game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService")) - ScreenPosition).Magnitude
                    if Distance <= OrionLib.Flags["POV SIZE"].Value then
                        dist = Distance
                        Closest = v
                    end
                end
            end
        end
    end
    return  Closest
end
spawn(function()
    while task.wait() do
        pcall(function()
            if OrionLib.Flags["Auto Aimbot"].Value and OrionLib.Flags["Select Method Aimbot"].Value == "FOV Mouse" then 
                fov_circle.Position = game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService"))
                fov_circle.Visible =  true 
            else
                fov_circle.Visible =  false 
            end
        end)
    end
end)
game:GetService("RunService").RenderStepped:connect(function()
    pcall(function()
        if OrionLib.Flags["Auto Aimbot"].Value then 
            if OrionLib.Flags["Select Method Aimbot"].Value == "Select Player" then 
                local v = game.Workspace.Characters[OrionLib.Flags["Select Player Target"].Value]
                getgenv().psskill =  CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/0.5)
            else
                local v = ClosestPartaimbot()
                getgenv().psskill =  CFrame.new(v.HumanoidRootPart.CFrame.p, v.HumanoidRootPart.Position + v.HumanoidRootPart.Velocity/0.5)
            end
        end
    end)
end)
local Section = Tab7:AddSection({
	Name = "Main"
})
Tab7:AddButton({
	Name = "Redeem Code",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2GAMERROBOT_EXP1")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("StrawHatMaine")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2OfficialNoobie")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("THEGREATACE")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("SUB2NOOBMASTER123")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2Daigrock")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Axiore")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("TantaiGaming")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Bluxxy")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("STRAWHATMAINE")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("3BVISITS")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("UPD16")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2Fer999")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Enyu_is_Pro")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("JCWK")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("StarcodeHEO")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("MagicBUS")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("KittGaming")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("Sub2CaptainMaui")
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer("EXP_5B")
  	end    
})
Tab7:AddButton({
	Name = "Teleport Old World",
	Callback = function()
        local args = {
            [1] = "TravelMain" -- OLD WORLD to NEW WORLD
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Teleport New World",
	Callback = function()
        local args = {
            [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Teleport Third Sea",
	Callback = function()
        local args = {
            [1] = "TravelZou" -- OLD WORLD to NEW WORLD
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
local Section = Tab7:AddSection({
	Name = "Fighting Shop"
})
local function Remote(x, v, c)
    if not x and c then
        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer(v, true)
    else
        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer(x, v, c)
    end
end
Tab7:AddButton({
	Name = "SuperHuman",
	Callback = function()
        Remote('BuySuperhuman', true)
        Remote('BuySuperhuman')
  	end    
})
Tab7:AddButton({
	Name = "DeathStep",
	Callback = function()
        Remote('BuyDeathStep', true)
        Remote('BuyDeathStep')
  	end    
})
Tab7:AddButton({
	Name = "SharkmanKarate",
	Callback = function()
        Remote('BuySharkmanKarate', true)
        Remote('BuySharkmanKarate')
  	end    
})
Tab7:AddButton({
	Name = "Electric Claw",
	Callback = function()
        Remote('BuyElectricClaw', true)
        Remote('BuyElectricClaw')
  	end    
})
Tab7:AddButton({
	Name = "Dragon Talon",
	Callback = function()
        Remote('BuyDragonTalon', true)
        Remote('BuyDragonTalon')
  	end    
})
Tab7:AddButton({
	Name = "GodHuman",
	Callback = function()
        Remote('BuyGodhuman', true)
        Remote('BuyGodhuman')
  	end    
})
local Section = Tab7:AddSection({
	Name = "Abilities Shop"
})
Tab7:AddButton({
	Name = "Skyjump [ $10,000 Beli ]",
	Callback = function()
        local args = {
            [1] = "BuyHaki",
            [2] = "Geppo"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Buso Haki [ $25,000 Beli ]",
	Callback = function()
        local args = {
            [1] = "BuyHaki",
            [2] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Observation haki [ $750,000 Beli ]",
	Callback = function()
        local args = {
            [1] = "KenTalk",
            [2] = "Buy"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Soru [ $100,000 Beli ]",
	Callback = function()
        local args = {
            [1] = "BuyHaki",
            [2] = "Soru"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
local Section = Tab7:AddSection({
	Name = "Misc"
})
Tab7:AddButton({
	Name = "Reroll Race",
	Callback = function()
        local args = {
            [1] = "BlackbeardReward",
            [2] = "Reroll",
            [3] = "2"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
  	end    
})
Tab7:AddButton({
	Name = "Reset Stats",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
  	end    
})

local Section = Tab8:AddSection({
	Name = "Status"
})

local StatusEliteHunter = Tab8:AddLabel("Elite Mob : ❌")
local StatusKatakuri = Tab8:AddLabel("Summon Katakuri :")
local StatusMirage = Tab8:AddLabel("Mirage Island : ❌")
local StatusMoon = Tab8:AddLabel("Moon : ")
local StatusGear = Tab8:AddLabel("Acient One Status : ")
function CheckAcientOneStatus()
    if not game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return "You have yet to achieve greatness"
    end
    local v227 = nil
    local v228 = nil
    local v229 = nil
    v229, v228, v227 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Check")
    if v229 == 1 then
        return "Required Train More"
    elseif v229 == 2 or v229 == 4 or v229 == 7 then
        return "Can Buy Gear With " .. v227 .. " Fragments"
    elseif v229 == 3 then
        return "Required Train More"
    elseif v229 == 5 then
        return "You Are Done Your Race."
    elseif v229 == 6 then
        return "Upgrades completed: " .. v228 - 2 .. "/3, Need Trains More"
    end
    if v229 ~= 8 then
        if v229 == 0 then
            return "Ready For Trial"
        else
            return "You have yet to achieve greatness"
        end
    end
    return "Remaining " .. 10 - v228 .. " training sessions."
end
function MoonTextureId()
    if game.PlaceId == 2753915549 then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif game.PlaceId == 4442272183  then
        return game:GetService("Lighting").FantasySky.MoonTextureId
    elseif game.PlaceId == 7449423635 then
        return game:GetService("Lighting").Sky.MoonTextureId
    end
end
function CheckMoon()
    local moon5 = "http://www.roblox.com/asset/?id=9709149431"
    local moon4 = "http://www.roblox.com/asset/?id=9709149052"
    local moonreal = MoonTextureId()
    local cofullmoonkothangbeo = "Bad Moon"
    if moonreal == moon5 or moonreal == moon4 then
        if moonreal == moon5 then
            cofullmoonkothangbeo = "Full Moon"
        elseif moonreal == moon4 then
            cofullmoonkothangbeo = "Next Night"
        end
    end
    return cofullmoonkothangbeo
end
function function6()
    return math.floor(game.Lighting.ClockTime)
end
function getServerTime()
    RealTime = tostring(math.floor(game.Lighting.ClockTime*100)/100)
    RealTime = tostring(game.Lighting.ClockTime)
    RealTimeTable = RealTime:split(".")
    Minute,Second = RealTimeTable[1],tonumber((0+tonumber(RealTimeTable[2]/100)))*60
    return Minute,Second
end
function function8()
    local c = game.Lighting
    local c2 = c.ClockTime
    if CheckMoon() == "Full Moon" and c2 <= 5 then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(5 - c2) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (c2 > 5 and c2 < 12) then
        return tostring(function6()) .. " ( Fake Moon )"
    elseif CheckMoon() == "Full Moon" and (c2 > 12 and c2 < 18) then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - c2) .. " Minutes )"
    elseif CheckMoon() == "Full Moon" and (c2 > 18 and c2 <= 24) then
        return tostring(function6()) .. " ( Will End Moon In " .. math.floor(24+6 - c2) .. " Minutes )"
    end
    if CheckMoon() == "Next Night" and c2 < 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18 - c2) .. " Minutes )"
    elseif CheckMoon() == "Next Night" and c2 > 12 then
        return tostring(function6()) .. " ( Will Full Moon In " .. math.floor(18+12 - c2) .. " Minutes )"
    end
    return tostring(function6())
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if DetectEliteHunter() then 
                StatusEliteHunter:Set("Elite Mob : ✅")
            else
                StatusEliteHunter:Set("Elite Mob : ❌")
            end
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then 
                StatusMirage:Set("Mirage Island : ✅")
            else
                StatusMirage:Set("Mirage Island : ❌")
            end
            StatusMoon:Set("Moon : "..CheckMoon().."|"..function8())
            StatusGear:Set("Acient One Status : "..CheckAcientOneStatus())
            StatusKatakuri:Set("Summon Katakuri :"..string.gsub(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true),"%D","").." Mobs")
        end)
    end
end)


local Section = Tab8:AddSection({
	Name = "Server"
})
local InputJobId
Tab8:AddTextbox({
	Name = "Input JobId",
	Default =  "",
	TextDisappear = true,
    Flag = "Input JobId",
	Callback = function(Value)
        InputJobId = Value
	end	  
})
Tab8:AddButton({
	Name = "Join Server",
	Callback = function()
        while task.wait() do 
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",tostring(InputJobId))
        end
  	end    
})
Tab8:AddButton({
	Name = "Copy JobId",
	Callback = function()
        setclipboard(tostring(game.JobId))
  	end    
})
Tab8:AddButton({
	Name = "Hop Server",
	Callback = function()
        HopServer()
  	end    
})
local Section = Tab9:AddSection({
	Name = "Main"
})

Tab9:AddButton({
	Name = "No Fog",
	Callback = function()
        local c = game.Lighting
        c.FogEnd = 100000
        for i, v in pairs(c:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
  	end    
})
Tab9:AddToggle({
	Name = "Auto Get Cyborg",
	Default = Settings["Auto Get Cyborg"] or false,
    Flag = "Auto Get Cyborg",
	Callback = function(Value)
        SaveSettings("Auto Get Cyborg",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Ghoul",
	Default = Settings["Auto Get Ghoul"] or false,
    Flag = "Auto Get Ghoul",
	Callback = function(Value)
        SaveSettings("Auto Get Ghoul",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Ghoul [ Hop Find Boss ]",
	Default = Settings["Auto Get Ghoul [ Hop Find Boss ]"] or false,
    Flag = "Auto Get Ghoul [ Hop Find Boss ]",
	Callback = function(Value)
        if Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Get Ghoul, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Get Ghoul [ Hop Find Boss ]",Value)
	end
})

Tab9:AddToggle({
	Name = "Upgrade Race V2-V3",
	Default = Settings["Upgrade Race V2-V3"] or false,
    Flag = "Upgrade Race V2-V3",
	Callback = function(Value)
        SaveSettings("Upgrade Race V2-V3",Value)
	end
})
function CheckPlayerBackpack(mb)
    k = game.Players.LocalPlayer.Backpack
    k2 = game.Players.LocalPlayer.Character
    for i, v in pairs(k:GetChildren()) do
        if v.Name == tostring(mb) then
            return true
        end
    end
    for i, v in pairs(k2:GetChildren()) do
        if v.Name == tostring(mb) then
            return true
        end
    end
end
function CheckMicrochip()
    if CheckPlayerBackpack("Microchip") then
        return true
    end
end
function CheckCoreBrain()
    if CheckPlayerBackpack("Core Brain") then
        return true
    end
end
function BuyChipLaw()
    v354 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    if v354 == 1 then
        return true
    end
    if v354 == 0 then
        return false
    end
    if v354 == 2 then
        return true
    end
end

function GetCyborg()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") == 2 then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Turn Off Please",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
        task.wait(3)
        return
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
        return
    end
    if  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckBlockPart") then
        if CheckNameBoss("Order [Lv. 1250] [Raid Boss]") then
            local v = CheckNameBoss("Order [Lv. 1250] [Raid Boss]")
            if v then
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Get Cyborg"].Value
            end
        else
            if not CheckMicrochip() and game.Players.LocalPlayer.Data.Fragments.Value >= 1000 then
                BuyChipLaw()
            elseif CheckMicrochip() then
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            end
        end
    else
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Find Fist of Darkness, Please",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        task.wait(3)
    end
end
function GetGhoul()
    if not checkcountitem("Ectoplasm",100) then
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Ectoplasm >= 100",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        task.wait(3)
        return 
    end
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
        if (CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808).Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 8 then 
            local args = {
                [1] = "Ectoplasm",
                [2] = "BuyCheck",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            v352 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
        else
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808).Position,CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808))
        end
    else
        if CheckNameBoss("Cursed Captain [Lv. 1325] [Raid Boss]") then
            local v = CheckNameBoss("Cursed Captain [Lv. 1325] [Raid Boss]")
            if v then
                repeat task.wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Get Ghoul"].Value
                task.wait(2)
            end
        else
            if OrionLib.Flags["Auto Get Ghoul [ Hop Find Boss ]"].Value then 
                HopServer()
            end
        end
    end
end
function CheckItemInChar(x)
    if plr.Character:FindFirstChild(x) or plr.Backpack:FindFirstChild(x) then 
        return true 
    end
end
function CheckRace()
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if v113 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if v111 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end
getgenv().BlBossHuman = {}
function RaceHumanV2()
    local DetectbossHuman =  (not table.find(BlBossHuman,"Jeremy [Lv. 850] [Boss]") and CheckNameBoss("Jeremy [Lv. 850] [Boss]")) or (not table.find(BlBossHuman,"Fajita [Lv. 925] [Boss]") and CheckNameBoss("Fajita [Lv. 925] [Boss]")) or (not table.find(BlBossHuman,"Diamond [Lv. 750] [Boss]") and CheckNameBoss("Diamond [Lv. 750] [Boss]"))
    if DetectbossHuman then 
        local v = DetectbossHuman
        repeat task.wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
        if not table.find(BlBossHuman,DetectbossHuman.Name) then
            table.insert(BlBossHuman,DetectbossHuman.Name)
        end
    end
end
function MinkHumanV2()
    local v = DetectChest()
    repeat task.wait()
        if  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2 then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 5 then 
            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
        end
        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.Position,v.CFrame*CFrame.new(0,1,0),true)
    until not v or not v.Parent or not OrionLib.Flags["Upgrade Race V2-V3"].Value
end
local SeabeastAim = false
function UpgradeRace()
    local Race = CheckRace()
    if string.find(Race,"V1") then 
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
        elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
            if not CheckItemInChar("Flower 1") then 
                print("a")
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Flower1.Position,game:GetService("Workspace").Flower1.CFrame)
            elseif not CheckItemInChar("Flower 2") then 
                print("b")
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Flower2.Position,game:GetService("Workspace").Flower2.CFrame)
            elseif not CheckItemInChar("Flower 3") then 
                print("c")
                if not DetectMob("Swan Pirate [Lv. 775]") then 
                    TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Upgrade Race V2-V3"].Value)
                else
                    local v = DetectMob("Swan Pirate [Lv. 775]")
                    repeat task.wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        task.spawn(function()
                            BringMob(v)
                        end)
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                end
            end
        elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
            if (CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position,CFrame.new(-2777.6001, 72.9661407, -3571.42285))
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
            end
        else
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") 
                and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible  then
                    if not DetectMob("Swan Pirate [Lv. 775]") then 
                        TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Upgrade Race V2-V3"].Value)
                    else
                        local v = DetectMob("Swan Pirate [Lv. 775]")
                        repeat task.wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            task.spawn(function()
                                BringMob(v)
                            end)
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                    end
                else
                    if (plr.Character.HumanoidRootPart.Position-CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
                    else
                        local args = {
                            [1] = "StartQuest",
                            [2] = "BartiloQuest",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                local v = CheckNameBoss("Jeremy [Lv. 850] [Boss]")
                if v then
                    repeat task.wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                repeat task.wait()
                    if (plr.Character.HumanoidRootPart.Position-Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
                        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-1835.65, 10.4325, 1679.75),CFrame.new(-1835.65, 10.4325, 1679.75))
                    else
                        plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
                        task.wait()
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3
            end
        end
    else
        local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
        if v113 == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            return
        elseif v113 == 2 then 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
            return
        elseif v113 == -1 then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Beli >= 2m",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            task.wait(2)
            return 
        end
        if Race == "Human V2" then 
            RaceHumanV2()
        elseif Race == "Mink V2" then 
            MinkHumanV2()
        elseif Race == "Cyborg V2" then 
            if not checkdevilfruit() then 
                if  getfruitstore(true) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
                end
            end
        elseif Race == "Fishman V2" then
            if not checkseabeast() then
                if not checkboat() then
                    local PositionGetBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
                    if game.PlaceId == 7449423635 then
                        PositionGetBoat = CFrame.new(-6044.32, 15.1151, -2038.66)
                    end
                    if (PositionGetBoat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 8 then
                        toTarget(plr.Character.HumanoidRootPart.Position,PositionGetBoat.Position,PositionGetBoat)
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","PirateBasic")
                    end
                else
                    local PositionWaitSea = CFrame.new(28.4108+20, 1.2327+10, 3679.99+10)
                    if game.PlaceId == 7449423635 then
                        PositionWaitSea = CFrame.new(-7551.96, 10.4861, -1537.59)
                    end
                    if (checkboat().VehicleSeat.Position-PositionWaitSea.Position).Magnitude > 50 then 
                        checkboat().VehicleSeat.CFrame = PositionWaitSea
                    else
                        if not plr.Character.Humanoid.Sit then 
                            if (checkboat().VehicleSeat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 50 then
                                toTarget(plr.Character.HumanoidRootPart.Position,checkboat().VehicleSeat.Position,checkboat().VehicleSeat.CFrame)
                            else
                                plr.Character.HumanoidRootPart.CFrame = checkboat().VehicleSeat.CFrame
                            end
                        end
                    end
                end
            else
                SeabeastAim = true
                local v = checkseabeast()
                repeat task.wait()
                    TeleportSeabeast(v)
                    spawn(function()
                        autoskill()
                    end)
                    if v:FindFirstChild("Engine") then
                        getgenv().psskill = v.Engine.CFrame
                    else
                        getgenv().psskill = v.HumanoidRootPart.CFrame
                    end
                until not v or not v.Parent or v.Health.Value <= 0 or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                SeabeastAim = false
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Not Support, Suggest Please",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            task.wait(1)
        end
    end
end
--a3a4f17e-aa4a-4829-806a-3fc0fb764ec0
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Upgrade Race V2-V3"].Value then 
                UpgradeRace()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Cyborg"].Value then 
                GetCyborg()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Ghoul"].Value then 
                GetGhoul()
            end
        end)
    end
end)

local Section = Tab9:AddSection({
	Name = "Trial V4"
})
--[[
local SettingMultiAccount = {}
if not pcall(function() readfile(FolderName.."/" .. "AccountMulti.json") end) then
    writefile(FolderName.."/" .. "AccountMulti.json", game:GetService("HttpService"):JSONEncode(SettingMultiAccount))
end

SettingMultiAccount = HttpService:JSONDecode(readfile(FolderName.."/" .. "AccountMulti.json"))
Tab9:AddToggle({
	Name = "Multi Account",
	Default = Settings["Multi Account"] or false,
    Flag = "Multi Account",
	Callback = function(Value)
        SettingMultiAccount[plr.Name] = Value
        writefile(FolderName.."/" .. "AccountMulti.json", game:GetService("HttpService"):JSONEncode(SettingMultiAccount))
        SaveSettings("Multi Account",Value)
	end
})
]]

Tab9:AddToggle({
	Name = "Auto Buy Gear",
	Default = Settings["Auto Buy Gear"] or false,
    Flag = "Auto Buy Gear",
	Callback = function(Value)
        SaveSettings("Auto Buy Gear",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Choose Gears",
	Default = Settings["Auto Choose Gears"] or false,
    Flag = "Auto Choose Gears",
	Callback = function(Value)
        SaveSettings("Auto Choose Gears",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Blue Gear",
	Default = false,
    Flag = "Auto Get Blue Gear"
})

getgenv().NoclipButton = false
Tab9:AddButton({
	Name = "Teleport  Door Trial",
	Callback = function()
        NoclipButton = true
        local Door = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union
        repeat task.wait()
            toTarget(plr.Character.HumanoidRootPart.Position,Door.Position,Door.CFrame)
        until (Door.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8
        NoclipButton = false 
  	end    
})

Tab9:AddButton({
	Name = "Teleport Acient Clock ",
	Callback = function()
        local Prompt = game:GetService("Workspace").Map["Temple of Time"]:FindFirstChild("Prompt")
        NoclipButton = true
        repeat task.wait()
            toTarget(plr.Character.HumanoidRootPart.Position,Prompt.Position,Prompt.CFrame)
        until (Prompt.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8
        NoclipButton = false
  	end    
})
local TogglePullLever = Tab9:AddToggle({
	Name = "Pull Lever",
	Default = Settings["Pull Lever"] or false,
    Flag = "Pull Lever",
	Callback = function(Value)
        SaveSettings("Pull Lever",Value)
	end
})
Tab9:AddToggle({
	Name = "Pull Lever [ Hop ]",
	Default = Settings["Pull Lever [ Hop ]"] or false,
    Flag = "Pull Lever [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Pull Lever"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Pull Lever Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Pull Lever [ Hop ]",Value)
	end
})
getgenv().TrialDone = false
local ToggleTrial = Tab9:AddToggle({
	Name = "Auto Trial",
	Default = Settings["Auto Trial"] or false,
    Flag = "Auto Trial",
	Callback = function(Value)
        if Value then 
            if game.Players.LocalPlayer.Data.Race.Value == "Fishman" then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Select Weapons  Kill Seabeast In Setting ",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                }) 
            end
        end
        SaveSettings("Auto Trial",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Trial [ Hop ]",
	Default = Settings["Auto Trial [ Hop ]"] or false,
    Flag = "Auto Trial [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Trial"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Turn On Auto Trial Please ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Auto Trial [ Hop ]",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Kill Player When complete Trial",
	Default = Settings["Auto Kill Player When complete Trial"] or false,
    Flag = "Auto Kill Player When complete Trial",
	Callback = function(Value)
        if Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Pick Weapon In Main Farm ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Auto Kill Player When complete Trial",Value)
	end
})
Tab9:AddToggle({
	Name = "Detect Players When Turn Race V3\n And Auto Turn On Race V3 [ Test ]",
	Default = Settings["Detect Players When Turn Race V3 And Auto Turn On Race V3"] or false,
    Flag = "Detect Players When Turn Race V3 And Auto Turn On Race V3",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Trial"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Turn On Auto Trial Please ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Detect Players When Turn Race V3 And Auto Turn On Race V3",Value)
	end
})
function CheckMultiAccount()
    local mmb = {}
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= plr.Name  then 
            mmb[v.Name] = v.Data.Race.Value
        end
    end
    return mmb
end
function CheckMultiTeleDoor()
    local CountPlayer = 0 
    for i,v in next,CheckMultiAccount() do 
        for i1,v1 in next,game.Workspace.Characters:GetChildren() do
            if  i == v1.Name then 
                if v1.HumanoidRootPart:FindFirstChild("Agility") and (v1.HumanoidRootPart.Position-game:GetService("Workspace").Map["Temple of Time"][v.."Corridor"].Door.Door.RightDoor.Union.Position).Magnitude <= 50 then 
                    CountPlayer = CountPlayer + 1 
                end
            end
        end
    end
    if CountPlayer >= 2 then 
        return true 
    end
end
function TrialHuman()
    if  game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Strength") then
        StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if  (v.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then 
                    toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,75,0))
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end
function TrialGhoul()
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Carnage") then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position).Magnitude <= 1000 then

            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if (v.HumanoidRootPart.Position - game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position).Magnitude <= 1000 then
                    toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,75,0))
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end
local autospamskillTrial = false
function GetSeaBeastTrial()
    if not game.Workspace.Map:FindFirstChild("FishmanTrial") then
        autospamskillTrial = false
        return 
    end
    local FishmanTrial 
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
        FishmanTrial = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
    end
    if FishmanTrial then
        for i, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
            if string.find(v.Name, "SeaBeast") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
                if v.Health.Value > 0 then
                    return v
                end
            end
        end
    end
end

function function7()
    local GameTime = "Error"
    local c2 = game.Lighting.ClockTime
    if c2 >= 18 or c2 < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end
getgenv().KillAuraDone = false
spawn(function()
    while task.wait() do
        pcall(function()
            for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then 
                    if string.find(v.Text,"completed your trial!")  or string.find(v.Text,"All trials have been completed!") then 
                        TrialDone = true 
                    end
                    if string.find(v.Text,"FIGHT!") then
                        task.wait(1)
                        KillAuraDone = true 
                    end
                end
            end
        end)
    end
end) 
loadstring([[
    local dotehookold
    dotehookold = hookfunction(require(game:GetService("ReplicatedStorage").Notification).new,function(...)
        local Args = {...}
        if Args[1] and (string.find(Args[1],"completed your trial!")  or string.find(Args[1],"All trials have been completed!")) then
            TrialDone = true 
        end
        if Args[1] and string.find(Args[1],"FIGHT!")  then
            KillAuraDone = true 
        end
        return dotehookold(...)
    end)
]])()
spawn(function()
game.ReplicatedStorage.Remotes.Temple.OnClientEvent:Connect((function(a1, a2)
    if a1 == "Start" and (a2 == 2 or a2 == "2") then 
        KillAuraDone = true

    end
end))
end)
function DetectPlayerKillauraTrial()
    for i,v in next,game.Workspace.Characters:GetChildren() do 
        if v:IsA("Model") and  v.Name ~= plr.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-Vector3.new(28718.068359375, 14887.5625, -60.5482177734375)).Magnitude <= 150 then 
            return v
        end
    end
end

function  AutoKilPlayer()
    if not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible and KillAuraDone then 
        KillAuraDone = false 
        return
    end
    if KillAuraDone and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible  
    and DetectPlayerKillauraTrial()  then
        local v = DetectPlayerKillauraTrial()
        if v then 
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,0,4))
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        end
    end 
end
function AutoTrials()
    if  (CheckMoon() == "Full Moon"  or CheckMoon() == "Next Night")   and OrionLib.Flags["Auto Trial [ Hop ]"].Value  then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = " Turn Off Hop Trial, Please ",
            Image = "rbxassetid://4483345998",
            Time = 5
        }) 
        task.wait(3)
        return 
    else
        if OrionLib.Flags["Auto Trial [ Hop ]"].Value then 
            HopServer()
            return 
        end
    end
    if TrialDone then 
        ToggleTrial:Set(false)
        if autospamskillTrial then 
            autospamskillTrial = false
        end
        task.wait()
        TrialDone = false
        return 
    end
    if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then
        local Race = game.Players.LocalPlayer.Data.Race.Value
        if Race == "Human" then 
            TrialHuman()
        elseif Race == "Skypiea" then 
            if game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"] and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"].CFrame.Position).Magnitude <= 1000 then
                local FinishPart = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                toTarget(plr.Character.HumanoidRootPart.Position,FinishPart.Position,FinishPart.CFrame)
                task.wait(3)
            end
        elseif Race == "Fishman" then
            local FishmanTrial 
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
                FishmanTrial = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
            end
            if FishmanTrial and (FishmanTrial.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 1500 then
                if GetSeaBeastTrial() then
                    autospamskillTrial = true
                    spawn(function()
                        autoskill()
                    end)
                    TeleportSeabeast(GetSeaBeastTrial())
                    getgenv().psskill = GetSeaBeastTrial().HumanoidRootPart.CFrame
                else
                    autospamskillTrial = false
                end
            end
        elseif Race == "Mink" then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"].Position).Magnitude <= 1000 then
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").StartPoint.Position,game:GetService("Workspace").StartPoint.CFrame*CFrame.new(0,2,0))
            end
        elseif Race == "Ghoul" then 
            TrialGhoul()
        elseif Race == "Cyborg" then
            CyborgBypassCFrame = CFrame.new(-20021.8691,10090.4893,-16.37994,-0.976144373,6.71342875e-08,-0.217122361,8.46145412e-08,1,-7.1212007e-08,0.217122361,-8.78849065e-08,-0.976144373)
            if (CyborgBypassCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then

                toTarget(plr.Character.HumanoidRootPart.Position,CyborgBypassCFrame.Position,CyborgBypassCFrame)
                task.wait(3)
            end
        end
    else
        if not TrialDone and not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible   then 
            local Door = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union
            toTarget(plr.Character.HumanoidRootPart.Position,Door.Position,Door.CFrame)
            if OrionLib.Flags["Detect Players When Turn Race V3 And Auto Turn On Race V3"].Value  and  CheckMultiTeleDoor() then 
                game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                task.wait()
                game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
            end
        end
    end
end

spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Trial"].Value then 
                AutoTrials()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Kill Player When complete Trial"].Value then 
                AutoKilPlayer()
            end
        end)
    end
end)
task.spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Kill Player When complete Trial"].Value and KillAuraDone and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then 
                autoattack()
            end
        end)
    end
end)



function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for i, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then --and not v.CanCollide then
                return v
            end
        end
    end
end
function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
end
function CollectBlueGear()
    local BlueGear = getBlueGear()
    if BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getBlueGear().Position,getBlueGear().CFrame)
    elseif BlueGear and BlueGear.Transparency == 1 then
        if (getHighestPoint().CFrame*CFrame.new(0, 211.88, 0).Position-plr.Character.HumanoidRootPart.Position).Magnitude > 10 then 
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getHighestPoint().Position,getHighestPoint().CFrame*CFrame.new(0, 211.88, 0))
        else
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
            task.wait(.1)
            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
            task.wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
            task.wait(1.5)
        end
    end
end
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Blue Gear"].Value then 
                CollectBlueGear()
            end
        end)
    end
end) 
local Doorsau = CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
local Door2 = 0.2

function PullLever()
    if not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then 
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and function7() == "Night" then
            local v213 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            if v213 == 1 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
            elseif v213 == 2 then
                toTarget(plr.Character.HumanoidRootPart.Position,CFrame.new(2956.78, 2281.85, -7217.63).Position,CFrame.new(2956.78, 2281.85, -7217.63))
                if (CFrame.new(2956.78, 2281.85, -7217.63).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then 
                    local args = {
                        [1] = "RaceV4Progress",
                        [2] = "Teleport"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            elseif v213 == 3 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
            else
                CollectBlueGear()
            end
        elseif game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and function7() ~= "Night" then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Waiting  Night",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            task.wait(5)
        elseif not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and OrionLib.Flags["Pull Lever [ Hop ]"].Value then 
            HopServer()
        end
    else
        if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > Doorsau.Z + Door2 or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < Doorsau.Z - Door2 then 
            if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map["Temple of Time"].Lever.Part.Position).Magnitude > 10 then
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map["Temple of Time"].Lever.Part.Position,game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
            else
                fireproximityprompt(workspace.Map["Temple of Time"].Lever.Prompt.ProximityPrompt,1)
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Pull Lever Complete",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            TogglePullLever:Set(false)
        end
    end
end

spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Pull Lever"].Value then 
                PullLever()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Buy Gear"].Value then 
                if string.find(CheckAcientOneStatus(),"Can Buy Gear") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
                end
            end
        end)
    end
end)


local Gears = {
    "Alpha",
    "Omega"
}
function DetectGearUp()
    for i,v in next,workspace.Map["Temple of Time"].InnerClock:GetChildren() do 
        if v:IsA("MeshPart") and v:FindFirstChild("Highlight") and v.Highlight.FillTransparency == 1 then 
            return v.Name
        end
    end
end
local NumberGear  = 1
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Choose Gears"].Value then 
                local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
                if v111 and  v111.HadPoint then
                    if DetectGearUp() then 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","SpendPoint",DetectGearUp(),"Omega")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","SpendPoint",DetectGearUp(),"Alpha")
                    else
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseIn()
                    end
                else
                    if game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Enabled then 
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseOut()
                    end
                end
            end
        end)
    end
end)

local Section = Tab10:AddSection({
	Name = "Setting SeaBeast"
})
Tab10:AddDropdown({
	Name = "Select Weapon SeaBeast 1",
	Default =  Settings["Select Weapon SeaBeast 1"] or "Blox Fruit",
	Options = {'Blox Fruit', 'Sword', 'Melee'},
    Flag = "Select Weapon SeaBeast 1",
	Callback = function(Value)
		SaveSettings("Select Weapon SeaBeast 1",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill Z",
	Default = Settings["Seabeast1 Z"] or false,
    Flag = "Seabeast1 Z",
	Callback = function(Value)
        SaveSettings("Seabeast1 Z",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill X",
	Default = Settings["Seabeast1 X"] or false,
    Flag = "Seabeast1 X",
	Callback = function(Value)
        SaveSettings("Seabeast1 X",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill C",
	Default = Settings["Seabeast1 C"] or false,
    Flag = "Seabeast1 C",
	Callback = function(Value)
        SaveSettings("Seabeast1 C",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill V",
	Default = Settings["Seabeast1 V"] or false,
    Flag = "Seabeast1 V",
	Callback = function(Value)
        SaveSettings("Seabeast1 V",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill F",
	Default = Settings["Seabeast1 F"] or false,
    Flag = "Seabeast1 F",
	Callback = function(Value)
        SaveSettings("Seabeast1 F",Value)
	end    
})
Tab10:AddDropdown({
	Name = "Select Weapon SeaBeast 2",
	Default =  Settings["Select Weapon SeaBeast 2"] or "Melee",
	Options = {'Blox Fruit', 'Sword', 'Melee'},
    Flag = "Select Weapon SeaBeast 2",
	Callback = function(Value)
		SaveSettings("Select Weapon SeaBeast 2",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill Z",
	Default = Settings["Seabeast2 Z"] or false,
    Flag = "Seabeast2 Z",
	Callback = function(Value)
        SaveSettings("Seabeast2 Z",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill X",
	Default = Settings["Seabeast2 X"] or false,
    Flag = "Seabeast2 X",
	Callback = function(Value)
        SaveSettings("Seabeast2 X",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill C",
	Default = Settings["Seabeast2 C"] or false,
    Flag = "Seabeast2 C",
	Callback = function(Value)
        SaveSettings("Seabeast2 C",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill V",
	Default = Settings["Seabeast2 V"] or false,
    Flag = "Seabeast2 V",
	Callback = function(Value)
        SaveSettings("Seabeast2 V",Value)
	end    
})
Tab10:AddToggle({
	Name = "Use Skill F",
	Default = Settings["Seabeast2 F"] or false,
    Flag = "Seabeast2 F",
	Callback = function(Value)
        SaveSettings("Seabeast2 F",Value)
	end    
})

Tab10:AddSection({
	Name = "Setting Other"
})
Tab10:AddSlider({
    Name = "Tween Speed",
    Min = 0,
    Max = 300,
    Default = Settings["Tween Speed"] or 160 ,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Tween Speed",
    Flag = "Tween Speed",
    Callback = function(Value)
        SaveSettings("Tween Speed",Value)
    end
})
Tab10:AddSlider({
    Name = "Delay HopServer",
    Min = 0,
    Max = 30,
    Default = Settings["Delay HopServer"] or 15 ,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Delay HopServer",
    Flag = "Delay HopServer",
    Callback = function(Value)
        SaveSettings("Delay HopServer",Value)
    end
})

local Section = Tab11:AddSection({
	Name = "Main"
})

Tab11:AddToggle({
	Name = "White Screen",
	Default = Settings["White Screen"] or false,
    Flag = "White Screen",
	Callback = function(Value)
        SaveSettings("White Screen",Value)
	end    
})
local fovcircle2 = 10
local fov_circle2 = Drawing.new("Circle")
fov_circle2.Thickness = 1
fov_circle2.NumSides = 100
fov_circle2.Radius = fovcircle2 
fov_circle2.Filled = false
fov_circle2.Visible = false
fov_circle2.ZIndex = 999
fov_circle2.Transparency = 1
fov_circle2.Color = Color3.fromRGB(237, 5, 5)
spawn(function()
    while task.wait() do
        if OrionLib.Flags["White Screen"].Value then
            pcall(function()
                if not game.Workspace:FindFirstChild("IgnoredWhiteScreen") then
                    local Ignored = Instance.new("IntValue", game.Workspace)
                    Ignored.Name = "IgnoredWhiteScreen"
                    local RunService = game:GetService("RunService")
                    RunService:Set3dRenderingEnabled(false)
                else
                    fov_circle2.Position = game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService"))
                    fov_circle2.Visible =  true 
                end
            end)
        else
            if game.Workspace:FindFirstChild("IgnoredWhiteScreen") then
                fov_circle2.Visible = false
                local RunService = game:GetService("RunService")
                RunService:Set3dRenderingEnabled(true)
                game.Workspace:FindFirstChild("IgnoredWhiteScreen"):Destroy()
            end
        end
    end
end)
local Island 
if game.PlaceId == 2753915549 then
    Island = {
        ["Start Island"] = CFrame.new(1071.2832, 16.3085976, 1426.86792),
        ["Marine Start"] = CFrame.new(-2573.3374, 6.88881969, 2046.99817),
        ["Middle Town"] = CFrame.new(-655.824158, 7.88708115, 1436.67908),
        ["Jungle"] = CFrame.new(-1249.77222, 11.8870859, 341.356476),
        ["Pirate Village"] = CFrame.new(-1122.34998, 4.78708982, 3855.91992),
        ["Desert"] = CFrame.new(1094.14587, 6.47350502, 4192.88721),
        ["Frozen Village"] = CFrame.new(1198.00928, 27.0074959, -1211.73376),
        ["MarineFord"] = CFrame.new(-4505.375, 20.687294, 4260.55908),
        ["Colosseum"] = CFrame.new(-1428.35474, 7.38933945, -3014.37305),
        ["Sky 1st Floor"] = CFrame.new(-4970.21875, 717.707275, -2622.35449),
        ["Sky 2st Floor"] = CFrame.new(-4813.0249, 903.708557, -1912.69055),
        ["Sky 3st Floor"] = CFrame.new(-7952.31006, 5545.52832, -320.704956),
        ["Prison"] = CFrame.new(4854.16455, 5.68742752, 740.194641),
        ["Magma Village"] = CFrame.new(-5231.75879, 8.61593437, 8467.87695),
        ["UndeyWater City"] = CFrame.new(61163.8516, 11.7796879, 1819.78418),
        ["Fountain City"] = CFrame.new(5132.7124, 4.53632832, 4037.8562),
        ["House Cyborg's"] = CFrame.new(6262.72559, 71.3003616, 3998.23047),
        ["Shank's Room"] = CFrame.new(-1442.16553, 29.8788261, -28.3547478),
        ["Mob Island"] = CFrame.new(-2850.20068, 7.39224768, 5354.99268),
    }
elseif game.PlaceId == 4442272183 then
    Island = {
        ["First Spot"] = CFrame.new(82.9490662, 18.0710983, 2834.98779),
        ["Kingdom of Rose"] = game.Workspace["_WorldOrigin"].Locations["Kingdom of Rose"].CFrame,
        ["Dark Ares"] = game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame,
        ["Flamingo Mansion"] = CFrame.new(-390.096313, 331.886475, 673.464966),
        ["Flamingo Room"] = CFrame.new(2302.19019, 15.1778421, 663.811035),
        ["Green bit"] = CFrame.new(-2372.14697, 72.9919434, -3166.51416),
        ["Cafe"] = CFrame.new(-385.250916, 73.0458984, 297.388397),
        ["Factroy"] = CFrame.new(430.42569, 210.019623, -432.504791),
        ["Colosseum"] = CFrame.new(-1836.58191, 44.5890656, 1360.30652),
        ["Ghost Island"] = CFrame.new(-5571.84424, 195.182297, -795.432922),
        ["Ghost Island 2nd"] = CFrame.new(-5931.77979, 5.19706631, -1189.6908),
        ["Snow Mountain"] = CFrame.new(1384.68298, 453.569031, -4990.09766),
        ["Hot and Cold"] = CFrame.new(-6026.96484, 14.7461271, -5071.96338),
        ["Magma Side"] = CFrame.new(-5478.39209, 15.9775667, -5246.9126),
        ["Cursed Ship"] = CFrame.new(902.059143, 124.752518, 33071.8125),
        ["Frosted Island"] = CFrame.new(5400.40381, 28.21698, -6236.99219),
        ["Forgotten Island"] = CFrame.new(-3043.31543, 238.881271, -10191.5791),
        ["Usoapp Island"] = CFrame.new(4748.78857, 8.35370827, 2849.57959),
        ["Raids Low"] = CFrame.new(-5554.95313, 329.075623, -5930.31396),
        ["Minisky"] = CFrame.new(-260.358917, 49325.7031, -35259.3008),
    }
elseif game.PlaceId == 7449423635 then
    Island = {
        ["Port Town"] = CFrame.new(-287, 30, 5388),
        ["Hydar Island"] = CFrame.new(3399.32227, 72.4142914, 1572.99963, -0.809679806, -4.48284467e-08, 0.586871922, 2.42332163e-08, 1, 1.09818842e-07, -0.586871922, 1.0313989e-07, -0.809679806),
        ["Room Enma/Yama & Secret Temple"] = CFrame.new(5247, 7, 1097),
        ["House Hydar Island"] = CFrame.new(5245, 602, 251),
        ["Great Tree"] = CFrame.new(2443, 36, -6573),
        ["Castle on the sea"] = CFrame.new(-5500, 314, -2855),
        ["Mansion"] = CFrame.new(-12548, 337, -7481),
        ["Floating Turtle"] = CFrame.new(-10016, 332, -8326),
        ["Haunted Castle"] = CFrame.new(-9509.34961, 142.130661, 5535.16309),
        ["Peanut Island"] = CFrame.new(-2131, 38, -10106),
        ["Ice Cream Island"] = CFrame.new(-950, 59, -10907),
        ["CakeLoaf"] = CFrame.new(-1762, 38, -11878)
    }
end
local Island1 = {}
for i,v in next,Island do 
    table.insert(Island1,i)
end


Tab11:AddDropdown({
	Name = "Select Island",
	Default = "",
	Options = Island1,
    Flag = "Select Island",
	Callback = function(Value)
	end    
})
Tab11:AddToggle({
	Name = "Teleport Island",
	Default =  false,
    Flag = "Teleport Island",
	Callback = function(Value)
	end    
})
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Teleport Island"].Value then 
            pcall(function()
                for i,v in next,Island do
                    if i == OrionLib.Flags["Select Island"].Value then
                        toTarget(plr.Character.HumanoidRootPart.Position,v.Position,v)
                    end
                end
            end)
        end
    end
end)
Tab11:AddToggle({
	Name = "Teleport Mirage",
	Default = false,
    Flag = "Teleport Mirage",
	Callback = function(Value)
	end    
})
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Teleport Mirage"].Value then 
            pcall(function()
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    AllNPCS = getnilinstances()
                    for i, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                        table.insert(AllNPCS, v)
                    end
                    for i, v in pairs(AllNPCS) do
                        if v.Name == "Advanced Fruit Dealer" then
                            repeat task.wait()
                                toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
                            until (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8 or not OrionLib.Flags["Teleport Mirage"].Value
                        end
                    end
                end
            end)
        end
    end
end)
local Section = Tab11:AddSection({
	Name = "Stats"
})
Tab11:AddToggle({
	Name = "Melee",
	Default = Settings["Stats Melee"] or false,
    Flag = "Stats Melee",
	Callback = function(Value)
        SaveSettings("Stats Melee",Value)
	end    
})
Tab11:AddToggle({
	Name = "Defense",
	Default = Settings["Stats Defense"] or false,
    Flag = "Stats Defense",
	Callback = function(Value)
        SaveSettings("Stats Defense",Value)
	end    
})
Tab11:AddToggle({
	Name = "Sword",
	Default = Settings["Stats Sword"] or false,
    Flag = "Stats Sword",
	Callback = function(Value)
        SaveSettings("Stats Sword",Value)
	end    
})
Tab11:AddToggle({
	Name = "Gun",
	Default = Settings["Stats Gun"] or false,
    Flag = "Stats Gun",
	Callback = function(Value)
        SaveSettings("Stats Gun",Value)
	end    
})
Tab11:AddToggle({
	Name = "Demon Fruit",
	Default = Settings["Stats Demon Fruit"] or false,
    Flag = "Stats Demon Fruit",
	Callback = function(Value)
        SaveSettings("Stats Demon Fruit",Value)
	end    
})
tablestats = {
    ["Melee"] = false,
    ["Defense"] = false,
    ["Sword"] = false,
    ["Gun"] = false,
    ["Demon Fruit"] = false,
},
spawn(function()
    while task.wait() do 
        pcall(function()
            for i,v in next,tablestats do 
                if OrionLib.Flags["Stats "..i].Value and game.Players.localPlayer.Data.Points.Value > 0 and game:GetService("Players").LocalPlayer.Data.Stats[i].Level.Value < 2450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", i, 9999)
                end
            end
        end)
    end
end)
