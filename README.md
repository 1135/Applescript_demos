# Applescript_demos

### 用Applescript自动发送iMessage消息（文本/文件）
>注意：不论发送什么类型的iMessage消息（文本/文件），发送目标 都必须在iMessage程序的左侧列表中已经存在“对话”才行，也可以手动“编写新消息”即可在列表中添加一个“对话”。具体看文件内的相应注释。

###### sendMessage_text_or_text+file.applescript
```bash
命令行中输入命令:
osascript sendMessage_withfile.applescript hasexisted@icloud.com "1111111111111111111111111111111111" "NoAttachment" 
功能：只发送文本消息 不发送文件

osascript sendMessage_withfile.applescript hasexisted@icloud.com "send this text and a file" /Users/xx/Downloads/xx.sh
功能：发送文本消息 同时紧跟着发送文件
```

###### sendMessage_text_or_text+file.applescript
```
可用脚本编辑器Script Editor.app直接编辑 发送 文本消息(间隔几秒 循环发送)
```

###### sendMessage_random_file.scpt
```
随机发送文件（xx用户的Downloads:tmp文件夹下的文件）
```

###### sendMessage_only_text.applescript
```bash
命令行中输入命令发送 文本消息
osascript sendMessage_only_text.applescript 13699992222  "Hello there"
```
