local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart") -- Bagian utama karakter
local attractionRadius = 10 -- Radius untuk interaksi ProximityPrompt
local checkInterval = 0.1 -- Interval pengecekan

-- Nama objek dengan ProximityPrompt
local giftName = "Gift"

-- Fungsi untuk menarik dan memproses pickup Gift
local function attractAndPickupGift()
    local gifts = {} -- Simpan semua objek Gift yang ditemukan

    -- Cari semua Gift di workspace
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") and obj.Name == giftName then
            local prompt = obj:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                table.insert(gifts, {object = obj, distance = (obj.Position - humanoidRootPart.Position).Magnitude, prompt = prompt})
            end
        end
    end

    -- Urutkan Gift berdasarkan jarak dari karakter
    table.sort(gifts, function(a, b)
        return a.distance < b.distance
    end)

    -- Proses Gift yang terdekat
    for _, giftData in ipairs(gifts) do
        local obj = giftData.object
        local prompt = giftData.prompt
        local distance = giftData.distance

        -- Cek apakah ProximityPrompt dapat diaktifkan
        if prompt.Enabled and distance <= prompt.MaxActivationDistance then
            -- Simulasikan ProximityPrompt
            prompt:InputHoldBegin()  -- Mulai tahan input
            wait(prompt.HoldDuration) -- Tunggu hingga durasi hold selesai
            prompt:InputHoldEnd()  -- Lepas input
            print("Gift berhasil diambil: " .. tostring(obj.Name)) -- Debugging
            wait(1) -- Jeda sebelum melanjutkan ke Gift berikutnya
            break -- Hentikan loop setelah mengambil satu Gift
        end
    end
end

-- Jalankan fungsi secara terus-menerus
while true do
    attractAndPickupGift() -- Memproses pickup Gift terdekat
    wait(checkInterval) -- Tunggu sebelum iterasi berikutnya
end
