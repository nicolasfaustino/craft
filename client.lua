local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
craft = Tunnel.getInterface("craft")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS --
-----------------------------------------------------------------------------------------------------------------------------------------
local part0 = false
local part1 = false
local part2 = false
local part3 = false
local part4 = false
local part5 = false
local part6 = false
local part7 = false
local part8 = false
local fazendo = false
-------------------------------------------------------------------------------------------------
--[ CRAFTING FUNCTION ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() -- CRAFTING FUNCTION
	while true do
		local sleep = 0
		-- PART 1
		if not part0 then
			for k,v in pairs(Config.FarmsPart1) do
				local amount = math.random(v.quantidademin,v.quantidademax)
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and not part1 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and not part1 then
								if IsControlJustPressed(0,38) and craft.checkItem(v.item,amount) and craft.checkPermission(v.perm) then
									sleep = 5
									local ped = PlayerPedId()
									part1 = true
									part0 = true
									vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
									vRP._CarregarObjeto("anim@heists@box_carry@","idle",v.prop,50,28422,0.0,0.0,0.0,0.0,180.0,0.0)
								end
							end
						end
					end
				end
			end
		end
		-- PART 2
		if part1 and not part2 then
			for k,v in pairs(Config.FarmsPart2) do
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part1 and not part2 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part1 and not part2 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									local ped = PlayerPedId()
									part2 = true
									vRP._stopAnim(source,false)
									vRP._DeletarObjeto(source)
									item1 = CreateObject(GetHashKey(v.prop),v.locmesa[i][1], v.locmesa[i][2], v.locmesa[i][3]-1.1,true,true,true)
								end
							end
						end
					end
				end
			end
		end
		-- PART 3
		if part2 and not part3 then
			for k,v in pairs(Config.FarmsPart3) do
				local amount = math.random(v.quantidademin,v.quantidademax)
				local ped = PlayerPedId()
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part2 and not part3 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part2 and not part3 then
								if IsControlJustPressed(0,38) and craft.checkItem(v.item,amount) and craft.checkPermission(v.perm) then
									sleep = 5
									part3 = true
									vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
									vRP._CarregarObjeto("anim@heists@box_carry@","idle",v.prop,50,28422,0.0,0.0,0.0,0.0,180.0,0.0)
								end
							end
						end
					end
				end
			end
		end
		-- PART 4
		if part3 and not part4 then
			for k,v in pairs(Config.FarmsPart4) do
				local loc = v.loc
				if loc then
					print(loc)
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part3 and not part4 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part3 and not part4 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									local ped = PlayerPedId()
									part4 = true
									vRP._DeletarObjeto(source)
									vRP._stopAnim(source,false)
									item2 = CreateObject(GetHashKey(v.prop),v.locmesa[i][1], v.locmesa[i][2], v.locmesa[i][3]-1.1,true,true,true)
								end
							end
						end
					end
				end
			end
		end
		-- PART 5
		if part4 and not part5 and not fazendo then
			for k,v in pairs(Config.FarmsPart5) do
				local ped = PlayerPedId()
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part4 and not part5 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part4 and not part5 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									vRP._playAnim(true,{{"mini@repair","fixing_a_player"}},true)
									fazendo = true
									SetTimeout(8000,function()
										vRP._stopAnim(source,false)
										DeleteObject(item1)
										DeleteObject(item2)
										itemcrafting = CreateObject(GetHashKey(v.prop),v.locmesa[i][1], v.locmesa[i][2], v.locmesa[i][3]-1.1,true,true,true)
										part5 = true
										fazendo = false
									end)
								end
							end
						end
					end
				end
			end
		end
		-- PART 6
		if part5 and not part6 then
			for k,v in pairs(Config.FarmsPart6) do
				local ped = PlayerPedId()
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part5 and not part6 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part5 and not part6 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									part6 = true
									DeleteObject(itemcrafting)
									vRP._playAnim(true,{{"anim@heists@box_carry@","idle"}},true)
									vRP._CarregarObjeto("anim@heists@box_carry@","idle",v.prop,50,28422,0.0,0.0,0.0,0.0,180.0,0.0)
								end
							end
						end
					end
				end
			end
		end
		-- PART 7
		if part6 and not part7 then
			for k,v in pairs(Config.FarmsPart7) do
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part6 and not part7 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part6 and not part7 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									local ped = PlayerPedId()
									part7 = true
									vRP._DeletarObjeto(source)
									vRP._stopAnim(source,false)
									itemcrafting2 = CreateObject(GetHashKey(v.prop),v.locmesa[i][1], v.locmesa[i][2], v.locmesa[i][3]-1.1,true,true,true)
								end
							end
						end
					end
				end
			end
		end
		-- PART 8
		if part7 and not part8 then
			for k,v in pairs(Config.FarmsPart8) do
				local amount = math.random(v.quantidademin,v.quantidademax)
				local ped = PlayerPedId()
				local loc = v.loc
				if loc then
					for i = 1, #loc do
						local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.loc[i][1], v.loc[i][2], v.loc[i][3], true )
						if distance <= 2 and part7 and not part8 then
							DrawText3D(v.loc[i][1], v.loc[i][2], v.loc[i][3], v.messagedraw)
							if distance <= 2 and part7 and not part8 then
								if IsControlJustPressed(0,38) and craft.checkPermission(v.perm) then
									sleep = 5
									part8 = true
									vRP._playAnim(true,{{"mini@repair","fixing_a_player"}},true)
									SetTimeout(8000,function()
										print("finalizado 1")
										vRP._stopAnim(source,false)
										DeleteObject(itemcrafting2)
										print(v.item,amount,v.perm)
										craft.giveItem(v.item,amount,v.perm)
										print("finalizado 2")
										ResetTrampo()
									end)
								end
							end
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)


-------------------------------------------------------------------------------------------------
--[ ANTI-BUG ]-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if part1 then
			DisableControlAction(0,167,true)
			DisableControlAction(0,21,true)
			DisableControlAction(0,22,true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES --
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end

function ResetTrampo()
	if part8 then
    	part0 = false
		part1 = false
		part2 = false
		part3 = false
		part4 = false
		part5 = false
		part6 = false
		part7 = false
		part8 = false
		amount = nil
	end
end

