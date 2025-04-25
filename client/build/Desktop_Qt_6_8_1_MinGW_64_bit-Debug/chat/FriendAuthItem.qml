import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id:friendAuthItem
    width: parent.width
    height: 60
    Rectangle {
        width: parent.width
        height: 1  // 线条的高度
        color: "#E7E7E7"  // 线条的颜色
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    RowLayout {
        width: parent.width * 0.8
        height:parent.height * 0.8
        anchors.centerIn: parent
        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            source: model.avatar|| ""
        }
        ColumnLayout {
            Text {
                text:qsTr(model.name || "")
                font.pointSize: 12
            }
            Text {
                text:qsTr(model.desc || "")
                font.pointSize: 12
            }
        }
        Item {
            Layout.fillWidth:true
            height:parent.height
        }

        Text {
            text:qsTr("已添加")
            font.pointSize: 8
        }
    }
}
