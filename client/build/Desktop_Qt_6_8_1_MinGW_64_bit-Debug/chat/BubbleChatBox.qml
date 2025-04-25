import QtQuick
import QtQuick.Layouts
import global 1.0
/******************************************************************************
 *
 * @file       BubbleChatBox.qml
 *              聊天气泡框
 * @author     xuorz
 * @date       2025/03/18
 * @history
 *****************************************************************************/
Rectangle {
    id: bubble
    property string avatar: ""
    property string userName: ""
    property string message
    property bool isSelf: false
    property int type: Global.Text

    // 整体高度根据内容自适应
    height: rowLayout.implicitHeight + 20
    color: "#F5F5F5"
    RowLayout {
        id: rowLayout
        layoutDirection:isSelf ? Qt.LeftToRight : Qt.RightToLeft
        spacing: 8
        anchors {
            fill: parent
            rightMargin: bubble.isSelf ? 20 : 0
            leftMargin: isSelf ? 0 : 20
        }
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout {
            id: messageLayout
            Layout.alignment: Qt.AlignTop  // 改为顶部对齐
            // spacing: 4

            Text {
                id: nameText
                text: userName
                font.pixelSize: 12
                color: "#666666"
                Layout.alignment: isSelf?  Qt.AlignRight : Qt.AlignLeft
            }
            Rectangle {
                id: messageBubble
                Layout.preferredWidth: {
                    if (type === Global.Text) {
                        return Math.min(contentLoader.implicitWidth + 16, parent.parent.width * 0.7)
                    } else if (type === Global.Image) {
                        return Math.min(100, parent.parent.width * 0.7) // 调整图片宽度
                    }
                }
                implicitHeight: type === Global.Text ? contentLoader.implicitHeight + 16 : messageBubble.width
                radius: 8
                color: "#95EC69"  // 保持背景色一致

                Loader {
                    id: contentLoader
                    anchors.fill: parent
                    sourceComponent: {
                        if (type === Global.Text) {
                            return textComponent
                        } else if (type === Global.Image) {
                            return imageComponent
                        }
                    }
                }
            }
        }

        Image {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignTop  // 改为顶部对齐
            // radius: width/2
            clip: true
            source: avatar
            fillMode: Image.PreserveAspectCrop
        }
    }


    Component {
        id: textComponent
        Text {
            anchors.centerIn: parent  // 添加居中布局
            text: message
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            width: parent.width - 16  // 减去边距
            font.pixelSize: 14
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter  // 文字水平居中
            verticalAlignment: Text.AlignVCenter    // 文字垂直居中
        }
    }

    Component {
        id: imageComponent
        Image {
            source: Qt.resolvedUrl(message)
            fillMode: Image.PreserveAspectFit
            width: parent.width
            height: sourceSize.height * (width / sourceSize.width)
        }
    }
}
