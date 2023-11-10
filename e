local Background = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local Frame_2 = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local Text = Instance.new("ScreenGui")
local TextUI = Instance.new("Frame")
local Loading = Instance.new("TextLabel")
local Image = Instance.new("ScreenGui")
local Warper = Instance.new("Frame")
local Animated = Instance.new("ImageLabel")

--Properties:

Background.Name = "Background"
Background.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "Frame"
Frame.Parent = Background
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(53, 0, 1)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.464705884, 0)
Frame.Size = UDim2.new(0, 304, 0, 504)
Frame.Image = "rbxassetid://3570695787"
Frame.ImageColor3 = Color3.fromRGB(50, 50, 50)
Frame.ImageTransparency = 0.001
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120

Frame_2.Name = "Frame"
Frame_2.Parent = Background
Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BackgroundTransparency = 1.000
Frame_2.BorderColor3 = Color3.fromRGB(53, 0, 1)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, 0, 0.464705884, 0)
Frame_2.Size = UDim2.new(0, 300, 0, 500)
Frame_2.Image = "rbxassetid://3570695787"
Frame_2.ImageColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.ImageTransparency = 0.001
Frame_2.ScaleType = Enum.ScaleType.Slice
Frame_2.SliceCenter = Rect.new(100, 100, 100, 100)
Frame_2.SliceScale = 0.120

Title.Name = "Title"
Title.Parent = Frame_2
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0.0930555537, 0)
Title.Size = UDim2.new(1, 0, 0.186111107, 0)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Headshot Beta"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 50.000
Title.TextStrokeTransparency = 0.750
Title.TextTransparency = 0.001

Text.Name = "Text"
Text.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Text.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextUI.Name = "TextUI"
TextUI.Parent = Text
TextUI.AnchorPoint = Vector2.new(0.5, 0.5)
TextUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextUI.BackgroundTransparency = 1.000
TextUI.Position = UDim2.new(0.5, 0, 0.699999988, 0)
TextUI.Size = UDim2.new(0, 300, 0, 37)

Loading.Name = "Loading"
Loading.Parent = TextUI
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loading.BackgroundTransparency = 1.000
Loading.BorderSizePixel = 0
Loading.Position = UDim2.new(0.5, 0, 0, 0)
Loading.Size = UDim2.new(1, 0, 1, 0)
Loading.Font = Enum.Font.SourceSansBold
Loading.Text = ""
Loading.TextColor3 = Color3.fromRGB(255, 255, 255)
Loading.TextSize = 30.000
Loading.TextStrokeTransparency = 0.750
Loading.TextTransparency = 0.001

Image.Name = "Image"
Image.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Image.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Warper.Name = "Warper"
Warper.Parent = Image
Warper.AnchorPoint = Vector2.new(0.5, 0.5)
Warper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Warper.BackgroundTransparency = 1.000
Warper.ClipsDescendants = true
Warper.Position = UDim2.new(0.5, 0, 0.449999988, 0)
Warper.Size = UDim2.new(0, 200, 0, 200)

Animated.Name = "Animated"
Animated.Parent = Warper
Animated.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Animated.BackgroundTransparency = 1.000
Animated.Size = UDim2.new(1, 0, 1, 0)
Animated.Image = "http://www.roblox.com/asset/?id=12998277905"
Animated.ImageTransparency = 0.001

-- Scripts:

local function SPQUHL_fake_script() -- Loading.LocalScript 
    local script = Instance.new('LocalScript', Loading)
    local function QIFE_fake_script()
        local script = Instance.new('LocalScript', Image)

        local warperFramerate = 30
        local lastFrame = 1
        local frames = 32
        local rows = 6
        local columns = 6

        local AnimationFrameWrapper = script.Parent.Warper

        local AnimatedSprite = AnimationFrameWrapper.Animated

        local t = tick()

        AnimatedSprite.Size = UDim2.new(columns,0,rows,0)

        local function AnimationFunction()
        end

        local function UpdateWarper(f)
            if tick()-t >= 1/warperFramerate then
                lastFrame = lastFrame + 1
                if lastFrame > frames then lastFrame = 1 end
                local CurrentColumn = lastFrame
                local CurrentRow = 1
                repeat
                    if CurrentColumn>columns then
                        CurrentColumn = CurrentColumn - columns
                        CurrentRow = CurrentRow + 1
                    end
                until not(CurrentColumn>columns)

                AnimationFrameWrapper.Animated.Position = UDim2.new(-(CurrentColumn-1),0,-(CurrentRow-1),0)
                print(CurrentColumn,CurrentRow)
                f()

                t = tick()
            end
        end

        game:GetService("RunService").RenderStepped:Connect(function()
            UpdateWarper(AnimationFunction)
        end)
    end
    coroutine.wrap(QIFE_fake_script)()
    local plr = game.Players.LocalPlayer.Name
    script.Parent.Text = "Loading"
    wait(0.5)
    script.Parent.Text = "Checking for AC"
    wait(0.5)
    script.Parent.Text = "Loading.."
    wait(0.5)
    script.Parent.Text = "Injecting Headshot.."
    wait(0.5)
    script.Parent.Text = "Loading.."
    wait(0.5)
    script.Parent.Text = "Injecting Steroids"
    wait(0.5)
    script.Parent.Text = "Loading"
    wait(0.5)
    script.Parent.Text = "Welcome!, "..plr.."!"
end
coroutine.wrap(SPQUHL_fake_script)()
getgenv().bgblur = Instance.new('BlurEffect', game.Lighting)
for i = 1,15,-1 do
    getgenv().bgblur.Size = getgenv().bgblur.Size - 1
    wait(0.04)
end
transparencyyy = 0
for transparencyyy = 1,0,-0.1 do
    Frame.ImageTransparency = transparencyyy
    Frame_2.ImageTransparency = transparencyyy
    Animated.ImageTransparency = transparencyyy
    Title.TextStrokeTransparency = transparencyyy
    Title.TextTransparency = transparencyyy
    Loading.TextTransparency = transparencyyy
    Loading.TextStrokeTransparency = transparencyyy
    wait(0.05)
end
wait(5)
for transparencyy = 0,1,0.1 do
    Frame.ImageTransparency = transparencyy
    Frame_2.ImageTransparency = transparencyy
    Animated.ImageTransparency = transparencyy
    Title.TextStrokeTransparency = transparencyy
    Title.TextTransparency = transparencyy
    Loading.TextTransparency = transparencyy
    Loading.TextStrokeTransparency = transparencyy
    wait(0.04)
end
for i = 15,-100,-1 do
    getgenv().bgblur.Size = getgenv().bgblur.Size - 1
    wait(0.04)
end
