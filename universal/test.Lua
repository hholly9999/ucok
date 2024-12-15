local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Claw Machine Master GUI : Shag420", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
 game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = -1
end)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
OrionLib:MakeNotification({
	Name = "Credits:",
	Content = "Shag420",
	Image = "rbxassetid://0",
	Time = 10
})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Thank you for using my script!","Discord: Shag420")
-- Fungsi untuk memberikan hadiah kepada pemain lokal
-- Tambahkan GarraAttachment pada boneka Gacha
Tab:AddButton({
	Name = "Add GarraAttachment to Gachas and Gancho",
	Callback = function()
		for i, v in ipairs(game.Workspace.Machines:GetDescendants()) do
			if v.Name == "Player" then
				if v.Parent.Parent.Parent:FindFirstChild("Escaner") then
					if v.Text == player.Name then
						-- Tambahkan GarraAttachment pada Gacha
						for _, gachaModel in ipairs(v.Parent.Parent.Parent.Gachas:GetChildren()) do
							local garraAttachment = gachaModel:FindFirstChild("GarraAttachment")
							if not garraAttachment then
								garraAttachment = Instance.new("Attachment")
								garraAttachment.Name = "GarraAttachment"
								garraAttachment.Parent = gachaModel
							end
						end

						-- Tambahkan GarraAttachment pada Gancho
						local gancho = v.Parent.Parent:FindFirstChild("Gancho")
						if gancho then
							local garraAttachment = gancho:FindFirstChild("GarraAttachment")
							if not garraAttachment then
								garraAttachment = Instance.new("Attachment")
								garraAttachment.Name = "GarraAttachment"
								garraAttachment.Parent = gancho
							end
						end
					end
				end
			end
		end
	end
})

-- Fungsi untuk memberikan hadiah kepada pemain lain
Tab:AddButton({
    Name = "Give Prizes To Others (Stand Next To Their Machine)",
    Callback = function()
        for _, v in next, game.Workspace.Machines:GetDescendants() do
            if v.Name == "Player" then
                local escaner = v.Parent.Parent.Parent:FindFirstChild("Escaner")
                if escaner then
                    if game.Players.LocalPlayer:DistanceFromCharacter(escaner.Position) <= 10 then
                        local touchTransmitter = escaner:FindFirstChild("TouchTransmitter")
                        if touchTransmitter then
                            for _, gacha in next, v.Parent.Parent.Parent.Gachas:GetChildren() do
                                if gacha:IsA("Model") then
                                    local body = gacha:FindFirstChild("Body")
                                    if body and body:IsA("Part") then
                                        -- Cek dan lakukan interaksi dengan TouchTransmitter
                                        touchTransmitter:FireServer()

                                        local targetPosition = escaner.Position
                                        body.Position = targetPosition
                                        body.Anchored = false
                                        body.CanCollide = true

                                        print("Boneka (Body) berhasil dipindahkan dan dijatuhkan untuk pemain lain!")
                                    else
                                        warn("Gacha model tidak memiliki Body yang valid.")
                                    end
                                end
                            end
                        else
                            warn("Escaner tidak memiliki TouchTransmitter.")
                        end
                    end
                end
            end
        end
    end
})




local Tab = Window:MakeTab({
	Name = "Autofarms",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Warning:","Autofarms automatically starts working for you")
Tab:AddButton({
	Name = "Stop/Start Working",
	Callback = function()
for i,v in next, game.Workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") then 
        if string.find(v.Parent.Parent.Name, "Work") then
            if v.ObjectText == "Press to start/stop working" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)
break
        end
    end
end
end
  	end    
})

Tab:AddToggle({
	Name = "Restart Machine Farm",
	Default = false,
	Callback = function(Value)
		getgenv().rmf = Value
        while rmf do
            pcall(function()
if game.Players.LocalPlayer.Working.Value == false then 
    repeat
for i,v in next, game.Workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") then 
        if string.find(v.Parent.Parent.Name, "Work") then
            if v.ObjectText == "Press to start/stop working" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)
break
        end
    end
end
end
task.wait(1)
until game.Players.LocalPlayer.Working.Value == true
else
for i,v in next, game.Workspace.Machines:GetDescendants() do 
    if v:IsA("ProximityPrompt") then
        if v.ObjectText == "Press to restart the machine!" then
            if v.Enabled == true then
                if v.Parent.Parent.Parent.Configuration.isPlaying.Value == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                task.wait(0.25)
                game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
                fireproximityprompt(v,1) 
                end
            end
        end
    end
    end

end
end)
            task.wait()
            end
	end    
})

