local features = {}

function features.getWaypointCoords()
	if not HUD.IS_WAYPOINT_ACTIVE() then return nil end
    local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
    return HUD.GET_BLIP_COORDS(blip)
end

function features.getDistance(coords1, coords2, useZ)
    return math.sqrt((coords1.x - coords2.x)^2 + (coords1.y - coords2.y)^2 + (useZ and (coords1.z - coords2.z)^2 or 0))
end

function features.setVehiclePreset(vehicle, preset)
	local modTypes = {
		["Spoilers"] = 0,
		["Front Bumper"] = 1,
		["Rear Bumper"] = 2,
		["Side Skirt"] = 3,
		["Exhaust"] = 4,
		["Frame"] = 5,
		["Grille"] = 6, 
		["Hood"] = 7,
		["Fender"] = 8,
		["Right Fender"] = 9,
		["Roof"] = 10,
		["Engine"] = 11,
		["Brakes"] = 12,
		["Transmission"] = 13, 
		["Horns"] = 14,
		["Suspension"] = 15, 
		["Armor"] = 16,
		["Front Wheels"] = 23,
		["Back Wheels"] = 24,
		["Plate Holders"] = 25,
		["Trim Design"] = 27,
		["Ornaments"] = 28,
		["Dial Design"] = 30,
		["Steering Wheel"] = 33,
		["Shifter Leavers"] = 34,
		["Plaques"] = 35,
		["Hydraulics"] = 38,
		["Livery"] = 48
	}
	local modTypesPower = {
		["Engine"] = 11,
		["Brakes"] = 12,
		["Transmission"] = 13,
		["Suspension"] = 15
	}
	local function getMaxMods(vehicle, modType)
		local val = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, modType)
		if val > 0 then
			return val - 1
		else
			return 0
		end
	end
	entity.request_control(vehicle, function()
		VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
		if preset == 1 then -- DEFAULT
			for _, modType in pairs(modTypes) do
				VEHICLE.SET_VEHICLE_MOD(vehicle, modType, 0, false)
			end
		elseif preset == 2 then -- RANDOM
			for _, modType in pairs(modTypes) do
				VEHICLE.SET_VEHICLE_MOD(vehicle, modType, math.random(0, getMaxMods(vehicle, modType)), false)
				VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, math.random(0, 1))
			end
		elseif preset == 3 then -- POWER
			for _, modType in pairs(modTypesPower) do
				VEHICLE.SET_VEHICLE_MOD(vehicle, modType, getMaxMods(vehicle, modType), false)
				VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, false)
			end
		elseif preset == 4 then -- MAX
			for _, modType in pairs(modTypes) do
				VEHICLE.SET_VEHICLE_MOD(vehicle, modType, getMaxMods(vehicle, modType), false)
				VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, false)
			end
		end
	end)
end

function features.isEmpty(value)
	return ((value == nil) or (value == "") or (value == "NULL"))
end

function features.makeFirstLetUpper(text)
	local output = ''
	local iter = 0
	for let in text:gmatch('%D') do
		if iter == 0 then
			let = let:upper()
		end
		output = output .. let
		iter = iter + 1
	end
	return output
end

function features.getFPS()
	return DrawUI.dbg.fps
end

function features.isPositionInArea(corner_leftUpper_v2, corner_rightDown_v2, position_v2)
	local axis_x_b = (position_v2.x >= corner_leftUpper_v2.x) and (corner_rightDown_v2.x >= position_v2.x)
	local axis_y_b = (position_v2.y >= corner_leftUpper_v2.y) and (corner_rightDown_v2.y >= position_v2.y)
	return axis_x_b and axis_y_b
end

function features.getVirtualKeyViaID(id)
	for name, keyID in pairs(gui.virualKeys) do
		if keyID == id then return name end
	end
	return nil
end

