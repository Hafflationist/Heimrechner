{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO)
import qualified Data.Text as T
import GI.Gtk
  ( Orientation (OrientationHorizontal),
    Widget,
    boxNew,
    buttonNew,
    buttonNewWithLabel,
    containerAdd,
    onButtonClicked,
    toWidget,
    widgetShow,
  )
import Graphics.UI.GIGtkStrut (StrutSize (ExactSize))
import System.Process (spawnCommand)
import System.Taffybar (startTaffybar)
import System.Taffybar.Context (TaffyIO, TaffybarConfig)
import System.Taffybar.Hooks (withLogServer, withToggleServer)
import System.Taffybar.SimpleConfig
  ( Position (Top),
    SimpleTaffyConfig (..),
    defaultSimpleTaffyConfig,
    toTaffyConfig,
    usePrimaryMonitor,
  )
import System.Taffybar.Util (runCommand)
import System.Taffybar.Widget
  ( LayoutConfig (LayoutConfig, formatLayout),
    Workspace (windows, workspaceName, workspaceState),
    WorkspaceState (..),
    WorkspacesConfig (labelSetter, minIcons, showWorkspaceFn, widgetGap),
    buildContentsBox,
    commandRunnerNew,
    defaultClockConfig,
    defaultWindowsConfig,
    defaultWorkspacesConfig,
    layoutNew,
    textClockNewWith,
    widgetSetClassGI,
    windowsNew,
    workspacesNew,
  )
import System.Taffybar.Widget.SNITray (sniTrayNew)
import System.Taffybar.Widget.SimpleClock (ClockConfig (clockFormatString, clockUpdateStrategy))
import System.Taffybar.Widget.SimpleClock (ClockUpdateStrategy(ConstantInterval))

main :: IO ()
main = startTaffybar exampleTaffybarConfig

exampleTaffybarConfig :: TaffybarConfig
exampleTaffybarConfig =
  withLogServer $ withToggleServer $ toTaffyConfig myConfig

myConfig :: SimpleTaffyConfig
myConfig =
  defaultSimpleTaffyConfig
    { startWidgets = powerMenu : workspaces : map (>>= buildContentsBox) [layout],
      centerWidgets = map (>>= buildContentsBox) [windowsW],
      endWidgets = map (>>= buildContentsBox) [clock, tray],
      barPadding = 24,
      barPosition = Top,
      barHeight = ExactSize 48,
      widgetSpacing = 16,
      monitorsAction = usePrimaryMonitor
    }

myWorkspacesConfig :: WorkspacesConfig
myWorkspacesConfig =
  let showLabelOnlyForEmptyWorkspace ws
        | workspaceState ws == Empty = workspaceName ws
        | workspaceState ws == Active && null (windows ws) = workspaceName ws
        | otherwise = ""
   in defaultWorkspacesConfig
        { labelSetter = return . showLabelOnlyForEmptyWorkspace
        }

workspaces :: TaffyIO Widget
workspaces = workspacesNew myWorkspacesConfig

cc :: ClockConfig
cc = 
    defaultClockConfig {
        clockFormatString = "%  %Y-%m-%d %H:%M:%S  ",
	      clockUpdateStrategy = ConstantInterval 0.2
    }


clock :: TaffyIO Widget
clock = textClockNewWith $ cc


myLayoutConfig :: LayoutConfig
myLayoutConfig =
  let layoutDisplay "Spacing Tall" = "█▌▋"
      layoutDisplay "Spacing ThreeCol" = "█▐▐"
      layoutDisplay "Spacing Full" = "███"
      layoutDisplay "Spacing Mirror Tall" = "▀▀▀"
      layoutDisplay "Spacing TwoPanePersistent" = "█ █"
      layoutDisplay "Spacing Accordion" = "▌█▐"
      layoutDisplay "Spacing MultiCol" = "▌█▐"
      layoutDisplay "Spacing Grid" = "▚▚▚"
      layoutDisplay "Spacing GridRatio 0.5625" = "▚▚▚"
      layoutDisplay x = x
   in LayoutConfig
        { formatLayout = return . layoutDisplay }

layout :: TaffyIO Widget
layout = layoutNew myLayoutConfig

windowsW :: TaffyIO Widget
windowsW = windowsNew defaultWindowsConfig

tray :: TaffyIO Widget
tray = sniTrayNew

powerMenu :: TaffyIO Widget
powerMenu = commandButton "start-menu" "\xf313" powerMenuLauncher
  where
    powerMenuLauncher =
      T.unwords
        [ "eww",
          "open-many",
          "--toggle",
          "topbar-powermenu-bg",
          "topbar-powermenu-logout",
          "topbar-powermenu-sleep",
          "topbar-powermenu-reboot",
          "topbar-powermenu-poweroff"
        ]

commandButton :: T.Text -> T.Text -> T.Text -> TaffyIO Widget
commandButton className label cmd = do
  button <- buttonNewWithLabel label
  _ <- onButtonClicked button $ void (spawnCommand (T.unpack cmd))
  _ <- widgetSetClassGI button className
  widgetShow button
  toWidget button
