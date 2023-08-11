ESX = exports['es_extended']:getSharedObject()

local Translation = Config.Translation
local Language = Config.Language

local isNearLifeInvader = false
local name = 'LifeInvader'

if Config.LifeInvader == 'command' then

    RegisterCommand('lifeinvader', function(input, args, rawCommand)

        local input = CreateDialog(Translation[Language]['Werbetext'])
        if input ~= nil then
            TriggerServerEvent('LifeInv:buyadcomm', input)
        end
    
        if Config.Notify == 'ESX' then
            exports["esx_notify"]:Notify("info", 3000, Translation[Language]['paid_1000$'])
        elseif Config.Notify == 'OKOK' then
            exports['okokNotify']:Alert("LifeInvader", Translation[Language]['paid_500$'], 5000, 'info')
        end
    
    end)

    elseif Config.LifeInvader == 'coords' then

    Citizen.CreateThread(function()
        while true do
        
            DrawMarker(27, Config.MarkerCoords.x, Config.MarkerCoords.y, Config.MarkerCoords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 50, 60, 50, false, true, 2, false, false, false, false)
        
            if isNearLifeInvader then
                showInfobar(Translation[Language]['showInfoBar'])
                if IsControlJustReleased(0, 38) then
                    local input = CreateDialog(Translation[Language]['Werbetext'])
                    if input ~= nil then
                        TriggerServerEvent('LifeInv:buyad', input)
                    end
                    if Config.Notify == 'ESX' then
                        exports["esx_notify"]:Notify("info", 3000, Translation[Language]['paid_500$'])
                    elseif Config.Notify == 'OKOK' then
                        exports['okokNotify']:Alert("LifeInvader", Translation[Language]['paid_500$'], 5000, 'info')
                    end
                end
            end
        
            Citizen.Wait(1)
        end
    end)

    local blip = AddBlipForCoord(Config.Coords.x, Config.Coords.y)
        SetBlipSprite (blip, 77)
        SetBlipScale  (blip, 1.0)
        SetBlipDisplay(blip, 4)
        SetBlipColour (blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING') 
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)

    elseif Config.LifeInvader == 'bothe' then

    local blip = AddBlipForCoord(Config.Coords.x, Config.Coords.y)
        SetBlipSprite (blip, 77)
        SetBlipScale  (blip, 1.0)
        SetBlipDisplay(blip, 4)
        SetBlipColour (blip, 1)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING') 
        AddTextComponentString(name)
        EndTextCommandSetBlipName(blip)

    Citizen.CreateThread(function()
        while true do
            
            DrawMarker(27, Config.MarkerCoords.x, Config.MarkerCoords.y, Config.MarkerCoords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 50, 60, 50, false, true, 2, false, false, false, false)
            
            if isNearLifeInvader then
                showInfobar(Translation[Language]['showInfoBar'])
                if IsControlJustReleased(0, 38) then
                    local input = CreateDialog(Translation[Language]['Werbetext'])
                    if input ~= nil then
                        TriggerServerEvent('LifeInv:buyad', input)
                    end
                    if Config.Notify == 'ESX' then
                        exports["esx_notify"]:Notify("info", 3000, Translation[Language]['paid_500$'])
                    elseif Config.Notify == 'OKOK' then
                        exports['okokNotify']:Alert("LifeInvader", Translation[Language]['paid_500$'] , 5000, 'info')
                    end
                end
            end
            
            Citizen.Wait(1)
        end
    end)  

    RegisterCommand('lifeinvader', function(input, args, rawCommand)

        local input = CreateDialog(Translation[Language]['Werbetext'])
        if input ~= nil then
            TriggerServerEvent('LifeInv:buyadcomm', input)
        end
        
        if Config.Notify == 'ESX' then
            exports["esx_notify"]:Notify("info", 3000, Translation[Language]['paid_1000$'])
        elseif Config.Notify == 'OKOK' then
            exports['okokNotify']:Alert("LifeInvader", Translation[Language]['paid_1000$'], 5000, 'info')
        end
    
    end)
    
end

Citizen.CreateThread(function()
    while true do
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        local dist = Vdist(playerCoords, Config.Coords.x, Config.Coords.y, Config.Coords.z)

        if dist < 1.5 then
            isNearLifeInvader = true
        else
            isNearLifeInvader = false
        end

        Citizen.Wait(350)
    end    
end)



RegisterNetEvent('LifeInv:sendad')
AddEventHandler('LifeInv:sendad', function(text)

    showPictureNotification('CHAR_LIFEINVADER', text, 'LifeInvader', Translation[Language]['Werbung'])

end)

function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput

    AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
    DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", Translation[Language]['Insert_Advertisment'], "", "", "", 100)
    while (UpdateOnscreenKeyboard() == 0) do
     DisableAllControlActions(0);
     Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
     local displayResult = GetOnscreenKeyboardResult()
     return displayResult
    end

end
   
   
function showInfobar(msg)

    CurrentActionMsg  = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end
   
   
function showPictureNotification(icon, msg, title, subtitle)

    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg);
    SetNotificationMessage(icon, icon, true, 1, title, subtitle);
    DrawNotification(false, true);

end