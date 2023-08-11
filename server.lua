ESX = exports['es_extended']:getSharedObject()

local Translation = Config.Translation
local Language = Config.Language

RegisterServerEvent('LifeInv:buyad')
AddEventHandler('LifeInv:buyad', function(adtext)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('bank').money >= 500 then
        xPlayer.removeAccountMoney('bank', 500)
        TriggerClientEvent('LifeInv:sendad', -1, adtext)
    else
        xPlayer.showNotification(Translation[Language]['notenoughmoney'])
    end

    LifeInvlog(adtext)
    
end)

RegisterServerEvent('LifeInv:buyadcomm')
AddEventHandler('LifeInv:buyadcomm', function(adtext)

    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('bank').money >= 1000 then
        xPlayer.removeAccountMoney('bank', 1000)
        TriggerClientEvent('LifeInv:sendad', -1, adtext)
    else
        xPlayer.showNotification(Translation[Language]['notenoughmoney'])
    end

    LifeInvlog(adtext)
    
end)

function LifeInvlog(adtext)

    local identifiers = GetPlayerIdentifiers(source)
    
    local discordID, fivemIdentifier
    for _, identifier in pairs(identifiers) do
        if string.find(identifier, "discord:") then
            discordID = string.sub(identifier, 9)
        elseif string.find(identifier, "license:") then
            fivemIdentifier = string.sub(identifier, 9)
        end
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local playerid = xPlayer.source
    local name = xPlayer.getName(xPlayer)

    url = Config.WeebHook

    local embeds = {
        {
            ["title"] = "LifeInvader",
            ["type"] = "rich",
            ["color"] = Config.Color,
            ["description"] = '**Message:** '..adtext..'\n'..'\n'..'\n**Sender:** '..name..'\n**ID:** '..playerid..'\n**identifier: **'..'||**'..fivemIdentifier..'**||**'..'\n**DiscordID: **'..'||'..discordID..'||**',
            ["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
        }
    }

    PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = Config.Name, embeds = embeds}), { ['Content-Type'] = 'application/json'})
end
