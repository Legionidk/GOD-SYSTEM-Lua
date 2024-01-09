Stuff = {
    ramps = {},
    bodyguards = {},
    ufos = {},
    attackers = {},
    isTextChatActive = false,
    blacklistedVehicles = {},
    onBlacklistedVehicle = function () end,
    trackedPlayers = {},
    guiKeyState = {},
    spectatingPlayer = nil,
    vehicleAccessSort = function ()
        return true
    end,
    EtaToWaypointData = {
        text = "",
        dist = "",
        arrivalTime = ""
    },
    bodyguardsTarget = nil,
}

ParsedFiles = {
    weapons = {},
    weaponHashes = {},
    peds = {},
    objects = {},
    vehicles = {},
}

-- Localizations = {
--     russian = {},
--     chinese = {},
--     custom = {},
-- }

Patterns = {
    wepWheelInVehicle = {module = "GTA5.exe", pattern = "44 88 6D E0 EB 06"},
}

Addreses = {
    wepWheelInVehicle = nil,
}

GetSelectedPlayer = function () end

function local_player()
    return player.index()
end

draw.crop_text = function (text_s, len_n)
    if len_n <= 0 then return "" end
    if string.len(text_s) == 0 then return "" end
    if draw.get_text_size(text_s).x <= len_n then return text_s end
    return draw.crop_text(text_s:sub(1, -2), len_n)
end

a2i = tonumber
i2s = tostring
rnd = math.random