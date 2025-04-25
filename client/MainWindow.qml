import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Rectangle {
    id:main
    QtObject {
        id: p_object
        property string name: ""
        signal switchCenterContent(var s)
        signal switchRightContent(var s)
        onSwitchCenterContent: (contentName)=> {
           centerControlArea.thisQml = String(contentName)
       }
        onSwitchRightContent: (contentName)=> {
            rightManagedZone.thisQml = String(contentName)
        }
    }
    color: "transparent"  // 设置为透明\


    property var rightList: [
        "ChatArea.qml","UserInfoArea.qml"
    ]


    RowLayout {
        anchors.fill: main
        spacing:0
        LeftNavBar {
            id:leftNavBar
            Layout.preferredWidth: 56
            Layout.fillHeight: true
            color: "#2E2E2E"
        }
        CenterControlArea {
            id:centerControlArea
            Layout.preferredWidth: 224
            Layout.fillHeight: true
            // thisQml: centertList[leftNavBar.currentIndex]
        }
        RightManagedZone {
            id:rightManagedZone
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }
    }
}
