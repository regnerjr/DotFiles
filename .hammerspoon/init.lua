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
end
)
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
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "end", function()
    hs.spotify.playpause()
    hs.spotify.displayCurrentTrack()
end)

-- Next Track
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "home", function()
    hs.spotify.next()
    hs.spotify.displayCurrentTrack()
end)

-- Previous Track
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "home", function()
    hs.spotify.previous()
    hs.spotify.displayCurrentTrack()
end)

----- System Default Output Volume
hs.hotkey.bind({"cmd","alt","ctrl"}, "pageup", function()
    local audio = hs.audiodevice.defaultOutputDevice()
    audio:setMuted(false)
    local name = audio:name()
    local vol = audio:volume()
    local newVol = vol + 5
    audio:setVolume(newVol)
    hs.alert.show("Volume" .. newVol .. "" )
end
)

hs.hotkey.bind({"cmd","alt","ctrl"}, "pagedown", function()
    local audio = hs.audiodevice.defaultOutputDevice()
    audio:setMuted(false)
    local name = audio:name()
    local vol = audio:volume()
    local newVol = vol - 5
    audio:setVolume(newVol)
    hs.alert.show("Volume " .. newVol .. "" )
end
)

hs.hotkey.bind({"cmd","alt","ctrl"}, "forwarddelete", function()
    local audio = hs.audiodevice.defaultOutputDevice()
    audio:setMuted(false)
    local name = audio:name()
    local vol = audio:volume()
    local newVol = vol - 25
    audio:setVolume(newVol)
    hs.alert.show("Volume " .. newVol .. "" )
end
)
----- Programmming
-- Reset iOS Simulator
hs.hotkey.bind({"cmd","alt","ctrl"}, "R", function()
    local sim = hs.application.get("Simulator")
    if sim then
        sim:activate()
        sim:selectMenuItem("Reset Content and Settings…")
    else
        hs.alert("Simulator not found")
    end
end
)
-- Launch Dash if not already Running
hs.hotkey.bind({"cmd","alt","ctrl"}, "\\", function()
    local front = hs.application.frontmostApplication()
    if front:name() == "Dash" then
        front:hide()
    else
        local dash = hs.application.open("Dash")
        dash:selectMenuItem("Focus Search Field")
    end
end
)

