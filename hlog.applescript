#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title hlog
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

on add_leading_zeros(this_number, max_leading_zeros)
	return text (max_leading_zeros * -1) thru -1 of ("00000000000000000" & this_number)
end add_leading_zeros

on splitText(inputString, myDelimiter)
	set oldDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to myDelimiter
	set outputArray to every text item of inputString
	set AppleScript's text item delimiters to oldDelimiters
	return outputArray
end splitText

on list2string(theList, theDelimiter)

    -- First, we store in a variable the current delimiter to restore it later
    set theBackup to AppleScript's text item delimiters

    -- Set the new delimiter
    set AppleScript's text item delimiters to theDelimiter

    -- Perform the conversion
    set theString to theList as string

    -- Restore the original delimiter
    set AppleScript's text item delimiters to theBackup

    return theString
end list2string


on jump2today()
tell application "System Events" 
	-- open today page throug command palette
    keystroke "o" using {command down}
	delay 0.1
	keystroke "today"
	delay 0.3
	key code 76
	delay 0.1
	-- Swith away and the go back to journal page to get focus
	key code 19 using {option down, shift down}
	delay 0.1
	key code 18 using {option down, shift down}
	delay 0.1
end tell
end

on jump2InsertPosition()
	tell application "System Events" 
		-- move cursor to the end of the page
		key code 125 using {command down} 
		delay 0.01
		key code 76
		delay 0.1
	end tell
end

on run argv
    set raw to (item 1 of argv)
    set warray to splitText(raw, " ")
	set tag to ""
    -- display dialog warray
	set tmp to (item 1 of warray) as string
	if tmp is equal to "p" then
		set tag to tmp
	end if
	set content to ""
	if tag is not equal to "" then
		set warray to items 2 thru -1 of warray
	end if
	set content to list2string(warray, " ")
	set the clipboard to content
	tell application "System Events"
		set frontmostProcess to first process where it is frontmost
		set appName to name of frontmostProcess
	end tell
	tell application "Hepta" to activate
	jump2today()
	jump2InsertPosition()	
	if tag is equal to "p" then
		tell application "System Events" to keystroke "_insert_pomo_" 
	else
		tell application "System Events" to keystroke "_insert_log_" 
	end if
	delay 0.5
	if appName is not equal to "Electron" then
		tell application appName to activate
	end if
end run