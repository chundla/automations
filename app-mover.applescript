(* 
	Script to check for the number of displays connected and move windows as desired.
 *)


use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use framework "AppKit"
use scripting additions
-- Find the resolution of all connected displays
set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
set countDisplays to count of items in allFrames
set applicationList to {{"Microsoft Outlook", {0, 38, 1728, 1057}}, {"Messages", {3649, 276, 4728, 901}}}
set twoApplicationList to {{"Microsoft Outlook", {-1920, 25, 0, 1080}}, {"Messages", {-960, 553, 0, 1081}}}
set applicationProcessList to {{"Signal", {{3648, -350}, {1079, 625}}}, {"Slack", {{3649, 901}, {1079, 644}}}, {"KeePassXC", {{3648, -350}, {1080, 1895}}}}
set twoApplicationProcessList to {{"Signal", {{-960, 25}, {960, 528}}}, {"Slack", {{-1920, 25}, {960, 1055}}}, {"KeePassXC", {{-1920, 25}, {1920, 1055}}}}

tell application "Finder"
	set env to POSIX path of ((path to me as text) & "::.env") as string
end tell
set secret to (read env)

if countDisplays is equal to 3 then
	repeat with i from 1 to number of items in applicationList
		set appName to item i of applicationList
		set applicationNameBTT to "moved-" & (item 1 of appName)
		if exists application (item 1 of appName) then
			tell application (item 1 of appName)
				if exists window 1 then
					if (bounds of window 1) is not equal to (item 2 of appName) then
						tell application "BetterTouchTool"
							set_string_variable applicationNameBTT to "Yes" shared_secret secret
						end tell
						set bounds of window 1 to (item 2 of appName)
					else
						tell application "BetterTouchTool"
							set_string_variable applicationNameBTT to "No" shared_secret secret
						end tell
					end if
				end if
			end tell
		end if
	end repeat
	repeat with i from 1 to number of items in applicationProcessList
		set processName to item i of applicationProcessList
		set processNameBTT to "moved-" & (item 1 of processName)
		tell application "System Events"
			if exists application process (item 1 of processName) then
				tell application process (item 1 of processName)
					if exists window 1 then
						if (get {position, size} of window 1) is not equal to (item 2 of processName) then
							tell application "BetterTouchTool"
								set_string_variable processNameBTT to "Yes" shared_secret secret
							end tell
							tell window 1
								set {position, size} to (item 2 of processName)
							end tell
						else
							tell application "BetterTouchTool"
								set_string_variable processNameBTT to "No" shared_secret secret
							end tell
						end if
					end if
				end tell
			end if
		end tell
	end repeat
end if

if countDisplays is equal to 2 then
	repeat with i from 1 to number of items in twoApplicationList
		set appName to item i of twoApplicationList
		set applicationNameBTT to "moved-" & (item 1 of appName)
		if exists application (item 1 of appName) then
			tell application (item 1 of appName)
				if exists window 1 then
					if (bounds of window 1) is not equal to (item 2 of appName) then
						tell application "BetterTouchTool"
							set_string_variable applicationNameBTT to "Yes" shared_secret secret
						end tell
						set bounds of window 1 to (item 2 of appName)
					else
						tell application "BetterTouchTool"
							set_string_variable applicationNameBTT to "No" shared_secret secret
						end tell
					end if
				end if
			end tell
		end if
	end repeat
	repeat with i from 1 to number of items in twoApplicationProcessList
		set processName to item i of twoApplicationProcessList
		set processNameBTT to "moved-" & (item 1 of processName)
		tell application "System Events"
			if exists application process (item 1 of processName) then
				tell application process (item 1 of processName)
					if exists window 1 then
						if (get {position, size} of window 1) is not equal to (item 2 of processName) then
							tell application "BetterTouchTool"
								set_string_variable processNameBTT to "Yes" shared_secret secret
							end tell
							tell window 1
								set {position, size} to (item 2 of processName)
							end tell
						else
							tell application "BetterTouchTool"
								set_string_variable processNameBTT to "No" shared_secret secret
							end tell
						end if
					end if
				end tell
			end if
		end tell
	end repeat
end if