Tab:AddToggle({
	Name = "Clean Floors Farm",
	Default = false,
	Callback = function(Value)
		getgenv().cff = Value
        while cff do
            pcall(function()
if game.Players.LocalPlayer.Working.Value == false then 
repeat
for i,v in next, game.Workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") then 
        if string.find(v.Parent.Parent.Name, "Work") then
            if v.ObjectText == "Press to start/stop working" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)
break
        end
    end
end
end
task.wait(1)
until game.Players.LocalPlayer.Working.Value == true
else
for i,v in next, game.Workspace.Engineers.Clean_Floor:GetDescendants() do 
    if v:IsA("ProximityPrompt") then
        if v.Enabled == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)  
        end
    end
    end             

end
end)
            task.wait()
            end
	end    
})

Tab:AddToggle({
	Name = "Refill Toys Farm",
	Default = false,
	Callback = function(Value)
		getgenv().rtf = Value
        while rtf do
            pcall(function()
if game.Players.LocalPlayer.Working.Value == false then 
repeat
for i,v in next, game.Workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") then 
        if string.find(v.Parent.Parent.Name, "Work") then
            if v.ObjectText == "Press to start/stop working" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)
break
        end
    end
end
end
task.wait(1)
until game.Players.LocalPlayer.Working.Value == true
else
for i,v in next, game.Workspace.Engineers.Refill_Toys:GetDescendants() do 
    if v:IsA("ProximityPrompt") then
        if v.Enabled == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
task.wait(0.25)
game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
fireproximityprompt(v, 1)  
        end
    end
    end             

end
end)
            task.wait()
            end
	end    
})

local Tab = Window:MakeTab({
    Name = "Plinko",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddParagraph("Warning:","You may need to click the buttons multiple times for it to work\n\nNames are random so just experiment with options (You need to click move ball after dropping it be kinda fast)")
local selectedOption = nil
local options = {}

for _, a in ipairs(game.Workspace:GetDescendants()) do
    if a:IsA("Script") and a.Name == "WinningScript" then
        local parent = a.Parent
        if parent and parent.Parent and parent.Parent.Name == "MaquinaCaida" then
            table.insert(options, parent.Name)
        end
    end
end

Tab:AddDropdown({
    Name = "Select what you want to win",
    Default = "",
    Options = options,
    Callback = function(Value1)
        selectedOption = Value1 
    end    
})

Tab:AddButton({
    Name = "Move Ball",
    Callback = function()
    pcall(function()
        for _, v in ipairs(game.Workspace:GetDescendants()) do
            if v.Name == "Jugador" and v.Parent and v.Parent.Name == "MaquinaCaida" then
            if game.Players.LocalPlayer:DistanceFromCharacter(v.Position) <= 50 then
                if v.SurfaceGui.Player.Text == game.Players.LocalPlayer.Name then
                    local target = v.Parent:FindFirstChild(selectedOption)
                    if target then
                        for b,c in next, game.Workspace:GetChildren() do
                            if c.Name == "Circulo" then
                            
                        c.CFrame = target.CFrame
                    end
                    end
                    end
                end
            end
        end
        end
        end)
    end    
})


local addedNames = {}

local Tab = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local function addButton(name, cframe)
    if not addedNames[name] then
        Tab:AddButton({
            Name = name,
            Callback = function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
            end
        })
        addedNames[name] = true
    end
end

local children = game.Workspace.Teleports:GetChildren()
local i, v = next(children)

while i do
    addButton(v.Name, v.CFrame)
    i, v = next(children, i)
end

game.Workspace.Teleports.ChildAdded:Connect(function(newplace)
    addButton(newplace.Name, newplace.CFrame)
end)

local Tab = Window:MakeTab({
    Name = "Misc.",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
      end    
})
Tab:AddButton({
	Name = "No ProximityPrompt Delay",
	Callback = function()
      	game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
        prompt.HoldDuration = -1
end)
  	end    
})
Tab:AddButton({
	Name = "Reset",
	Callback = function()
      	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
  	end    
})
