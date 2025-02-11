local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(0)
        local player = PlayerPedId()
        if IsPedFalling(player) then
            SetPedCanRagdoll(player, true)
            SetEntityVelocity(player, 0.0, 0.0, 0.-30) -- change 0.-30 if you want more slow / fast
        else
            SetPedCanRagdoll(player, true)
        end
    end
end)

AddEventHandler('gameEventTriggered', function(eventName, data)
    if eventName == 'CEventNetworkEntityDamage' then
        local entity, damageType = data[1], data[7]
        if entity == PlayerPedId() and damageType == 3 then
            CancelEvent()
        end
    end
end)
