local holdingRiot = false
local usingRiot = false
local riotModel = "prop_riot_shield"
local riotanimDict = "missfinale_c2mcs_1"
local riotanimName = "fin_c2_mcs_1_camman"
local holdingRiot2 = false
local usingRiot2 = false
local riotModel2 = "prop_ballistic_shield"
local riotanimDict2 = "missfinale_c2mcs_1"
local riotanimName2 = "fin_c2_mcs_1_camman"
local actionTime = 10
local riot_net = nil
local soundDistance = 15

---------------------------------------------------------------------------
-- Toggling Riot2 --
---------------------------------------------------------------------------
RegisterNetEvent("Riot:ToggleBalRiot")
AddEventHandler("Riot:ToggleBalRiot", function()
    if holdingRiot then 
        return 
    end 

    if not holdingRiot2 then
        RequestModel(GetHashKey(riotModel2))
        while not HasModelLoaded(GetHashKey(riotModel2)) do
            Citizen.Wait(100)
        end

        RequestAnimDict(riotanimDict2)
        while not HasAnimDictLoaded(riotanimDict2) do
            Citizen.Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local riotspawned2 = CreateObject(GetHashKey(riotModel2), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(riotspawned2)

        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(riotspawned2, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 45509), 0.35, 0.05, -0.1, 300.0, 180.0, 60.0, 1, 1, 1, 1, 0, 1)
        riot_net = netid
        holdingRiot2 = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(riot_net), 1, 1)
        DeleteEntity(NetToObj(riot_net))
        riot_net = nil
        holdingRiot2 = false
        usingRiot2 = false
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (holdingRiot2 == true) then
		 local ped = GetPlayerPed(-1)
            SetPlayerMayNotEnterAnyVehicle(ped)
			end
    end
end)

---------------------------------------------------------------------------
-- Toggling Riot1 --
---------------------------------------------------------------------------
RegisterNetEvent("Riot:ToggleRiot")
AddEventHandler("Riot:ToggleRiot", function()
    if holdingRiot2 then
        return
    end
    
    if not holdingRiot then
        RequestModel(GetHashKey(riotModel))
        while not HasModelLoaded(GetHashKey(riotModel)) do
            Citizen.Wait(100)
        end

        RequestAnimDict(riotanimDict)
        while not HasAnimDictLoaded(riotanimDict) do
            Citizen.Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local riotspawned = CreateObject(GetHashKey(riotModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(riotspawned)

        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(riotspawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 45509), 0.35, 0.05, -0.1, 300.0, 180.0, 60.0, 1, 1, 1, 1, 0, 1)
        riot_net = netid
        holdingRiot = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(riot_net), 1, 1)
        DeleteEntity(NetToObj(riot_net))
        riot_net = nil
        holdingRiot = false
        usingRiot = false
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if (holdingRiot == true) then
		 local ped = GetPlayerPed(-1)
            SetPlayerMayNotEnterAnyVehicle(ped)
			end
    end
end)

function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0, 1)
end

function DisplayNotification(string)
	SetTextComponentFormat("STRING")
	AddTextComponentString(string)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end