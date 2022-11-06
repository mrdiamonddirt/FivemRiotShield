RegisterCommand("riot", function(source, args, raw)
    local src = source
    TriggerClientEvent("Riot:ToggleRiot", src)
end)

RegisterCommand("riot2", function(source, args, raw)
    local src = source
    TriggerClientEvent("Riot:ToggleBalRiot", src)
end)