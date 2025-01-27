-- so much credit to Toph for teaching me and working with me <3
-- credit to Rimuru for letting me learn on her script and teaching me a few things <3 (slightly skidded from too :sus:)
-- credit to Aren for teaching me Lua right at the start <3

local main = func.add_feature("Femboy Script", "parent", 0)
local popt = func.add_feature("Player Options", "parent", main.id)
local vehopt = func.add_feature("Vehicle Options", "parent", main.id)
local wthopt = func.add_feature("Weather Options", "parent", main.id)
local miscopt = func.add_feature("Misc Options", "parent", main.id)
local heirarchy = func.get_feature_by_hierarchy_key(v)

--player options
local rgb = func.add_feature("RGB Player Features", "parent", popt.id)

local AllRGBHair = func.add_feature("Loop All Hair Colors", "value_i", rgb.id, function(f)
    while f.on do
        local playerped = player.get_player_ped(player.player_id())
        for i = 0, 63 do
            ped.set_ped_hair_colors(playerped, i, i)
            system.wait(f.value)
        end
    end
end)
AllRGBHair.min = 0
AllRGBHair.max = 10000
AllRGBHair.mod = 50 ----- Thank you Toph <3

local RGBHair = func.add_feature("Rainbow Hair (better)", "value_i", rgb.id, function(f)
    while f.on do
        local playerped = player.get_player_ped(player.player_id())
        for i = 33, 53 do
            ped.set_ped_hair_colors(playerped, i, i)
            system.wait(f.value)
        end
    end
end)
RGBHair.min = 0
RGBHair.max = 10000
RGBHair.mod = 50 ------ Thank you Toph <3333

local RGBEyes = func.add_feature("Rainbow Eyes", "value_i", rgb.id, function(f)
    while f.on do 
        for i = 1, 32 do 
            native.call(0x50B56988B170AFDF, player.get_player_ped(player.player_id()), i)
            system.wait(f.value)
        end
    end
end)
RGBEyes.min = 0
RGBEyes.max = 2000
RGBEyes.mod = 50

local OTR = func.get_feature_by_hierarchy_key("online.services.off_the_radar") func.add_feature("OTR", "toggle", popt.id, function(feat)
    OTR:toggle()
end)

local BST = func.get_feature_by_hierarchy_key("online.services.bull_shark_testosterone") func.add_feature("BST", "toggle", popt.id, function(feat)
    while feat.on do
        BST:toggle()
        system.wait(0)
    end
 func.notify("Will have to wait until the BST runs out")
end)

local fovVariable = func.get_feature_by_hierarchy_key("local.misc.fov_changer.third_person")
local fov = func.add_feature("Field Of View", "value_i", popt.id, function(f)
    if f.on then
        fovVariable:toggle()
            while f.on do
	            fovVariable.value = f.value
	            fovVariable:toggle()
                fovVariable:toggle()
                system.wait()
            end    
        fovVariable:toggle()
    end
end)
fov.min = 1
fov.mod = 2
fov.value = 50
fov.max = 130

-- vehicle options
local dorctrl = func.add_feature("Door Control", "parent", vehopt.id)
local lightctrl = func.add_feature("Light Control", "parent", vehopt.id)
 func.add_feature("Fix Vehicle", "action", vehopt.id, function()
	vehicle.set_vehicle_fixed(player.get_player_vehicle(player.player_id()), true)
end)

local dirtLevel = func.add_feature("Dirt Level", "autoaction_value_f", vehopt.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    while feat.value do
        native.call(0x79D3B596FE44EE8B, veh, feat.value)
        system.wait(0)
    end
end)
dirtLevel.min = 0.0
dirtLevel.max = 15.0
dirtLevel.mod = 1.0
 func.add_feature("Stay clean", "toggle", vehopt.id, function(feat)
    while feat.on do
        native.call(0x79D3B596FE44EE8B, player.get_player_vehicle(player.player_id()), 0)
        system.wait(0)
    end
end)
 func.add_feature("Brake Lights", "toggle", lightctrl.id, function(feat)
    while feat.on do
        vehicle.set_vehicle_brake_lights(player.get_player_vehicle(player.player_id()), true)
        system.wait(0)
    end
end)

