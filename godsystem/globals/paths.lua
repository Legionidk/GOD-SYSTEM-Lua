local filesys = require("godsystem/util/file_system.lua")

local paths = {}
paths.files = {}
paths.folders = {}
paths.logs = {}

-- TODO:fix path
paths.folders.main = filesys.getInitScriptPath() .. "\\godsystem"
paths.folders.user = paths.folders.main .. '\\user'
paths.folders.dumps = paths.folders.main .. '\\dumps'
paths.folders.loadouts = paths.folders.user .. '\\loadouts'
paths.folders.localization = paths.folders.main .. '\\localization'
paths.folders.outfits = paths.folders.user .. '\\outfits'
paths.folders.chat_spammer = paths.folders.user.. '\\chat_spammer'
paths.folders.logs = paths.folders.user .. '\\logs'
paths.folders.misc = paths.folders.user .. '\\misc'
paths.folders.imgs = paths.folders.main .. '\\img'

paths.logs.chat = paths.folders.logs .. '\\' .. 'Chat.log'
paths.logs.weapons = paths.folders.logs .. '\\' .. 'Weapons.log'
paths.logs.warnScreens = paths.folders.logs .. '\\' .. 'Warning Screens.log'
paths.logs.netEvents = paths.folders.logs .. '\\' .. 'Network Events.log'
paths.logs.scriptEvents = paths.folders.logs .. '\\' .. 'Script Events.log'

paths.files.weapons = paths.folders.dumps .. '\\' .. 'weapons.json'
paths.files.peds = paths.folders.dumps .. '\\' .. 'peds.json'
paths.files.objects = paths.folders.dumps .. '\\' .. 'ObjectList.ini'
paths.files.weaponHashes = paths.folders.dumps .. '\\' .. 'WeaponList.json'
paths.files.vehicles = paths.folders.dumps .. '\\' .. 'VehicleList.json'

paths.files.config = paths.folders.user .. '\\config.json'
paths.files.hotkeys = paths.folders.user .. '\\hotkeys.json'
paths.files.vehicleBlacklist = paths.folders.misc .. '\\blacklisted_vehicles.json'
paths.files.playerHistory = paths.folders.misc .. '\\player_history.json'
paths.files.playerManager = paths.folders.misc .. '\\player_manager.json'

paths.files.imgs = {}
paths.files.imgs.header = paths.folders.imgs .. "\\header.png"
paths.files.imgs.bg = paths.folders.imgs .. "\\background.png"
paths.files.imgs.selected = paths.folders.imgs .. "\\selected.png"
paths.files.imgs.footer = paths.folders.imgs .. "\\footer.png"
paths.files.imgs.hintBox = paths.folders.imgs .. "\\description.png"
paths.files.imgs.footerArrows = paths.folders.imgs .. "\\footer_arrows.png"
paths.files.imgs.toggleOn = paths.folders.imgs .. "\\toggle_on.png"
paths.files.imgs.toggleOff = paths.folders.imgs .. "\\toggle_off.png"
paths.files.imgs.sub = paths.folders.imgs .. "\\sub.png"
paths.files.imgs.cursor = paths.folders.imgs .. "\\cursor.png"
paths.files.imgs.success = paths.folders.imgs .. "\\success.png"
paths.files.imgs.info = paths.folders.imgs .. "\\info.png"
paths.files.imgs.warning = paths.folders.imgs .. "\\warning.png"
paths.files.imgs.error = paths.folders.imgs .. "\\error.png"


return paths