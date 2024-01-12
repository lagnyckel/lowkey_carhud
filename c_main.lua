Carhud = {}

Citizen.CreateThread(function()
    while true do 
        local playerPed, loopInterval = PlayerPedId(), 1500; 

        if IsPedInAnyVehicle(playerPed, false) and GetIsVehicleEngineRunning(GetVehiclePedIsIn(playerPed, false)) then 
            loopInterval = 300; 

            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 3.6
            local fuel = GetVehicleFuelLevel(vehicle)
            local engine = math.floor(GetVehicleEngineHealth(vehicle) / 10); 

            SendNUIMessage({
                type = 'display', 
                data = {
                    speed = math.floor(speed), 
                    fuel = fuel, 
                    engine = engine,
                    belt = false, -- Lägg din export till ditt bältes script här
                }
            })
        else
            SendNUIMessage({
                type = 'hide'
            })
        end

        Citizen.Wait(loopInterval)
    end
end)