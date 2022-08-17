local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "[UFO🛸] Strength Training Simulator! 💪 bbooddy#1838 ", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})

_G.autoclick = false
_G.autorebirth = false
_G.autohatch = false
_G.eggselect = "Basic Egg"
_G.autohatch2 = false
_G.autoequip = false
_G.autocraft = false




function AntiAfk()
		local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end

function AntiKick()
	local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
if getnamecallmethod() == "Kick" or getnamecallmethod() == "kick" then
return wait(math.huge)
end
return old(self, ...)
end)
setreadonly(mt, true)
game:GetService("ScriptContext"):SetTimeout(0.1)
for i,v in pairs(getconnections(game.Players.LocalPlayer.Character.Humanoid.Changed)) do
v:Disable()
end
for i,v in pairs(getconnections(game.Players.LocalPlayer.Character.Humanoid.Running)) do
v:Disable()
end
for i,v in pairs(getconnections(game.Players.LocalPlayer.Character.HumanoidRootPart.Changed)) do
v:Disable()
end
for i,v in pairs(getconncections(game.Players.LocalPlayer.Character.DescendantAdded)) do
v:Disable()
end
end

function autocraft()
	while _G.autocraft == true do
local ohString1 = "CraftAll"

game:GetService("ReplicatedStorage").Remotes.Pets.Action:FireServer(ohString1)
wait(30)
end
end

function autoequip()
	while _G.autoequip == true do
local ohString1 = "EquipBest"

game:GetService("ReplicatedStorage").Remotes.Pets.Action:FireServer(ohString1)
wait(30)
end
end

function autogem()
	local folder = game:GetService("Workspace").Lobby.Gems; 
	for i, Obj in next, folder:GetChildren() do
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Obj.CFrame
    wait(0.50)
end
end


function autohatch()
	while _G.autohatch == true do
local ohString1 = _G.eggselect
local ohNumber2 = 1

game:GetService("ReplicatedStorage").Remotes.Pets.HatchEgg:FireServer(ohString1, ohNumber2)
wait(0.01)
end
end

function autohatch2()
	while _G.autohatch2 == true do
local ohString1 = _G.eggselect
local ohNumber2 = 3

game:GetService("ReplicatedStorage").Remotes.Pets.HatchEgg:FireServer(ohString1, ohNumber2)
wait(0.01)
end
end

function autoclick()
	while _G.autoclick == true do
game:GetService("ReplicatedStorage").Remotes.Game.Click:InvokeServer()
wait(0.01)
end
end

function autorebirth()
	while _G.autorebirth == true do
local ohNumber1 = _G.autorebirthvalue
game:GetService("ReplicatedStorage").Remotes.Game.Rebirth:FireServer(ohNumber1)
wait(0.01)
end
end



																																											
local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab2:AddSection({
	Name = "Eggs"
})


local Section = Tab:AddSection({
	Name = "Auto Click & Rebirth"
})

local Section = Tab3:AddSection({
	Name = "Misc"
})



Tab:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		_G.autoclick = Value
		autoclick()
	end    
})

Tab:AddTextbox({
	Name = "Rebirth Amount",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
	_G.autorebirthvalue = Value
	end	  
})

Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		_G.autorebirth = Value
		autorebirth()
	end    
})

Tab:AddToggle({
	Name = "Auto Equip Best",
	Default = false,
	Callback = function(Value)
		_G.autoequip = Value
		autoequip()
	end    
})


Tab:AddToggle({
	Name = "Auto Craft All",
	Default = false,
	Callback = function(Value)
		_G.autocraft = Value
		autocraft()
	end    
})



Tab:AddButton({
	Name = "Pick All Gems",
	Callback = function()
	autogem()
  	end    
})




Tab2:AddDropdown({
	Name = "Normal Eggs",
	Default = "Basic Egg",
	Options = {"Basic Egg", "Superior Egg", "Desert Egg", "Winter Egg", "Moon Egg", "Beach Egg", "Ocean Egg", "Farm Egg", "Graveyard Egg", "Lava Egg", "Candy Egg", "Toxic Egg", "Mineshaft Egg", "Alien Egg"},
	Callback = function(Value)
	_G.eggselect = Value
	end    
})



Tab2:AddToggle({
	Name = "Auto Open",
	Default = false,
	Callback = function(Value)
		_G.autohatch = Value
		autohatch()
	end    
})

Tab2:AddToggle({
	Name = "Auto Triple Open",
	Default = false,
	Callback = function(Value)
		_G.autohatch2 = Value
		autohatch2()
	end    
})


Tab2:AddButton({
	Name = "Remove Hatching Animation",
	Callback = function()
game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.EggHatching:Remove()
  	end     
})


Tab3:AddButton({
	Name = "Anti Afk & Kick",
	Callback = function()
	AntiKick()
	AntiAfk()
end
})

OrionLib:Init()