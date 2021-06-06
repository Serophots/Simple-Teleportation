local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local InputService = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local library = {}
library.Colours  = {}

local libraryColours = library.Colours
libraryColours.Main = Color3.fromRGB(20, 20, 20)
libraryColours.Primary = Color3.fromRGB(26, 26, 26)
libraryColours.Secondary = Color3.fromRGB(38, 38, 38)
libraryColours.Status = Color3.fromRGB(65, 65, 65)
libraryColours.Check = Color3.fromRGB(30, 30, 30)
libraryColours.Text = Color3.fromRGB(170, 170, 170)
libraryColours.Picker = Color3.fromRGB(50, 50, 50)
libraryColours.Accents = Color3.fromRGB(0, 255, 109)
libraryColours.White = Color3.fromRGB(255,255,255)
libraryColours.OffWhite = Color3.fromRGB(225,225,225)
libraryColours.Black = Color3.fromRGB(0,0,0)

local function CodeToKey(p8) 
	p8 = string.lower(tostring(p8))
	local toreturn = string.sub(p8, 14, #p8):upper()
	if toreturn == "RIGHTCONTROL" then toreturn = "RightCtrl" end
	if toreturn == "LEFTCONTROL" then toreturn = "LeftCtrl" end
	if toreturn == "LEFTSHIFT" then toreturn = "LeftShft" end
	if toreturn == "RIGHTSHIFT" then toreturn = "RightShft" end
	return toreturn
end

local function RelativeXY(GuiObject)
	local x, y = Mouse.X - GuiObject.AbsolutePosition.X, Mouse.Y - GuiObject.AbsolutePosition.Y
	local xm, ym = GuiObject.AbsoluteSize.X, GuiObject.AbsoluteSize.Y
	x = math.clamp(x, 0, xm)
	y = math.clamp(y, 0, ym)
	return x, y, x/xm, y/ym
end

local function RoundBox()
	local Round = Instance.new("ImageLabel")
	Round.BackgroundTransparency = 1
	Round.Image = "rbxasset://textures/ui/dialog_white@2x.png"
	Round.ScaleType = Enum.ScaleType.Slice
	Round.SliceCenter = Rect.new(10, 10, 10, 10)
	return Round
end

local function RoundButton()
	local Round = Instance.new("ImageButton")
	Round.AutoButtonColor = false
	Round.BackgroundTransparency = 1
	Round.Image = "rbxasset://textures/ui/dialog_white@2x.png"
	Round.ScaleType = Enum.ScaleType.Slice
	Round.SliceCenter = Rect.new(10, 10, 10, 10)
	return Round
end

local function Status()
	local Stat = Instance.new("ImageButton")
	Stat.Size = UDim2.new(0,14,0,14)
	Stat.AutoButtonColor = false
	Stat.BackgroundTransparency = 1
	Stat.ImageColor3 = libraryColours.Status
	Stat.Image = "http://www.roblox.com/asset/?id=71659683"
	Stat.Rotation = -90
	return Stat
end

local function Label(text)
	local NewLabel = Instance.new("TextLabel")
	NewLabel.Text = text
	NewLabel.BackgroundTransparency = 1
	NewLabel.Position = UDim2.new(0, 0, 0, 0)
	return NewLabel
end

local function Button(text)
	local NewLabel = Instance.new("TextButton")
	NewLabel.AutoButtonColor = false
	NewLabel.Text = text
	NewLabel.BackgroundTransparency = 1
	NewLabel.Position = UDim2.new(0, 0, 0, 0)
	return NewLabel
end

local function TextInput(text)
	local NewLabel = Instance.new("TextBox")
	NewLabel.Text = text
	NewLabel.BackgroundTransparency = 1
	NewLabel.Position = UDim2.new(0, 0, 0, 0)
	return NewLabel
end

local function GetUUID()
	local NewUUID = HttpService:GenerateGUID(false)
	return NewUUID
end

local function Gui(bool)
	local NewGui = Instance.new("ScreenGui")
	NewGui.ResetOnSpawn = bool or false
	return NewGui
end

local function Frame()
	local NewFrame = Instance.new("Frame")
	NewFrame.BorderSizePixel = 0
	return NewFrame
end

local function List()
	local NewList = Instance.new("UIListLayout")
	return NewList
end

local function Click()
	local ClickImage = Instance.new("ImageLabel")
	ClickImage.Size = UDim2.new(0,14,0,14)
	ClickImage.Image = "http://www.roblox.com/asset/?id=4941650889"
	ClickImage.BackgroundTransparency = 1
	return ClickImage
end

local function CheckBox()
	local Checker = Instance.new("ImageLabel")
	Checker.Size = UDim2.new(1,-8,1,-8)
	Checker.Position = UDim2.new(0,4,0,4)
	Checker.ImageColor3 = libraryColours.Primary
	Checker.BackgroundTransparency = 1
	Checker.Image = "http://www.roblox.com/asset/?id=4941544626"
	return Checker
end

local function ExpandableArrow()
	local Checker = Instance.new("ImageLabel")
	Checker.Size = UDim2.new(1,-8,1,-8)
	Checker.Position = UDim2.new(0,4,0,4)
	Checker.ImageColor3 = libraryColours.Primary
	Checker.BackgroundTransparency = 1
	Checker.Image = "http://www.roblox.com/asset/?id=4941544626"
	return Checker
end

local wrap = function(func)
	coroutine.wrap(func)()
end

local CircleAnim = function(guiObject)
	local ncircle = Instance.new("ImageLabel")
	ncircle.BackgroundTransparency = 1
	ncircle.Image = "http://www.roblox.com/asset/?id=87913710"
	ncircle.Parent = guiObject
	ncircle.ImageColor3 = libraryColours.Black
	wrap(function()
		local x, y = RelativeXY(guiObject)
		for i = 1, 50, 1 do
			ncircle.Size = UDim2.new(0, i, 0, i)
			ncircle.Position = UDim2.new(0, x - i / 2, 0, y - i / 2)
			ncircle.ImageTransparency = i / 50
			RunService.Heartbeat:Wait()
		end
		ncircle:Destroy()
	end)
	return ncircle
end

local function Circle()
	local CircleImg = Instance.new("ImageLabel")
	CircleImg.Image = "http://www.roblox.com/asset/?id=87913710"
	CircleImg.Size = UDim2.new(0,12,0,12)
	CircleImg.BackgroundTransparency = 1
	return CircleImg
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local Left = Enum.TextXAlignment.Left
local Center = Enum.TextXAlignment.Center
local Right = Enum.TextXAlignment.Right

local ContainerPadding = 7

local OldInstance

function library:Init(parent, toggleKeybind)
	local parent = parent or game.Players.LocalPlayer.PlayerGui
	local GuiButton = toggleKeybind
	local guiShow = true

    if OldInstance then
        OldInstance:Destroy()
    end
	
	local tabcount = 0
	
	local newgui = Gui(false)
	newgui.Name = GetUUID()
	newgui.Parent = parent

    OldInstance = newgui

	print(OldInstance, newgui)
	
	InputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if not gameProcessedEvent then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				if input.KeyCode.Value == GuiButton.Value then
					guiShow = not guiShow
					for _,tab in pairs(newgui:GetChildren()) do
						if guiShow then --Make gui visible
							tab:TweenSize(UDim2.new(0,220,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
							tab:WaitForChild("mainlabel"):WaitForChild("titlebar").Visible = guiShow
							wait(0.1) --Nice animation
							tab:WaitForChild("lemonade").ClipsDescendants = false
						else --Make gui invisibile
							tab:WaitForChild("lemonade").ClipsDescendants = true
							tab:TweenSize(UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
							tab:WaitForChild("mainlabel"):WaitForChild("titlebar").Visible = guiShow
							wait(0.1) --Nice animation
						end
					end
				end
			end
		end
	end)
	
	local optionLibrary = {}
	
	function optionLibrary:AddTab(tabtitle)
		local toggle = true
		
		local containerframemaster = Instance.new("Frame")
		containerframemaster.Name = "ContainerFrame"
		containerframemaster.Size = UDim2.new(0,220,1,0)
		containerframemaster.Position = UDim2.new(0,5 + (225 * tabcount),0,5)
		containerframemaster.BackgroundTransparency = 1
		containerframemaster.Parent = newgui
		
		local tabtitle = tabtitle or ("Tab"..tostring(tabcount))
		
		tabcount = tabcount + 1
		
		local mainlabel = RoundBox()
		mainlabel.ImageColor3 = libraryColours.Main
		mainlabel.Size = UDim2.new(1,0,0,40)
		mainlabel.Parent = containerframemaster
		mainlabel.Name = "mainlabel"
		
		local titlebar = Button(tabtitle)
		titlebar.Size = UDim2.new(1,0,0,40)
		titlebar.Font = Enum.Font.SourceSansBold
		titlebar.TextSize = 18
		titlebar.TextColor3 = libraryColours.White
		titlebar.Name = "titlebar"
		titlebar.Parent = mainlabel
		
		local contentframe = RoundBox()
		contentframe.Size = UDim2.new(1,0,0,0)
		contentframe.Position = UDim2.new(0,0,0,40)
		contentframe.ImageColor3 = libraryColours.Primary
		--contentframe.ClipsDescendants = true
		contentframe.Name = "lemonade"
		contentframe.Parent = containerframemaster
		
		local togglebutton = Status()
		togglebutton.Position = UDim2.new(1,-22,0.5,-7)
		togglebutton.Rotation = 90
		togglebutton.Parent = titlebar
		
		local contentlist = List()
		contentlist.Parent = contentframe
		
		coroutine.wrap(function()
			local lastmx
			local lastmy
			
			titlebar.MouseButton1Down:Connect(function()
				lastmx = Mouse.X
				lastmy = Mouse.Y
				local move
				local kill
				move = Mouse.Move:Connect(function()
					local dx = Mouse.X - lastmx
					local dy = Mouse.Y - lastmy
					containerframemaster.Position = containerframemaster.Position + UDim2.new(0,dx,0,dy)
					lastmx = Mouse.X
					lastmy = Mouse.Y
				end)
				kill = InputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						move:Disconnect()
						kill:Disconnect()
					end
				end)
			end)
		end)()
		
		titlebar.MouseButton1Click:Connect(function()
			toggle = not toggle
			if not toggle then --making invis
				contentframe.ClipsDescendants = true
				contentframe:TweenSize(UDim2.new(1,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				mainlabel:TweenSize(UDim2.new(1,0,0,40), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				TweenService:Create(togglebutton, TweenInfo.new(0.1), {Rotation = -90}):Play()
			else
				mainlabel:TweenSize(UDim2.new(1,0,0,47+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				contentframe:TweenSize(UDim2.new(1,0,0,7+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				TweenService:Create(togglebutton, TweenInfo.new(0.1), {Rotation = 90}):Play()
				wait(0.1)
				contentframe.ClipsDescendants = false
			end
		end)
		
		contentlist:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if toggle then
				mainlabel:TweenSize(UDim2.new(1,0,0,47+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				contentframe:TweenSize(UDim2.new(1,0,0,7+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
			end
		end)
		
		local sectioncount = 0
		
		local tabLibrary = {}
		
		function tabLibrary:AddSection(title)
			local sectoggle = true
			local title = title or ("Section"..tostring(sectioncount))
			
			sectioncount = sectioncount + 1
			
			local sectionframe = Frame()
			sectionframe.BackgroundColor3 = libraryColours.Primary
			sectionframe.Size = UDim2.new(1,0,0,28)
			sectionframe.Parent = contentframe
			sectionframe.Name = "eA"
			
			local sectiontitle = Label("  "..title)
			sectiontitle.Size = UDim2.new(1,0,0,28)
			sectiontitle.Font = Enum.Font.GothamBlack
			sectiontitle.TextColor3 = libraryColours.OffWhite
			sectiontitle.TextSize = 14
			sectiontitle.TextXAlignment = Left
			sectiontitle.Parent = sectionframe
			
			local sectioncontent = Frame()
			sectioncontent.Name = "e"
			sectioncontent.Size = UDim2.new(1,0,0,0)
			sectioncontent.Position = UDim2.new(0,0,0,28)
			sectioncontent.BackgroundColor3 = libraryColours.Secondary
			--sectioncontent.ClipsDescendants = true --todo comment out for selection maybe
			sectioncontent.Parent = sectionframe
			
			local sectioncontentlist = List()
			sectioncontentlist.Parent = sectioncontent
			
			local secstatus = Status()
			secstatus.Position = UDim2.new(1,-21,0,7)
			secstatus.Rotation = 90
			secstatus.Parent = sectiontitle
			
			sectioncontentlist:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if sectoggle then
					sectioncontent:TweenSize(UDim2.new(1,0,0,sectioncontentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					sectionframe:TweenSize(UDim2.new(1,0,0,28+sectioncontentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
				end
			end)
			
			secstatus.MouseButton1Click:Connect(function()
				sectoggle = not sectoggle
				if not sectoggle then
					sectioncontent.ClipsDescendants = true
					sectioncontent:TweenSize(UDim2.new(1,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					sectionframe:TweenSize(UDim2.new(1,0,0,28), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					TweenService:Create(secstatus, TweenInfo.new(0.1), {Rotation = -90}):Play()
				else
					sectioncontent:TweenSize(UDim2.new(1,0,0,sectioncontentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					sectionframe:TweenSize(UDim2.new(1,0,0,28+sectioncontentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					TweenService:Create(secstatus, TweenInfo.new(0.1), {Rotation = 90}):Play()
					wait(0.1)
					sectioncontent.ClipsDescendants = false
				end
			end)
			
			local sectionLibrary = {}
			
			function sectionLibrary:AddButton(text, callback)
				local buttoncontainer = Frame()
				buttoncontainer.Size = UDim2.new(1,0,0,32)
				buttoncontainer.BackgroundColor3 = libraryColours.Secondary
				buttoncontainer.Parent = sectioncontent
				
				local imagebutton = RoundButton()
				imagebutton.ImageColor3 = libraryColours.Accents
				imagebutton.Size = UDim2.new(1,-10,1,-10)
				imagebutton.Position = UDim2.new(0,5,0,5)
				imagebutton.ClipsDescendants = true
				imagebutton.Parent = buttoncontainer
				
				local clickimage = Click()
				clickimage.Position = UDim2.new(0,4,0,4)
				clickimage.ImageColor3 = libraryColours.Black
				clickimage.Parent = imagebutton
				
				local buttonlabel = Label(text or "Button")
				buttonlabel.Size = UDim2.new(1,0,1,0)
				buttonlabel.Font = Enum.Font.SourceSansBold
				buttonlabel.Text = text or "Button"
				buttonlabel.TextColor3 = libraryColours.Black
				buttonlabel.TextSize = 18
				buttonlabel.Parent = imagebutton
				
				imagebutton.MouseButton1Click:Connect(function()
					callback()
					CircleAnim(imagebutton)
				end)

				local toreturn = {}

				toreturn["type"] = "Button"

				function toreturn:ResetDefault() end

				return toreturn
			end
			
			function sectionLibrary:AddSlider(text, default, callback)
				local min = default.min or default.Min or 16
				local max = default.max or default.Max or 64
				local roundto = default.roundto or default.Roundto or default.RoundTo or 1
				local def = default.def or default.Def or round((min + max) / 2, roundto)
				local defsca = (def - min)/(max - min)
				
				local slidercontainer = Frame()
				slidercontainer.Size = UDim2.new(1,0,0,40)
				slidercontainer.BackgroundColor3 = libraryColours.Secondary
				slidercontainer.Parent = sectioncontent
				
				local slidertitle = Label(text)
				slidertitle.Size = UDim2.new(1,-30,0,28)
				slidertitle.Font = Enum.Font.SourceSansBold
				slidertitle.TextColor3 = libraryColours.Text
				slidertitle.Text = ("  ".. text)
				slidertitle.TextXAlignment = Left
				slidertitle.TextSize = 16
				slidertitle.Parent = slidercontainer
				
				local valuecontainer = RoundBox()
				valuecontainer.Size = UDim2.new(0,32,0,16)
				valuecontainer.Position = UDim2.new(1,-36,0,6)
				valuecontainer.ImageColor3 = libraryColours.Status
				valuecontainer.Parent = slidercontainer
				
				local valuelabel = Label(def)
				valuelabel.Size = UDim2.new(1,0,1,0)
				valuelabel.Font = Enum.Font.SourceSansBold
				valuelabel.TextSize = 13
				valuelabel.TextColor3 = libraryColours.Text
				valuelabel.Parent = valuecontainer
				
				local sliderframe = Frame()
				sliderframe.BackgroundTransparency = 1
				sliderframe.Position = UDim2.new(0,0,1,-12)
				sliderframe.Size = UDim2.new(1,0,0,12)
				sliderframe.Parent = slidercontainer
				
				local sliderbutton = RoundButton()
				sliderbutton.Position = UDim2.new(0,5,0,1)
				sliderbutton.Size = UDim2.new(1,-10,0,4)
				sliderbutton.ImageColor3 = libraryColours.Status
				sliderbutton.Parent = sliderframe
				
				local sliderfill = RoundBox()
				sliderfill.ImageColor3 = libraryColours.Accents
				sliderfill.Size = UDim2.new(defsca,0,1,0)
				sliderfill.Parent = sliderbutton
				
				local slidercircle = Circle()
				slidercircle.Position = UDim2.new(1,-10,0.5,-10)
				slidercircle.Size = UDim2.new(0,20,0,20)
				slidercircle.ImageColor3 = libraryColours.Accents
				slidercircle.ImageTransparency = 1
				slidercircle.Parent = sliderfill
				
				local circlefill = Circle()
				circlefill.ImageColor3 = libraryColours.White
				circlefill.Size = UDim2.new(0,12,0,12)
				circlefill.Position = UDim2.new(0.5,-6,0.5,-6)
				circlefill.ImageTransparency = 1
				circlefill.Parent = slidercircle
				
				sliderbutton.MouseButton1Down:Connect(function()
					local x,y,xscale,yscale = RelativeXY(sliderbutton)
					local value = round(min + ((max - min) * xscale), roundto)
					valuelabel.Text = value
					sliderfill.Size = UDim2.new(xscale,0,1,0)
					callback(value)
					local move
					local kill
					TweenService:Create(slidercircle, TweenInfo.new(0.5), {ImageTransparency = 0.5}):Play()
					TweenService:Create(circlefill, TweenInfo.new(0.5), {ImageTransparency = 0}):Play()
					move = Mouse.Move:Connect(function()
						local x,y,xscale,yscale = RelativeXY(sliderbutton)
						local value = round(min + ((max - min) * xscale), roundto)
						valuelabel.Text = value
						sliderfill.Size = UDim2.new(xscale,0,1,0)
						callback(value)
					end)
					kill = InputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							move:Disconnect()
							kill:Disconnect()
							TweenService:Create(slidercircle, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
							TweenService:Create(circlefill, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
						end
					end)
				end)
				
				local toreturn = {}

				toreturn["type"] = "Slider"
				
				function toreturn:ResetDefault()
					valuelabel.Text = def
					sliderfill.Size = UDim2.new(defsca,0,1,0)
				end
				
				return toreturn
			end
			
			function sectionLibrary:AddKeybind(text, default, callback)
                local def = default
                local changing = false
				
				local keybindcontainer = Frame()
				keybindcontainer.BackgroundColor3 = libraryColours.Secondary
				keybindcontainer.Size = UDim2.new(1,0,0,28)
				keybindcontainer.Parent = sectioncontent
				
				local keybindlabel = Button("  "..text)
				keybindlabel.TextColor3 = libraryColours.Text
				keybindlabel.TextSize = 16
				keybindlabel.Font = Enum.Font.SourceSansBold
				keybindlabel.TextXAlignment = Left
				keybindlabel.Size = UDim2.new(1,0,0,28)
				keybindlabel.Parent = keybindcontainer
				
				local valuecontainer = RoundBox() --Outer box
				valuecontainer.Position = UDim2.new(1,-58,0,6)
				valuecontainer.Size = UDim2.new(0,54,0,16)
				valuecontainer.ImageColor3 = libraryColours.Status
				valuecontainer.Parent = keybindcontainer
				
				local valuecolor = RoundBox() --Inner color box
				valuecolor.Position = UDim2.new(0,2,0,2)
				valuecolor.Size = UDim2.new(0,28,0,12)
				valuecolor.ImageColor3 = libraryColours.Status
				valuecolor.Parent = valuecontainer
				
				local valuelabel = Label(CodeToKey(def)--[[string.char(def.Value):upper() or "None"]])
				valuelabel.Size = UDim2.new(1,0,1,0)
				valuelabel.Font = Enum.Font.SourceSansBold
				valuelabel.TextColor3 = libraryColours.Text
				valuelabel.TextSize = 13
                valuelabel.Parent = valuecontainer
                
                InputService.InputBegan:Connect(function(input, gameProcessedEvent)
                    if not gameProcessedEvent then
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            if input.KeyCode.Value == def.Value then
                                if not changing then
                                    callback()
                                    valuecolor:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                                    TweenService:Create(valuecolor, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
                                    wait(0.1)
                                    valuecolor:TweenSizeAndPosition(UDim2.new(0,28,0,12), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                                    TweenService:Create(valuecolor, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Status}):Play()
                                end
                            end
                        end
                    end
                end)
				
				keybindlabel.MouseButton1Down:Connect(function()
					valuelabel.Text = "..."
					local detect
					detect = InputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							local key = input.KeyCode
							local keyasstring = string.char(key.Value)
							local control = string.find(keyasstring, "%c")
							if not control then
                                valuelabel.Text = CodeToKey(key) --[[keyasstring:upper()]]
                                changing = true
                                def = key
                                wait()
                                changing = false
							else
								valuelabel.Text = CodeToKey(def) --[[string.char(def.Value):upper()]]
							end
							detect:Disconnect()
						end
					end)
				end)

				local toreturn = {}

				toreturn["type"] = "Keybind"

				function toreturn:ResetDefault()
					def = default
					valuelabel.Text = CodeToKey(def) --][string.char(def.Value):upper() or "None"]]
				end

				return toreturn
			end
			
			function sectionLibrary:AddToggle(text, default, callback)
				local thistoggle = default
				
				local togglecontainer = Frame()
				togglecontainer.Size = UDim2.new(1,0,0,28)
				togglecontainer.BackgroundColor3 = libraryColours.Secondary
				togglecontainer.Parent = sectioncontent
				
				local toggletracker = RoundBox() --The unchecked check box
				toggletracker.Size = UDim2.new(0,18,0,18)
				toggletracker.Position = UDim2.new(1,-23,0,5)
				toggletracker.ImageColor3 = libraryColours.Status
				toggletracker.Parent = togglecontainer
                toggletracker.Name = "toggletracker"
				
				local togglecolour = RoundBox() --smaller version of toggle tracker which states color of checkmark
				togglecolour.ImageColor3 = thistoggle and libraryColours.Accents or libraryColours.Secondary
				togglecolour.Size = thistoggle and UDim2.new(1,0,1,0) or UDim2.new(0,14,0,14)
				togglecolour.Position = thistoggle and UDim2.new(0,0,0,0) or UDim2.new(0,2,0,2)
				togglecolour.Parent = toggletracker
                togglecolour.Name = "togglecolour"
				
				local togglechecker = CheckBox() --check mark image symbol
				togglechecker.ImageTransparency = thistoggle and 0 or 1
				togglechecker.Parent = togglecolour
                togglechecker.Name = "togglechecker"
				
				local togglebutton = Button(text or "Toggle")
				togglebutton.Size = UDim2.new(1,0,1,0)
				togglebutton.Font = Enum.Font.SourceSansBold
				togglebutton.Text = ("  "..text) or ("  Toggle")
				togglebutton.TextXAlignment = Left
				togglebutton.TextColor3 = libraryColours.Text
				togglebutton.TextSize = 16
				togglebutton.Parent = togglecontainer
				
				togglebutton.MouseButton1Click:Connect(function()
					thistoggle = not thistoggle
					if not thistoggle then
						togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
					else
						togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
					end
					callback(thistoggle)
				end)
				
				local toreturn = {}

				toreturn["type"] = "Toggle"

				function toreturn:ResetDefault()
					thistoggle = default
					if not thistoggle then
						togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
					else
						togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
					end
				end

				return toreturn
			end

			function sectionLibrary:AddTextInput(text, default, callback)
				local textcontainer = Frame()
				textcontainer.Size = UDim2.new(1,0,0,36)
				textcontainer.BackgroundColor3 = libraryColours.Secondary
				textcontainer.Parent = sectioncontent
                
				local texttitle = Label(text)
				texttitle.Size = UDim2.new(1,-30,0,18)
				texttitle.Font = Enum.Font.SourceSansBold
				texttitle.TextColor3 = libraryColours.Text
				texttitle.Text = "  ".. text
				texttitle.TextXAlignment = Left
				texttitle.TextSize = 14
				texttitle.Parent = textcontainer
				
				local textinput = TextInput(default or "Enter text")
				textinput.Size = UDim2.new(1,-6,1,28)
				textinput.Position = UDim2.new(0,6,0,-5)
				textinput.Font = Enum.Font.SourceSansBold
				textinput.Text = default or "Enter text"
				textinput.TextXAlignment = Left
				textinput.TextColor3 = libraryColours.Accents
				textinput.TextSize = 16
				textinput.Parent = textcontainer
				
                textinput.FocusLost:connect(function()
                    callback(textinput.Text)
                end)

				local toreturn = {}

				toreturn["type"] = "TextInput"

				function toreturn:ResetDefault()
					textinput.Text = default or "Enter text"
                    callback(textinput.Text)
				end

				return toreturn
            end

			function sectionLibrary:AddPlayerTextInput(text, default, callback)
				local textcontainer = Frame()
				textcontainer.Size = UDim2.new(1,0,0,36)
				textcontainer.BackgroundColor3 = libraryColours.Secondary
				textcontainer.Parent = sectioncontent
                
				local texttitle = Label(text)
				texttitle.Size = UDim2.new(1,-30,0,18)
				texttitle.Font = Enum.Font.SourceSansBold
				texttitle.TextColor3 = libraryColours.Text
				texttitle.Text = "  ".. text
				texttitle.TextXAlignment = Left
				texttitle.TextSize = 14
				texttitle.Parent = textcontainer
				
				local textinput = TextInput(default.Name or game.Players.LocalPlayer.Name)
				textinput.Size = UDim2.new(1,-6,1,28)
				textinput.Position = UDim2.new(0,6,0,-5)
				textinput.Font = Enum.Font.SourceSansBold
				textinput.Text = default.Name or game.Players.LocalPlayer.Name
				textinput.TextXAlignment = Left
				textinput.TextColor3 = libraryColours.Accents
				textinput.TextSize = 16
				textinput.Parent = textcontainer
				
                textinput.FocusLost:connect(function()
					local plr
					for i,v in pairs(game.Players:GetPlayers()) do 
						if v.Name:lower():sub(1,#textinput.Text) == textinput.Text:lower() then
							textinput.Text = v.Name or textinput.Text
							callback(v or game.Players.LocalPlayer)
							break
						end
					end
                end)

				local toreturn = {}

				toreturn["type"] = "TextInput"

				function toreturn:ResetDefault()
					textinput.Text = default.Name or "Enter text"
                    callback(textinput.Text)
				end

				return toreturn
            end

			function sectionLibrary:AddGUIKeybindSet(text, default)
                local def = default
                local changing = false
				
				local keybindcontainer = Frame()
				keybindcontainer.BackgroundColor3 = libraryColours.Secondary
				keybindcontainer.Size = UDim2.new(1,0,0,28)
				keybindcontainer.Parent = sectioncontent
				
				local keybindlabel = Button("  "..text)
				keybindlabel.TextColor3 = libraryColours.Text
				keybindlabel.TextSize = 16
				keybindlabel.Font = Enum.Font.SourceSansBold
				keybindlabel.TextXAlignment = Left
				keybindlabel.Size = UDim2.new(1,0,0,28)
				keybindlabel.Parent = keybindcontainer
				
				local valuecontainer = RoundBox() --Outer box
				valuecontainer.Position = UDim2.new(1,-58,0,6)
				valuecontainer.Size = UDim2.new(0,54,0,16)
				valuecontainer.ImageColor3 = libraryColours.Status
				valuecontainer.Parent = keybindcontainer
				
				local valuecolor = RoundBox() --Inner color box
				valuecolor.Position = UDim2.new(0,2,0,2)
				valuecolor.Size = UDim2.new(0,28,0,12)
				valuecolor.ImageColor3 = libraryColours.Status
				valuecolor.Parent = valuecontainer
				
				local valuelabel = Label(CodeToKey(def)--[[tostring(def.Value):upper() or "None"]])
				valuelabel.Size = UDim2.new(1,0,1,0)
				valuelabel.Font = Enum.Font.SourceSansBold
				valuelabel.TextColor3 = libraryColours.Text
				valuelabel.TextSize = 13
                valuelabel.Parent = valuecontainer
                
                InputService.InputBegan:Connect(function(input, gameProcessedEvent)
                    if not gameProcessedEvent then
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            if input.KeyCode.Value == def.Value then
                                if not changing then
                                    valuecolor:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                                    TweenService:Create(valuecolor, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
                                    wait(0.1)
                                    valuecolor:TweenSizeAndPosition(UDim2.new(0,28,0,12), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
                                    TweenService:Create(valuecolor, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Status}):Play()
                                end
                            end
                        end
                    end
                end)

				keybindlabel.MouseButton1Down:Connect(function()
					valuelabel.Text = "..."
					local detect
					detect = InputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							local key = input.KeyCode
							local keyasstring = tostring(key.Value)
							local control = string.find(keyasstring, "%c")
							if not control then
                                valuelabel.Text = CodeToKey(key)--[[keyasstring:upper()]]
                                changing = true
                                def = key
								GuiButton = key
                                wait()
                                changing = false
							else
								valuelabel.Text = CodeToKey(def) --[[tostring(def.Value):upper()]]
							end
							detect:Disconnect()
						end
					end)
				end)

				local toreturn = {}

				toreturn["type"] = "GUIKeybind"

				function toreturn:ResetDefault()
					def = default
					valuelabel.Text = tostring(def.Value) or "None"
				end

				return toreturn
			end

			function sectionLibrary:AddDescription(text)
				local togglecontainer = Frame()
				togglecontainer.Size = UDim2.new(1,0,0,46)
				togglecontainer.BackgroundColor3 = libraryColours.Secondary
				togglecontainer.Parent = sectioncontent
				
				local textlabel = Label(text or "Toggle")
				textlabel.Size = UDim2.new(1,0,1,0)
				textlabel.Font = Enum.Font.SourceSansBold
				textlabel.Text = text or "None"
				textlabel.TextXAlignment = Left
				textlabel.TextColor3 = libraryColours.Text
				textlabel.TextSize = 12--16
				textlabel.Parent = togglecontainer
				textlabel.TextWrapped = true
				textlabel.Position = UDim2.new(0,6,0,0)
				
				local toreturn = {}

				toreturn["type"] = "Description"

				function toreturn:ResetDefault() end

				return toreturn
            end
			
			function sectionLibrary:AddSelection(text, selectionA, callback)
				local thistoggle = false
				local selection = selectionA
				
				local togglecontainer = Frame()
				togglecontainer.Size = UDim2.new(1,0,0,28)
				togglecontainer.BackgroundColor3 = libraryColours.Secondary
				togglecontainer.Parent = sectioncontent
				
				local toggletracker = RoundBox()
				toggletracker.Size = UDim2.new(0,18,0,18)
				toggletracker.Position = UDim2.new(1,-23,0,5)
				toggletracker.ImageColor3 = libraryColours.Status
				toggletracker.Parent = togglecontainer
                toggletracker.Name = "toggletracker"
				
				local togglecolour = RoundBox()
				togglecolour.ImageColor3 = thistoggle and libraryColours.Accents or libraryColours.Secondary
				togglecolour.Size = thistoggle and UDim2.new(1,0,1,0) or UDim2.new(0,14,0,14)
				togglecolour.Position = thistoggle and UDim2.new(0,0,0,0) or UDim2.new(0,2,0,2)
				togglecolour.Parent = toggletracker
                togglecolour.Name = "togglecolour"
				
				local togglechecker = ExpandableArrow()
				togglechecker.ImageTransparency = thistoggle and 0 or 1
				togglechecker.Parent = togglecolour
                togglechecker.Name = "togglechecker"
				
				local togglebutton = Button(text or "Toggle")
				togglebutton.Size = UDim2.new(1,0,1,0)
				togglebutton.Font = Enum.Font.SourceSansBold
				togglebutton.Text = ("  "..text) or ("  Toggle")
				togglebutton.TextXAlignment = Left
				togglebutton.TextColor3 = libraryColours.Text
				togglebutton.TextSize = 16
				togglebutton.Parent = togglecontainer

				--Selection part

				local containerframe = Instance.new("Frame")
				containerframe.Name = "ContainerFrame"
				containerframe.BackgroundTransparency = 1
				containerframe.Size = UDim2.new(0,0,100,0)
				containerframe.Position = UDim2.new(1,5,0,(togglecontainer.AbsolutePosition.Y - containerframemaster.AbsolutePosition.Y)*-1)
				containerframe.ClipsDescendants = true
				containerframe.Parent = togglecontainer
		
				local mainlabel = RoundBox()
				mainlabel.ImageColor3 = libraryColours.Main
				mainlabel.Size = UDim2.new(1,0,0,40)
				mainlabel.Parent = containerframe
				mainlabel.Name = "mainlabel"
				
				local titlebar = Label(text)
				titlebar.Size = UDim2.new(1,0,0,40)
				titlebar.Font = Enum.Font.SourceSansBold
				titlebar.TextSize = 18
				titlebar.TextColor3 = libraryColours.White
				titlebar.Name = "titlebar"
				titlebar.Parent = mainlabel
		
				local contentframe = RoundBox()
				contentframe.Size = UDim2.new(1,0,0,0)
				contentframe.Position = UDim2.new(0,0,0,40)
				contentframe.ImageColor3 = libraryColours.Primary
				contentframe.ClipsDescendants = true
				contentframe.Parent = containerframe

				local contentlist = List()
				contentlist.Parent = contentframe

				togglebutton.MouseButton1Click:Connect(function()
					thistoggle = not thistoggle
					if not thistoggle then
						togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
						
						containerframe:TweenSize(UDim2.new(0,0,100,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.1, true)
						wait(0.1)
					else
						togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
						
						containerframe:TweenSize(UDim2.new(0,220,100,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.1, true)
					end
				end)

				local function loadSelection()
					for i,v in pairs(contentframe:GetChildren()) do
						if v.ClassName == "Frame" then
							v:Destroy()
						end
					end
					for i,v in pairs(selection) do
						local thisthistoggle = v

						local selectionframe = Frame()
						selectionframe.Size = UDim2.new(1,0,0,28)
						selectionframe.BackgroundColor3 = libraryColours.Secondary
						selectionframe.Parent = contentframe
				
						local togglebutton = Button("  "..i)
						togglebutton.Size = UDim2.new(1,0,1,0)
						togglebutton.Font = Enum.Font.SourceSansBold
						togglebutton.TextXAlignment = Left
						togglebutton.TextColor3 = libraryColours.Text
						togglebutton.TextSize = 16
						togglebutton.Parent = selectionframe
				
						local toggletracker = RoundBox()
						toggletracker.Size = UDim2.new(0,18,0,18)
						toggletracker.Position = UDim2.new(1,-23,0,5)
						toggletracker.ImageColor3 = libraryColours.Status
						toggletracker.Parent = selectionframe
						toggletracker.Name = "toggletracker"
						
						local togglecolour = RoundBox()
						togglecolour.ImageColor3 = thisthistoggle and libraryColours.Accents or libraryColours.Secondary
						togglecolour.Size = thisthistoggle and UDim2.new(1,0,1,0) or UDim2.new(0,14,0,14)
						togglecolour.Position = thisthistoggle and UDim2.new(0,0,0,0) or UDim2.new(0,2,0,2)
						togglecolour.Parent = toggletracker
						togglecolour.Name = "togglecolour"
						
						local togglechecker = CheckBox()
						togglechecker.ImageTransparency = v and 0 or 1
						togglechecker.Parent = togglecolour
						togglechecker.Name = "togglechecker"

						togglebutton.MouseButton1Click:Connect(function()
							thisthistoggle = not thisthistoggle
							if not thisthistoggle then
								togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
								TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
								TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
							else
								togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
								TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
								TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
							end
							selection[i] = thisthistoggle
							callback(selection)
						end)
					end
				end
				loadSelection()
		
				contentlist:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if toggle then
						mainlabel:TweenSize(UDim2.new(1,0,0,47+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						contentframe:TweenSize(UDim2.new(1,0,0,7+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					end
				end)
				
				local toreturn = {}

				toreturn["type"] = "Selection"

				function toreturn:ResetDefault()
					selection = selectionA
					loadSelection()
				end

				function toreturn:UpdateSelection(newselection)
					selection = newselection
					loadSelection()
				end

				return toreturn
			end
			
			function sectionLibrary:AddPlayerSelection(text, default, callback)
				local thistoggle = false
				local truebydefault = false
				if default["truebydefault"] then
					truebydefault = default["truebydefault"]
					default["truebydefault"] = nil
				end
				local selection = default
				for i,v in pairs(game.Players:GetPlayers()) do
					if not selection[v.Name] then
						selection[v.Name] = truebydefault
					end
				end
				
				local togglecontainer = Frame()
				togglecontainer.Size = UDim2.new(1,0,0,28)
				togglecontainer.BackgroundColor3 = libraryColours.Secondary
				togglecontainer.Parent = sectioncontent
				
				local toggletracker = RoundBox()
				toggletracker.Size = UDim2.new(0,18,0,18)
				toggletracker.Position = UDim2.new(1,-23,0,5)
				toggletracker.ImageColor3 = libraryColours.Status
				toggletracker.Parent = togglecontainer
				toggletracker.Name = "toggletracker"
				
				local togglecolour = RoundBox()
				togglecolour.ImageColor3 = thistoggle and libraryColours.Accents or libraryColours.Secondary
				togglecolour.Size = thistoggle and UDim2.new(1,0,1,0) or UDim2.new(0,14,0,14)
				togglecolour.Position = thistoggle and UDim2.new(0,0,0,0) or UDim2.new(0,2,0,2)
				togglecolour.Parent = toggletracker
				togglecolour.Name = "togglecolour"
				
				local togglechecker = ExpandableArrow()
				togglechecker.ImageTransparency = thistoggle and 0 or 1
				togglechecker.Parent = togglecolour
				togglechecker.Name = "togglechecker"
				
				local togglebutton = Button(text or "Toggle")
				togglebutton.Size = UDim2.new(1,0,1,0)
				togglebutton.Font = Enum.Font.SourceSansBold
				togglebutton.Text = ("  "..text) or ("  Toggle")
				togglebutton.TextXAlignment = Left
				togglebutton.TextColor3 = libraryColours.Text
				togglebutton.TextSize = 16
				togglebutton.Parent = togglecontainer

				--Selection part

				local containerframe = Instance.new("Frame")
				containerframe.Name = "ContainerFrame"
				containerframe.BackgroundTransparency = 1
				containerframe.Size = UDim2.new(0,0,100,0)
				containerframe.Position = UDim2.new(1,5,0,(togglecontainer.AbsolutePosition.Y - containerframemaster.AbsolutePosition.Y)*-1)
				containerframe.ClipsDescendants = true
				containerframe.Parent = togglecontainer
		
				local mainlabel = RoundBox()
				mainlabel.ImageColor3 = libraryColours.Main
				mainlabel.Size = UDim2.new(1,0,0,40)
				mainlabel.Parent = containerframe
				mainlabel.Name = "mainlabel"
				
				local titlebar = Label(text)
				titlebar.Size = UDim2.new(1,0,0,40)
				titlebar.Font = Enum.Font.SourceSansBold
				titlebar.TextSize = 18
				titlebar.TextColor3 = libraryColours.White
				titlebar.Name = "titlebar"
				titlebar.Parent = mainlabel
		
				local contentframe = RoundBox()
				contentframe.Size = UDim2.new(1,0,0,0)
				contentframe.Position = UDim2.new(0,0,0,40)
				contentframe.ImageColor3 = libraryColours.Primary
				contentframe.ClipsDescendants = true
				contentframe.Parent = containerframe

				local contentlist = List()
				contentlist.Parent = contentframe

				togglebutton.MouseButton1Click:Connect(function()
					thistoggle = not thistoggle
					if not thistoggle then
						togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
						
						containerframe:TweenSize(UDim2.new(0,0,100,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.1, true)
					else
						togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
						TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
						
						containerframe:TweenSize(UDim2.new(0,220,100,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.1, true)
					end
				end)

				local function loadSelection()
					for i,v in pairs(contentframe:GetChildren()) do
						if v.ClassName == "Frame" then
							v:Destroy()
						end
					end
					table.sort(selection)
					for i,v in pairs(selection) do
						local thisthistoggle = v

						local selectionframe = Frame()
						selectionframe.Size = UDim2.new(1,0,0,28)
						selectionframe.BackgroundColor3 = libraryColours.Secondary
						selectionframe.Parent = contentframe
				
						local togglebutton = Button("  "..i)
						togglebutton.Size = UDim2.new(1,0,1,0)
						togglebutton.Font = Enum.Font.SourceSansBold
						togglebutton.TextXAlignment = Left
						togglebutton.TextColor3 = libraryColours.Text
						togglebutton.TextSize = 16
						togglebutton.Parent = selectionframe
				
						local toggletracker = RoundBox()
						toggletracker.Size = UDim2.new(0,18,0,18)
						toggletracker.Position = UDim2.new(1,-23,0,5)
						toggletracker.ImageColor3 = libraryColours.Status
						toggletracker.Parent = selectionframe
						toggletracker.Name = "toggletracker"
						
						local togglecolour = RoundBox()
						togglecolour.ImageColor3 = thisthistoggle and libraryColours.Accents or libraryColours.Secondary
						togglecolour.Size = thisthistoggle and UDim2.new(1,0,1,0) or UDim2.new(0,14,0,14)
						togglecolour.Position = thisthistoggle and UDim2.new(0,0,0,0) or UDim2.new(0,2,0,2)
						togglecolour.Parent = toggletracker
						togglecolour.Name = "togglecolour"
						
						local togglechecker = CheckBox()
						togglechecker.ImageTransparency = v and 0 or 1
						togglechecker.Parent = togglecolour
						togglechecker.Name = "togglechecker"

						togglebutton.MouseButton1Click:Connect(function()
							thisthistoggle = not thisthistoggle
							if not thisthistoggle then
								togglecolour:TweenSizeAndPosition(UDim2.new(0,14,0,14), UDim2.new(0,2,0,2), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
								TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Secondary}):Play()
								TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
							else
								togglecolour:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
								TweenService:Create(togglecolour, TweenInfo.new(0.1), {ImageColor3 = libraryColours.Accents}):Play()
								TweenService:Create(togglechecker, TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
							end
							selection[i] = thisthistoggle
							callback(selection)
						end)
					end
				end
				loadSelection()

				game.Players.PlayerAdded:Connect(function(p)
					selection[p.Name] = default[p.Name] or truebydefault
					loadSelection()
				end)

				game.Players.PlayerRemoving:Connect(function(p)
					selection[p.Name] = nil
					loadSelection()
				end)
		
				contentlist:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					if toggle then
						mainlabel:TweenSize(UDim2.new(1,0,0,47+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
						contentframe:TweenSize(UDim2.new(1,0,0,7+contentlist.AbsoluteContentSize.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
					end
				end)
				
				local toreturn = {}

				toreturn["type"] = "PlayerSelection"

				function toreturn:ResetDefault() end

				return toreturn
			end

			return sectionLibrary
		end
		
		return tabLibrary
	end
	
	return optionLibrary
end

return library
