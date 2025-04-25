import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
/******************************************************************************
 *
 * @file       UserItem.qml
 *              用户列表项
 * @author     xuorz
 * @date       2025/03/17
 * @history
 *****************************************************************************/
Rectangle {
    id:userItem
    height: 60
    property bool isActive: false
    // 添加点击信号
    signal clicked()
    color: isActive ? "#C8C7C6" : (mouseArea.containsMouse ? "#DEDCDA" : "#E5E4E4")
    RowLayout {
        anchors.fill: parent
        spacing: 12
        anchors.leftMargin:10
        anchors.rightMargin:10
        // 头像
        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            source: model.avatar|| ""
        }

        Text {
            text: model.name || ""
            font.pixelSize: 14
            color: "#000000"
            elide: Text.ElideRight  // 文本过长时显示省略号
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: userItem.clicked()
    }
}