local grvty = func.add_feature("Gravity", "value_f", vehopt.id, function(feat)
    if feat.on then
        vehicle.set_vehicle_gravity_amount(player.get_player_vehicle(player.player_id()), feat.value)
    else
        vehicle.set_vehicle_gravity_amount(player.get_player_vehicle(player.player_id()), 9.8)
    end
end)
grvty.min = -5.0
grvty.max = 20.0
grvty.mod = 1.0
 func.add_feature("Native Drifting", "toggle", vehopt.id, function(feat)
 func.notify("Slidy wheels equipped, Suspension dropped", "Femboy func")
	local veh = player.get_player_vehicle(player.player_id())
		native.call(0x3A375167F5782A65, veh, feat.on) -- SET_REDUCE_DRIFT_VEHICLE_SUSPENSION(veh, bool) 
		native.call(0x5AC79C98C5C17F05, veh, feat.on) -- SET_DRIFT_TYRES_ENABLED(veh, bool)
end)
		 func.add_feature("Drift Suspension", "toggle", vehopt.id, function(feat)
 func.notify("only works on vehicles released in the Tuners Update", "Femboy func")
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0x3A375167F5782A65, veh, feat.on) -- SET_REDUCE_DRIFT_VEHICLE_SUSPENSION(veh, bool) 
end) 
 func.add_feature("Drift Tyres", "toggle", vehopt.id, function(feat)
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0x5AC79C98C5C17F05, veh, feat.on) -- SET_DRIFT_TYRES_ENABLED(veh, bool)
end)
 func.add_feature("Launch Control", "toggle", vehopt.id, function(feat)
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0xAA6A6098851C396F, feat.on)
end)

local pwr = func.add_feature("Power Increasinator", "value_i", vehopt.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    if feat.on then
        vehicle.modify_vehicle_top_speed(veh, feat.value)
    else 
        vehicle.modify_vehicle_top_speed(veh, 1)
    end
end)
pwr.min = 1
pwr.max = 10000
pwr.mod = 1

local fwdlaunch = func.add_feature("Launch Forward", "action_slider", vehopt.id, function(feat)
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0xAB54A438726D25D5, veh, feat.value)
end)
fwdlaunch.min = 0.0
fwdlaunch.max = 200.0
fwdlaunch.mod = 10.0

local rgbX = func.add_feature("RGB Xenon", "value_i", lightctrl.id, function(feat)
 func.notify("Xenon Lights Added, BEGIN THE RAVE")
    local veh = player.get_player_vehicle(player.player_id())
    native.call(0x2A1F4F37F95BAD08, veh, 22, feat.on) -- TOGGLE_VEHICLE_MOD
    while feat.on do
            for i=1,12 do
                native.call(0xE41033B25D003A07, veh, i) -- SET_VEHICLE_XENON_LIGHTS_COLOR
                system.wait(feat.value)
            end
        system.wait(0)
    end
end)
rgbX.min = 0
rgbX.max = 2500
rgbX.mod = 100

local Hedlit = func.add_feature("Headlight Brightness", "autoaction_value_f", lightctrl.id, function(feat)
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0xB385454F8791F57C, veh, feat.value)
end)
Hedlit.min = 0.0
Hedlit.max = 100.0
Hedlit.mod = 1.0
 func.add_feature("Turn engine off", "action", vehopt.id, function()
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0x2497C4717C8B881E, veh, 0, 0, true)
end)
 func.add_feature("Disable auto start", "toggle", vehopt.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    if feat.on then
        native.call(0x2497C4717C8B881E, veh, 0, 1, 1)
     func.notify("auto start disabled, engine turned off" , "Femboy Script")
    else 
        native.call(0x2497C4717C8B881E, veh, 0, 0, 0)
     func.notify("auto start enabled" , "Femboy Script")
    end
end) -- thank you Toph
	 func.add_feature("Kill engine", "action", vehopt.id, function()
 func.notify("next bit of damage will kill the car, gl", "Femboy func")
	local veh = player.get_player_vehicle(player.player_id())
	native.call(0x45F6D8EEF34ABEF1, veh, 0)
end)
 func.add_feature("Notify Engine Health" , "action" , vehopt.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    local enginehealth = native.call(0xC45D23BAF168AAB8 , veh):__tonumber() --GET_VEHICLE_ENGINE_HEALTH
 func.notify("Engine health is " .. enginehealth .. ".", "Femboy func")
end) -- thank you Toph
 func.add_feature("Set Patriot Tyre Smoke", "action" , vehopt.id, function()
    veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_tire_smoke_color(veh, 0 , 0, 0)
 func.notify("Set tyre smoke color")
end) -- thank you Toph

-- door control func.add_feature("Open all doors", "action" , dorctrl.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    for i = 0 , 5 do
        vehicle.set_vehicle_door_open(veh , i , false , false)
    end
end) -- thank you Toph
 func.add_feature("Close All Doors", "action" , dorctrl.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    vehicle.set_vehicle_doors_shut(veh , false)
end) -- thank you Toph
 func.add_feature("Remove All Doors", "action" , dorctrl.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    for i = 0, 5 do
        native.call(0xD4D4F6A4AB575A33 , veh , i , true) -- SET_VEHICLE_DOOR_BROKEN
    end
end) -- thank you Toph

