-- RaajikLimitDamage.lua
local LimitDamage = CreateFrame("Frame")
LimitDamage:RegisterEvent("PLAYER_LOGIN")

LimitDamage:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Create a slash command to trigger the functionality
        SLASH_LIMIT1 = "/ld"
        SlashCmdList["LIMIT"] = function()
            -- Initialize the toggle state if it hasn't been set
            if not LimitDamage.perkEnabled then
                LimitDamage.perkEnabled = false
            end

            -- Toggle the perk and perform actions based on its state
            LimitDamage.perkEnabled = not LimitDamage.perkEnabled

            if LimitDamage.perkEnabled then
                -- Mark the player with the red X raid marker (marker ID 7)
                SetRaidTarget("player", 7)
                print("LimitDamage: Perk enabled and red X raid marker set.")
            else
                -- Remove the raid marker
                SetRaidTarget("player", 0)
                print("LimitDamage: Perk disabled and raid marker removed.")
            end

            -- Execute the provided chat command
            RunScript([[if not PerkToggle then PerkToggle = false end; PerkToggle = not PerkToggle; ChangePerkOption("Misc Options", "Limit damage", PerkToggle, true)]])
        end

        print("RaajikLimitDamage loaded. Use /ld to toggle the perk and raid marker.")
    end
end)