local alert         = require "hs.alert"
local hotkey        = require "hs.hotkey"
local layout        = require "hs.layout"
local monitors      = require "rpa.utils.monitors"
local position      = require "rpa.utils.position"
local pathwatcher   = require "hs.pathwatcher"
local screen        = require "hs.screen"
local screenwatcher = require "hs.screen.watcher"
local window        = require "hs.window"


-- Startup options -------------------------------------------------------------


-- Functions -------------------------------------------------------------------
----- Misc ---------------------------------------------------------------------
function showConsole()
  hs.openConsole(true)
end

function reloadConfig()
  hs.reload()
  alert.show("Hammerspoon config reloaded.")
end


----- Reload config automatically ----------------------------------------------
function reloadConfigAuto(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
        alert.show("Hammerspoon config automatically reloaded.")
    end
end

pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfigAuto):start()


----- Window manipulation ------------------------------------------------------
function maximize()
  local win = window.focusedWindow()
  win:maximize()
end

function smallCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.smallCenter())
end

function twoThirdsCenter()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsCenter())
end

function halfLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfLeft())
end

function halfRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfRight())
end

function halfTop()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfTop())
end

function halfBottom()
  local win = window.focusedWindow()
  win:moveToUnit(position.halfBottom())
end

function quarterTopLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopLeft())
end

function quarterTopRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterTopRight())
end

function quarterBottomLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomLeft())
end

function quarterBottomRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.quarterBottomRight())
end

function thirdLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdLeft())
end

function thirdMiddle()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdMiddle())
end

function thirdRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.thirdRight())
end

function twoThirdsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsLeft())
end

function twoThirdsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.twoThirdsRight())
end

function fiveSixthsLeft()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsLeft())
end

function fiveSixthsRight()
  local win = window.focusedWindow()
  win:moveToUnit(position.fiveSixthsRight())
end

function pushUp()
  local win = window.focusedWindow()
  win:moveOneScreenNorth()
end

function pushRight()
  local win = window.focusedWindow()
  win:moveOneScreenEast()
end

function pushDown()
  local win = window.focusedWindow()
  win:moveOneScreenSouth()
end

function pushLeft()
  local win = window.focusedWindow()
  win:moveOneScreenWest()
end

-- Screen layouts --------------------------------------------------------------
local laptop              = monitors.findScreen(1440, 900)
local thunderboltDisplays = monitors.sortedScreensBySize(2560, 1440)
local tv                  = monitors.findScreen(1920, 1080)
local monitor4k           = monitors.findScreen(1920, 1080)
local iMac                = monitors.findScreen(2560, 1440)