local brkdor = func.add_feature("Remove Specific Door", "action_value_i", dorctrl.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
	native.call(0xD4D4F6A4AB575A33 , veh , feat.value, true) -- SET_VEHICLE_DOOR_BROKEN, true = delete, false = break
end)
brkdor.min = 0
brkdor.max = 5
brkdor.mod = 1 
--VEH_EXT_DOOR_DSIDE_F = 0,
--VEH_EXT_DOOR_DSIDE_R = 1,
--VEH_EXT_DOOR_PSIDE_F = 2,
--VEH_EXT_DOOR_PSIDE_R = 3,
--VEH_EXT_BONNET = 4,
--VEH_EXT_BOOT = 5,

local wndwcol = func.add_feature("Window Colour", "action_value_i", dorctrl.id, function(feat)
    local veh = player.get_player_vehicle(player.player_id())
    while feat.on do
        native.call(0x57C51E6BAD752696, veh, feat.value)
        system.wait(0)
    end
end)
wndwcol.min = 0
wndwcol.max = 5
wndwcol.mod = 1
 func.add_feature("Windows open/close", "toggle", dorctrl.id, function(feat)
	local veh = player.get_player_vehicle(player.player_id())
	if feat.on then
		native.call(0x85796B0549DDE156, veh) -- ROLL_DOWN_WINDOWS
	else 
		for i = 0, 3 do
			native.call(0x602E548F46E24D59, veh, i) -- ROLL_UP_WINDOW
		end
	end
end)

--weather options
local rainlvl = func.add_feature("Magic puddles", "autoaction_value_f", wthopt.id, function(feat)
    native.call(0x643E26EA6E024D92, feat.value)
end)
rainlvl.min = 0.0
rainlvl.max = 10.0
rainlvl.mod = 0.5

local windspd = func.add_feature("Wind speed", "autoaction_value_f", wthopt.id, function(feat)
    native.call(0xEE09ECEDBABE47FC, feat.value)
end)
windspd.min = 0.0
windspd.max = 12.0
windspd.mod = 0.5
 func.add_feature("Really piss off Zeus (SEIZURE WARNING)", "toggle", wthopt.id, function(feat) func.notify("Way to go, you upset a God, feel like a big man huh? Big man with his big insults?")
while feat.on do
        native.call(0xF6062E089251C898, true) -- forces lightning
        system.wait(0)
        if feat.on then
            time.set_clock_time(23, 59, 0)
            native.call(0x643E26EA6E024D92, 7.0) -- controls rain/puddles
            native.call(0xEE09ECEDBABE47FC, 12.0) -- controls wind speed
        else
            time.set_clock_time(12, 0, 0)
            native.call(0x643E26EA6E024D92, 0.0)
            native.call(0xEE09ECEDBABE47FC, 0.0)
            native.call(0xF6062E089251C898, false)
         func.notify("Zeus accepts your apology")
            system.wait(0)
        end
    end   
end)

--misc options func.add_feature("Show Player Talking", "toggle", miscopt.id, function(feat)
    if feat.on then
        local IsTalking = {}
        while true do
            system.yield(100)
            for pid = 0, 31 do
                if player.is_player_valid(pid) then
                    if native.call(0x031E11F3D447647E, pid):__tointeger() == 1 then
                        if not IsTalking[pid] then
                         func.notify(player.get_player_name(pid) .. " started talking", "Femboy Script")
                            IsTalking[pid] = true
                        end
                    else
                        if IsTalking[pid] then
                         func.notify(player.get_player_name(pid) .. " stopped talking", "Femboy Script")
                            IsTalking[pid] = false
                        end
                    end
                end
            end
        end
    end
end, nil) -- thank you Ruly Pancake the whatever(th)
 func.add_feature("Make Nearby NPCs Riot", "toggle", miscopt.id, function(feat)
    native.call(0x2587A48BC88DFADF, feat.on)
end)

local mmdisco = func.add_feature("minimap disco" , "value_i" , miscopt.id, function(feat)
    while feat.on do
        for i = 208, 213 do
            native.call(0x6B1DE27EE78E6A19 , i)
            system.wait(feat.value)
        end
        system.wait(0)
    end
end)
mmdisco.min = 0
mmdisco.max = 2500
mmdisco.mod = 100
mmdisco.value = 100 -- thank you Toph
 func.add_feature("Get All Achievements", "action", miscopt.id, function()
    for i=1,77 do
        native.call(0xBEC7076D64130195, i)
    end
end)
 func.add_feature("Hide HUD", "toggle", miscopt.id, function(feat)
    if feat.on then
        native.call(0xA6294919E56FF02A, false)
        native.call(0xA0EBB943C300E693, false)
    else 
        native.call(0xA6294919E56FF02A, true)
        native.call(0xA0EBB943C300E693, true)
    end
end)

















