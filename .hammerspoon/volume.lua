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

local spotifyWasPlaying = false
local logger = hs.logger.new("audioDevice", "debug")

local function restartPlay()
  hs.alert("Restarting Play")
  hs.spotify.play()
end

local function audioDeviceChangedCallback(deviceUID, event, scope, element)

  spotifyIsPlaying = hs.spotify.isPlaying()

  device = hs.audiodevice.findDeviceByUID(deviceUID)

  if event ~= "jack" then
    return
  end

  -- Headphones are plugged in (went from headphones not plugged in to plugged in _|-
  if device:jackConnected() and spotifyWasPlaying then
    restartPlay()
  else -- Headphones are being unplugged
    if spotifyIsPlaying then
      hs.alert("Spotify Pause")
      hs.spotify.pause()
      spotifyWasPlaying = true
    else
      spotifyWasPlaying = false
    end
  end
end

audio:watcherCallback(audioDeviceChangedCallback)
audio:watcherStart()

return volume
