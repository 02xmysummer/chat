import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
Rectangle {
    id:centerControlArea
    property string thisQml: ""

    onThisQmlChanged: {
        searchArea.recover()
    }

    ColumnLayout {
        anchors.fill: centerControlArea
        spacing: 0
        //上侧搜索栏

        SearchArea {
            id:searchArea
            Layout.fillWidth: true
            height: 60
            onSearchTextChanged: {
                if(!searchText)
                    return
                searchList.searchText = searchText
            }
        }


        ChatList {
            id:chatList
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: thisQml === "ChatList.qml"
            onVisibleChanged: {
                if(!visible) return
            }
        }
        UserList {
            id:userList
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: thisQml === "UserList.qml"
        }

        SearchList {
            id:searchList
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: thisQml === "SearchList.qml"
        }
    }

}
