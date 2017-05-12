#!/usr/bin/env osascript
global frontApp, frontAppName, windowTitle
set windowTitle to ""
tell application "System Events"
	set frontApp to first application process whose frontmost is true
	set frontAppName to name of frontApp
	tell process frontAppName
		tell (1st window whose value of attribute "AXMain" is true)
			set windowTitle to value of attribute "AXTitle"
		end tell
	end tell
end tell

set thePath to ""
try	tell application (path to frontmost application as text)		set thePath to (path of document 1) as text	end tellon error	try		tell application "System Events" to tell (process 1 where frontmost is true)			set thePath to value of attribute "AXDocument" of window 1		end tell
	end tryend try


return {frontAppName,thePath}
