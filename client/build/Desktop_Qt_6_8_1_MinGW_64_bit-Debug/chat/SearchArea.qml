import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
Rectangle {
    id:searchBox
    signal clicked()
    signal exited()
    property string searchIcon: "qrc:/src/search.png"
    property string searchInfo:"搜索"
    readonly property alias searchText:searchInput.text
    RowLayout {
        width: searchBox.width * 0.8
        height:searchBox.height * 0.5
        anchors.centerIn:parent
        spacing: 10
        Rectangle {
            Layout.fillWidth:true
            Layout.fillHeight:true
            color: searchInput.focus? "#F9F9F9" :"#E2E2E2"
            border.width: searchInput.focus? 1 : 0
            border.color: searchInput.focus? "#DEDCDB" : "#E2E2E2"
            radius:5
            RowLayout {
                anchors.fill:parent

                Image {
                    source:searchIcon
                    height: 20
                    width: 20
                }
                TextField {
                    id:searchInput
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    verticalAlignment: Text.AlignVCenter
                    placeholderText: focus ? "" : searchInfo
                    background: Rectangle {
                        color: "transparent"
                    }
                    cursorDelegate: Rectangle {
                        width: 1
                        color: "black"
                    }

                    selectByMouse: true
                    selectionColor: "#E8E8E8"
                    selectedTextColor: "black"
                    onFocusChanged: {
                        if(focus) {
                            closeBtn.visible = true
                            searchBox.clicked()
                        } else{
                            closeBtn.visible = false
                        }
                    }
                }
                //关闭按钮
                Rectangle {
                    id:closeBtn
                    width:20
                    height:20
                    radius:width
                    color:"#E2E2E2"
                    visible: false
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.8
                        height: 1
                        rotation: 45
                        color:"#929292"
                    }
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width * 0.8
                        height: 1
                        rotation: -45
                        color:"#929292"
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            searchInput.clear()
                            searchInput.focus = false
                            searchBox.exited()

                        }
                    }
                }
                Item {
                    width:5
                    Layout.fillHeight:true
                }
            }

        }
        Rectangle {
            id:rightBtn
            width: 30
            Layout.fillHeight: true
            color:"#E2E2E2"
            Image {
                id:image
                width:20
                height:20
                anchors.centerIn: parent
                source:"qrc:/src/add_friend_normal.png"
                visible: true
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        toAddFriend()
                    }
                }
            }
            Text {
                id:cancle
                width:20
                height:20
                anchors.centerIn: parent
                text:qsTr("取消")
                font.pointSize:12
                visible:!image.visible
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        recover()
                    }
                }
            }
        }

    }





    function recover() {
        searchIcon = "qrc:/src/search.png"
        searchInfo = "搜索"
        rightBtn.color = "#E2E2E2"
        image.visible = true
        searchInput.clear()
    }

    function toAddFriend() {
        console.log("添加好友")
        searchIcon = "qrc:/src/add_friend_normal.png"
        searchInfo = "uid/邮箱"
        rightBtn.color = "transparent"
        image.visible = false
        p_object.switchCenterContent("SearchList.qml")
    }
}
