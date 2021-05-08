local XanaxUILib = loadstring(game:HttpGet("https://pastebin.com/raw/XZz3Ytbu"))()
local Ui = XanaxUILib:CreateWindow("Basic WalkSpeed")
local Info = Ui:CreateSection("Info")
local WalkSpeedTab = Ui:CreateSection("WalkSpeed")
local JumpPowerTab = Ui:CreateSection("JumpPower")
local uis = game:GetService("UserInputService")


Info:CreateLabel("Made by irlydontksdnow#4885")
Info:CreateLabel("Basic Movement GUI")
Info:CreateLabel("Change Tabs On The left")
Info:CreateLabel("Ver 1.3")
Info:CreateLabel("Press F to fly")

WalkSpeedTab:CreateLabel("WalkSpeed")
WalkSpeedTab:CreateLabel("Change the slider again after death")

WalkSpeedTab:CreateSlider("I am speed", "WalkSpeed", 16, 100, false, function(ws)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
end)

JumpPowerTab:CreateSlider("bruh jumpy boi", "Jump", 1, 300, false, function(jp)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
end)

local rs = game:GetService("RunService")

local myPlayer = game.Players.LocalPlayer
local myChar = myPlayer.Character
local myHRP = myChar:WaitForChild("HumanoidRootPart")
local camera = game.Workspace.CurrentCamera

local flying = false
local speed = 0.5


local bp = Instance.new("BodyPosition", myHRP)
bp.MaxForce = Vector3.new()
bp.D = 10
bp.P = 10000

local bg = Instance.new("BodyGyro", myHRP)
bg.MaxTorque = Vector3.new()
bg.D = 10

function fly()
	flying = true
	bp.MaxForce = Vector3.new(400000,400000,400000)
	bg.MaxTorque = Vector3.new(400000,400000,400000)
	while flying do
		rs.RenderStepped:wait()
		bp.Position = myHRP.Position +((myHRP.Position - camera.CFrame.p).unit * speed)
		bg.CFrame = CFrame.new(camera.CFrame.p, myHRP.Position)
	end
end

function endFlying()
	bp.MaxForce = Vector3.new()
	bg.MaxTorque = Vector3.new()
	flying = false
end

uis.InputBegan:connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		if not flying then
			fly()
		else
			endFlying()
		end
	end
end)
