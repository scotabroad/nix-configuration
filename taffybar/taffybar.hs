{-# LANGUAGE OverloadedStrings #-}
import System.Taffybar
import StatusNotifier.Tray
import System.Taffybar.Information.CPU
import System.Taffybar.SimpleConfig
import System.Taffybar.Widget
import System.Taffybar.Widget.Battery
import System.Taffybar.Widget.Generic.Graph
import System.Taffybar.Widget.Generic.PollingGraph
import System.Taffybar.Widget.SNITray

cpuCallback = do
  (_, systemLoad, totalLoad) <- cpuLoad
  return [ totalLoad, systemLoad ]

main = do
  let {-cpuCfg = defaultGraphConfig { graphDataColors = [ (0, 1, 0, 1), (1, 0, 1, 0.5)]
                                  , graphLabel = Just "cpu"
                                  }-}

      myBattery = textBatteryNew "$percentage$%" 
      myClock = textClockNewWith defaultClockConfig
      -- myCpu = pollingGraphNew cpuCfg 0.5 cpuCallback
      myWorkspaces = workspacesNew defaultWorkspacesConfig
      simpleConfig = defaultSimpleTaffyConfig
                       { startWidgets = [ myWorkspaces ]
                       , endWidgets = [ myBattery, myClock, sniTrayNew ]
                       }
  simpleTaffybar simpleConfig
