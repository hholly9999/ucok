function template.CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")

    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local MinimizeIcon = Instance.new("TextButton")

    -- ScreenGui
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- MainFrame
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Size = UDim2.new(0, 300, 0, 300)
    MainFrame.BorderSizePixel = 0
    MainFrame.Draggable = true
    MainFrame.Active = true
    MainFrame.ClipsDescendants = true

    -- TitleLabel
    TitleLabel.Parent = MainFrame
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    TitleLabel.Text = "Panel Fitur"
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextSize = 24

    -- MinimizeButton
    MinimizeButton.Parent = MainFrame
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(0.9, -60, 0, 10)
    MinimizeButton.Text = "-"
    MinimizeButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)

    -- CloseButton
    CloseButton.Parent = MainFrame
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(0.9, -30, 0, 10)
    CloseButton.Text = "X"
    CloseButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)

    -- MinimizeIcon
    MinimizeIcon.Parent = ScreenGui
    MinimizeIcon.Size = UDim2.new(0, 40, 0, 40)
    MinimizeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
    MinimizeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    MinimizeIcon.Text = "↓"
    MinimizeIcon.Visible = false
    MinimizeIcon.Draggable = true
    MinimizeIcon.Active = true

    -- Animasi Minimize
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.3, true, function()
            MainFrame.Visible = false
            MinimizeIcon.Visible = true
        end)
    end)

    -- Animasi Restore
    MinimizeIcon.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 300), "Out", "Quad", 0.3, true)
        MinimizeIcon.Visible = false
    end)

    -- Close GUI
    CloseButton.MouseButton1Click:Connect(function()
        if ScreenGui then
            ScreenGui:Destroy()
        end
    end)
end

return ScreenGui, MainFrame
