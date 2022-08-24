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
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.TaffybarPagerHints (pagerHints)

-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab

main :: IO ()
main = xmonad 
     . docks
     . ewmhFullscreen 
     . ewmh 
     . pagerHints
     . withEasySB (statusBarProp "xmobar" (pure def)) defToggleStrutsKey --to import info to xmobar
     $ myConfig

{- myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = nord14 " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = nord6 . wrap " " ""
    , ppHidden          = nord4 . wrap " " ""
    , ppUrgent          = nord11 . wrap " " ""
    , ppLayout          = nord4 . wrap " " ""
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins] --ws: workspace, l: layout, _: window (blank for omission), wins: ppExtras
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (nord6 " ") (nord6 "") . nord15 . ppWindow
    formatUnfocused = wrap (nord4 " ") (nord4 "") . nord9 . ppWindow

    -- | Windows should have *some* title, which should not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 15

    nord0, nord4, nord6, nord9, nord11, nord14, nord15 :: String -> String
    nord0    = xmobarColor "#2e3440" ""
    nord4    = xmobarColor "#d8dee9" ""
    nord6    = xmobarColor "#eceff4" ""
    nord9    = xmobarColor "#81a1c1" ""
    nord11   = xmobarColor "#bf616a" ""
    nord14   = xmobarColor "#a3be8c" ""
    nord15   = xmobarColor "#b48ead" "" -}

myTerminal = "kitty"

myStartupHook = do
    { spawnOnce "feh --bg-fill --no-fehbg ~/Wallpaper"
    ; spawnOnce "light-locker"
    ; spawnOnce "nm-applet --sm-disable"
    ; spawnOnce "ibus-daemon -drx"
    -- ; spawnOnce "trayer --edge bottom --align center --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent false --tint 0x2e3440 --height 30"
    }

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol ||| Mirror threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myLayoutHook = windowArrange $ spacingRaw False (Border 10 10 10 10) True (Border 5 5 5 5) True $ myLayout
                        --smartborder   screenborder<-bool screenwborder        windowborder bool      


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

    -- , ("C-S-<Escape>", spawn "gnome-system-monitor")
    , ("C-M1-t", spawn myTerminal) --probably should change modkey for explicit alt, incompatible with guake
    , ("M-f", spawn "firefox")
    , ("M-d", spawn "discord")
    , ("M-v", spawn "vivaldi")
    , ("M-p", spawn "rofi -show drun")
    , ("C-M-i", spawn "element-desktop")
    , ("M-s", spawn "steam")

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
