local Library = {}
local Library_Function = {}
local TweenService = game:GetService('TweenService')
local uis = game:GetService("UserInputService")

function Library_Function.Destroy()
    getgenv().VinF_Loaded = false;
    Library.Gui:Destroy();
    Library.NotiGui:Destroy();
end

Library_Function.GetIMG = function(url)
    local File = 'SynAsset ['
    if url and type(url) == 'string' and tostring(game:HttpGet(url)):find('PNG') then
        for i = 1, 5 do
            File = tostring(File..string.char(math.random(65, 122)))
        end
        File = File..'].png'
        writefile(File, game:HttpGet(url))
        coroutine.wrap(function()
            wait(5)
            if isfile(File) then
                delfile(File)
            end
        end)()
        return getsynasset(File)
    end
end


local UI_Theme = {
    ['Main Color'] = Color3.fromRGB(115, 148, 255);
    ['Image Icon'] = "rbxassetid://4638314646";
}

local function getcolor(color)
    return {math.floor(color.r*255),math.floor(color.g*255),math.floor(color.b*255)}
end

Library.NotiGui = Instance.new('ScreenGui')
Library.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Library.NotiGui.Name = 'VinF Notification [Premium Edition]'


    Library.NotiGui.Parent = game:GetService('CoreGui')


local NotiContainer = Instance.new("Frame")
local NotiList = Instance.new("UIListLayout")


NotiContainer.Name = "NotiContainer"
NotiContainer.Parent = Library.NotiGui
NotiContainer.AnchorPoint = Vector2.new(1, 1)
NotiContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotiContainer.BackgroundTransparency = 1.000
NotiContainer.Position = UDim2.new(1, -5, 1, -5)
NotiContainer.Size = UDim2.new(0, 350, 1, -10)

NotiList.Name = "NotiList"
NotiList.Parent = NotiContainer
NotiList.SortOrder = Enum.SortOrder.LayoutOrder
NotiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotiList.Padding = UDim.new(0, 5)



function Library.CreateNoti(Setting)
    local TitleName = Setting.Title; 
    local Desc = Setting.Desc; 
    local Timeshow = Setting.ShowTime or 10;

    local NotiFrame = Instance.new("Frame")
    local Noticontainer = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Topnoti = Instance.new("Frame")
    local Vinfimg = Instance.new("ImageLabel")
    local VinfimgCorner = Instance.new("UICorner")
    local TextLabel = Instance.new("TextLabel")
    local CloseContainer = Instance.new("Frame")
    local CloseImage = Instance.new("ImageLabel")
    local TextButton = Instance.new("TextButton")
    local TextLabel_2 = Instance.new("TextLabel")

    NotiFrame.Name = "NotiFrame"
    NotiFrame.Parent = NotiContainer
    NotiFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotiFrame.BackgroundTransparency = 1.000
    NotiFrame.ClipsDescendants = true
    NotiFrame.Position = UDim2.new(0, 0, 0.865191162, 0)
    NotiFrame.Size = UDim2.new(1, 0, 0, 100)

    Noticontainer.Name = "Noticontainer"
    Noticontainer.Parent = NotiFrame
    Noticontainer.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    Noticontainer.Position = UDim2.new(1, 0, 0, 0)
    Noticontainer.Size = UDim2.new(1, 0, 1, 0)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Noticontainer

    Topnoti.Name = "Topnoti"
    Topnoti.Parent = Noticontainer
    Topnoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Topnoti.BackgroundTransparency = 1.000
    Topnoti.Position = UDim2.new(0, 0, 0, 5)
    Topnoti.Size = UDim2.new(1, 0, 0, 25)

    Vinfimg.Name = "Vinfimg"
    Vinfimg.Parent = Topnoti
    Vinfimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinfimg.BackgroundTransparency = 1.000
    Vinfimg.Position = UDim2.new(0, 10, 0, 0)
    Vinfimg.Size = UDim2.new(0, 25, 0, 25)
    Vinfimg.Image = UI_Theme['Image Icon']

    VinfimgCorner.CornerRadius = UDim.new(1, 0)
    VinfimgCorner.Name = "VinfimgCorner"
    VinfimgCorner.Parent = Vinfimg

    TextLabel.Parent = Topnoti
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0, 40, 0, 0)
    TextLabel.Size = UDim2.new(1, -40, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = "<font color=\"rgb("..tostring(getcolor(UI_Theme['Main Color'])[1])..','..tostring(getcolor(UI_Theme['Main Color'])[2])..','..tostring(getcolor(UI_Theme['Main Color'])[3])..")\">sitink Hub</font> - "..TitleName
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.RichText = true

    CloseContainer.Name = "CloseContainer"
    CloseContainer.Parent = Topnoti
    CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
    CloseContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseContainer.BackgroundTransparency = 1.000
    CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
    CloseContainer.Size = UDim2.new(0, 22, 0, 22)

    CloseImage.Name = "CloseImage"
    CloseImage.Parent = CloseContainer
    CloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseImage.BackgroundTransparency = 1.000
    CloseImage.Size = UDim2.new(1, 0, 1, 0)
    CloseImage.Image = "rbxassetid://3926305904"
    CloseImage.ImageRectOffset = Vector2.new(284, 4)
    CloseImage.ImageRectSize = Vector2.new(24, 24)

    TextButton.Parent = CloseContainer
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.Size = UDim2.new(1, 0, 1, 0)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000

    TextLabel_2.Name = 'Bu cac tao ne'
    TextLabel_2.Parent = Noticontainer
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(0, 10, 0, 35)
    TextLabel_2.Size = UDim2.new(1, -15, 1, -40)
    TextLabel_2.Font = Enum.Font.GothamBold
    TextLabel_2.Text = Desc
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel_2.RichText = true

    local function remove()
        TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(1,0,0,0)}):Play()
        wait(.25)
        NotiFrame:Destroy()
    end

    TweenService:Create(Noticontainer,TweenInfo.new(.25),{Position = UDim2.new(0,0,0,0)}):Play()

    TextButton.MouseEnter:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.25),{ImageColor3 = UI_Theme['Main Color']}):Play()
    end)

    TextButton.MouseLeave:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.25),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)

    TextButton.MouseButton1Click:Connect(function()
        Library.addbuttoneffect()
        wait(.25)
        remove()
    end)

    spawn(function()
        wait(Timeshow)
        remove()
    end)


end

