-- ���۷���ʲô���͵�iMessage��Ϣ���ı�/�ļ���������Ŀ�� ��������iMessage���������б����Ѿ����ڡ��Ի������С��������ֶ�����д����Ϣ���������б������һ�����Ի�����
-- --
--  --��������ִ��
-- ���ܣ�ֻ�����ı���Ϣ �������ļ�
-- osascript sendMessage_text_or_text+file.applescript hasexisted@icloud.com "1111111111111111111111111111111111" "NoAttachment" 

-- ���ܣ������ı���Ϣ ͬʱ�����ŷ����ļ�
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