{ configs, inputs, pkgs, home-manager, ... }:

{
  # Manage xmobar
  programs.xmobar = {
    enable = true;
    package = pkgs.haskellPackages.xmobar;
    extraConfig = ''
    Config { font = "xft:Ubuntu:size=11:antialias=true"
       , additionalFonts = ["xft:UbuntuMono Nerd Font Mono:size=12:antialias=true"]
       , border = NoBorder
       -- , borderColor = "#1d2128"
       , bgColor = "#2e3440"
       , fgColor = "#eceff4"
       , alpha = 230
       , position = TopW C 99
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [
                 -- weather monitor %KPHX%
                      Run Weather "KPHX" 
                        [ "-t", "<station>: <tempF> °F"
                        , "-L", "70"
			, "-H", "99"
			, "--normal", "#a3be8c"
			, "--high", "#bf616a"
			, "--low", "#88c0d0"
			] 36000

		 -- cpu monitor	%cpu%
                    , Run Cpu 
		        [ "-t", "<fn=1>\xe266</fn> <total>%"
		        , "-L", "3"
			, "-H", "50"
		        , "--normal", "#a3be8c"
		        , "--high", "#bf616a"
		        ] 10

		-- battery monitor %battery%
		    , Run Battery
		   	[ "-t", "<acstatus>"
		   	, "-L", "10"
			, "-H", "80"
		   	, "-l", "#bf616a"
			, "-n", "#eceff4"
			, "-h", "#a3be8c"
		   	-- battery specific options
			, "--"
				, "--lowt", "10" --Low threshold for charge strings (in %)
				, "--hight", "80" --High threshold for charge strings (in %)
				
				--Without above thresholds, the strings below would be based off of watts
				, "--lows", "<fn=1>\xf579</fn> "
				, "--mediums", "<fn=1>\xf57d</fn> "
				, "--highs", "<fn=1>\xf578</fn> "
				, "-O", "<fn=1>\xf583</fn> <left>% " --AC on (i.e. charging)
				, "-i", "<fn=1>\xf582</fn> <left>% " --AC idle (fully charged, yet charger is in) 
				, "-o", "<left>% " --AC off (i.e. not charging)
		   	] 10

		-- alsa monitor %alsa:default:Master%
		   , Run Alsa "default" "Master"
		       [ "-t", "<volumestatus>"
		       , "--suffix" , "True"
		       -- alsa specific options
		       , "--"
		                , "--on", "<fn=1>\xfa7d</fn> " -- on string
				, "--onc", "#a3be8c" -- on string color
				, "--off", "<fn=1>\xfa80</fn> " -- off string
				, "--offc", "#bf616a" -- off string color
	               ]

		-- memory monitor %memory%
                   , Run Memory 
		       [ "-t", "<fn=1>\xf85a</fn> <usedratio>%"
		       ] 10

		-- swap monitor %swap%
                   , Run Swap 
		       [ "-t", "<fn=1>\xf16c</fn> <usedratio>%"
		       ] 10

		-- date monitor %date%
                    , Run Date "%a %b %d <fc=#88c0d0>%l:%M</fc> %p" "date" 10

		-- Xmonad monitor %XmonadLog%
		    , Run XMonadLog

		-- Keyboard Layout monitor %kbd%
		 -- , Run Kbd
		     -- [ ("us", ("US")
		     -- , ("ipa-x-sampa", ("IPA")
		     -- ]
                    ]

       , sepChar = "%"
       , alignSep = "}{"
       , template = " %XMonadLog% } %KPHX% | %date% { %alsa:default:Master% | %cpu% | %memory% | %swap% | %battery% "
       }
    '';
  };
}
