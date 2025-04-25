import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Dialogs
import global
/******************************************************************************
 *
 * @file       ChatInput.qml
 *              聊天内容输入框
 * @author     xuorz
 * @date       2025/03/18
 * @history
 *****************************************************************************/
Rectangle {
    signal sendMessage(var message)
    color: "#F5F5F5"

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20

        spacing: 0
        ScrollView {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
            clip: true

            TextArea {
                id: messageInput
                width: parent.width
                height: Math.max(implicitHeight, parent.height)
                wrapMode: TextArea.Wrap
                font.pointSize: 12
                selectByMouse: true
                verticalAlignment: TextArea.AlignTop

                // 移除边框
                background: Rectangle {
                    color: "transparent"
                }
                // 添加光标颜色设置
                cursorDelegate: Rectangle {
                    width: 1
                    color: "black"
                }
            }
        }
        Rectangle {
            Layout.fillWidth: true
            height:30
            color: "transparent"
            Button {
                anchors.right: parent.right
                width: 68
                height: 32
                anchors.verticalCenter: parent.verticalCenter

                hoverEnabled: true

                background: Rectangle {
                    id: buttonBackground
                    color: parent.hovered ? "#06AE56" : "#07C160"
                    radius: 4
                }

                contentItem: Text {
                    text: "发送"
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                property bool isSelf : true
                onClicked:{
                    if (messageInput.text === "")
                        return
                    console.log(messageInput.text)
                    var message = {
                        "userName": "xmy",
                        "avatar": "qrc:/src/avatar.jpg",
                        "message": messageInput.text,
                        "isSelf": isSelf,
                        "type": Global.Text
                    }
                    sendMessage(message)
                    messageInput.clear()
                    messageInput.forceActiveFocus()
                    isSelf = !isSelf
                }
            }
        }
    }

}

