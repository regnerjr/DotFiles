local volume = require 'volume'

-- Auto Reload
function reloadConfig(files)
  hs.reload()
  hs.alert('Reloaded Config')
end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

grids = {
  ['2560x1440'] = '4x4',
  ['1440x900'] = '3x3',
  ['1920x1200'] = '4x4',
  ['1680x1050'] = '4x4'
}

for res, grid in pairs(grids) do
  hs.grid.setGrid(grid, res)
end

hs.grid.ui.textColor = {1, 1, 1, 0.5}
hs.grid.ui.cellColor = {0, 0, 0, 0.25}
hs.grid.ui.cellStrokeColor = {0, 0, 0, 0.25}
hs.grid.ui.selectedColor = {1, 1, 1, 0.1}
hs.grid.ui.highlightColor = {0.8, 0.8, 0, 0.0}
hs.grid.ui.highlightStrokeColor = {0, 0, 0, 0}

hs.grid.ui.textSize = 40
hs.grid.ui.cellStrokeWidth = 0
hs.grid.ui.highlightStrokeWidth = 0

hs.grid.ui.fontName = 'Helvetica Neue'

hs.grid.setMargins({0,0})

-- Watch for External Screen Attach / Detach
local watcher = nil
local lastCount = nil

local function screenCount() return #hs.screen.allScreens() end

function watchForScreenChanges()
  if watcher ~= nil then return end
  lastCount = screenCount()
  watcher = hs.screen.watcher.new(function()
    local updatedCount = screenCount()
    if lastCount ~= updatedCount then
      hs.alert('Screen count changed from '..lastCount..' -> '..updatedCount)
      lastCount = updatedCount
      reloadConfig(nil)
    end
  end)
  watcher:start()
end

watchForScreenChanges()

----- Window Movement
-- Left Half
hs.hotkey.bind({"cmd", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.mainScreen()
  local f = win:frame()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y
  f.h = sf.h
  f.w = (sf.w / 2)
  win:setFrame(f)
end)

-- Right Half
hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local screen = hs.screen.mainScreen()
  local f = win:frame()
  local sf = screen:frame()

  f.x = (sf.w / 2)
  f.y = sf.y
  f.h = sf.h
  f.w = (sf.w / 2)
  win:setFrame(f)
end)

-- Quickswitch to another open window
hs.hotkey.bind({}, "f13", function()
  hs.hints.windowHints()
end)

-- Move to Center
hs.hotkey.bind({"cmd", "ctrl"}, "U", function()
  hs.grid.toggleShow()
end)

-- FullScreen
hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit'[0,0,100,100]'
end)

-- Move Right (used to move to other display)
hs.hotkey.bind({"cmd", "ctrl"}, "P", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local allScreens = hs.screen.allScreens()
  if #allScreens > 1 then
    win:moveToScreen(screen:next())
  end
end)

----- Spotify
-- Play/Pause
hs.hotkey.bind({}, "f4", function()
  hs.spotify.playpause()
  hs.timer.doAfter(0.2,
    function()
    if hs.spotify.isPlaying() then
      hs.spotify.displayCurrentTrack()
    end
  end)
end)

-- Next Track
hs.hotkey.bind({}, "f5", function()
  hs.spotify.next()
  hs.timer.doAfter(0.2,
    function()
      hs.spotify.displayCurrentTrack()
  end)
end)

-- Previous Track
hs.hotkey.bind({"shift"}, "f5", function()
  hs.spotify.previous()
  hs.timer.doAfter(0.2,
    function()
      hs.spotify.displayCurrentTrack()
  end)
end)

----- Programmming


------ Launch Apps

-- Launch Dash if not already Running
hs.hotkey.bind({"cmd","alt","ctrl", "shift"}, "\\", function()
  local front = hs.application.frontmostApplication()
  if front:name() == "Dash" then
    front:hide()
  else
    local dash = hs.application.open("Dash")
    dash:selectMenuItem("Focus Search Field")
  end
end)


local AppLauncher = {}

--- AppLauncher.modifiers
--- Modifier keys used when launching apps
AppLauncher.modifiers = {"cmd", "alt", "ctrl", "shift"}

--- AppLauncher:bindHotkeys(mapping)
function AppLauncher:bindHotkeys(mapping)
    for key, app in pairs(mapping) do
        hs.hotkey.bind(AppLauncher.modifiers, key, function()
            hs.application.launchOrFocus(app)
        end)
    end
end

AppLauncher:bindHotkeys({
    c = "Calendar",
    f = "Slack",
    s = "Spotify",
    m = "Mail",
    t = "Terminal",
    o = "Omnifocus",
    j = "Microsoft Outlook",
    z = "Zoom.us",
})
