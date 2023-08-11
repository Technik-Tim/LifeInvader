Config = {}

Config.LifeInvader = 'bothe' -- You can use the script either with a command = command, via coords = coords, or using both = bothe.

Config.Notify = 'OKOK' -- If you are using ESX Notify, please set it to 'ESX'; if you are using OKOK Notify, please set it to 'OKOK'.

Config.Coords = {x = -1082.03, y = -247.85, z = 37.76}

Config.MarkerCoords = {x = -1082.03, y = -247.85, z = 36.86}

Config.Language = 'de' -- You can choose between 'en' and 'de'.

-- WeebHook --

Config.Webhook = ""

Config.DateFormat = '%x %H:%M' -- Here you can find the various options for formatting time: https://www.lua.org/pil/22.1.html

Config.Name = 'LifeInvader'

Config.Color = 16711680 -- You can find the required number under "Decimal value" on this website: https://www.spycolor.com



Config.Translation = {

    ['de'] = {
        ['notenoughmoney'] = 'Du hast nicht genug Geld',
        ['paid_1000$'] = 'Du hast 1000$ gezahlt',
        ['paid_500$'] = 'Du hast 500$ gezahlt',
        ['showInfoBar'] = 'Drücke ~g~E~s~, um ~o~Werbung ~s~zu Schalten (~r~500$~s~)',
        ['Werbetext'] = 'Werbetext',
        ['Werbung'] = 'Werbung',
        ['Insert_Advertisment'] = 'Werbung einfügen'
    },

    ['en'] = {
        ['notenoughmoney'] = 'You do not have enough money',
        ['paid_1000$'] = 'You paid 1000$',
        ['paid_500$'] = 'You paid 500$',
        ['showInfoBar'] = 'Press ~g~E~s~, to ~o~buy an ad ~s~for ~r~500$~s~',
        ['Werbetext'] = 'promotional text',
        ['Werbung'] = 'Advertisement',
        ['Insert_Advertisment'] = 'Insert Advertisement'
    }
}

