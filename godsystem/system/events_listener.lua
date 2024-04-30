require("godsystem/util/notify_system.lua")

local onEventFunctions = {}

eApiEvents = {
    OnKeyPressed = 1,
    OnFrame = 2,
    OnFeatureTick = 3,
    OnInit = 4,
    OnDone = 5,
    OnPlayerJoin = 6,
    OnPlayerLeft = 7,
    OnPlayerJoinByRid = 8,
    OnScriptEvent = 9,
    OnChatMsg = 10,
    OnNetworkEvent = 11,
    OnTransitionEnd = 12, 
    OnFirstSingleplayerJoin = 13,
    OnSessionJoin = 14,
    OnVehicleEnter = 15,
    OnVehicleLeave = 16,
    OnModderDetected = 17,
    OnGameState = 18,
    OnPlayerActive = 19,
    OnSpectating = 20,
    OnStopSpectating = 21,
    OnFeatureStart = 22,
    OnFeatureEnd = 23,
}

for _, ID in pairs(eApiEvents) do
    onEventFunctions[ID] = {}
end

GET_REGISTERED_LISTENERS = function ()
    return onEventFunctions
end

GET_EVENTS_LIST = function ()
    return eApiEvents
end

listener = {}

listener.register = function (hash_s, eventID, callback_t)
    table.insert(onEventFunctions[eventID], {hash = hash_s, callback = callback_t})
    -- log.dbg(string.format("[EVENTS_LISTENER] Successfully registered listener with hash: %s", hash_s))
    return true
end

listener.remove = function (hash_s, eventID)
    for ID, t in ipairs(onEventFunctions[eventID]) do
        if t["hash"] == hash_s then
            table.remove(onEventFunctions[eventID], ID)
            -- log.dbg("[EVENTS_LISTENER] " .. string.format("Successfully removed listener with hash: %s.", hash_s))
            return true
        end
    end
    log.error("EVENTS_LISTENER", string.format("Failed to remove listener with hash: %s | Listener doesnt exist.", hash_s))
    return false
end

listener.exists = function (hash_s, eventID)
    local event = onEventFunctions[eventID]
    for _, t in ipairs(event) do
        if t["hash"] == hash_s then
            return true
        end
    end
    return false
end

listener.setCallback = function (hash_s, eventID, callback_f)
    local event = onEventFunctions[eventID]
    for _, t in ipairs(event) do
        if t["hash"] == hash_s then
            t['callback'] = callback_f
            return true
        end
    end
    log.error("EVENTS_LISTENER", string.format("Failed to set listener callback with hash: %s | Listener doesnt exist.", hash_s))
    return false
end


function OnInit()
    log.init("                                                                             ")
    log.init("             **             **            **        **                       ")
    log.init("            **          **     **        **        **                        ")
    log.init("           **          **      **       ** **     **                         ")
    log.init("          **          **               **   **   **                          ")
    log.init("         **           **  ******      **     ** **                           ")
    log.init("        *******       **    **       **        **                            ")
    log.init("       *******          **          **        **   Made in Russia            ")
    log.init("                                                                             ")

    local event = onEventFunctions[eApiEvents.OnInit]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        --log.dbg("Exec: " .. hash_s)
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnInit)
        else 
            local out = callback_f() 
            if out == false then listener.remove(hash_s, eApiEvents.OnInit) end
        end
    end
    -- notify.success("heistcontrol", "Script has been loaded successfully.")
end

function OnKeyPressed(key, isDown)
    if native.is_invoker_ready() then
        local event = onEventFunctions[eApiEvents.OnKeyPressed]
        for _, t in ipairs(event) do
            local hash_s, callback_f = t["hash"], t["callback"]
            if not callback_f then
                log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
                listener.remove(hash_s, eApiEvents.OnKeyPressed)
            else 
                local out = callback_f(key,isDown) 
                if out == false then listener.remove(hash_s, eApiEvents.OnKeyPressed) end
            end
        end
    end
end

function OnFrame()
    local event = onEventFunctions[eApiEvents.OnFrame]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnFrame)
        else 
            local out = callback_f()
            if out == false then listener.remove(hash_s, eApiEvents.OnFrame) end
        end
    end
end

function OnFeatureTick()
    local event = onEventFunctions[eApiEvents.OnFeatureTick]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnFeatureTick)
        else 
            local out = callback_f()
            if out == false then listener.remove(hash_s, eApiEvents.OnFeatureTick) end
        end
    end
end

function OnFeatureStart()
    log.dbg("Feature is started.")
    local event = onEventFunctions[eApiEvents.OnFeatureStart]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnFeatureStart)
        else 
            local out = callback_f()
            if out == false then listener.remove(hash_s, eApiEvents.OnFeatureStart) end
        end
    end
end

function OnFeatureEnd()
    log.dbg("Feature is stopped.")
    local event = onEventFunctions[eApiEvents.OnFeatureEnd]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnFeatureEnd)
        else 
            local out = callback_f()
            if out == false then listener.remove(hash_s, eApiEvents.OnFeatureEnd) end
        end
    end
end

function OnDone()
    local event = onEventFunctions[eApiEvents.OnDone]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnDone)
        else 
            local out = callback_f() 
            if out == false then listener.remove(hash_s, eApiEvents.OnDone) end
        end
    end
