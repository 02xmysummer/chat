import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

TextField {
    id: input
    width: parent.width - 34
    height: 30
    anchors.horizontalCenter:parent.horizontalCenter

    property string hint: ""
    Text {
        anchors.fill: parent
        text: input.hint
        leftPadding: 20

        color: "#999999"
        verticalAlignment: Text.AlignVCenter
        visible: !input.text && !input.activeFocus
    }

    background: Rectangle {
        radius: 4
        border.width: 1
        border.color: input.focus ? "#2196F3" : "#e0e0e0"
    }
}
