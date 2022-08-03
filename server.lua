local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
craft = {}
Tunnel.bindInterface("craft",craft)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR ITEM
-----------------------------------------------------------------------------------------------------------------------------------------

function craft.checkItem(item,amount)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,item,amount) then -- Retirar dinheiro sujo do inventario
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você precisa ter "..amount.."x "..item..".")
            return false
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSÃO
-----------------------------------------------------------------------------------------------------------------------------------------
function craft.checkPermission(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,perm) then -- PERMISSÃO
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE ITEM
-----------------------------------------------------------------------------------------------------------------------------------------

function craft.giveItem(item,amount,perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,perm) then -- Retirar dinheiro sujo do inventario
            vRP.giveInventoryItem(user_id,item,amount)
        end
    end
end