function Library.CreateWindow(WindowName)
    --Drag function, by Ririchi / Inori
    local Heartbeat = game:GetService("RunService").Heartbeat;

    local dragger = {}

    do
        local mouse        = game:GetService("Players").LocalPlayer:GetMouse();
        local inputService = game:GetService('UserInputService');
        local heartbeat    = game:GetService("RunService").Heartbeat;

        function dragger.new(frame, secondlol)
            frame.Active = true;
            secondlol.Active = true;

            secondlol.MouseLeave:connect(function()
                IsInFrame = false;
            end)

            secondlol.MouseEnter:connect(function()
                IsInFrame = true;
            end)

            local input = secondlol.InputBegan:connect(function(key)
                if key.UserInputType == Enum.UserInputType.MouseButton1 and IsInFrame then
                    local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
                    while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        pcall(function()
                            frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Linear', 0.01, true);
                        end)
                    end
                end
            end)
        end
    end

    --Created ScreenUI
    Library.Gui = Instance.new('ScreenGui')
    Library.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Library.Gui.Name = 'sitink[Premium Edition]'
    Library.Toggled = true

    Library.Gui.Parent = game:GetService('CoreGui')

    --Button Effect
    function Library.addbuttoneffect()
        local mouse = game:GetService("Players").LocalPlayer:GetMouse();
        local buoi = Drawing.new("Circle")
        buoi.Visible = true
        buoi.Radius = 10
        buoi.Filled = true
        buoi.Color = getgenv().CustomUI and getgenv().CustomUI.Misc.ClickEffect or Color3.fromRGB(255, 255, 255)
        buoi.Position = Vector2.new(mouse.X, mouse.Y + 35)


        local BuoiFolder = Instance.new('Folder')
        BuoiFolder.Parent = Library.gui
        BuoiFolder.Name = 'Van ddos'

        local a = Instance.new('NumberValue')
        a.Value = 10
        a.Parent = BuoiFolder
        a.Name = 'Van meo'

        local b = Instance.new('NumberValue')
        b.Value = 1
        b.Parent = BuoiFolder
        b.Name = 'Van ddos va van meo nhu nhau'

        TweenService:Create(a,TweenInfo.new(.25),{Value = 30}):Play()
        TweenService:Create(b,TweenInfo.new(.25),{Value = 0}):Play()


        a:GetPropertyChangedSignal('Value'):Connect(function()
            buoi.Radius = a.Value
        end)


        b:GetPropertyChangedSignal('Value'):Connect(function()
            buoi.Transparency = b.Value
        end)

        wait(.5)
        BuoiFolder:Destroy()
    end

    --Toggle UI Function
    function Library_Function.Toggle() 
        Library.Toggled = not Library.Toggled;
        Library.Gui.Enabled = Library.Toggled;
    end

    --Created Window

    local Top = Instance.new("Frame")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopContainer = Instance.new("Frame")
    local TitleName = Instance.new("TextLabel")
    local CloseContainer = Instance.new("Frame")
    local CloseImage = Instance.new("ImageLabel")
    local CloseButton = Instance.new("TextButton")
    local TabContainer = Instance.new("ScrollingFrame")
    local TabCon_Con = Instance.new("Frame")
    local TabListLayout = Instance.new("UIListLayout")
    local VinfContainer = Instance.new("Frame")
    local Vinf = Instance.new("Frame")
    local VinfCorner = Instance.new("UICorner")
    local Vinfimg = Instance.new("ImageLabel")
    local VinfimgCorner = Instance.new("UICorner")
    local VinfText = Instance.new("TextLabel")
    local TextButton_2 = Instance.new("TextButton")
    local MainContainer = Instance.new("Frame")
    local MainPage = Instance.new("UIPageLayout")

    Top.Name = "VinHub bu cac"
    Top.Parent = Library.Gui
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.AnchorPoint = Vector2.new(.5,.5)
    Top.BackgroundTransparency = 1.000
    Top.Position = UDim2.new(0.5, 0, 0.27, 0)
    Top.Size = UDim2.new(0, 670, 0, 30)

    dragger.new(Top,Top)

    Main.Name = "VinHub bu cac x2"
    Main.Parent = Top
    Main.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    Main.Size = UDim2.new(1, 0, 0, 370)

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = Main

    TopContainer.Name = "TopContainer"
    TopContainer.Parent = Main
    TopContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopContainer.BackgroundTransparency = 1.000
    TopContainer.Size = UDim2.new(1, 0, 0, 30)

    TitleName.Name = "TitleName"
    TitleName.Parent = TopContainer
    TitleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.BackgroundTransparency = 1.000
    TitleName.Position = UDim2.new(0, 10, 0, 0)
    TitleName.Size = UDim2.new(1, -10, 1, 0)
    TitleName.Font = Enum.Font.GothamBold
    TitleName.Text = "<font color=\"rgb("..tostring(getcolor(UI_Theme['Main Color'])[1])..','..tostring(getcolor(UI_Theme['Main Color'])[2])..','..tostring(getcolor(UI_Theme['Main Color'])[3])..")\">sitink Hub</font> - "..WindowName
    TitleName.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.TextSize = 16.000
    TitleName.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    TitleName.TextWrapped = true
    TitleName.TextXAlignment = Enum.TextXAlignment.Left
    TitleName.RichText = true

    CloseContainer.Name = "CloseContainer"
    CloseContainer.Parent = TopContainer
    CloseContainer.AnchorPoint = Vector2.new(1, 0.5)
    CloseContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseContainer.BackgroundTransparency = 1.000
    CloseContainer.Position = UDim2.new(1, -4, 0.5, 0)
    CloseContainer.Size = UDim2.new(0, 22, 0, 22)

    CloseImage.Name = "CloseImage"
    CloseImage.Parent = CloseContainer
    CloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseImage.BackgroundTransparency = 1.000
    CloseImage.Size = UDim2.new(1, 0, 1, 0)
    CloseImage.Image = "rbxassetid://3926305904"
    CloseImage.ImageRectOffset = Vector2.new(284, 4)
    CloseImage.ImageRectSize = Vector2.new(24, 24)

    CloseButton.Parent = CloseContainer
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundTransparency = 1.000
    CloseButton.Size = UDim2.new(1, 0, 1, 0)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = ""
    CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    CloseButton.TextSize = 14.000

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Main
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 10, 0, 80)
    TabContainer.Selectable = false
    TabContainer.Size = UDim2.new(0, 180, 0, 280)
    TabContainer.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    TabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabContainer.ScrollBarThickness = 5
    TabContainer.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    TabCon_Con.Name = "TabCon_Con"
    TabCon_Con.Parent = TabContainer
    TabCon_Con.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabCon_Con.BackgroundTransparency = 1.000
    TabCon_Con.Position = UDim2.new(0, 5, 0, 0)
    TabCon_Con.Size = UDim2.new(1, -15, 1, 0)

    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = TabCon_Con
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    TabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContainer.CanvasSize = UDim2.new(0,0,0,TabListLayout.AbsoluteContentSize.Y + 5)
    end)

    VinfContainer.Name = "VinfContainer"
    VinfContainer.Parent = Main
    VinfContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VinfContainer.BackgroundTransparency = 1.000
    VinfContainer.Position = UDim2.new(0, 10, 0, 30)
    VinfContainer.Size = UDim2.new(0, 180, 0, 44)

    Vinf.Name = "Vinf"
    Vinf.Parent = VinfContainer
    Vinf.AnchorPoint = Vector2.new(0.5, 0.5)
    Vinf.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinf.BackgroundTransparency = 1
    Vinf.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Vinf.Position = UDim2.new(0.5, 0, 0.5, 0)
    Vinf.Size = UDim2.new(1, -4, 1, -4)

    VinfCorner.CornerRadius = UDim.new(0, 4)
    VinfCorner.Name = "VinfCorner"
    VinfCorner.Parent = Vinf

    Vinfimg.Name = "Vinfimg"
    Vinfimg.Parent = Vinf
    Vinfimg.AnchorPoint = Vector2.new(0, 0.5)
    Vinfimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Vinfimg.BackgroundTransparency = 1.000
    Vinfimg.Position = UDim2.new(0, 5, 0.5, 0)
    Vinfimg.Size = UDim2.new(0, 30, 0, 30)
    Vinfimg.Image = UI_Theme['Image Icon']

    VinfimgCorner.CornerRadius = UDim.new(1, 0)
    VinfimgCorner.Name = "VinfimgCorner"
    VinfimgCorner.Parent = Vinfimg

    VinfText.Name = "VinfText"
    VinfText.Parent = Vinf
    VinfText.AnchorPoint = Vector2.new(1, 0.5)
    VinfText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    VinfText.BackgroundTransparency = 1.000
    VinfText.Position = UDim2.new(1, 0, 0.5, 0)
    VinfText.Size = UDim2.new(0, 135, 0, 40)
    VinfText.Font = Enum.Font.Gotham
    VinfText.Text = "<b>sitink Hub Info</b>"
    VinfText.TextColor3 = Color3.fromRGB(255, 255, 255)
    VinfText.TextSize = 14.000
    VinfText.TextXAlignment = Enum.TextXAlignment.Left
    VinfText.RichText = true

    TextButton_2.Parent = VinfContainer
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 1.000
    TextButton_2.Size = UDim2.new(1, 0, 1, 0)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = ""
    TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton_2.TextSize = 14.000

    MainContainer.Name = "MainContainer"
    MainContainer.Parent = Main
    MainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainContainer.BackgroundTransparency = 1.000
    MainContainer.ClipsDescendants = true
    MainContainer.Position = UDim2.new(0, 210, 0, 30)
    MainContainer.Size = UDim2.new(0, 455, 0, 370)

    MainPage.Name = "MainPage"
    MainPage.Parent = MainContainer
    MainPage.FillDirection = Enum.FillDirection.Vertical
    MainPage.SortOrder = Enum.SortOrder.LayoutOrder
    MainPage.EasingDirection = Enum.EasingDirection.InOut
    MainPage.EasingStyle = Enum.EasingStyle.Quart
    MainPage.Padding = UDim.new(0, 5)
    MainPage.TweenTime = .25

    TextButton_2.MouseEnter:Connect(function()
        TweenService:Create(Vinf,TweenInfo.new(.5),{BackgroundTransparency = .75}):Play()
    end)
    TextButton_2.MouseLeave:Connect(function()
        TweenService:Create(Vinf,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
    end)

    --Close Function 

    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.5),{ImageColor3 = UI_Theme['Main Color']}):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseImage,TweenInfo.new(.5),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)

    CloseButton.MouseButton1Click:Connect(function()
        Library.addbuttoneffect()
        Library_Function.Destroy()
    end)



    local Main_function = {}

    local LayoutOrderBut = -1
    local LayoutOrder = -1

    function Main_function.CreatePage(Tab_Name)
        LayoutOrderBut = LayoutOrderBut + 1
        LayoutOrder = LayoutOrder + 1

        local TabName = Instance.new("Frame")
        local TabNameCorner = Instance.new("UICorner")
        local Line = Instance.new("Frame")
        local InLine = Instance.new("Frame")
        local LineCorner = Instance.new("UICorner")
        local TabTitleContainer = Instance.new("Frame")
        local TabTitle = Instance.new("TextLabel")
        local TabButton = Instance.new('TextButton')
        local TabFrame = Instance.new("Frame")
        local TabLabel = Instance.new("TextLabel")
        local TabButton2 = Instance.new('TextButton')

        TabName.Name = Tab_Name.."Tab_Control"
        TabName.Parent = TabCon_Con
        TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabName.BackgroundTransparency = 1.000
        TabName.Size = UDim2.new(1, 0, 0, 30)
        TabName.LayoutOrder = LayoutOrderBut

        TabNameCorner.CornerRadius = UDim.new(0, 4)
        TabNameCorner.Name = "TabNameCorner"
        TabNameCorner.Parent = TabName

        Line.Name = "Line"
        Line.Parent = TabName
        Line.AnchorPoint = Vector2.new(0, 0.5)
        Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Line.BackgroundTransparency = 1.000
        Line.Position = UDim2.new(0, 0, 0.5, 0)
        Line.Size = UDim2.new(0, 14, 1, 0)

        InLine.Name = "InLine"
        InLine.Parent = Line
        InLine.AnchorPoint = Vector2.new(0.5, 0.5)
        InLine.BackgroundColor3 = Color3.fromRGB(115, 148, 255)
        InLine.BorderSizePixel = 0
        InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
        InLine.Size = UDim2.new(1, -10, 0, 0)

        LineCorner.Name = "LineCorner"
        LineCorner.Parent = InLine

        TabTitleContainer.Name = "TabTitleContainer"
        TabTitleContainer.Parent = TabName
        TabTitleContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitleContainer.BackgroundTransparency = 1.000
        TabTitleContainer.Position = UDim2.new(0, 15, 0, 0)
        TabTitleContainer.Size = UDim2.new(1, -15, 0, 30)

        TabTitle.Name = "TabTitle"
        TabTitle.Parent = TabTitleContainer
        TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.BackgroundTransparency = 1.000
        TabTitle.Size = UDim2.new(1, 0, 1, 0)
        TabTitle.Font = Enum.Font.GothamBold
        TabTitle.Text = Tab_Name
        TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.TextSize = 14.000
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        TabButton.Name = 'TabButton'
        TabButton.Parent = TabName
        TabButton.BackgroundTransparency = 1
        TabButton.TextTransparency = 1
        TabButton.Size = UDim2.new(1,0,1,0)

        local TabNameCon = Instance.new("Frame")
        local FolderContainerTitle = Instance.new("Frame")
        local FolderTitleLayout = Instance.new("UIListLayout")
        local FolderContainer = Instance.new("Frame")
        local FolderPageLayout = Instance.new("UIPageLayout")

        TabNameCon.Name = Tab_Name.."Tab_Con"
        TabNameCon.Parent = MainContainer
        TabNameCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabNameCon.BackgroundTransparency = 1.000
        TabNameCon.Position = UDim2.new(0, 0, 0, 30)
        TabNameCon.Size = UDim2.new(1, 0, 1, -30)
        TabNameCon.LayoutOrder = 1

        FolderContainerTitle.Name = "FolderContainerTitle"
        FolderContainerTitle.Parent = TabNameCon
        FolderContainerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderContainerTitle.BackgroundTransparency = 1.000
        FolderContainerTitle.Size = UDim2.new(0, 450, 0, 25)

        FolderTitleLayout.Name = "FolderTitleLayout"
        FolderTitleLayout.Parent = FolderContainerTitle
        FolderTitleLayout.FillDirection = Enum.FillDirection.Horizontal
        FolderTitleLayout.SortOrder = Enum.SortOrder.LayoutOrder

        FolderContainer.Name = "FolderContainer"
        FolderContainer.Parent = TabNameCon
        FolderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderContainer.BackgroundTransparency = 1.000
        FolderContainer.Position = UDim2.new(0, 0, 0, 30)
        FolderContainer.Size = UDim2.new(1, 0, 1, -30)

        FolderPageLayout.Name = "FolderPageLayout"
        FolderPageLayout.Parent = FolderContainer
        FolderPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        FolderPageLayout.EasingDirection = Enum.EasingDirection.InOut
        FolderPageLayout.EasingStyle = Enum.EasingStyle.Quart
        FolderPageLayout.Padding = UDim.new(0, 5)
        FolderPageLayout.TweenTime = .25

        local Frame = Instance.new("Frame")
        local FolButton = Instance.new("TextButton")


        Frame.Parent = FolderContainerTitle
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.Size = UDim2.new(0, 100, 1, 0)

        FolButton.Parent = Frame
        FolButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolButton.BackgroundTransparency = 1.000
        FolButton.Size = UDim2.new(1, 0, 1, 0)
        FolButton.Font = Enum.Font.GothamBold
        FolButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        FolButton.TextSize = 16.000
        FolButton.TextXAlignment = Enum.TextXAlignment.Left
        FolButton.Text = Tab_Name

        local FolderMain = Instance.new("ScrollingFrame")
        local FolderCon = Instance.new("Frame")
        local FolderConList = Instance.new("UIListLayout")

        FolderMain.Name = "FolderMain"
        FolderMain.Parent = FolderContainer
        FolderMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderMain.BackgroundTransparency = 1.000
        FolderMain.BorderSizePixel = 0
        FolderMain.Selectable = false
        FolderMain.Size = UDim2.new(1, 0, 1, 0)
        FolderMain.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        FolderMain.ScrollBarThickness = 5
        FolderMain.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        FolderMain.CanvasSize = UDim2.new(0,0,0,0)

        FolderCon.Name = "FolderCon"
        FolderCon.Parent = FolderMain
        FolderCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FolderCon.BackgroundTransparency = 1.000
        FolderCon.Position = UDim2.new(0, 0, 0, 0)
        FolderCon.Size = UDim2.new(1, -10, 1, 0)

        FolderConList.Name = "FolderConList"
        FolderConList.Parent = FolderCon
        FolderConList.SortOrder = Enum.SortOrder.LayoutOrder
        FolderConList.Padding = UDim.new(0,5)

        FolderConList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            FolderMain.CanvasSize = UDim2.new(0,0,0,FolderConList.AbsoluteContentSize.Y + 5)
        end)

        FolButton.MouseButton1Click:Connect(function() Library.addbuttoneffect() end)

        FolButton.MouseButton1Click:Connect(function()
            TweenService:Create(FolButton,TweenInfo.new(.5),{TextTransparency = 0}):Play()
            FolderPageLayout:JumpTo(FolderMain)
            for i,v in next, FolderContainerTitle:GetChildren() do
                if string.find(v.Name,'Fol') and v:IsA('Frame') then 
                    TweenService:Create(v.Foltext,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                    TweenService:Create(v.Folimg,TweenInfo.new(.25),{ImageTransparency = 1}):Play()
                    wait(.25)
                    v.Visible = false 
                end
            end
        end)


        Frame.Size = UDim2.new(0, 10 + FolButton.TextBounds.X, 0, 25)

        TabButton.MouseEnter:Connect(function()
            if TabName.BackgroundTransparency == 1 then 
                TweenService:Create(TabName,TweenInfo.new(.5),{BackgroundTransparency = 0.5}):Play()
            end
        end)

        TabButton.MouseLeave:Connect(function()
            if not TabName.Active then 
                TweenService:Create(TabName,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
            end
        end)

        for i,v in pairs(TabCon_Con:GetChildren()) do
            if not (v:IsA('UIListLayout')) then
                if i == 2 then 
                    v.BackgroundTransparency = 0.7;
                    v.Line.InLine.Size = UDim2.new(1, -10, 1, -10)
                    v.Active = true
                    oldlay = v.LayoutOrder
                    oldobj = v
                end
            end
        end

        TabButton.MouseButton1Click:Connect(function()
            Library.addbuttoneffect()
        end)

        TabButton.MouseButton1Click:Connect(function()
            if TabName.Name == Tab_Name.."Tab_Control" and not TabName.Active then

                for i,v in pairs(MainContainer:GetChildren()) do
                    if not (v:IsA('UIPageLayout')) and not (v:IsA('UICorner')) then
                        v.Visible = false
                        --[[if v.Name == Tab_Name.."Tab_Con" then
                            MainPage:JumpToIndex(TabNameCon.LayoutOrder)
                        end]]
                    end
                end
                TabNameCon.Visible = true 
                MainPage:JumpTo(TabNameCon)

                for i,v in pairs(TabCon_Con:GetChildren()) do
                    if not (v:IsA('UIListLayout')) then
                        if v.Name == Tab_Name.."Tab_Control" then 
                            if v.LayoutOrder > oldlay  then 
                                oldobj.Active = false 
                                TweenService:Create(oldobj.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 1, 0), AnchorPoint = Vector2.new(.5,1)}):Play()
                                TweenService:Create(oldobj,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                                v.Line.InLine.Position = UDim2.new(0.5, 0, 0, 0)
                                v.Line.InLine.AnchorPoint = Vector2.new(.5,0)
                                wait(.25)
                                TweenService:Create(v.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()
                                TweenService:Create(v,TweenInfo.new(.5),{BackgroundTransparency = .7}):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            else
                                oldobj.Active = false 
                                TweenService:Create(oldobj.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,0,0),Position = UDim2.new(0.5, 0, 0, 0), AnchorPoint = Vector2.new(.5,0)}):Play()
                                TweenService:Create(oldobj,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                                v.Line.InLine.Position = UDim2.new(0.5, 0, 1, 0)
                                v.Line.InLine.AnchorPoint = Vector2.new(.5,1)
                                wait(.25)
                                TweenService:Create(v.Line.InLine,TweenInfo.new(.5),{Size = UDim2.new(1,-10,1,-10),Position = UDim2.new(0.5, 0, .5, 0), AnchorPoint = Vector2.new(.5,.5)}):Play()
                                TweenService:Create(v,TweenInfo.new(.5),{BackgroundTransparency = .7}):Play()
                                v.Active = true
                                oldobj = v
                                oldlay = v.LayoutOrder
                            end

                        end
                    end
                end
            end
        end)

        local Page_function = {}

        function Page_function.AddFolder(Setting)
            local Folder_Name = Setting.Folder_Name;
            local Folder_Desc = Setting.Folder_Desc;

            local Fol = Instance.new("Frame")
            local Foltext = Instance.new("TextButton")
            local Folimg = Instance.new("ImageLabel")

            Fol.Name = Folder_Name.."Fol"
            Fol.Parent = FolderContainerTitle
            Fol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Fol.BackgroundTransparency = 1.000
            Fol.Size = UDim2.new(0, 100, 1, 0)
            Fol.Visible = false

            Foltext.Name = "Foltext"
            Foltext.Parent = Fol
            Foltext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Foltext.BackgroundTransparency = 1.000
            Foltext.Position = UDim2.new(0, 20, 0, 0)
            Foltext.Size = UDim2.new(1, -20, 1, 0)
            Foltext.Font = Enum.Font.GothamBold
            Foltext.TextColor3 = Color3.fromRGB(255, 255, 255)
            Foltext.TextSize = 16.000
            Foltext.TextXAlignment = Enum.TextXAlignment.Left
            Foltext.Text = Folder_Name

            Fol.Size = UDim2.new(0, 30 + Foltext.TextBounds.X, 0, 25)

            Folimg.Name = "Folimg"
            Folimg.Parent = Fol
            Folimg.AnchorPoint = Vector2.new(0, 0.5)
            Folimg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Folimg.BackgroundTransparency = 1.000
            Folimg.Position = UDim2.new(0, 0, 0.5, 0)
            Folimg.Size = UDim2.new(0, 15, 0, 15)
            Folimg.Image = "rbxassetid://6954383209"

            local Folder_Desc = Folder_Desc or ''
            local foldername = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local concac = Instance.new("Frame")
            local title = Instance.new("TextLabel")
            local concac1 = Instance.new("Frame")
            local desc = Instance.new("TextLabel")
            local Frame = Instance.new("Frame")
            local ImageLabel = Instance.new("ImageLabel")
            local folderbutton = Instance.new("TextButton")

            foldername.Name = Folder_Name.."folder"
            foldername.Parent = FolderCon
            foldername.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            foldername.Size = UDim2.new(1, 0, 0, 50)

            UICorner.CornerRadius = UDim.new(0, 4)
            UICorner.Parent = foldername

            concac.Name = "concac"
            concac.Parent = foldername
            concac.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            concac.BackgroundTransparency = 1.000
            concac.Size = UDim2.new(1, 0, 0.5, 0)

            title.Name = "title"
            title.Parent = concac
            title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            title.BackgroundTransparency = 1.000
            title.Position = UDim2.new(0, 5, 0, 0)
            title.Size = UDim2.new(1, -5, 1, 0)
            title.Font = Enum.Font.GothamBold
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.TextSize = 15.000
            title.TextXAlignment = Enum.TextXAlignment.Left
            title.Text = Folder_Name

            concac1.Name = "concac1"
            concac1.Parent = foldername
            concac1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            concac1.BackgroundTransparency = 1.000
            concac1.Position = UDim2.new(0, 0, 0, 25)
            concac1.Size = UDim2.new(1, 0, 0.5, 0)

            desc.Name = "desc"
            desc.Parent = concac1
            desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            desc.BackgroundTransparency = 1.000
            desc.Position = UDim2.new(0, 5, 0, 0)
            desc.Size = UDim2.new(1, -5, 1, 0)
            desc.Font = Enum.Font.GothamBold
            desc.TextColor3 = Color3.fromRGB(255, 255, 255)
            desc.TextSize = 12.000
            desc.TextXAlignment = Enum.TextXAlignment.Left
            desc.Text = Folder_Desc

            Frame.Parent = foldername
            Frame.AnchorPoint = Vector2.new(1, 0.5)
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.Position = UDim2.new(1, -10, 0.5, 0)
            Frame.Size = UDim2.new(0, 20, 0, 20)

            ImageLabel.Parent = Frame
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BackgroundTransparency = 1.000
            ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
            ImageLabel.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel.Image = "rbxassetid://6954383209"

            folderbutton.Name = "folderbutton"
            folderbutton.Parent = foldername
            folderbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            folderbutton.BackgroundTransparency = 1.000
            folderbutton.Size = UDim2.new(1, 0, 1, 0)
            folderbutton.Font = Enum.Font.SourceSans
            folderbutton.Text = ""
            folderbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            folderbutton.TextSize = 14.000

            local FolderInCon = Instance.new("ScrollingFrame")
            local FolderConCon = Instance.new("Frame")
            local FolderConConList = Instance.new("UIListLayout")

            FolderInCon.Name = Folder_Name.."Bucu"
            FolderInCon.Parent = FolderContainer
            FolderInCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderInCon.BackgroundTransparency = 1.000
            FolderInCon.BorderSizePixel = 0
            FolderInCon.Selectable = false
            FolderInCon.Size = UDim2.new(1, 0, 1, 0)
            FolderInCon.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            FolderInCon.ScrollBarThickness = 5
            FolderInCon.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            FolderInCon.LayoutOrder = 1
            FolderInCon.CanvasSize = UDim2.new(0,0,0,0)

            FolderConCon.Name = "FolderConCon"
            FolderConCon.Parent = FolderInCon
            FolderConCon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            FolderConCon.BackgroundTransparency = 1.000
            FolderConCon.Size = UDim2.new(1, -10, 1, 0)

            FolderConConList.Name = "FolderConConList"
            FolderConConList.Parent = FolderConCon
            FolderConConList.SortOrder = Enum.SortOrder.LayoutOrder
            FolderConConList.Padding = UDim.new(0, 5)

            FolderConConList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                FolderInCon.CanvasSize = UDim2.new(0,0,0,FolderConConList.AbsoluteContentSize.Y + 5)
            end)

            folderbutton.MouseButton1Click:Connect(function()
                Library.addbuttoneffect();
            end)

            folderbutton.MouseButton1Click:Connect(function()
                for i,v in next, FolderContainer:GetChildren() do 
                    if v:IsA('Frame') and string.find(v.Name,'bucu') then 
                        v.Visible = false 
                    end
                end
                FolderInCon.Visible = true 
                FolderPageLayout:JumpTo(FolderInCon)
            end)

            folderbutton.MouseButton1Click:Connect(function()
                for i,v in next, FolderContainerTitle:GetChildren() do 
                    if v.Name == 'Frame' then 
                        TweenService:Create(v.TextButton,TweenInfo.new(.5),{TextTransparency =.4}):Play()
                    elseif not v:IsA('UIListLayout') then
                        TweenService:Create(v.Foltext,TweenInfo.new(.25),{TextTransparency = 1}):Play()
                        TweenService:Create(v.Folimg,TweenInfo.new(.25),{ImageTransparency = 1}):Play()
                        wait()
                        v.Visible = false
                    end
                end
                Fol.Visible = true
                spawn(function()
                    wait()
                    TweenService:Create(Fol.Foltext,TweenInfo.new(.25),{TextTransparency = 0}):Play()
                    TweenService:Create(Fol.Folimg,TweenInfo.new(.25),{ImageTransparency = 0}):Play()
                end)

            end)

            local Folder_function = {}
            local Sec_oder = -1 
            local Sec_zin = 99
            function Folder_function.AddSection(Section_name)
                Sec_oder = Sec_oder + 1
                Sec_zin = Sec_zin - 1
                local SectionName = Instance.new("Frame")
                local SectionListLayout = Instance.new("UIListLayout")
                local SectionTitle = Instance.new("TextLabel")


                SectionName.Name = Section_name.."bucac"
                SectionName.Parent = FolderConCon
                SectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionName.BackgroundTransparency = 1.000
                SectionName.Size = UDim2.new(1, 0, 0, 50)
                --SectionName.LayoutOrder = Sec_oder
                --SectionName.ZIndex = Sec_zin

                SectionListLayout.Name = "SectionListLayout"
                SectionListLayout.Parent = SectionName
                SectionListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                SectionListLayout.Padding = UDim.new(0, 5)

                SectionTitle.Name = "SectionTitle"
                SectionTitle.Parent = SectionName
                SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.BackgroundTransparency = 1.000
                SectionTitle.Size = UDim2.new(1, 0, 0, 20)
                SectionTitle.Font = Enum.Font.GothamBlack
                SectionTitle.Text = Section_name
                SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.TextSize = 13.000
                SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

                SectionListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    SectionName.Size = UDim2.new(1,0,0,SectionListLayout.AbsoluteContentSize.Y + 5)
                end)

                local Section_function = {}

                function Section_function.CreateToggle(Setting,Callback)
                    
                    local TogName = Setting.ToggleName; 
                    local TogDesc = Setting.ToggleDesc; 
                    local DefaultValue = Setting.DefaultValue or false;
                    local Callback = Callback or function() end;

                    local ToggleFrame = Instance.new("Frame")
                    local ToggleCorner = Instance.new("UICorner")
                    local ToggleTitle = Instance.new("TextLabel")
                    local ToggleDesc = Instance.new("TextLabel")
                    local ToggleButton = Instance.new("TextButton")
                    local Togglebucu = Instance.new("Frame")
                    local TogglebucuCorner = Instance.new("UICorner")
                    local StageFrame = Instance.new("Frame")
                    local StageFrameCorner = Instance.new("UICorner")
                    local StrokeUI = Instance.new('UIStroke')

                    ToggleFrame.Name = TogName.."Ngu"
                    ToggleFrame.Parent = SectionName
                    ToggleFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    ToggleFrame.Position = UDim2.new(0, 0, 0, 0)
                    ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
                    ToggleFrame.LayoutOrder = OderSec

                    ToggleCorner.CornerRadius = UDim.new(0, 4)
                    ToggleCorner.Name = "ToggleCorner"
                    ToggleCorner.Parent = ToggleFrame

                    ToggleTitle.Name = "ToggleTitle"
                    ToggleTitle.Parent = ToggleFrame
                    ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.BackgroundTransparency = 1.000
                    ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
                    ToggleTitle.Size = UDim2.new(1, -10, 0.5, 10)
                    ToggleTitle.Font = Enum.Font.GothamBlack
                    ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleTitle.TextSize = 14.000
                    ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleTitle.Text = TogName

                    ToggleDesc.Name = "ToggleDesc"
                    ToggleDesc.Parent = ToggleFrame
                    ToggleDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleDesc.BackgroundTransparency = 1.000
                    ToggleDesc.Position = UDim2.new(0, 10, 0.5, -5)
                    ToggleDesc.Size = UDim2.new(1, -10, 0.5, 0)
                    ToggleDesc.Font = Enum.Font.GothamBold
                    ToggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleDesc.TextSize = 12.000
                    ToggleDesc.TextXAlignment = Enum.TextXAlignment.Left
                    ToggleDesc.Text = TogDesc

                    ToggleButton.Name = "ToggleButton"
                    ToggleButton.Parent = ToggleFrame
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ToggleButton.BackgroundTransparency = 1.000
                    ToggleButton.Size = UDim2.new(1, 0, 1, 0)
                    ToggleButton.Font = Enum.Font.SourceSans
                    ToggleButton.Text = ""
                    ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    ToggleButton.TextSize = 14.000

                    Togglebucu.Name = "Togglebucu"
                    Togglebucu.Parent = ToggleFrame
                    Togglebucu.AnchorPoint = Vector2.new(1, 0.5)
                    Togglebucu.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                    Togglebucu.Position = UDim2.new(1, -10, 0.5, 0)
                    Togglebucu.Size = UDim2.new(0, 50, 0, 20)

                    StrokeUI.Parent = Togglebucu
                    StrokeUI.Color = Color3.fromRGB(255,255,255)
                    StrokeUI.LineJoinMode = Enum.LineJoinMode.Round
                    StrokeUI.Thickness = 1

                    TogglebucuCorner.CornerRadius = UDim.new(1, 0)
                    TogglebucuCorner.Name = "TogglebucuCorner"
                    TogglebucuCorner.Parent = Togglebucu

                    StageFrame.Name = "StageFrame"
                    StageFrame.Parent = Togglebucu
                    StageFrame.AnchorPoint = Vector2.new(0, 0.5)
                    StageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    StageFrame.Position = UDim2.new(0, 3, 0.5, 0)
                    StageFrame.Size = UDim2.new(0, 14, 0, 14)

                    StageFrameCorner.CornerRadius = UDim.new(1, 0)
                    StageFrameCorner.Name = "StageFrameCorner"
                    StageFrameCorner.Parent = StageFrame

                    ToggleButton.MouseEnter:Connect(function()
                        TweenService:Create(ToggleFrame,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(69, 69, 69)}):Play()
                    end)

                    ToggleButton.MouseLeave:Connect(function()
                        TweenService:Create(ToggleFrame,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
                    end)

                    local function Conback(val)
                        local stagepos = val and UDim2.new(1,-17,.5,0) or UDim2.new(0,3,.5,0)
                        local stroketrans = val and 1 or 0 
                        local Togglebucucolor = val and UI_Theme['Main Color'] or Color3.fromRGB(55, 55, 55)
                        TweenService:Create(Togglebucu,TweenInfo.new(.25),{BackgroundColor3 = Togglebucucolor}):Play()
                        TweenService:Create(StrokeUI,TweenInfo.new(.25),{Transparency = stroketrans}):Play()
                        TweenService:Create(StageFrame,TweenInfo.new(.25),{Position = stagepos}):Play()
                        Callback(val)
                    end

                    if DefaultValue and Callback then Conback(DefaultValue) end 

                    ToggleButton.MouseButton1Click:Connect(function() Library.addbuttoneffect() end)

                    ToggleButton.MouseButton1Click:Connect(function()
                        DefaultValue = not DefaultValue
                        Conback(DefaultValue)
                    end)

                    local tog_func = {}

                    function tog_func.SetStage(vale)
                        Conback(vale)
                    end

                    return tog_func

                end

                function Section_function.CreateButton(Setting,Callback)

                    

                    local ButtonName = Setting.ButtonName
                    local ButtonValue = Setting.ButtonValue
                    local ButtonDescText = Setting.ButtonDesc
                    local Callback = Callback or function() end

                    local Sizef = ButtonDescText and UDim2.new(1, 0, 0, 50) or UDim2.new(1, 0, 0, 40)
                    local Sizename = ButtonDescText and UDim2.new(1, -10, 0.5, 10) or UDim2.new(1, -10, 1, 0)
                    local Sizebut = ButtonDescText and UDim2.new(0,150,1,-20) or UDim2.new(0,150,0,24)

                    local ButtonFrame = Instance.new("Frame")
                    local ButtonCorner = Instance.new("UICorner")
                    local ButtonTitle = Instance.new("TextLabel")
                    local ButtonDesc = Instance.new("TextLabel")
                    local ButtonCor = Instance.new("Frame")
                    local ButtonCorner1 = Instance.new("UICorner")
                    local Buttonee = Instance.new("TextButton")

                    ButtonFrame.Name = ButtonName.."Ngu"
                    ButtonFrame.Parent = SectionName
                    ButtonFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    ButtonFrame.Position = UDim2.new(0, 0, 0, 0)
                    ButtonFrame.Size = Sizef
                    ButtonFrame.LayoutOrder = OderSec

                    ButtonCorner.CornerRadius = UDim.new(0, 4)
                    ButtonCorner.Name = "ButtonCorner"
                    ButtonCorner.Parent = ButtonFrame

                    ButtonTitle.Name = "ButtonTitle"
                    ButtonTitle.Parent = ButtonFrame
                    ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.BackgroundTransparency = 1.000
                    ButtonTitle.Position = UDim2.new(0, 10, 0, 0)
                    ButtonTitle.Size = Sizename
                    ButtonTitle.Font = Enum.Font.GothamBlack
                    ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    ButtonTitle.TextSize = 14.000
                    ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
                    ButtonTitle.Text = ButtonName

                    if ButtonDescText then
                        ButtonDesc.Name = "ButtonDesc"
                        ButtonDesc.Parent = ButtonFrame
                        ButtonDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonDesc.BackgroundTransparency = 1.000
                        ButtonDesc.Position = UDim2.new(0, 10, 0.5, -5)
                        ButtonDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        ButtonDesc.Font = Enum.Font.GothamBold
                        ButtonDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ButtonDesc.TextSize = 12.000
                        ButtonDesc.TextXAlignment = Enum.TextXAlignment.Left
                        ButtonDesc.Text = ButtonDescText
                    end

                    ButtonCor.Name = "ButtonCor"
                    ButtonCor.Parent = ButtonFrame
                    ButtonCor.AnchorPoint = Vector2.new(1, 0.5)
                    ButtonCor.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    ButtonCor.Position = UDim2.new(1, -10, 0.5, 0)
                    ButtonCor.Size = Sizebut

                    ButtonCorner1.CornerRadius = UDim.new(0, 4)
                    ButtonCorner1.Name = "ButtonCorner"
                    ButtonCorner1.Parent = ButtonCor

                    Buttonee.Name = "Buttonee"
                    Buttonee.Parent = ButtonCor
                    Buttonee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Buttonee.BackgroundTransparency = 1.000
                    Buttonee.Size = UDim2.new(1, 0, 1, 0)
                    Buttonee.Font = Enum.Font.GothamBold
                    Buttonee.TextColor3 = Color3.fromRGB(255, 255, 255)
                    Buttonee.TextSize = 14.000
                    Buttonee.Text = ButtonValue

                    Buttonee.MouseButton1Click:Connect(function()
                        Library.addbuttoneffect()
                    end)

                    Buttonee.MouseButton1Click:Connect(function()
                        Callback()
                    end)

                end

                function Section_function.CreateLabel(Setting)
                    

                    local TitleText = Setting.Title 
                    local TitleBGColor = Setting.BgColor or Color3.fromRGB(60,60,60)
                    local TitleTextColor = Setting.TextColor or Color3.fromRGB(255,255,255)

                    local LabelFrame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local LabelTitle = Instance.new("TextLabel")

                    LabelFrame.Name = TitleText.."Ngu"
                    LabelFrame.Parent = SectionName
                    LabelFrame.BackgroundColor3 = TitleBGColor
                    LabelFrame.Size = UDim2.new(1, 0, 0, 30)
                    LabelFrame.LayoutOrder = OderSec

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = LabelFrame

                    LabelTitle.Name = "LabelTitle"
                    LabelTitle.Parent = LabelFrame
                    LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LabelTitle.BackgroundTransparency = 1.000
                    LabelTitle.Position = UDim2.new(0, 10, 0, 0)
                    LabelTitle.Size = UDim2.new(1, -10, 1, 0)
                    LabelTitle.Font = Enum.Font.GothamBlack
                    LabelTitle.TextColor3 = TitleTextColor
                    LabelTitle.TextSize = 14.000
                    LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
                    LabelTitle.Text = TitleText

                    local label_func = {}
                    function label_func:SetText(Val)
                        LabelTitle.Text = Val 
                    end 

                    return label_func


                end
                function Section_function.CreateLabelmmb(Setting)
                    

                    local TitleText = Setting.Title 
                    local TitleBGColor = Setting.BgColor or Color3.fromRGB(60,60,60)
                    local TitleTextColor = Setting.TextColor or Color3.fromRGB(255,255,255)

                    local LabelFrame = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local LabelTitle = Instance.new("TextLabel")

                    LabelFrame.Name = TitleText.."Ngu"
                    LabelFrame.Parent = SectionName
                    LabelFrame.BackgroundColor3 = TitleBGColor
                    LabelFrame.Size = UDim2.new(1, 0, 0, Setting.Size)
                    LabelFrame.LayoutOrder = OderSec

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = LabelFrame

                    LabelTitle.Name = "LabelTitle"
                    LabelTitle.Parent = LabelFrame
                    LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LabelTitle.BackgroundTransparency = 1.000
                    LabelTitle.Position = UDim2.new(0, 1, 0, 0)
                    LabelTitle.Size = UDim2.new(0, -1, 1, 0)
                    LabelTitle.Font = Enum.Font.GothamBlack
                    LabelTitle.TextColor3 = TitleTextColor
                    LabelTitle.TextSize = 14.000
                    LabelTitle.TextXAlignment = Enum.TextXAlignment.Left
                    LabelTitle.Text = TitleText
                    local label_func = {}
                    function label_func:SetText(Val)
                        LabelTitle.Text = Val 
                    end 

                    return label_func

                end
                
                function Section_function.CreateSlider(Setting,Callback)
                    

                    local TitleText = Setting.Title; 
                    local DescText = Setting.Desc; 
                    local Min_Value = Setting.Min or 0;
                    local Max_Value = Setting.Max or 100;
                    local DefaultValue = Setting.DefaultValue or Min_Value;
                    local Precise = Setting.Precise or false;
                    local Disabled = Setting.Disabled or false; 

                    local SizeChia = 200; 

                    local Callback = Callback or function() end


                    local SliderFrame = Instance.new("Frame")
                    local ToggleCorner = Instance.new("UICorner")
                    local SliderTitle = Instance.new("TextLabel")
                    local SliderDesc = Instance.new("TextLabel")
                    local SliderBar = Instance.new("Frame")
                    local SliderButton = Instance.new("TextButton")
                    local SliderBarCorner = Instance.new("UICorner")
                    local Bar = Instance.new("Frame")
                    local BarCorner = Instance.new("UICorner")
                    local SliderBox = Instance.new("TextBox")

                    SliderFrame.Name = TitleText.."Ngu"
                    SliderFrame.Parent = SectionName
                    SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    SliderFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
                    SliderFrame.LayoutOrder = OderSec

                    ToggleCorner.CornerRadius = UDim.new(0, 4)
                    ToggleCorner.Name = "ToggleCorner"
                    ToggleCorner.Parent = SliderFrame

                    SliderTitle.Name = "SliderTitle"
                    SliderTitle.Parent = SliderFrame
                    SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.BackgroundTransparency = 1.000
                    SliderTitle.Position = UDim2.new(0, 10, 0, 0)
                    SliderTitle.Size = UDim2.new(1, -10, 0.5, 10)
                    SliderTitle.Font = Enum.Font.GothamBlack
                    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderTitle.TextSize = 14.000
                    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                    SliderTitle.Text = TitleText;

                    SliderDesc.Name = "SliderDesc"
                    SliderDesc.Parent = SliderFrame
                    SliderDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderDesc.BackgroundTransparency = 1.000
                    SliderDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                    SliderDesc.Size = UDim2.new(1, -10, 0.5, 0)
                    SliderDesc.Font = Enum.Font.GothamBold
                    SliderDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderDesc.TextSize = 12.000
                    SliderDesc.TextXAlignment = Enum.TextXAlignment.Left
                    SliderDesc.Text = DescText

                    SliderBar.Name = "SliderBar"
                    SliderBar.Parent = SliderFrame
                    SliderBar.AnchorPoint = Vector2.new(1, 0.5)
                    SliderBar.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    SliderBar.Position = UDim2.new(1, -10, 0.5, 0)
                    SliderBar.Size = UDim2.new(0, 200, 0, 5)
                    SliderBar.ClipsDescendants = true; 

                    SliderButton.Name = "SliderButton "
                    SliderButton.Parent = SliderBar
                    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderButton.BackgroundTransparency = 1.000
                    SliderButton.Size = UDim2.new(1, 0, 1, 0)
                    SliderButton.Font = Enum.Font.GothamBold
                    SliderButton.Text = ""
                    SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderButton.TextSize = 14.000

                    SliderBarCorner.CornerRadius = UDim.new(1, 0)
                    SliderBarCorner.Name = "SliderBarCorner"
                    SliderBarCorner.Parent = SliderBar

                    Bar.Name = "Bar"
                    Bar.Parent = SliderBar
                    Bar.BackgroundColor3 = UI_Theme['Main Color']
                    Bar.Size = UDim2.new(1, 0, 1, 0)

                    BarCorner.CornerRadius = UDim.new(1, 0)
                    BarCorner.Name = "BarCorner"
                    BarCorner.Parent = Bar

                    SliderBox.Name = "SliderBox"
                    SliderBox.Parent = SliderFrame
                    SliderBox.AnchorPoint = Vector2.new(0, 0.5)
                    SliderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SliderBox.BackgroundTransparency = 1.000
                    SliderBox.Position = UDim2.new(0, 180, 0.5, 0)
                    SliderBox.Size = UDim2.new(0, 50, 0, 20)
                    SliderBox.ClearTextOnFocus = false
                    SliderBox.Font = Enum.Font.GothamBold
                    SliderBox.Text = DefaultValue;
                    SliderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                    SliderBox.TextSize = 14.000
                    SliderBox.TextXAlignment = Enum.TextXAlignment.Right

                    local mouse = game.Players.LocalPlayer:GetMouse()

                    if DefaultValue and not Disabled then 
                        if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
                        Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 6)
                        SliderBox.Text = DefaultValue
                        Callback(DefaultValue)
                    end

                    SliderButton.MouseButton1Down:Connect(function()
                        if not Disabled then 
                            local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                            pcall(function()
                                Callback(value)
                                SliderBox.Text = value
                            end)
                            Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            moveconnection = mouse.Move:Connect(function()   
                                local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
                                pcall(function()
                                    Callback(value)
                                    SliderBox.Text = value
                                end)
                                Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    local value = Precise and  tonumber(string.format("%.1f",(((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

                                    pcall(function()
                                        Callback(value)
                                        SliderBox.Text = value
                                    end)
                                    Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, SizeChia), 0, 6)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end
                    end)

                    local function GetSliderValue(Value)
                        if tonumber(Value) <= Min_Value then
                            Bar.Size = UDim2.new(0,(0 * SizeChia), 0, 6)
                            SliderBox.Text = Min_Value
                            if not Disabled then 
                                Callback(tonumber(Min_Value))
                            end

                        elseif tonumber(Value) >= Max_Value then
                            Bar.Size = UDim2.new(0,(Max_Value  /  Max_Value * SizeChia), 0, 6)
                            SliderBox.Text = Max_Value
                            if not Disabled then 
                                Callback(tonumber(Max_Value))
                            end
                        else
                            Bar.Size = UDim2.new(1 - ((Max_Value - Value) / (Max_Value - Min_Value)),0, 0, 6)
                            if not Disabled then 
                                Callback(tonumber(Value))
                            end
                        end
                    end


                    SliderBox.FocusLost:Connect(function()
                        GetSliderValue(SliderBox.Text)
                    end)


                    local slider_function = {}

                    function slider_function.SetValue(Value)
                        GetSliderValue(Value)
                    end

                    return slider_function

                end

                function Section_function.CreateDropdown(Setting,Callback)

                    local TitleText = Setting.Title; 
                    local DescText = Setting.Desc; 

                    local List = Setting.List; 
                    local Search_Setting = Setting.Search;
                    local Selected = Setting.Selected; 
                    local DefaultVal = Setting.DefaultValue or List[1];
                    local Callback = Callback or function() end

                    local DropdownFrame = Instance.new("Frame")
                    local DropdownFrame_Corner = Instance.new("UICorner")
                    local DropdownVal = Instance.new("Frame")
                    local DropdownValCorner = Instance.new("UICorner")
                    local DropdownButton = Instance.new("TextButton")
                    local ImageLabel = Instance.new("ImageLabel")
                    local DropdownContainer = Instance.new("Frame")
                    local UICorner = Instance.new("UICorner")
                    local DropdownScroll = Instance.new("ScrollingFrame")
                    local ScrollContainer = Instance.new("Frame")
                    local ScrollContainerList = Instance.new("UIListLayout")
                    local DropdownTitle = Instance.new("TextLabel")
                    local TextLabel


                    if Search_Setting then 
                        TextLabel = Instance.new("TextBox")
                    else
                        TextLabel = Instance.new("TextLabel")
                    end

                    DropdownFrame.Name = "DropdownFrame"
                    DropdownFrame.Parent = SectionName
                    DropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                    DropdownFrame.Position = UDim2.new(0, 0, 0.636792421, 0)
                    DropdownFrame.Size = UDim2.new(1, 0, 0.0166898686, 50)
                    DropdownFrame.ZIndex = 2

                    DropdownFrame_Corner.CornerRadius = UDim.new(0, 4)
                    DropdownFrame_Corner.Name = "DropdownFrame_Corner"
                    DropdownFrame_Corner.Parent = DropdownFrame

                    DropdownVal.Name = "DropdownVal"
                    DropdownVal.Parent = DropdownFrame
                    DropdownVal.AnchorPoint = Vector2.new(1, 0.5)
                    DropdownVal.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    DropdownVal.Position = UDim2.new(1, -10, 0, 35)
                    DropdownVal.Size = UDim2.new(1, -20, 0, 24)

                    DropdownValCorner.CornerRadius = UDim.new(0, 4)
                    DropdownValCorner.Name = "DropdownValCorner"
                    DropdownValCorner.Parent = DropdownVal

                    DropdownButton.Name = "DropdownButton"
                    DropdownButton.Parent = DropdownVal
                    DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownButton.BackgroundTransparency = 1.000
                    DropdownButton.Size = UDim2.new(1, 0, 1, 0)
                    DropdownButton.Font = Enum.Font.GothamBold
                    DropdownButton.Text = ""
                    DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownButton.TextSize = 14.000

                    ImageLabel.Parent = DropdownVal
                    ImageLabel.AnchorPoint = Vector2.new(1, 0.5)
                    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel.BackgroundTransparency = 1.000
                    ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    ImageLabel.Position = UDim2.new(1, -6, 0.5, 0)
                    ImageLabel.Rotation = 90.000
                    ImageLabel.Size = UDim2.new(0, 12, 0, 12)
                    ImageLabel.Image = "rbxassetid://6954383209"

                    DropdownContainer.Name = "DropdownContainer"
                    DropdownContainer.Parent = DropdownVal
                    DropdownContainer.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                    DropdownContainer.BorderSizePixel = 0
                    DropdownContainer.Position = UDim2.new(0, 0, 1, 5)
                    DropdownContainer.Size = UDim2.new(1, 0, 0, 0)
                    DropdownContainer.ClipsDescendants = true

                    UICorner.CornerRadius = UDim.new(0, 4)
                    UICorner.Parent = DropdownContainer

                    DropdownScroll.Name = "DropdownScroll"
                    DropdownScroll.Parent = DropdownContainer
                    DropdownScroll.Active = true
                    DropdownScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownScroll.BackgroundTransparency = 1.000
                    DropdownScroll.BorderSizePixel = 0
                    DropdownScroll.Size = UDim2.new(1, 0, 1, 0)
                    DropdownScroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                    DropdownScroll.ScrollBarThickness = 5
                    DropdownScroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

                    ScrollContainer.Name = "ScrollContainer"
                    ScrollContainer.Parent = DropdownScroll
                    ScrollContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ScrollContainer.BackgroundTransparency = 1.000
                    ScrollContainer.Position = UDim2.new(0, 5, 0, 5)
                    ScrollContainer.Size = UDim2.new(1, -15, 1, -5)

                    ScrollContainerList.Name = "ScrollContainerList"
                    ScrollContainerList.Parent = ScrollContainer
                    ScrollContainerList.SortOrder = Enum.SortOrder.LayoutOrder
                    ScrollContainerList.Padding = UDim.new(0, 5)

                    TextLabel.Parent = DropdownVal
                    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.BackgroundTransparency = 1.000
                    TextLabel.ClipsDescendants = true
                    TextLabel.Position = UDim2.new(0, 5, 0, 0)
                    TextLabel.Size = UDim2.new(1, -30, 1, 0)
                    TextLabel.Font = Enum.Font.GothamBold
                    TextLabel.Text = DescText
                    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel.TextSize = 14.000
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    pcall(function()
                        TextLabel.PlaceholderText = DescText
                    end)
                    if not Selected then
                        if Search_Setting then
                            TextLabel.PlaceholderText = DefaultVal; 
                        else
                            TextLabel.Text = DefaultVal; 
                        end
                    end
                    DropdownTitle.Name = "DropdownTitle"
                    DropdownTitle.Parent = DropdownFrame
                    DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.BackgroundTransparency = 1.000
                    DropdownTitle.Position = UDim2.new(0, 10, 0, 0)
                    DropdownTitle.Size = UDim2.new(1, -10, 0, 25)
                    DropdownTitle.Font = Enum.Font.GothamBlack
                    DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownTitle.TextSize = 14.000
                    DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
                    DropdownTitle.Text = TitleText


                    ScrollContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 10 + ScrollContainerList.AbsoluteContentSize.Y + 5)
                    end)

                    local isbusy = false

                    local found = {}

                    local searchtable = {}

                    local function edit()
                        for i in pairs(found) do
                            found[i] = nil
                        end
                        for h, l in pairs(ScrollContainer:GetChildren()) do
                            if not l:IsA("UIListLayout") and not l:IsA("UIPadding") and not l:IsA('UIGridLayout') then
                                l.Visible = false
                            end
                        end
                        TextLabel.Text = string.lower(TextLabel.Text)
                    end

                    local ListNew = List

                    local function Search()
                        local Results = {}
                        for i, v in pairs(searchtable) do
                            if string.find(v, TextLabel.Text) then
                                table.insert(found, v)
                            end
                        end
                        for a, b in pairs(ScrollContainer:GetChildren()) do
                            for c, d in pairs(found) do
                                if d == b.Name then
                                    b.Visible = true
                                end
                            end
                        end
                    end

                    local function clear_object_in_list()
                        for i,v in next, ScrollContainer:GetChildren() do 
                            if v:IsA('Frame') then 
                                v:Destroy()
                            end
                        end
                    end

                    local function refreshlist()
                        clear_object_in_list()

                        searchtable = {}

                        for i, v in pairs(ListNew) do
                            if not Selected then 
                                table.insert(searchtable, string.lower(v))
                            else 
                                table.insert(searchtable, string.lower(i))
                            end 
                        end

                        if not Selected then 
                            for i,v in pairs (ListNew) do

                                local Dropval = Instance.new("Frame")
                                local DropvalCorner = Instance.new("UICorner")
                                local Line = Instance.new("Frame")
                                local InLine = Instance.new("Frame")
                                local LineCorner = Instance.new("UICorner")
                                local Dropvalcontainer = Instance.new("Frame")
                                local Dropvalbutton = Instance.new("TextButton")

                                Dropval.Name = string.lower(v)
                                Dropval.Parent = ScrollContainer
                                Dropval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropval.BackgroundTransparency = 1.000
                                Dropval.Size = UDim2.new(1, 0, 0, 20)

                                DropvalCorner.CornerRadius = UDim.new(0, 4)
                                DropvalCorner.Name = "DropvalCorner"
                                DropvalCorner.Parent = Dropval

                                Line.Name = "Line"
                                Line.Parent = Dropval
                                Line.AnchorPoint = Vector2.new(0, 0.5)
                                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Line.BackgroundTransparency = 1.000
                                Line.Position = UDim2.new(0, 0, 0.5, 0)
                                Line.Size = UDim2.new(0, 14, 1, 0)

                                InLine.Name = "InLine"
                                InLine.Parent = Line
                                InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                InLine.BackgroundColor3 = UI_Theme['Main Color']
                                InLine.BackgroundTransparency = 1.000
                                InLine.BorderSizePixel = 0
                                InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                InLine.Size = UDim2.new(1, -10, 1, -10)

                                LineCorner.Name = "LineCorner"
                                LineCorner.Parent = InLine

                                Dropvalcontainer.Name = "Dropvalcontainer"
                                Dropvalcontainer.Parent = Dropval
                                Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalcontainer.BackgroundTransparency = 1.000
                                Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                Dropvalbutton.Name = "Dropvalbutton"
                                Dropvalbutton.Parent = Dropvalcontainer
                                Dropvalbutton.Active = false
                                Dropvalbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.BackgroundTransparency = 1.000
                                Dropvalbutton.Selectable = false
                                Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                Dropvalbutton.Font = Enum.Font.GothamBold
                                Dropvalbutton.Text = v
                                Dropvalbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.TextSize = 13.000
                                Dropvalbutton.TextWrapped = true
                                Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left

                                if Search_Setting then
                                    if v == TextLabel.PlaceholderText then
                                        InLine.BackgroundTransparency = 0;
                                        Dropval.BackgroundTransparency = .7
                                    end
                                else
                                    if v == TextLabel.Text then 
                                        InLine.BackgroundTransparency = 0;
                                        Dropval.BackgroundTransparency = .7
                                    end
                                end

                                Dropvalbutton.MouseButton1Click:Connect(function()

                                    if Search_Setting then
                                        TextLabel.PlaceholderText = v
                                    else
                                        TextLabel.Text = v
                                    end

                                    refreshlist()
                                    if Callback then 
                                        Callback(v)
                                    end

                                end)

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    Library.addbuttoneffect()
                                end)

                            end
                        else 	

                            for i,v in pairs (ListNew) do

                                local linetran = v and 0 or 1
                                local objtran = v and .7 or 1

                                local Dropval = Instance.new("Frame")
                                local DropvalCorner = Instance.new("UICorner")
                                local Line = Instance.new("Frame")
                                local InLine = Instance.new("Frame")
                                local LineCorner = Instance.new("UICorner")
                                local Dropvalcontainer = Instance.new("Frame")
                                local Dropvalbutton = Instance.new("TextButton")

                                Dropval.Name = string.lower(i)
                                Dropval.Parent = ScrollContainer
                                Dropval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropval.BackgroundTransparency = objtran
                                Dropval.Size = UDim2.new(1, 0, 0, 20)

                                DropvalCorner.CornerRadius = UDim.new(0, 4)
                                DropvalCorner.Name = "DropvalCorner"
                                DropvalCorner.Parent = Dropval

                                Line.Name = "Line"
                                Line.Parent = Dropval
                                Line.AnchorPoint = Vector2.new(0, 0.5)
                                Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Line.BackgroundTransparency = 1.000
                                Line.Position = UDim2.new(0, 0, 0.5, 0)
                                Line.Size = UDim2.new(0, 14, 1, 0)

                                InLine.Name = "InLine"
                                InLine.Parent = Line
                                InLine.AnchorPoint = Vector2.new(0.5, 0.5)
                                InLine.BackgroundColor3 = UI_Theme['Main Color']
                                InLine.BackgroundTransparency = linetran
                                InLine.BorderSizePixel = 0
                                InLine.Position = UDim2.new(0.5, 0, 0.5, 0)
                                InLine.Size = UDim2.new(1, -10, 1, -10)

                                LineCorner.Name = "LineCorner"
                                LineCorner.Parent = InLine

                                Dropvalcontainer.Name = "Dropvalcontainer"
                                Dropvalcontainer.Parent = Dropval
                                Dropvalcontainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalcontainer.BackgroundTransparency = 1.000
                                Dropvalcontainer.Position = UDim2.new(0, 15, 0, 0)
                                Dropvalcontainer.Size = UDim2.new(1, -15, 1, 0)

                                Dropvalbutton.Name = "Dropvalbutton"
                                Dropvalbutton.Parent = Dropvalcontainer
                                Dropvalbutton.Active = false
                                Dropvalbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.BackgroundTransparency = 1.000
                                Dropvalbutton.Selectable = false
                                Dropvalbutton.Size = UDim2.new(1, 0, 1, 0)
                                Dropvalbutton.Font = Enum.Font.GothamBold
                                Dropvalbutton.Text = i
                                Dropvalbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                Dropvalbutton.TextSize = 13.000
                                Dropvalbutton.TextWrapped = true
                                Dropvalbutton.TextXAlignment = Enum.TextXAlignment.Left

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    Library.addbuttoneffect()
                                end)

                                Dropvalbutton.MouseButton1Click:Connect(function()
                                    v = not v 

                                    local linetran = v and 0 or 1
                                    local objtran = v and .7 or 1

                                    TweenService:Create(Dropval,TweenInfo.new(.5),{BackgroundTransparency = objtran}):Play()
                                    TweenService:Create(InLine,TweenInfo.new(.5),{BackgroundTransparency = linetran}):Play()

                                    if Callback then
                                        Callback(i,v)
                                        List[i] = v
                                    end
                                end)
                            end

                        end 

                    end
                    


                    if Search_Setting then
                        TextLabel.Changed:Connect(function()
                            edit()
                            Search()
                        end)
                    end

                    if typeof(DefaultVal) ~= 'table' then
                        Callback(DefaultVal)
                        if Search_Setting then
                            TextLabel.PlaceholderText = tostring(DefaultVal)
                        else
                            TextLabel.Text = tostring(DefaultVal)
                        end
                    elseif Selected then
                        for i,v in next, DefaultVal do
                            ListNew[i] = v
                            Callback(i,v)
                        end
                    end

                    if Search_Setting then 
                        TextLabel.Focused:Connect(function()
                            Library.addbuttoneffect()
                        end)

                        TextLabel.Focused:Connect(function()
                            refreshlist()
                            isbusy = not isbusy 
                            local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                            local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                            TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                            TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                        end)


                    end


                    DropdownButton.MouseButton1Click:Connect(function()
                        Library.addbuttoneffect()
                    end)

                    DropdownButton.MouseButton1Click:Connect(function()
                        refreshlist()
                        isbusy = not isbusy 
                        local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                        local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                        TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                        TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                    end)

                    local dropdown_function = {}
                        function dropdown_function:GetNewList(List)

                            ListNew = List

                            refreshlist()
                            isbusy = true
                            local listsize = isbusy and UDim2.new(1, 0,0, 175) or UDim2.new(1, 0,0, 0)
                            local dropsize = isbusy and UDim2.new(1, 0,0, 235) or UDim2.new(1, 0,0, 55)

                            TweenService:Create(DropdownContainer,TweenInfo.new(.5),{Size = listsize}):Play()
                            TweenService:Create(DropdownFrame,TweenInfo.new(.5),{Size = dropsize}):Play()

                        end

                        return dropdown_function

                    end


                    function Section_function.CreateTextBox(Setting,Callback)
                        

                        local TitleText = Setting.Title;
                        local DescText = Setting.Desc; 

                        local Number_Only = Setting.Number or false 

                        local DefaultVal = Setting.DefaultValue or '' 

                        local Placeholder = Setting.Placeholder or Setting.Title

                        local Callback = Callback or function() end

                        local TextBoxFrame = Instance.new("Frame")
                        local BoxVal = Instance.new("Frame")
                        local DropdownValCorner = Instance.new("UICorner")
                        local Box = Instance.new("TextBox")
                        local Lineeeee = Instance.new("Frame")
                        local UICorner = Instance.new("UICorner")
                        local TextboxDesc = Instance.new("TextLabel")
                        local TextboxTitle = Instance.new("TextLabel")
                        local UICorner_2 = Instance.new("UICorner")

                        TextBoxFrame.Name = TitleText.."Ngu"
                        TextBoxFrame.Parent = SectionName
                        TextBoxFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        TextBoxFrame.Position = UDim2.new(0, 0, 0.725806475, 0)
                        TextBoxFrame.Size = UDim2.new(1, 0, 0, 50)
                        TextBoxFrame.LayoutOrder = OderSec

                        BoxVal.Name = "BoxVal"
                        BoxVal.Parent = TextBoxFrame
                        BoxVal.AnchorPoint = Vector2.new(1, 0.5)
                        BoxVal.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                        BoxVal.ClipsDescendants = true
                        BoxVal.Position = UDim2.new(1, -10, 0.5, 0)
                        BoxVal.Size = UDim2.new(0, 200, 0, 24)

                        DropdownValCorner.CornerRadius = UDim.new(0, 4)
                        DropdownValCorner.Name = "DropdownValCorner"
                        DropdownValCorner.Parent = BoxVal

                        Box.Name = "Box"
                        Box.Parent = BoxVal
                        Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Box.BackgroundTransparency = 1.000
                        Box.ClipsDescendants = true
                        Box.Position = UDim2.new(0, 5, 0, 0)
                        Box.Size = UDim2.new(1, -5, 1, 0)
                        Box.Font = Enum.Font.GothamBold
                        Box.PlaceholderColor3 = Color3.fromRGB(185, 185, 185)
                        Box.Text = ""
                        Box.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Box.TextSize = 14.000
                        Box.TextXAlignment = Enum.TextXAlignment.Left
                        Box.PlaceholderText = Placeholder

                        Lineeeee.Name = "Lineeeee"
                        Lineeeee.Parent = BoxVal
                        Lineeeee.BackgroundColor3 = UI_Theme['Main Color']
                        Lineeeee.BackgroundTransparency = 1.000
                        Lineeeee.Position = UDim2.new(0, 0, 1, -2)
                        Lineeeee.Size = UDim2.new(1, 0, 0, 6)

                        UICorner.CornerRadius = UDim.new(1, 0)
                        UICorner.Parent = Lineeeee

                        TextboxDesc.Name = "TextboxDesc"
                        TextboxDesc.Parent = TextBoxFrame
                        TextboxDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxDesc.BackgroundTransparency = 1.000
                        TextboxDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                        TextboxDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        TextboxDesc.Font = Enum.Font.GothamBold
                        TextboxDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxDesc.TextSize = 12.000
                        TextboxDesc.TextXAlignment = Enum.TextXAlignment.Left
                        TextboxDesc.Text = DescText

                        TextboxTitle.Name = "TextboxTitle"
                        TextboxTitle.Parent = TextBoxFrame
                        TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxTitle.BackgroundTransparency = 1.000
                        TextboxTitle.Position = UDim2.new(0, 10, 0, 0)
                        TextboxTitle.Size = UDim2.new(1, -10, 0.5, 10)
                        TextboxTitle.Font = Enum.Font.GothamBlack
                        TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextboxTitle.TextSize = 14.000
                        TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left
                        TextboxTitle.Text = TitleText

                        UICorner_2.CornerRadius = UDim.new(0, 4)
                        UICorner_2.Parent = TextBoxFrame

                        Box.Focused:Connect(function() 
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 0}):Play()
                        end)

                        Box.Focused:Connect(function() 

                            Library.addbuttoneffect()

                        end)



                        if Number_Only then 
                            Box:GetPropertyChangedSignal("Text"):Connect(function()
                                if tonumber(Box.Text) then 
                                else 
                                    Box.PlaceholderText = Placeholder
                                    Box.Text = ''
                                end
                            end)
                        end

                        Box.FocusLost:Connect(function()
                            TweenService:Create(Lineeeee,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
                            if Box.Text ~= '' then
                                Callback(Box.Text)
                            end
                        end)

                        local textbox_function = {}

                        if DefaultVal then
                            Box.Text = DefaultVal
                            Callback(DefaultVal)
                        end

                        function textbox_function.SetValue(Value)
                            Box.Text = Value
                            Callback(Value)
                        end 

                        return textbox_function;

                    end

                    function Section_function.CreateKeybind(Setting,Callback)	

                        local TitleText = Setting.Title; 
                        local DescText = Setting.Desc; 

                        local Callback = Callback or function() end
                        local keycodename = Setting.KeyDefault or Setting.Key or Setting.Default
                        local Default = Setting.KeyDefault or Setting.Key or Setting.Default
                        local Type = tostring(Default):match("UserInputType") and "UserInputType" or "KeyCode"
                        keycodename = tostring(keycodename):gsub("Enum.UserInputType.", "")
                        keycodename = tostring(keycodename):gsub("Enum.KeyCode.", "")

                        local BindFrame = Instance.new("Frame")
                        local BindTitle = Instance.new("TextLabel")
                        local BindDesc = Instance.new("TextLabel")
                        local BindCor = Instance.new("Frame")
                        local ButtonCorner = Instance.new("UICorner")
                        local Bindkey = Instance.new("TextButton")
                        local BindCorner = Instance.new("UICorner")

                        BindFrame.Name = TitleText.."Ngu"
                        BindFrame.Parent = SectionName
                        BindFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                        BindFrame.Position = UDim2.new(0, 0, 0.208333328, 0)
                        BindFrame.Size = UDim2.new(1, 0, 0, 50)
                        BindFrame.LayoutOrder = OderSec

                        BindTitle.Name = "BindTitle"
                        BindTitle.Parent = BindFrame
                        BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        BindTitle.BackgroundTransparency = 1.000
                        BindTitle.Position = UDim2.new(0, 10, 0, 0)
                        BindTitle.Size = UDim2.new(1, -10, 0.5, 10)
                        BindTitle.Font = Enum.Font.GothamBlack
                        BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                        BindTitle.TextSize = 14.000
                        BindTitle.TextXAlignment = Enum.TextXAlignment.Left
                        BindTitle.Text = TitleText

                        BindDesc.Name = "BindDesc"
                        BindDesc.Parent = BindFrame
                        BindDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        BindDesc.BackgroundTransparency = 1.000
                        BindDesc.Position = UDim2.new(0, 10, 0.600000024, -5)
                        BindDesc.Size = UDim2.new(1, -10, 0.5, 0)
                        BindDesc.Font = Enum.Font.GothamBold
                        BindDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
                        BindDesc.TextSize = 12.000
                        BindDesc.TextXAlignment = Enum.TextXAlignment.Left
                        BindDesc.Text = DescText

                        BindCor.Name = "BindCor"
                        BindCor.Parent = BindFrame
                        BindCor.AnchorPoint = Vector2.new(1, 0.5)
                        BindCor.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
                        BindCor.Position = UDim2.new(1, -10, 0.5, 0)
                        BindCor.Size = UDim2.new(0, 150, 1, -26)

                        ButtonCorner.CornerRadius = UDim.new(0, 4)
                        ButtonCorner.Name = "ButtonCorner"
                        ButtonCorner.Parent = BindCor

                        Bindkey.Name = "Bindkey"
                        Bindkey.Parent = BindCor
                        Bindkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Bindkey.BackgroundTransparency = 1.000
                        Bindkey.Size = UDim2.new(1, 0, 1, 0)
                        Bindkey.Font = Enum.Font.GothamBold
                        Bindkey.Text = tostring(Default):gsub("Enum.KeyCode.", "");
                        Bindkey.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Bindkey.TextSize = 14.000

                        BindCorner.CornerRadius = UDim.new(0, 4)
                        BindCorner.Name = "BindCorner"
                        BindCorner.Parent = BindFrame

                        local WhitelistedType = {
                            [Enum.UserInputType.MouseButton1] = "Mouse1";
                            [Enum.UserInputType.MouseButton2] = "Mouse2";
                            [Enum.UserInputType.MouseButton3] = "Mouse3";
                        };

                        Bindkey.MouseButton1Click:Connect(function()
                            Library.addbuttoneffect()
                        end)

                        Bindkey.MouseButton1Click:Connect(function()
                            local Connection;

                            Bindkey.Text = "...";

                            Connection = uis.InputBegan:Connect(function(i)
                                if WhitelistedType[i.UserInputType] then
                                    Bindkey.Text = WhitelistedType[i.UserInputType];
                                    spawn(function()
                                        wait(0.1)
                                        Default = i.UserInputType;
                                        Type = "UserInputType";
                                    end);
                                elseif i.KeyCode ~= Enum.KeyCode.Unknown then
                                    Bindkey.Text = tostring(i.KeyCode):gsub("Enum.KeyCode.", "");
                                    spawn(function()
                                        wait(0.1)
                                        Default = i.KeyCode;
                                        Type = "KeyCode";
                                    end);
                                else
                                    warn("Exception: " .. i.UserInputType .. " " .. i.KeyCode);
                                end;


                                Connection:Disconnect();
                            end);
                        end);

                        uis.InputBegan:Connect(function(i)
                            if (Default == i.UserInputType or Default == i.KeyCode) then
                                Callback(Default);
                            end;
                        end);

                    end
                    return Section_function
                end
                return Folder_function
            end
            return Page_function
        end
    return Main_function
end
return Library
