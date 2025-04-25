import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts


FramelessWindow {
    id:sendfileDialog
    width: 300
    height:440
    tipTopBtnShow: false
    minBntShow: false
    maxBntShow: false
    quitBntShow: true
    visible:false
    ColumnLayout {
        anchors.fill:parent
        anchors.leftMargin:10
        anchors.rightMargin:10

        //顶部占位符
        Item {
            Layout.fillWidth:true
            height:30
        }
        Text {
            text:qsTr("发送给：")
            font.pixelSize: 16
        }
        //发送者信息
        RowLayout {
            Layout.fillWidth:true
            height:40
            Image {
                source: "file:///D://code/qt//untitled1//avatar.jpg"
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                fillMode: Image.PreserveAspectFit
            }
            Text {
                text:qsTr("xmy")
                font.pixelSize:14
            }
        }
        //发送文件信息
        RowLayout {
            Layout.fillWidth:true
            height:40
            Image {
                source: "file:///D://code/qt//untitled1//avatar.jpg"
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40
                fillMode: Image.PreserveAspectFit
            }
            ColumnLayout {
                width: 30
                Layout.fillHeight:true
                Layout.rightMargin:10
                Text {
                    text:qsTr("avatar.jpg")
                    font.pixelSize:14
                }
                Text {
                    text:qsTr("50kb")
                    font.pixelSize:14
                }

            }

            Item {
                Layout.fillWidth:true
                height:40
            }
            Image {
                id:deleteImg
                source:"qrc:/src/delete.png"
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                visible:false
                MouseArea {
                    anchors.fill:parent
                    onClicked: {
                        console.log("delete")
                    }
                }
            }

        }

        Item {
            Layout.fillWidth:true
            Layout.fillHeight:true
        }
    }
}
