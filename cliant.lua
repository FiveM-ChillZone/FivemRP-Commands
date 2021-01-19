-- FiveM ChillZone

-- discord https://discord.gg/HAS4S7c

-- Feel free to edit everithing 



-- /me
RegisterCommand("me", function(source, args)
    TriggerServerEvent('me', table.concat(args, " "))
end)
TriggerEvent( "chat:addSuggestion", "/me", "Whaet's your RP line 11? " )


-- /do
RegisterCommand("do", function(source, args) 
    TriggerServerEvent('do', table.concat(args, " "))
end)
TriggerEvent( "chat:addSuggestion", "/do", "this is in line 24? " )


-- /OOC
RegisterCommand("ooc", function(source, args) 
    TriggerServerEvent('ooc', table.concat(args, " "))
end)
TriggerEvent( "chat:addSuggestion", "/ooc", "it is fucked up line 30 " )


-- /dv
RegisterCommand( "dv", function()
    TriggerEvent( "deleteVehicle" )
end, false )
TriggerEvent( "chat:addSuggestion", "/dv", "Don't abuse, And make sure to finish With your RP first" )

-- max distance from vehicle   
local distanceToCheck = 5.0

-- retry timeout
local numRetries = 5


RegisterNetEvent( "deleteVehicle" )
AddEventHandler( "deleteVehicle", function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "You must be in the driver seat!" )
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "~y~You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
        Notify( "~g~Failed, trying again..." )

        -- Fallback if the vehicle doesn't get deleted
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            -- The vehicle has been banished from the face of the Earth!
            if ( not DoesEntityExist( veh ) ) then 
                Notify( "~r~Vehicle deleted." )
            end 

            -- Increase the timeout counter and make the system wait
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            -- We've timed out and the vehicle still hasn't been deleted. 
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
                Notify( "~g~Failed to delete vehicle after " .. timeoutMax .. " retries." )
            end 
        end 
    else 
        Notify( "~g~Deleted." )
    end 
end 


function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end

-- notification on the player's screen 
function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- announce
RegisterCommand("announce", function(source, args)
    TriggerServerEvent('announce', table.concat(args, " "))

end)
