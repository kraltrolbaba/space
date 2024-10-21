-- Basit bir hile menüsü
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Menü oluşturma fonksiyonu
function createMenu()
    local screenGui = Instance.new("ScreenGui")
    local frame = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local unitLabel = Instance.new("TextLabel")
    local unitInput = Instance.new("TextBox")
    local valueLabel = Instance.new("TextLabel")
    local valueInput = Instance.new("TextBox")
    local submitButton = Instance.new("TextButton")

    screenGui.Parent = player.PlayerGui

    -- Menü şekillendirme
    frame.Parent = screenGui
    frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    frame.Size = UDim2.new(0.4, 0, 0.4, 0)

    title.Parent = frame
    title.Text = "Liderlik Tablosu Düzenleyici"
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    title.TextColor3 = Color3.new(1, 1, 1)

    unitLabel.Parent = frame
    unitLabel.Text = "Birimi Girin:"
    unitLabel.Position = UDim2.new(0.1, 0, 0.3, 0)
    unitLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
    unitLabel.TextColor3 = Color3.new(1, 1, 1)

    unitInput.Parent = frame
    unitInput.Position = UDim2.new(0.4, 0, 0.3, 0)
    unitInput.Size = UDim2.new(0.4, 0, 0.1, 0)
    unitInput.PlaceholderText = "Birimi girin..."

    valueLabel.Parent = frame
    valueLabel.Text = "Yeni Değer:"
    valueLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
    valueLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
    valueLabel.TextColor3 = Color3.new(1, 1, 1)

    valueInput.Parent = frame
    valueInput.Position = UDim2.new(0.4, 0, 0.5, 0)
    valueInput.Size = UDim2.new(0.4, 0, 0.1, 0)
    valueInput.PlaceholderText = "Yeni değeri girin..."

    submitButton.Parent = frame
    submitButton.Text = "Değiştir"
    submitButton.Position = UDim2.new(0.3, 0, 0.7, 0)
    submitButton.Size = UDim2.new(0.4, 0, 0.15, 0)
    submitButton.BackgroundColor3 = Color3.new(0.1, 0.6, 0.1)

    -- Değeri değiştirme fonksiyonu
    submitButton.MouseButton1Click:Connect(function()
        local unitName = unitInput.Text
        local newValue = tonumber(valueInput.Text)

        if unitName and newValue then
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                local unit = leaderstats:FindFirstChild(unitName)
                if unit and unit:IsA("IntValue") then
                    unit.Value = newValue
                    print("Birimin yeni değeri: " .. newValue)
                else
                    print("Birimi bulamadım ya da bu bir IntValue değil.")
                end
            else
                print("Leaderstats bulunamadı.")
            end
        else
            print("Birimi veya yeni değeri doğru girdiğinizden emin olun.")
        end
    end)
end

-- Menü oluşturma çağrısı
createMenu()
