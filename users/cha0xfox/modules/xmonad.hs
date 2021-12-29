import XMonad
import XMonad.Config.Desktop
import XMonad.Operations
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Run (spawnPipe, hPutStrLn)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Cursor ( setDefaultCursor )
import XMonad.Layout.IndependentScreens
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Gaps
import XMonad.Layout.Master
import XMonad.Layout.Spiral
import XMonad.Layout.IfMax
import XMonad.Layout.Renamed
import XMonad.Layout.MultiToggle (Toggle(..), mkToggle, single)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.SimpleFloat (simpleFloat)
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import Data.Semigroup
import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.InsertPosition
  ( Focus(Newer)
  , Position(Below)
  , insertPosition
  )
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
  ( (-?>)
  , composeOne
  , doCenterFloat
  , doFullFloat
  , isDialog
  , isFullscreen
  , isInProperty
  )
import Distribution.Simple (KnownExtension(MultiWayIf))


--------[main]--------

main = do
  xmproc2 <- spawnPipe "xmobar -x 2 ~/.xmobarrc"
  xmonad $ ewmh def 
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , keys        = myKeys
    , startupHook = myStartupHook
    , workspaces  = withScreens 4 myWS
    , layoutHook  = avoidStruts $ myLayouts
    , borderWidth = 0
    , focusedBorderColor = "#bd93f9"
    , logHook     = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc2
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
    , manageHook  = myManageHook <+> manageDocks
    , handleEventHook = handleEventHook def <+> fullscreenEventHook
    }


--------[workspaces]--------

webWs = "web"

devWs = "dev"

comWs = "com"

wrkWs = "wrk"

sysWs = "sys"

etcWs = "etc"

myWS :: [WorkspaceId]
myWS = [webWs, devWs, comWs, wrkWs, sysWs, etcWs]

--------------------------

myFish = "alacritty -e fish"
myTerminal = "alacritty"


--------[functions]--------

centerWindow :: Window -> X ()
centerWindow win = do
    (_, W.RationalRect x y w h) <- floatLocation win
    windows $ W.float win (W.RationalRect ((1 - w) / 2) ((1 - h) / 2) w h)
    return ()

--------[keys]--------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [
    ((modm .|. shiftMask, xK_Return), spawn myFish)

    -- Launcher

    , ((modm,               xK_d     ), spawn "rofi -matching fuzzy rofi -show drun -modi drun,run -show-icons")

    -- Restart xmonad

    , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Kill window

    , ((modm .|. shiftMask, xK_c     ), kill)

    -- Copy screenshot 

    , ((modm,               xK_p     ), spawn "maim -s | tee ~/Screenshots/screen-$(date +%s).png | xclip -selection clipboard -t image/png")

    -- Make window fload and center

    , ((modm .|. shiftMask, xK_s     ), withFocused centerWindow)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_s     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Scraptchpads
    , ((modm .|. shiftMask, xK_a), namedScratchpadAction myScratchPads "terminal")
    , ((modm .|. shiftMask, xK_n), namedScratchpadAction myScratchPads "ncmpcpp")

    ]
    ++

    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r, xK_t] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


--------[Layout]--------

myLayouts =
  avoidStruts .
  smartBorders .
  fullScreenToggle . comLayout . devLayout . webLayout . etcLayout . wrkLayout $
  (myLayout ||| tiled ||| Mirror tiled ||| full ||| float )
    -- Default tiling algorithm partitions the screen into two panes
  where
    tiled = renamed [Replace "Tiled"] $ gapSpaced 10 $ Tall nmaster delta ratio
    full = renamed [Replace "Full"] $ gapSpaced 10 Full
    column3 = renamed [Replace "3col"] $ gapSpaced 10 $ ThreeColMid 1 (3 / 100) (1 / 2)
    float = renamed [Replace "Float"] $ simpleFloat
    myLayout = renamed [Replace "Spiral"] $ gapSpaced 10 $ IfMax 2 (Tall nmaster delta ratio) (spiral (6/7))
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2
    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100 -- Gaps bewteen windows
    myGaps gap = gaps [(U, gap), (D, gap), (L, gap), (R, gap)]
    gapSpaced g = spacing g . myGaps g
    -- Per workspace layout
    comLayout = onWorkspace comWs (tiled ||| full)
    devLayout = onWorkspace devWs (full ||| column3 ||| tiled ||| master)
    webLayout = onWorkspace webWs (tiled ||| full)
    wrkLayout = onWorkspace wrkWs (tiled ||| full)
    etcLayout = onWorkspace etcWs float
    -- Fullscreen
    fullScreenToggle = mkToggle (single NBFULL)
    -- Misc
    master =
      fixMastered (1 / 4) (1 / 2) (gapSpaced 10 $ Tall nmaster delta ratio)


--------[Startup]--------

myStartupHook = do
    spawnOnce "feh --bg-fill ~/wall.png"
    setDefaultCursor xC_left_ptr
    


--------[Scratchpads]--------

myScratchPads :: [NamedScratchpad]
myScratchPads =
  [
      NS "ncmpcpp"              launchMocp             (title =? "ncmpcpp")    (customFloating $ W.RationalRect 0.15 0.15 0.7 0.7)
    , NS "terminal"             launchTerminal         (title =? "scratchpad") (customFloating $ W.RationalRect 0.15 0.15 0.7 0.7)
  ]
  where
    launchMocp     = myTerminal ++ " -t ncmpcpp -e ncmpcpp"
    launchTerminal = myTerminal ++ " -t scratchpad -e fish"


--------[Manage]--------

myManageHook = composeAll
    [ className =? "Barrier"        --> doFloat
    , resource  =? "kdesktop"       --> doIgnore 
    , resource  =? "scratchpad"       --> floating 
    ]        
        where floating = customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)

--------[Event]--------
-- deprecated
myHandleEventHook :: Event -> X All
myHandleEventHook = dynamicPropertyChange "WM_NAME" (title =? "scratchpad" --> floating)
        where floating = customFloating $ W.RationalRect (1/6) (1/6) (2/3) (2/3)