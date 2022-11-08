if QBCore == nil then
    RegisterCommand("riot", function(source, args, raw)
        local src = source
        TriggerClientEvent("Riot:ToggleRiot", src)
    end)
    
    RegisterCommand("riot2", function(source, args, raw)
        local src = source
        TriggerClientEvent("Riot:ToggleBalRiot", src)
    end)
    else
        local QBCore = exports['qb-core']:GetCoreObject()
    
        QBCore.Commands.Add("riot", "Gives Riot Shield (Police Only)", {}, false, function(source)
            local Player = QBCore.Functions.GetPlayer(source)
            if Player.PlayerData.job.name == "police" then
                TriggerClientEvent("Riot:ToggleRiot", source)
            else
                TriggerClientEvent('QBCore:Notify', source,  "For Police Officer Only", "error")
            end
        end)
        
        QBCore.Commands.Add("riot2", "Gives Ballistic Riot Shield (Police Only)", {}, false, function(source)
            local Player = QBCore.Functions.GetPlayer(source)
            if Player.PlayerData.job.name == "police" then
                TriggerClientEvent("Riot:ToggleBalRiot", source)
            else
                TriggerClientEvent('QBCore:Notify', source,  "For Police Officer Only", "error")
            end
        end)
    end
    
    
    