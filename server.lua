-- FiveM ChillZone

-- discord https://discord.gg/HAS4S7c

-- Feel free to edit everithing 

-- use [^1-^9]*(123456789) 
-- https://forum.cfx.re/t/chat-formatting-colors-bold-underline/67641




-- /me
RegisterServerEvent('me')
AddEventHandler('me', function(param)
  print('^7[^5Me^7]^5:'.. param)
  TriggerClientEvent('chatMessage', -1, '^3[Me]^4' .. GetPlayerName(source), {0,0,0} , param)
end)

-- /do
RegisterServerEvent('do')
AddEventHandler('do', function(param)
  print('^7[^2Do^7]^5:'.. param)
  TriggerClientEvent('chatMessage', -1, '^2[Do]^4' .. GetPlayerName(source), {0,0,0} , param)
end)

-- /OOC
RegisterServerEvent('ooc')
  AddEventHandler('ooc', function(param)
    print('^5[OOC]^5:'.. param)
    TriggerClientEvent('chatMessage', -1, '^5[OOC]^5' .. GetPlayerName(source), {0,0,0} , param)
  end)
  
  -- announce
RegisterServerEvent('announce')
AddEventHandler('announce', function(param)
  print('^7[^1Announcement^7]^5:'.. param)
  TriggerClientEvent('chatMessage', -1, '^7[^1Announcement^7]^2', {0,0,0} , param)
end)