local layoutImac = {
  -- Command line
  {"Terminal", nil, iMac, position.thirdRight(), nil, nil},
  {"iTerm",    nil, iMac, position.thirdRight(), nil, nil},
  {"iTerm2",   nil, iMac, position.thirdRight(), nil, nil},

  -- Browsers
  {"Safari",                    nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Google Chrome",             nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Firefox",                   nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition",   nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"WebKit",                    nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, iMac, position.twoThirdsLeft(), nil, nil},

  -- Development
  {"Atom",          nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Code",          nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"CodeKit",       nil, iMac, position.thirdRight(),    nil, nil},
  {"IntelliJ IDEA", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"MacVim",        nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Sublime Text",  nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"TextMate",      nil, iMac, position.twoThirdsLeft(), nil, nil},

  -- Productivity
  {"Calendar",           nil, iMac,  position.twoThirdsCenter(), nil, nil},
  {"Fantastical",        nil, iMac,  position.twoThirdsCenter(), nil, nil},
  {"Mail",               nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Nylas Mail",         nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Spark",              nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Outlook",            nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Slack",              nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Socialcast",         nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"HipChat",            nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Skype for Business", nil, iMac,  position.twoThirdsCenter(), nil, nil},
  {"MindNode",           nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Ulysses",            nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Bear",               nil, iMac,  position.twoThirdsLeft(),   nil, nil},
  {"Things",             nil, iMac,  position.twoThirdsCenter(), nil, nil},
  {"Todoist",            nil, iMac,  position.twoThirdsCenter(), nil, nil},

  -- Design
  {"Sketch",            nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Affinity Designer", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo",    nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion 6", nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Zeplin",            nil, iMac, position.twoThirdsLeft(), nil, nil},

  -- Music
  {"iTunes",  nil, iMac, position.halfLeft(), nil, nil},
  {"Rdio",    nil, iMac, position.smallCenter(), nil, nil},
  {"Spotify", nil, iMac, position.smallCenter(), nil, nil},

  -- Misc
  {"Dash",     nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, iMac, position.thirdRight(),    nil, nil},
  {"nvALT",    nil, iMac, position.thirdRight(),    nil, nil},
  {"JIRA",     nil, iMac, position.smallCenter(),   nil, nil},
  {"Pocket",   nil, iMac, position.twoThirdsLeft(), nil, nil},
  {"Reeder",   nil, iMac, position.twoThirdsLeft(), nil, nil}
}

local layoutLaptopOnly = {
  -- Command line
  {"Terminal", nil, laptop, position.twoThirdsRight(), nil, nil},
  {"iTerm",    nil, laptop, position.twoThirdsRight(), nil, nil},
  {"iTerm2",   nil, laptop, position.twoThirdsRight(), nil, nil},

  -- Browsers
  {"Safari",                    nil, laptop, layout.maximized, nil, nil},
  {"Google Chrome",             nil, laptop, layout.maximized, nil, nil},
  {"Firefox",                   nil, laptop, layout.maximized, nil, nil},
  {"FirefoxDeveloperEdition",   nil, laptop, layout.maximized, nil, nil},
  {"WebKit",                    nil, laptop, layout.maximized, nil, nil},
  {"Safari Technology Preview", nil, laptop, layout.maximized, nil, nil},

  -- Development
  {"Atom",          nil, laptop, layout.maximized, nil, nil},
  {"Code",          nil, laptop, layout.maximized, nil, nil},
  {"CodeKit",       nil, laptop, layout.maximized, nil, nil},
  {"IntelliJ IDEA", nil, laptop, layout.maximized, nil, nil},
  {"MacVim",        nil, laptop, layout.maximized, nil, nil},
  {"Sublime Text",  nil, laptop, layout.maximized, nil, nil},
  {"TextMate",      nil, laptop, layout.maximized, nil, nil},

  -- Productivity
  {"Calendar",           nil, laptop,  layout.maximized, nil, nil},
  {"Fantastical",        nil, laptop,  layout.maximized, nil, nil},
  {"Mail",               nil, laptop,  layout.maximized, nil, nil},
  {"Nylas Mail",         nil, laptop,  layout.maximized, nil, nil},
  {"Spark",              nil, laptop,  layout.maximized, nil, nil},
  {"Outlook",            nil, laptop,  layout.maximized, nil, nil},
  {"Slack",              nil, laptop,  layout.maximized, nil, nil},
  {"Socialcast",         nil, laptop,  layout.maximized, nil, nil},
  {"HipChat",            nil, laptop,  layout.maximized, nil, nil},
  {"Skype for Business", nil, laptop,  layout.maximized, nil, nil},
  {"MindNode",           nil, laptop,  layout.maximized, nil, nil},
  {"Ulysses",            nil, laptop,  layout.maximized, nil, nil},
  {"Bear",               nil, laptop,  layout.maximized, nil, nil},
  {"Things",             nil, laptop,  layout.maximized, nil, nil},
  {"Todoist",            nil, laptop,  layout.maximized, nil, nil},

  -- Design
  {"Sketch",            nil, laptop, layout.maximized, nil, nil},
  {"Affinity Designer", nil, laptop, layout.maximized, nil, nil},
  {"Affinity Photo",    nil, laptop, layout.maximized, nil, nil},
  {"Suitcase Fusion 6", nil, laptop, layout.maximized, nil, nil},
  {"Zeplin",            nil, laptop, layout.maximized, nil, nil},

  -- Music
  {"iTunes",  nil, laptop, layout.maximized, nil, nil},
  {"Rdio",    nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},

  -- Misc
  {"Dash",     nil, laptop, layout.maximized,     nil, nil},
  {"Marked 2", nil, laptop, position.halfRight(), nil, nil},
  {"nvALT",    nil, laptop, position.halfRight(), nil, nil},
  {"JIRA",     nil, laptop, layout.maximized,     nil, nil},
  {"Pocket",   nil, laptop, layout.maximized,     nil, nil},
  {"Reeder",   nil, laptop, layout.maximized,     nil, nil}
}

local layoutWith4kDisplay = {
  -- Command line
  {"Terminal", nil, monitor4k, position.halfRight(), nil, nil},
  {"iTerm",    nil, monitor4k, position.halfRight(), nil, nil},
  {"iTerm2",   nil, monitor4k, position.halfRight(), nil, nil},

  -- Browsers
  {"Safari",                    nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Google Chrome",             nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Firefox",                   nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"FirefoxDeveloperEdition",   nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"WebKit",                    nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Safari Technology Preview", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},

  -- Development
  {"Atom",          nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Code",          nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"CodeKit",       nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"IntelliJ IDEA", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"MacVim",        nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Sublime Text",  nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"TextMate",      nil, monitor4k, position.fiveSixthsLeft(), nil, nil},

  -- Productivity
  {"Calendar",           nil, laptop,    layout.maximized,         nil, nil},
  {"Fantastical",        nil, laptop,    layout.maximized,         nil, nil},
  {"Mail",               nil, laptop,    layout.maximized,         nil, nil},
  {"Nylas Mail",         nil, laptop,    layout.maximized,         nil, nil},
  {"Spark",              nil, laptop,    layout.maximized,         nil, nil},
  {"Outlook",            nil, laptop,    layout.maximized,         nil, nil},
  {"Slack",              nil, laptop,    layout.maximized,         nil, nil},
  {"Socialcast",         nil, laptop,    layout.maximized,         nil, nil},
  {"HipChat",            nil, laptop,    layout.maximized,         nil, nil},
  {"Skype for Business", nil, laptop,    layout.maximized,         nil, nil},
  {"MindNode",           nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Ulysses",            nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Bear",               nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Things",             nil, laptop,    layout.maximized,         nil, nil},
  {"Todoist",            nil, laptop,    layout.maximized,         nil, nil},

  -- Design
  {"Sketch",            nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Affinity Designer", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Affinity Photo",    nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Suitcase Fusion 6", nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Zeplin",            nil, laptop,    layout.maximized,         nil, nil},

  -- Music
  {"iTunes",  nil, laptop, layout.maximized, nil, nil},
  {"Rdio",    nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},

  -- Misc
  {"Dash",     nil, monitor4k, position.fiveSixthsLeft(), nil, nil},
  {"Marked 2", nil, monitor4k, position.halfRight(),    nil, nil},
  {"nvALT",    nil, monitor4k, position.halfRight(),    nil, nil},
  {"JIRA",     nil, laptop,    layout.maximized,         nil, nil},
  {"Pocket",   nil, laptop,    layout.maximized,         nil, nil},
  {"Reeder",   nil, laptop,    layout.maximized,         nil, nil}
}

local layoutWithThunderboltDisplay = {
  -- Command line
  {"Terminal", nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"iTerm",    nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},
  {"iTerm2",   nil, thunderboltDisplays[1], position.thirdRight(), nil, nil},

  -- Browsers
  {"Safari",                    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Google Chrome",             nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Firefox",                   nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition",   nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"WebKit",                    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},

  -- Development
  {"Atom",          nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Code",          nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"CodeKit",       nil, thunderboltDisplays[1], position.thirdRight(),    nil, nil},
  {"IntelliJ IDEA", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"MacVim",        nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sublime Text",  nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"TextMate",      nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},

  -- Productivity
  {"Calendar",           nil, laptop,                 layout.maximized,         nil, nil},
  {"Fantastical",        nil, laptop,                 layout.maximized,         nil, nil},
  {"Mail",               nil, laptop,                 layout.maximized,         nil, nil},
  {"Nylas Mail",         nil, laptop,                 layout.maximized,         nil, nil},
  {"Spark",              nil, laptop,                 layout.maximized,         nil, nil},
  {"Outlook",            nil, laptop,                 layout.maximized,         nil, nil},
  {"Slack",              nil, laptop,                 layout.maximized,         nil, nil},
  {"Socialcast",         nil, laptop,                 layout.maximized,         nil, nil},
  {"HipChat",            nil, laptop,                 layout.maximized,         nil, nil},
  {"Skype for Business", nil, laptop,                 layout.maximized,         nil, nil},
  {"MindNode",           nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Ulysses",            nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Bear",               nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Things",             nil, laptop,                 layout.maximized,         nil, nil},
  {"Todoist",            nil, laptop,                 layout.maximized,         nil, nil},

  -- Design
  {"Sketch",            nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Designer", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo",    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion 6", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Zeplin",            nil, laptop,                 layout.maximized,         nil, nil},

  -- Music
  {"iTunes",  nil, laptop, layout.maximized, nil, nil},
  {"Rdio",    nil, laptop, layout.maximized, nil, nil},
  {"Spotify", nil, laptop, layout.maximized, nil, nil},

  -- Misc
  {"Dash",     nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplays[1], position.thirdRight(),    nil, nil},
  {"nvALT",    nil, thunderboltDisplays[1], position.thirdRight(),    nil, nil},
  {"JIRA",     nil, laptop,                 layout.maximized,         nil, nil},
  {"Pocket",   nil, laptop,                 layout.maximized,         nil, nil},
  {"Reeder",   nil, laptop,                 layout.maximized,         nil, nil}
}

local layoutWithTwoThunderboltDisplays = {
  -- Command line
  {"Terminal", nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},
  {"iTerm",    nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},
  {"iTerm2",   nil, thunderboltDisplays[2], position.halfLeft(), nil, nil},

  -- Browsers
  {"Safari",                    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Google Chrome",             nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Firefox",                   nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"FirefoxDeveloperEdition",   nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"WebKit",                    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Safari Technology Preview", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},

  -- Development
  {"Atom",          nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Code",          nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"CodeKit",       nil, thunderboltDisplays[1], position.thirdRight(),    nil, nil},
  {"IntelliJ IDEA", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"MacVim",        nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Sublime Text",  nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"TextMate",      nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},

  -- Productivity
  {"Calendar",           nil, laptop,                 layout.maximized,         nil, nil},
  {"Fantastical",        nil, laptop,                 layout.maximized,         nil, nil},
  {"Mail",               nil, laptop,                 layout.maximized,         nil, nil},
  {"Nylas Mail",         nil, laptop,                 layout.maximized,         nil, nil},
  {"Spark",              nil, laptop,                 layout.maximized,         nil, nil},
  {"Outlook",            nil, laptop,                 layout.maximized,         nil, nil},
  {"Slack",              nil, laptop,                 layout.maximized,         nil, nil},
  {"Socialcast",         nil, laptop,                 layout.maximized,         nil, nil},
  {"HipChat",            nil, laptop,                 layout.maximized,         nil, nil},
  {"Skype for Business", nil, laptop,                 layout.maximized,         nil, nil},
  {"MindNode",           nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Ulysses",            nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Bear",               nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Things",             nil, laptop,                 layout.maximized,         nil, nil},
  {"Todoist",            nil, laptop,                 layout.maximized,         nil, nil},

  -- Design
  {"Sketch",            nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Designer", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Affinity Photo",    nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Suitcase Fusion 6", nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Zeplin",            nil, laptop,                 layout.maximized,         nil, nil},

  -- Music
  {"iTunes",  nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"Rdio",    nil, thunderboltDisplays[2], position.halfRight(), nil, nil},
  {"Spotify", nil, thunderboltDisplays[2], position.halfRight(), nil, nil},

  -- Misc
  {"Dash",     nil, thunderboltDisplays[1], position.twoThirdsLeft(), nil, nil},
  {"Marked 2", nil, thunderboltDisplays[1], position.halfLeft(),      nil, nil},
  {"nvALT",    nil, thunderboltDisplays[1], position.thirdRight(),    nil, nil},
  {"JIRA",     nil, laptop,                 layout.maximized,         nil, nil},
  {"Pocket",   nil, laptop,                 layout.maximized,         nil, nil},
  {"Reeder",   nil, laptop,                 layout.maximized,         nil, nil}
}

local layoutWithTv = layoutLaptopOnly

function doLayoutImac()
  layout.apply(layoutImac)
end

function doLayoutLaptopOnly()
  layout.apply(layoutLaptopOnly)
end

function doLayoutWith4kDisplay()
  layout.apply(layoutWith4kDisplay)
end

function doLayoutWithThunderboltDisplay()
  layout.apply(layoutWithThunderboltDisplay)
end

function doLayoutWithTwoThunderboltDisplays()
  layout.apply(layoutWithTwoThunderboltDisplays)
end

function doLayoutWithTv()
  layout.apply(layoutWithTv)
end

function handleScreenChanges()
  local screens = monitors.screensWestToEast()

  if #screens == 1 then
    local frame = screens[1]:fullFrame()

    if frame.w == 2560 and frame.h == 1440 then
      doLayoutImac()
    else
      doLayoutLaptopOnly()
    end
  elseif #screens == 2 then
    if thunderboltDisplays then
      doLayoutWithThunderboltDisplay()
    elseif monitor4k and monitor4k:name() == 'LG HDR 4K' then
      doLayoutWith4kDisplay()
    elseif tv then
      doLayoutWithTv()
    end
  elseif #screens == 3 then
    doLayoutWithTwoThunderboltDisplays()
  else
    -- For other, unrecognized screens, leave all windows on main laptop screen
    doLayoutLaptopOnly()
  end
end

screenwatcher.new(handleScreenChanges):start()


-- Key bindings ----------------------------------------------------------------
hotkey.bind({"ctrl"},                 "1",     nil, maximize)
hotkey.bind({"ctrl", "shift"},        "1",     nil, smallCenter)
hotkey.bind({"ctrl", "shift", "alt"}, "1",     nil, twoThirdsCenter)
hotkey.bind({"ctrl"},                 "2",     nil, halfLeft)
hotkey.bind({"ctrl", "shift"},        "2",     nil, halfRight)
hotkey.bind({"ctrl"},                 "3",     nil, halfTop)
hotkey.bind({"ctrl", "shift"},        "3",     nil, halfBottom)
hotkey.bind({"ctrl"},                 "4",     nil, thirdLeft)
hotkey.bind({"ctrl", "shift"},        "4",     nil, thirdRight)
hotkey.bind({"ctrl", "shift", "alt"}, "4",     nil, thirdMiddle)
hotkey.bind({"ctrl"},                 "5",     nil, twoThirdsLeft)
hotkey.bind({"ctrl", "shift"},        "5",     nil, twoThirdsRight)
hotkey.bind({"ctrl"},                 "6",     nil, fiveSixthsLeft)
hotkey.bind({"ctrl", "shift"},        "6",     nil, fiveSixthsRight)
hotkey.bind({"ctrl"},                 "7",     nil, quarterTopLeft)
hotkey.bind({"ctrl", "shift"},        "7",     nil, quarterBottomLeft)
hotkey.bind({"ctrl"},                 "8",     nil, quarterTopRight)
hotkey.bind({"ctrl", "shift"},        "8",     nil, quarterBottomRight)
hotkey.bind({"cmd", "alt"},           "up",    nil, pushUp)
hotkey.bind({"cmd", "alt"},           "right", nil, pushRight)
hotkey.bind({"cmd", "alt"},           "down",  nil, pushDown)
hotkey.bind({"cmd", "alt"},           "left",  nil, pushLeft)
hotkey.bind({"ctrl", "shift"},        "\\",    nil, doLayoutLaptopOnly)
hotkey.bind({"ctrl", "shift", "alt"}, "\\",    nil, doLayoutWith4kDisplay)
hotkey.bind({"ctrl", "alt"},          "\\",    nil, doLayoutWithTwoThunderboltDisplays)
hotkey.bind({"ctrl"},                 "\\",    nil, doLayoutWithThunderboltDisplay)
hotkey.bind({"ctrl"},                 "/",     nil, doLayoutWithTv)
hotkey.bind({"ctrl", "shift"},        "/",     nil, doLayoutImac)
hotkey.bind({"cmd", "ctrl", "shift"}, "l",     nil, showConsole)
hotkey.bind({"cmd", "ctrl", "shift"}, "r",     nil, reloadConfig)

