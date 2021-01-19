-- FiveM ChillZone

-- discord https://discord.gg/HAS4S7c

-- Feel free to edit everithing 

-- use [^1-^9]*(123456789) 
-- https://forum.cfx.re/t/chat-formatting-colors-bold-underline/67641




-- /me
RegisterServerEvent('me')
AddEventHandler('me', function(param)
  print('[5Me]:'.. param)
  TriggerClientEvent('chatMessage', -1, '^*^3[Me]^*^4' .. GetPlayerName(source), {0,0,0} , param)
end)

-- /do
RegisterServerEvent('do')
AddEventHandler('do', function(param)
  print('[Do]:'.. param)
  TriggerClientEvent('chatMessage', -1, '^*^2[Do]^*^4' .. GetPlayerName(source), {0,0,0} , param)
end)

-- /OOC
RegisterServerEvent('ooc')
  AddEventHandler('ooc', function(param)
    print('[OOC]:'.. param)
    TriggerClientEvent('chatMessage', -1, '^*^5[OOC]^*^5' .. GetPlayerName(source), {0,0,0} , param)
  end)
  
  -- announce
RegisterServerEvent('announce')
AddEventHandler('announce', function(param)
  print('^*^7[^*^1Announcement^*^7]^*^5:'.. param)
  TriggerClientEvent('chatMessage', -1, '^*^7[^*^1Announcement^*^7]^*^2', {0,0,0} , param)
end)

-- /help this command will print a preset message on the client chat (can be /discord, /help, /website or whatever)
RegisterCommand("help", function(source, args, rawCommand)
  if (source > 0) then
      TriggerClientEvent("chat:addMessage", -1, {
          args = {
              GetPlayerName(source),
              -- [[here you can change the preset msg use ~g/r/b...~]]
              "~g~NO ~r~HELP ~b~FOR ~y~YOU!"
          },
          color = { 5, 255, 255 }
      })
  else
      print("This command was executed by the server console, RCON client, or a resource.")
  end

end, false --[[this command is not restricted, everyone can use this.]])

