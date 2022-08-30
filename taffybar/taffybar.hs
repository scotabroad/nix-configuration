{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Map                                    as M
import           Data.Maybe
import qualified GI.Gtk                                      as Gtk
import qualified GI.Gtk.Objects.Overlay                      as Gtk
import           Network.HostName
import           StatusNotifier.Tray
import           System.Directory
import           System.Environment.XDG.BaseDir
import           System.FilePath
import           System.Taffybar
import           System.Taffybar.Information.CPU
import           System.Taffybar.SimpleConfig
import           System.Taffybar.Widget
import           System.Taffybar.Widget.Battery
import           System.Taffybar.Widget.Generic.Graph
import           System.Taffybar.Widget.Generic.PollingGraph
import           System.Taffybar.Widget.Layout
import           System.Taffybar.Widget.SNITray
import           System.Taffybar.Widget.Workspaces

main :: IO ()
main = simpleTaffybar myConfig
  
myBatteryIcon = batteryIconNew

myBatteryText = textBatteryNew "$percentage$%" 

myClock = textClockNewWith defaultClockConfig
  { clockUpdateStrategy = RoundedTargetInterval 60 0.0
  , clockFormatString = "%a %b %d %l:%M %p"
  }

myLayout = layoutNew defaultLayoutConfig

myWorkspaces = workspacesNew defaultWorkspacesConfig
    { minIcons = 1
    , widgetGap = 0
    , showWorkspaceFn = hideEmpty
    }
      
myConfig = defaultSimpleTaffyConfig
    { startWidgets = [ myWorkspaces, myLayout ]
    , centerWidgets = [ myClock ]
    , endWidgets = [ myBatteryText, myBatteryIcon, sniTrayNew ]
    }
