import QtQuick
import QtQuick.Layouts

Rectangle {
    id:rightManagedZone
    property string thisQml: "ChatArea.qml"

    property string name: p_object.name
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Item {
            Layout.fillWidth: true
            height: 60
            Rectangle {
                id:topRect
                width: parent.width
                height: 30
                color: "transparent"

            }
            Rectangle {
                width: parent.width
                height: 30
                color: "#F5F5F5"
                anchors.top:topRect.bottom
            }
            Text {
                id:title
                anchors {
                    left: parent.left        // 左对齐父元素
                    leftMargin: 20          // 左侧距离20
                    verticalCenter: parent.verticalCenter  // 垂直居中
                }
                text: name
                font.pixelSize: 20
            }
        }


        ChatArea {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: rightManagedZone.thisQml === "ChatArea.qml"
        }

        FriendAuthList {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: rightManagedZone.thisQml === "FriendAuthList.qml"
        }

    }
}
