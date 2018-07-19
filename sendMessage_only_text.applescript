-- osascript sendMessage_only_text.applescript 13699992222  "Hello there"
on run {targetBuddyPhone, targetMessage}
	tell application "Messages"
		set targetService to 1st service whose service type = iMessage
		set targetBuddy to buddy targetBuddyPhone of targetService
		send targetMessage to targetBuddy
	end tell
end run