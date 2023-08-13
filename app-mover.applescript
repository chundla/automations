(* 
	Script to check for the number of displays connected and move windows as desired.
 *)

tell application "Image Events"
	launch
	set countDisplays to count displays
	quit
end tell

if countDisplays is equal to 3 then
	tell application "System Events"
		if exists application "Microsoft Outlook" then
			tell application "Microsoft Outlook"
				if exists window 1 then
					set bounds of window 1 to {0, 38, 1728, 1057}
				end if
			end tell
		end if
		if exists application "Messages" then
			tell application "Messages"
				if exists window 1 then
					set bounds of window 1 to {3649, 276, 4728, 901}
				end if
			end tell
		end if
		if exists application process "Signal" then
			tell application process "Signal"
				if exists window 1 then
					tell window 1
						set {position, size} to {{3648, -350}, {1079, 625}}
					end tell
				end if
			end tell
		end if
		if exists application process "Slack" then
			tell application process "Slack"
				if exists window 1 then
					tell window 1
						set {position, size} to {{3649, 901}, {1079, 644}}
					end tell
				end if
			end tell
		end if
		if exists application process "KeePassXC" then
			tell application process "KeePassXC"
				if exists window 1 then
					tell window 1
						set {position, size} to {{3648, -350}, {1080, 1895}}
					end tell
				end if
			end tell
		end if
	end tell
end if
