local addonName, addon = ...
addon._G = _G

-- Set the environment of the current function to the global table NinjaKittyMedia.
-- See: http://www.lua.org/pil/14.3.html
setfenv(1, addon)

local handlerFrame = _G.CreateFrame("Frame")

-- http://www.wowinterface.com/forums/showthread.php?p=267998
handlerFrame:SetScript("OnEvent", function(self, event, ...)
  return self[event] and self[event](self, ...)
end)

function handlerFrame:ADDON_LOADED(name)
  if name ~= addonName then return end

  self:UnregisterEvent("ADDON_LOADED")

  local libSharedMedia = _G.LibStub("LibSharedMedia-3.0", true); _G.assert(libSharedMedia)

  libSharedMedia:Register("background", "NinjaKitty Minimap BG", [[Interface\AddOns\]] .. addonName ..
    [[\Minimap-Background.tga]])

  libSharedMedia:Register("font", "Ubuntu Bold", [[Interface\AddOns\]] .. addonName .. [[\fonts\Ubuntu-B.ttf]])
  libSharedMedia:Register("font", "Ubuntu Condensed", [[Interface\AddOns\]] .. addonName .. [[\fonts\Ubuntu-C.ttf]])
  libSharedMedia:Register("font", "Ubuntu Light", [[Interface\AddOns\]] .. addonName .. [[\fonts\Ubuntu-L.ttf]])
  libSharedMedia:Register("font", "Ubuntu Medium", [[Interface\AddOns\]] .. addonName .. [[\fonts\Ubuntu-M.ttf]])
  libSharedMedia:Register("font", "Ubuntu Mono Bold", [[Interface\AddOns\]] .. addonName .. [[\fonts\UbuntuMono-B.ttf]])
  libSharedMedia:Register("font", "Ubuntu Mono", [[Interface\AddOns\]] .. addonName .. [[\fonts\UbuntuMono-R.ttf]])
  libSharedMedia:Register("font", "Ubuntu", [[Interface\AddOns\]] .. addonName .. [[\fonts\Ubuntu-R.ttf]])

  self.ADDON_LOADED = nil
end

handlerFrame:RegisterEvent("ADDON_LOADED")

-- vim: tw=120 sts=2 sw=2 et