function features.teleport(...)
	local args = {...}
	local entity = nil
	local coords = nil
	if type(args[1]) == "number" and (#args == 4 or #args == 2) then
		if (#args == 2) then
			if not (type(args[2]) == "userdata") then log.error("Features", "Wrong arg #2 in teleport function.") return false end
			coords = args[2]
		elseif #args == 4 then
			if not ((type(args[2]) == "number") and (type(args[3]) == "number") and (type(args[4]) == "number")) then log.error("Features", "Wrong arg #2, 3, 4 in teleport function.") return false end
			coords = Vector3(args[2], args[3], args[4])
		end
		entity = args[1]
	elseif type(args[1]) == "userdata" and (#args == 1) then
		coords = args[1]
		entity = player.id()
	elseif (#args == 3) and (type(args[1]) == "number" and type(args[2]) == "number" and type(args[3]) == "number") then
		coords = Vector3(args[1], args[2], args[3])
		entity = player.id()
	end
	if entity and coords then
		local out = false
		callbacks.requestControl(entity, function ()
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, coords.x, coords.y, coords.z)
			out = true
		end)
		return out
	end
	return false
end

function table.tostring(table_t)
	local out = ""
	if #table_t == 0 then
		for key, value in pairs(table_t) do
			out = out .. string.format("['%s'] = %s, ", key, value)
		end
	else
		out = table.concat(table_t, ", ")
	end
	return out
end

function features.format(str, ...)
	local args = {...}
	local iterations = 0
	for _ in string.gmatch(str or "", "{}") do
		iterations = iterations + 1
		local out = args[iterations]
		if type(out) == 'table' then out = table.tostring(out) end
		str = str:gsub("{}", #args >= iterations and tostring(out) or "?", 1)
	end
	return str
end

function string.split(text_s, sep_s)
	if not sep_s then sep_s = " " end
	local out = {}
	local ID = 1
	out[ID] = ''
	for symbol in text_s:gmatch('.') do
		if symbol == sep_s then
      		ID = ID + 1
		  	out[ID] = ''
    	else
		  	out[ID] = out[ID] .. symbol
    	end
	end
	return out
end

function features.split_text_into_lines(text_s, maxWidth_n)
	local out = ""
	if draw.get_text_size(text_s).x <= maxWidth_n then return text_s end
	for _, token in ipairs(string.split(text_s, " ")) do
		local new = out .. token .. " "
		if draw.get_text_size(new).x > maxWidth_n then
			out = out .. '\n' .. token .. " "
		else
			out = new
		end
	end
	return out
end

function features.randomPlayer()
	local pids = math.random(0, 32)
	while pids == player.index() or not player.is_valid(pids) do
		pids = math.random(0, 32)
	end
	return pids
end

function table.contains(table, element)
	for _, value in pairs(table) do
	  if value == element then
		return true
	  end
	end
	return false
end

function features.delete_entities_by_model(model)
	local hash = string.joaat(model)
	if STREAMING.IS_MODEL_A_VEHICLE(hash) then
		for k, vehicle in pairs(pools.get_all_vehicles()) do
			if ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
				for k, ped in pairs(pools.get_all_peds()) do
					if PED.GET_VEHICLE_PED_IS_IN(ped, true) == vehicle then
						if not PED.IS_PED_A_PLAYER(ped) then
							ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false)
							entity.delete(ped)
						end
					end
				end
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, false, false)
				entity.delete(vehicle)
			end
		end
		return
	end
	if STREAMING.IS_MODEL_A_PED(hash) then
		for k, ped in pairs(pools.get_all_peds()) do
			if ENTITY.GET_ENTITY_MODEL(ped) == hash then
				if not PED.IS_PED_A_PLAYER(ped) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false)
					entity.delete(ped)
				end
			end
		end
		return
	end
	for k, object in pairs(pools.get_all_objects()) do
		if ENTITY.GET_ENTITY_MODEL(object) == hash then
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false)
			entity.delete(object)
		end
	end
end


-- local temp = WEAPON.GIVE_WEAPON_TO_PED

-- function WEAPON.GIVE_WEAPON_TO_PED(ped, wepHash, ammo, isHidden, bForceInHand)
-- 	log.dbg("'GIVE_WEAPON_TO_PED': Hash: {}", wepHash)
-- 	temp(ped, wepHash, ammo, isHidden, bForceInHand)
-- end

-- local temp2 = WEAPON.GIVE_WEAPON_COMPONENT_TO_PED