end

function OnPlayerJoin(pid, name, rid)
    local event = onEventFunctions[eApiEvents.OnPlayerJoin]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnPlayerJoin)
        else 
            local out = callback_f(pid, name, rid) 
            if out == false then listener.remove(hash_s, eApiEvents.OnPlayerJoin) end
        end
    end
end

function OnPlayerLeft(pid)
    local event = onEventFunctions[eApiEvents.OnPlayerLeft]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnPlayerLeft)
        else 
            local out = callback_f(pid) 
            if out == false then listener.remove(hash_s, eApiEvents.OnPlayerLeft) end
        end
    end
end

function OnPlayerJoinByRid(rid)
    local event = onEventFunctions[eApiEvents.OnPlayerJoinByRid]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnPlayerJoinByRid)
        else 
            local out = callback_f(rid) 
            if out == false then listener.remove(hash_s, eApiEvents.OnPlayerJoinByRid) end
        end
    end
end

function OnScriptEvent(pid, eventInfo, args)
    local event = onEventFunctions[eApiEvents.OnScriptEvent]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnScriptEvent)
        else 
            local out = callback_f(pid, eventInfo, args) 
            if out == false then listener.remove(hash_s, eApiEvents.OnScriptEvent) end
        end
    end
end

function OnChatMsg(pid, text)
    local event = onEventFunctions[eApiEvents.OnChatMsg]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnChatMsg)
        else 
            local out = callback_f(pid, text)
            if out == false then listener.remove(hash_s, eApiEvents.OnChatMsg) end
        end
    end
end

function OnNetworkEvent(pid, eventInfo, buf)
    local event = onEventFunctions[eApiEvents.OnNetworkEvent]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnNetworkEvent)
        else 
            local out = callback_f(pid, eventInfo, buf) 
            if out == false then listener.remove(hash_s, eApiEvents.OnNetworkEvent) end
        end
    end
end

function OnTransitionEnd(isMp)
    local event = onEventFunctions[eApiEvents.OnTransitionEnd]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnTransitionEnd)
        else 
            local out = callback_f(isMp) 
            if out == false then listener.remove(hash_s, eApiEvents.OnTransitionEnd) end
        end
    end
end

function OnFirstSingleplayerJoin()
    local event = onEventFunctions[eApiEvents.OnFirstSingleplayerJoin]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnFirstSingleplayerJoin)
        else 
            local out = callback_f() 
            if out == false then listener.remove(hash_s, eApiEvents.OnFirstSingleplayerJoin) end
        end
    end
end

function OnSessionJoin()
    local event = onEventFunctions[eApiEvents.OnSessionJoin]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnVehicleLeave)
        else 
            local out = callback_f() 
            if out == false then listener.remove(hash_s, eApiEvents.OnSessionJoin) end 
        end
    end
end

function OnVehicleEnter(handle)
    local event = onEventFunctions[eApiEvents.OnVehicleEnter]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnVehicleEnter)
        else 
            local out = callback_f(handle) 
            if out == false then listener.remove(hash_s, eApiEvents.OnVehicleEnter) end
        end
    end
end

function OnVehicleLeave(handle)
    local event = onEventFunctions[eApiEvents.OnVehicleLeave]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnVehicleLeave)
        else 
            local out = callback_f(handle) 
            if out == false then listener.remove(hash_s, eApiEvents.OnVehicleLeave) end
        end
    end
end

function OnModderDetected(pid, reason)
    local event = onEventFunctions[eApiEvents.OnModderDetected]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnModderDetected)
        else 
            local out = callback_f(pid, reason) 
            if out == false then listener.remove(hash_s, eApiEvents.OnModderDetected) end
        end
    end
end

function OnGameState(old, new)
    local event = onEventFunctions[eApiEvents.OnGameState]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnGameState)
        else 
            local out = callback_f(old, new) 
            if out == false then listener.remove(hash_s, eApiEvents.OnGameState) end 
        end
    end
end

function OnPlayerActive(pid)
    local event = onEventFunctions[eApiEvents.OnPlayerActive]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnPlayerActive)
        else 
            local out = callback_f(pid) 
            if out == false then listener.remove(hash_s, eApiEvents.OnPlayerActive) end
        end
    end
end

function OnSpectating(spec, target, isMe)
    local event = onEventFunctions[eApiEvents.OnSpectating]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnSpectating)
        else 
            local out = callback_f(spec, target, isMe)
            if out == false then listener.remove(hash_s, eApiEvents.OnSpectating) end
        end
    end
end

function OnStopSpectating(spec, target, isMe)
    local event = onEventFunctions[eApiEvents.OnStopSpectating]
    for _, t in ipairs(event) do
        local hash_s, callback_f = t["hash"], t["callback"]
        if not callback_f then 
            log.error("EVENTS_LISTENER", string.format("Invalid callback in registered listener with hash: %s.", hash_s))
            listener.remove(hash_s, eApiEvents.OnStopSpectating)
        else 
            local out = callback_f(spec, target, isMe)
            if out == false then listener.remove(hash_s, eApiEvents.OnStopSpectating) end
        end
    end
end