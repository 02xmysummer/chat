import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Rectangle {
    id: leftNavBar

    ColumnLayout {
        anchors.fill: leftNavBar
        spacing: 10
        RoundButton {
            id:avatarButton
            property int icon_width:6 * leftNavBar.width / 7
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 30
            Layout.preferredWidth: icon_width
            Layout.preferredHeight: icon_width
            icon.source: "qrc:/src/avatar.jpg"
            icon.width: icon_width
            icon.height: icon_width
            icon.color: "transparent"
            background: Rectangle {
                radius: width/2
                color: "transparent"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true  // 启用悬浮检测
                cursorShape: Qt.PointingHandCursor  // 设置鼠标形状为手形
            }
        }
        ListView {
            id:listView
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width
            spacing: 5
            model: ListModel {
                id:listModel
                ListElement { icon: "chat"; centerName:"ChatList.qml"; active: true }
                ListElement { icon: "contacts"; centerName:"UserList.qml"; active: false }
            }

            delegate: Rectangle {
                width: parent.width
                height: 50
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    width: 24
                    height: 24
                    source: model.active ? "qrc:/src/" + model.icon + "_active.png" :
                                           "qrc:/src/" + model.icon + ".png"
                    opacity: model.active ? 1.0 : 0.5

                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        for (var i = 0; i < parent.ListView.view.model.count; i++) {
                            parent.ListView.view.model.setProperty(i, "active", i === index)
                        }
                        const centerName = listModel.get(index).centerName
                        p_object.switchCenterContent(centerName)
                        console.log("switch center to", centerName)
                    }
                }
                Component.onCompleted: {
                    if(index !== 0)
                        return
                    const centerName = listModel.get(0).centerName
                    p_object.switchCenterContent(centerName)
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

}
