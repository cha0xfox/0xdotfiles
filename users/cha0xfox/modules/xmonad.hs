import XMonad
import XMonad.Config.Desktop
import XMonad.Operations
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
--import qualified DBus as D
--import qualified DBus.Client as D
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
import XMonad.Hooks.EwmhDesktops
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
import Text.XHtml (h1)


--------[main]--------

main = do
  --xmproc2 <- spawnPipe "xmobar -x 2 ~/.xmobarrc"
  xmonad $ docks $ewmh  def 
    { terminal    = myTerminal
    , modMask     = mod4Mask
    , keys        = myKeys
    , startupHook = myStartupHook
    , workspaces  = withScreens 4 myWS
    , layoutHook  = myLayouts
    , borderWidth = 0
    , focusedBorderColor = "#df0252"
    , normalBorderColor = "#282a36"
--    , logHook     = myLogHook
--    , logHook     = dynamicLogWithPP xmobarPP
--                        { ppOutput = hPutStrLn xmproc2
--                        , ppTitle = xmobarColor "green" "" . shorten 50
--                        }
    , manageHook  = myManageHook <+> manageDocks <+> namedScratchpadManageHook scratchpads
    , handleEventHook = fullscreenEventHook
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

myFish = "alacritty"
myTerminal = "alacritty --class=floatterm"


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
    -- spawn floating terminal
    , ((modm              , xK_Return), spawn myTerminal)

    -- Launcher

    , ((modm,               xK_d     ), spawn "rofi -matching fuzzy rofi -show drun -modi drun,run -show-icons")
    , ((modm .|. shiftMask, xK_d     ), spawn "sh ~/0xdotfiles/users/cha0xfox/modules/scripts/shutmenu.sh")
    , ((modm .|. shiftMask, xK_f     ), spawn "rofi -lines 10 -padding 0 -show search -modi search:~/0xdotfiles/users/cha0xfox/modules/scripts/rofi-web-search.py -i -p 'Search: '")

    -- Restart xmonad

    , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Kill window

    , ((modm .|. shiftMask, xK_c     ), kill)

    -- Copy screenshot 

    , ((modm,               xK_p     ), spawn "maim -s -u | tee ~/Screenshots/screen-$(date +%s).png | xclip -selection clipboard -t image/png")

    , ((modm .|. shiftMask, xK_p     ), spawn "maim -st 0 | convert - -resize 1x1 -format '%[pixel:p{0,0}]' info:- | xclip -selection clipboard")

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
    , ((modm .|. shiftMask, xK_a), namedScratchpadAction scratchpads "term")

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
    tiled = renamed [Replace "Tiled"] $ gapSpaced 5 $ Tall nmaster delta ratio
    full = renamed [Replace "Full"] $ gapSpaced 5 Full
    column3 = renamed [Replace "3col"] $ gapSpaced 5 $ ThreeColMid 1 (3 / 100) (1 / 2)
    float = renamed [Replace "Float"] $ simpleFloat
    myLayout = renamed [Replace "Spiral"] $ gapSpaced 5 $ IfMax 2 (Tall nmaster delta ratio) (spiral (6/7))
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2
    -- Percent of screen to increment by when resizing panes
    delta = 3 / 100 
    -- Gaps bewteen windows
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
      fixMastered (1 / 4) (1 / 2) (gapSpaced 5 $ Tall nmaster delta ratio)


--------[Startup]--------

myStartupHook = do
    spawnOnce "feh --bg-fill ~/Wallpapers/wall.jpg"
    spawnOnce "sh ~/0xdotfiles/users/cha0xfox/modules/scripts/autostart.sh"
    setDefaultCursor xC_left_ptr
    


--------[Scratchpads]--------

-- scratchPads
scratchpads :: [NamedScratchpad]
scratchpads = [
    NS "term" "alacritty --class scratchpad" (resource =? "scratchpad")
        (customFloating $ W.RationalRect (0.2) (0.1) (0.6) (0.7))
  ]



--------[Managehook]--------

myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [title =? t --> doCenterFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
    ]
    where
		myCFloats = ["alacritty-float", "MPlayer", "mpv",	"Gimp", "feh", "Viewnior", "Gpicview", "Kvantum Manager", "qt5ct", "VirtualBox Manager", "qemu", "Qemu-system-x86_64", "Lxappearance", "Nitrogen", "Arandr", "Pavucontrol", "Xfce4-power-manager-settings", "Nm-connection-editor"]
		myTFloats = ["Downloads", "Save As...", "Getting Started", "floatterm"]
		myRFloats = []
		myIgnores = ["desktop_window"]
