import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
/******************************************************************************
 *
 * @file       UserList.qml
 *              用户列表
 * @author     xuorz
 * @date       2025/03/16
 * @history
 *****************************************************************************/
ListView {
    id:userList
    clip: true  // 防止内容溢出
    property int activeIndex: 0
    property var randomNicknames : [
      "星河漫游者",
      "夜羽轻尘",
      "幻梦追光者",
      "墨染青衫",
      "风语者·零",
      "量子漫游家",
      "云端拾梦人",
      "幻月流萤",
      "墨色玄音",
      "星轨编织者",
      "暗夜微光",
      "雾隐行者",
      "幻夜星辰",
      "墨影随风",
      "风吟浅唱",
      "光年之外",
      "幽影迷踪",
      "幻境旅人",
      "墨色涟漪",
      "星海孤舟",
      "雾里看花",
      "暗夜精灵",
      "幻梦之翼",
      "墨色独白",
      "风起云卷",
      "光影游侠",
      "幽夜魅影",
      "幻夜行者",
      "墨色诗篇",
      "星辉漫游者",
      "雾中漫步者",
      "暗夜独行者",
      "幻梦编织者",
      "墨色旋律",
      "风起时",
      "光年信使",
      "幽影幻梦",
      "幻夜微光",
      "墨色微澜"
    ];

    boundsBehavior:Flickable.StopAtBounds
    ScrollBar.vertical: ScrollBar {
        active: true
        // policy: ScrollBar.AlwaysOn  // Always show scrollbar
    }
    ListModel {
        id: dataModel
    }
    model: dataModel
    delegate: UserItem {
        width: userList.width
        isActive: index === userList.activeIndex

        onClicked: {
            activeIndex = index
            if(activeIndex === 0){
                p_object.name =  qsTr("新的朋友")
                p_object.switchRightContent("FriendAuthList.qml")
            }
            else {

            }
        }
    }

    Component.onCompleted: {
        dataModel.append({
            "name" : qsTr("新的朋友"),
            "avatar" : "qrc:/src/add_friend.png",
        })
        for(let i = 0; i < randomNicknames.length; ++i) {
            var randomavatorIndex = Math.floor(Math.random() * 20) + 1;
            dataModel.append({
                "name" : randomNicknames[i],
                "avatar" : "qrc:/states/"+ randomavatorIndex + ".jpg",
            })
        }
    }
}
