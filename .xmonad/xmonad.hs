import XMonad

-- Config
import XMonad.Config.Desktop
import XMonad.Config.Gnome

-- Layout
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.WindowArranger

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab

main :: IO ()
main = xmonad 
     . ewmhFullscreen 
     . ewmh 
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey --to import info to xmobar
     $ myConfig

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#88c0d0" 2 --nord8
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins] --ws: workspace, l: layout, _: window (blank for omission), wins: ppExtras
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow

    -- | Windows should have *some* title, which should not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 15

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#b48ead" "" --nord15
    blue     = xmobarColor "#81a1c1" "" --nord9
    white    = xmobarColor "#eceff4" "" --nord6
    yellow   = xmobarColor "#ebcb8b" "" --nord13
    red      = xmobarColor "#bf616a" "" --nord11
    lowWhite = xmobarColor "#d8dee9" "" --nord4

myTerminal = "kitty"

myStartupHook = do
    { spawnOnce "feh --bg-fill --no-fehbg ~/Wallpaper"
    ; spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x1d2128 --height 40"
    ; spawnOnce "light-locker"
    ; spawnOnce "nm-applet --sm-disable"
    }

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol ||| simpleTabbedLeft
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myLayoutHook = windowArrange $ spacingRaw False (Border 10 10 10 10) True (Border 5 5 5 5) True $ myLayout
-- myLayoutHook = windowArrangeAll $ spacingRaw False (Border 10 10 10 10) True (Border 5 5 5 5) True $ myLayout
                        --smartborder   screenborder<-bool windowborder        windowborder bool      
-- myLayoutHook = windowArrangeAll $ myLayout


-- Keybindings
myAdditionalKeys :: [(String, X ())]
myAdditionalKeys =
    [ ("C-M1-<Delete>", spawn "light-locker-command --lock")
    , ("C-q", kill)
    , ("M-C-r", spawn "reboot")
    , ("M-C-p", spawn "poweroff")

    ---------------------------------------------------------------------
    --                          App Launchers                          --
    ---------------------------------------------------------------------

    , ("C-S-<Escape>", spawn "gnome-system-monitor")
    , ("C-M1-t", spawn myTerminal) --probably should change modkey for explicit alt, incompatible with guake
    , ("M-f", spawn "firefox")
    , ("M-d", spawn "discord")
    , ("M-v", spawn "vivaldi")
    , ("M-p", spawn "rofi -show run")
    , ("C-M-i", spawn "element-desktop")
    --, ("M-s", spawn "flatpak run com.valvesoftware.Steam")

    ---------------------------------------------------------------------
    --                      Multimedia Controls                        --
    ---------------------------------------------------------------------                      
    
    , ("<XF86AudioLowerVolume>", spawn "amixer -q set Master unmute 2%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q set Master unmute 2%+")
    , ("<XF86AudioMute>", spawn "amixer -q set Master toggle")
    , ("<XF86MonBrightnessUp>", spawn "light -A 10")
    , ("<XF86MonBrightnessDown>", spawn "light -U 10")
    , ("<Print>", spawn "flameshot full -p ~/Pictures/Screenshots/")

    ---------------------------------------------------------------------
    --                          Window Controls                        --
    ---------------------------------------------------------------------                      
    , ("M-C-s", sendMessage Arrange)
    , ("M-C-S-s", sendMessage DeArrange)
    , ("M-C-<L>", sendMessage (MoveLeft 5))
    , ("M-C-<R>", sendMessage (MoveRight 5))
    , ("M-C-<D>", sendMessage (MoveDown 5))
    , ("M-C-<U>", sendMessage (MoveUp 5))
    , ("M-S-<L>", sendMessage (IncreaseLeft 5))
    , ("M-S-<R>", sendMessage (IncreaseRight 5))
    , ("M-S-<D>", sendMessage (IncreaseDown 5))
    , ("M-S-<U>", sendMessage (IncreaseUp 5))
    , ("M-C-S-<R>", sendMessage (DecreaseLeft 5))
    , ("M-C-S-<L>", sendMessage (DecreaseRight 5))
    , ("M-C-S-<U>", sendMessage (DecreaseDown 5))
    , ("M-C-S-<D>", sendMessage (DecreaseUp 5))
    ]

myUnusedKeys :: [String]
myUnusedKeys = 
    [ "M-S-<Return>"
    , "M-S-c"
    , "M-w"
    , "M-S-w"
    , "M-e"
    , "M-S-e"
    , "M-r"
    , "M-S-r"
    ]

myConfig = def
	{ -- modMask = mod4Mask change Mod key from alt to super
          terminal = myTerminal
	  , borderWidth = 0
	  , normalBorderColor = "#ECEFF4" -- nord6
	  , focusedBorderColor = "#8FBCBB" -- nord7
	  , layoutHook = myLayoutHook
	  , startupHook = myStartupHook
	} `additionalKeysP` myAdditionalKeys
	  `removeKeysP` myUnusedKeys
