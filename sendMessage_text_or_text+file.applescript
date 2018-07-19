-- 不论发送什么类型的iMessage消息（文本/文件），发送目标 都必须在iMessage程序的左侧列表中已经存在“对话”才行。（可以手动“编写新消息”即可在列表中添加一个“对话”）
-- --
--  --在命令行执行
-- 功能：只发送文本消息 不发送文件
-- osascript sendMessage_text_or_text+file.applescript hasexisted@icloud.com "1111111111111111111111111111111111" "NoAttachment" 

-- 功能：发送文本消息 同时紧跟着发送文件
-- osascript sendMessage_text_or_text+file.applescript hasexisted@icloud.com "send this text and a file" /Users/xx/Downloads/xx.sh

on run {targetBuddyPhone, targetMessage, targetFile}
	tell application "Messages"
		-- if Messages.app was not running, launch it
		set wasRunning to true
		if it is not running then
			set wasRunning to false
			launch
			close window 1
			my waitUntilRunning("Messages", 1)
			close window 1
		end if
		
		-- send the message
		set targetService to 1st service whose service type = iMessage
		set targetBuddy to buddy targetBuddyPhone of targetService
		
		set newFileName to targetFile
		set targetFileSend to (newFileName as POSIX file)
		
		if targetFileSend = "NoAttachment" then
			send targetMessage to targetBuddy
		else
			send targetMessage to targetBuddy
			send targetFileSend to targetBuddy
		end if
		-- if the app was not running, close the window
		if not wasRunning then
			close window 1
		end if
	end tell
end run