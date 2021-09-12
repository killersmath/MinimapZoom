----------------------------------
-- Handlers
----------------------------------

local function handleMouseWheel() 
  local direction = arg1;
  local maxZoom = Minimap:GetZoomLevels() - 1;
  local newZoom = Minimap:GetZoom() + direction;
 
  if direction == 1 then
    if IsShiftKeyDown() then
      if (Minimap:GetZoom() == maxZoom) then
        return
      end
      
      MinimapZoomOut:Enable();
      
      Minimap:SetZoom(newZoom);
      
      if(Minimap:GetZoom() == maxZoom) then
        MinimapZoomIn:Disable();
      end
    end
  else
    if IsShiftKeyDown() then
      if(Minimap:GetZoom() == 0) then
        return
      end
      
      MinimapZoomIn:Enable();
      
      Minimap:SetZoom(newZoom);
    
      if(Minimap:GetZoom() == 0) then
        MinimapZoomOut:Disable();
       end
    end
  end
end

----------------------------------
-- Setup MiniMap
----------------------------------

local mMap = getglobal("Minimap");
mMap:EnableMouseWheel(true);
mMap:SetScript("OnMouseWheel", handleMouseWheel)