import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import global
import tcpmgr
Rectangle {
    property string searchText: ""


    Connections {
        target: TcpMgr
        function onSig_user_search(searchinfo) {
            console.log("searchinfo is : ",searchinfo)
        }

    }

    onSearchTextChanged: {
        search.text = "搜索：" +searchText
    }

    Rectangle {
        id:rect
        width:parent.width
        height:60
        visible:true
        anchors.leftMargin:10
        anchors.rightMargin:10
        RowLayout {
            anchors.fill:parent
            Image {
                source: "qrc:/src/add_friend.png"
                Layout.preferredWidth:32
                Layout.preferredHeight:32
            }
            Text {
                id:search
                text:"搜索uid/name"
                elide: Text.ElideRight  // 文本过长时显示省略号
            }
            Image {
                source: "qrc:/src/right_tip.png"
                Layout.preferredWidth:32
                Layout.preferredHeight:32
            }
        }

        MouseArea {
            anchors.fill:parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                const jsonData = {
                    "uid": searchText
                }
                const jsonStr = JSON.stringify(jsonData)
                TcpMgr.sig_send_data(Global.ID_SEARCH_USER_REQ, jsonStr)
                aplyFriendPage.show()
            }
        }
    }
    ApplyFriendPage {
        id:aplyFriendPage
    }

    function slot_user_search() {

    }

}