-- function WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, wepHash, componentHash)
-- 	log.dbg("'GIVE_WEAPON_COMPONENT_TO_PED': Weapon hash: {}; Component hash: {}", wepHash, componentHash)
-- 	temp(ped, wepHash, componentHash)
-- end

function switch(value_any, table_t, default_f)
	if not value_any and default_f then return default_f() end
	return pcall(table_t[value_any] or default_f or function () return end)
end

function table.any(table_t)
	for key, value in pairs(table_t) do
		if value then return true end
	end
	return false
end

function table.all(table_t)
	for key, value in pairs(table_t) do
		if not value then return false end
	end
	return true
end

function try (func_f, catch_f)
	local status, out = pcall(func_f)
	if status then return end
	if catch_f then catch_f(out) end
end

function b2i(value)
	return value and 1 or 0
end

function features.range(min, max, step)
	local out = {}
	for i = min, max, step or 1 do
		table.insert(out, i)
	end
	return out
end

function lobby.get_connected_players()
	local out = {}
	for pid = 0, 32 do
		if player.is_connected(pid) then
			table.insert(out, pid)
		end
	end
	return out
end

function features.minutes2Timestamp(minutes_n)
	local hours = math.floor(minutes_n / 60)
	if hours == 0 then return features.format("{} min", minutes_n) end
	return features.format("{} hours {} min", hours, ("0" .. tostring(minutes_n % hours)):sub(-2, -1))
end

function features.formatSeconds(seconds_n)
	local weeks = math.floor(seconds_n / 604800)
	local remainder = seconds_n % 604800
	local days = math.floor(remainder / 86400)
	local remainder = remainder % 86400
	local hours = math.floor(remainder / 3600)
	local remainder = remainder % 3600
	local minutes = math.floor(remainder / 60)
	local seconds = remainder % 60

	return weeks, days, hours, minutes, seconds	
end

function features.smart_kick(pid)
	if player.is_session_host(player.index()) then -- Checks if local player is host
		player.kick(pid) -- HOST/VOTE kick
	else
		player.kick_idm(pid) -- UNBLOCKABLE IDM kick
	end
end

function features.stat_set(stat, value)
    local success = true
    local hash = string.smart_joaat(stat)
    switch (stats.get_stat_type_name(hash), {
        ["UINT8"] = function ()
            stats.set_u8(hash, a2i(value))
        end,
        ["UINT16"] = function ()
            stats.set_u16(hash, a2i(value))
        end,
        ["UINT32"] = function ()
            stats.set_u32(hash, a2i(value))
        end,
        ["UINT64"] = function ()
            stats.set_u64(hash, a2i(value))
        end,
        ["INT"] = function ()
            stats.set_u32(hash, a2i(value))
        end,
        ["INT64"] = function ()
            stats.set_u64(hash, a2i(value))
        end,
        ["FLOAT"] = function ()
            stats.set_float(hash, a2i(value) + .0)
        end,
        ["BOOL"] = function ()
            stats.set_bool(hash, value and true)
        end,
        ["STRING"] = function ()
            stats.set_string(hash, i2s(value))
        end,
    }, function ()
        success = false
        notify.fatal("Character Stat", "Unknown stat variable")
    end)
    return success
end

function features.stat_get(stat)
	local value = nil
	local hash = string.smart_joaat(stat)
	switch (stats.get_stat_type_name(hash), {
		["UINT8"] = function ()
			value = stats.get_u8(hash)
		end,
		["UINT16"] = function ()
			value = stats.get_u16(hash)
		end,
		["UINT32"] = function ()
			value = stats.get_u32(hash)
		end,
		["UINT64"] = function ()
			value = stats.get_u64(hash)
		end,
		["INT"] = function ()
			value = stats.get_u32(hash)
		end,
		["INT64"] = function ()
			value = stats.get_u64(hash)
		end,
		["FLOAT"] = function ()
			value = stats.get_float(hash)
		end,
		["BOOL"] = function ()
			value = stats.get_bool(hash)
		end,
		["STRING"] = function ()
			value = stats.get_string(hash)
		end,
	}, function ()
		value = "N/A"
	end)
	return value
end

return features