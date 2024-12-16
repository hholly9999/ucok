local GUI = {}

function GUI.CreateGUI()
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
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.Size = UDim2.new(0, 300, 0, 300)
    MainFrame.BorderSizePixel = 0
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.ClipsDescendants = true -- Untuk animasi

    -- Pengaturan untuk Dragging Frame
    MainFrame.Draggable = true
    MainFrame.Active = true
    MainFrame.Selectable = true

    -- Konfigurasi Title (Judul Frame)
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "Panel Fitur"
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.TextSize = 24
    TitleLabel.TextStrokeTransparency = 0.8
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center

    -- Konfigurasi Tombol Minimize
    MinimizeButton.Parent = MainFrame
    MinimizeButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 10)
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Font = Enum.Font.SourceSans
    MinimizeButton.Text = "-"
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.TextSize = 20

    -- Efek Hover untuk Minimize
    MinimizeButton.MouseEnter:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    end)
    MinimizeButton.MouseLeave:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    end)

    -- Konfigurasi Tombol Close
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Font = Enum.Font.SourceSans
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 20

    -- Efek Hover untuk Close
    CloseButton.MouseEnter:Connect(function()
        CloseButton.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
    end)
    CloseButton.MouseLeave:Connect(function()
        CloseButton.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    end)

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

    -- Fungsi Minimize dengan Animasi
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.3, true, function()
            MainFrame.Visible = false
            MinimizeIcon.Visible = true
        end)
    end)

    -- Fungsi Restore GUI dengan Animasi
    MinimizeIcon.MouseButton1Click:Connect(function()
        MainFrame.Visible = true
        MainFrame:TweenSize(UDim2.new(0, 300, 0, 300), "Out", "Quad", 0.3, true)
        MinimizeIcon.Visible = false
    end)

    -- Fungsi Close untuk Menghapus GUI
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

return GUI
