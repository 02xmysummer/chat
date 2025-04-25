import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

/******************************************************************************
 *
 * @file       ChatArea.qml
 *              聊天区域
 * @author     xuorz
 * @date       2025/03/18
 * @history
 *****************************************************************************/

ColumnLayout {
    id:chatArea
    spacing: 0


    //消息记录框
    ChatContent {
        id:chatContent
        Layout.fillWidth: true
        Layout.fillHeight: true

    }

    //工具栏区域
    ChatTools {
        id:tools
        Layout.fillWidth: true
        height: 22
        onSendMessage: function(message){
            chatContent.appendMessage(message)
        }
    }

    //底部消息输入框
    ChatInput {
        id:chatInput
        Layout.fillWidth: true
        height: 120
        onSendMessage: function(message){
            chatContent.appendMessage(message)
        }
    }
}



