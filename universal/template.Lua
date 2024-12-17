local template = {}

function template.CreateGUI()
    -- Deklarasi Objek GUI
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")

    -- Tombol Kontrol GUI
    local MinimizeButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local MinimizeIcon = Instance.new("TextButton")

    -- Pengaturan GUI
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Konfigurasi Frame Utama
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.ClipsDescendants = true
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- Konfigurasi Title (Judul Frame)
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "Panel Fitur"
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextSize = 24

    -- Konfigurasi Tombol Minimize
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 10)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.TextSize = 20

    -- Konfigurasi Tombol Close
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 20

    -- Konfigurasi Ikon Minimize
    MinimizeIcon.Parent = ScreenGui
    MinimizeIcon.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    MinimizeIcon.Position = UDim2.new(0.5, -20, 0.5, -20)
    MinimizeIcon.Size = UDim2.new(0, 40, 0, 40)
    MinimizeIcon.Font = Enum.Font.SourceSans
    MinimizeIcon.Text = "↓"
    MinimizeIcon.TextColor3 = Color3.new(1, 1, 1)
    MinimizeIcon.TextSize = 20
    MinimizeIcon.Visible = false
    MinimizeIcon.Draggable = true
    MinimizeIcon.Active = true

    -- Efek Hover untuk Tombol
    local function setupHover(button, hoverColor, defaultColor)
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = hoverColor
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = defaultColor
        end)
    end

    setupHover(MinimizeButton, Color3.new(0.3, 0.3, 0.3), Color3.new(0.18, 0.18, 0.18))
    setupHover(CloseButton, Color3.new(0.3, 0.1, 0.1), Color3.new(0.18, 0.18, 0.18))

    -- Fungsi Minimize
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame:TweenSize(
            UDim2.new(0, 0, 0, 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.3,
            true,
            function()
                MainFrame.Visible = false
                MinimizeIcon.Visible = true
            end
        )
    end)

    -- Fungsi Restore
    MinimizeIcon.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        MainFrame:TweenSize(
            UDim2.new(0, 300, 0, 200),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.3,
            true
        )
        MinimizeIcon.Visible = false
    end)

    -- Fungsi Close
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

return template
