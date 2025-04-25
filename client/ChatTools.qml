import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Dialogs
import global
Rectangle {
    height: 30
    Layout.fillWidth: true
    color: "#F5F5F5"

    signal sendMessage(var message)

    RowLayout {
        anchors.leftMargin: 10
        spacing: 10
        anchors.fill: parent
        // 表情按钮
        HoverImage {
            width: 20
            height: 20
            color: "#F5F5F5"
            defaultSource: "qrc:/src/emoji.png"
            // hoverSource:
        }

        // 文件按钮
        HoverImage {
            width: 20
            height: 20
            color: "#F5F5F5"
            defaultSource: "qrc:/src/folder_black.png"
            onClicked: {
                fileDialog.open()
            }
        }
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
    FileDialog {
        id: fileDialog
        title: "选择文件"
        nameFilters: [
            "所有文件 (*.*)",
            "图片文件 (*.jpg *.jpeg *.png *.gif *.bmp *.webp)"
        ]
        onAccepted: {
            console.log("选择的文件:", fileDialog.selectedFile)
            sendFileDialog.show()
        }
    }
    SendFileDialog {
        id:sendFileDialog

        // onAccepted: {
        //     var message = {
        //         "userName": "xmy",
        //         "avatar": "qrc:/src/avatar.jpg",
        //         "message": String(fileDialog.selectedFile),
        //         "isSelf": true,
        //         "type": Global.Image
        //     }
        //     sendMessage(message)
        // }
    }


}
