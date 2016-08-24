local volume = {}

local audio = hs.audiodevice.defaultOutputDevice()

-- Some audio devices, Such as FocusRite Scarlett, don't allow software volume output adjustments
local function hasVolume()
  local vol = audio:volume()
  if vol == nil then
    hs.alert.closeAll()
    hs.alert("Use the big shiny knob")
    return false
  end
  return true
end

function volume.increase()
  if not hasVolume() then return end
  audio:setMuted(false)
  local vol = audio:volume()
  local newVol = vol + 5
  audio:setVolume(newVol)
  hs.alert.show("Volume" .. newVol .. "" )
end

function volume.decrease()
  if not hasVolume() then return end
  audio:setMuted(false)
  local name = audio:name()
  local vol = audio:volume()
  local newVol = vol - 5
  audio:setVolume(newVol)
  hs.alert.show("Volume " .. newVol .. "" )
end

function volume.quiet()
  if not hasVolume() then return end
  audio:setMuted(false)
  local name = audio:name()
  local vol = audio:volume()
  local newVol = vol - 25
  audio:setVolume(newVol)
  hs.alert.show("Volume " .. newVol .. "" )
end

return volume
