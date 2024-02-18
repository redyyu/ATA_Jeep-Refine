local oldISVehicleMenu = ISVehicleMenu.FillMenuOutsideVehicle

local paintTable = {}
paintTable["Base.ATAJeepArcher"] = 1
paintTable["Base.ATAJeepRubicon"] = 1
paintTable["Base.ATAJeepClassic"] = 1

local paintBus = function(playerObj, vehicle, newSkinIndex)
    ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, vehicle, "SeatFrontRight"))
    ISTimedActionQueue.add(ISPaintBus:new(playerObj, vehicle, "SeatFrontRight", newSkinIndex))
end

function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
    oldISVehicleMenu(player, context, vehicle, test)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    
    if (paintTable[vehicle:getScriptName()]) then 
        if (vehicle:getSkinIndex()%2) == 0 then
            local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
            local paintCan = playerInv:getFirstTypeRecurse("PaintRed")
            if vehicle and paintBrush and  paintCan then
                context:addOption(getText("ContextMenu_Vehicle_EGNH"), playerObj, paintBus, vehicle, vehicle:getSkinIndex()+1)
            end
        else
            local paintBrush = playerInv:getFirstTypeRecurse("Sponge")
            local paintCan = playerInv:getFirstTypeRecurse("Bleach")
            if vehicle and paintBrush and  paintCan then
                context:addOption(getText("ContextMenu_Vehicle_CLEAN_EGNH"), playerObj, paintBus, vehicle, vehicle:getSkinIndex()-1)
            end
        end
    end
end


