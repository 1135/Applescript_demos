#!/bin/sh
if [ "$#" -eq 1 ]; then stdinmsg=$(cat); fi
exec <"$0" || exit; read v; read v; read v; exec /usr/bin/osascript - "$@" "$stdinmsg"; exit

-- 脚本参考
-- https://gist.github.com/aktau/8958054
-- 发送图片命令
-- bash sendMessage_text_or_file.sh hasexisted@163.com /Users/xx/Downloads/1.jpg
-- 需要发送文本命令，自行修改57-62行

-- another way of waiting until an app is running
on waitUntilRunning(appname, delaytime)
    repeat until my appIsRunning(appname)
        tell application "Messages" to close window 1
        delay delaytime
    end repeat

    -- the fact that Messages.app is running
    -- does not mean it is ready to send,
    -- unfortunately, add another small delay
    delay delaytime
end waitUntilRunning

on appIsRunning(appName)
    application appname is running
end appIsRunning

-- use system events (unused)
on SysevAppIsRunning(appName)
    tell application "System Events" to (name of processes) contains appName
end appIsRunning

-- use finder (unusged)
on finderAppIsRunning(appName)
    tell application "Finder" to (name of every process) contains appName
end appIsRunning

-- taken from:
-- http://stackoverflow.com/questions/11812184/how-to-send-an-imessage-text-with-applescript-only-in-provided-service
-- thanks to users @Senseful and @DigiLord
on run {targetBuddyPhone, targetMessage}
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

        -- 下面1行代码 发送普通文本消息(已被注释)
        -- send targetMessage to targetBuddy
        -- 下面3行代码 发送文件
        set newFileName to targetMessage -- "/Users"
        set targetFileSend to (newFileName as POSIX file)
        send targetFileSend to targetBuddy

        -- if the app was not running, close the window
        if not wasRunning
            close window 1
        end if
    end tell
end run