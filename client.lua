Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

	local ped = PlayerPedId() -- Get Player ID
  if IsPedInAnyVehicle(ped) then -- Only display speed limit when in a vehicle
    local vehicle = GetVehiclePedIsIn(ped, false)
    if GetPedInVehicleSeat(vehicle, -1) == ped then
      local playerLocation = GetEntityCoords(ped) -- Get Player Coords
      local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerLocation.x, playerLocation.y, playerLocation.z)) -- Use Player Coords to find nearest Streets      
      
      speedlimit = Config.SpeedLimits[street] or "45"
        
      if Config.units == "KPH" then
        speedlimit = math.floor(speedlimit * 1.609)
      end

      DisplayLimit(speedlimit)
    end
  end
end
end)

function DisplayLimit(speedlimit)
	if Config.enableSpeedlimitDisplay then
    SendMessage('visibility', true)
    SendMessage('speedLimitData', speedlimit)
  else
    SendMessage('visibility', false)
	end
end

function SendMessage(messageType, messageData) -- Sends the message to our JS Event Handler
  SendNUIMessage({
    type = messageType,
    data = messageData
  })
end