import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Controls.Material


/******************************************************************************
 *
 * @file       FriendAuthList.qml
 * @brief      好友认证列表
 *
 * @author     xuorz
 * @date       2025/04/24
 * @history
 *****************************************************************************/


ListView {
    id:friendAuthList
    boundsBehavior:Flickable.StopAtBounds
    width: parent.width - 20

    property var names : [
        "CyberPunk42",
        "ZackTheHacker",
        "CodeWizard2077",
        "PixelPioneer",
        "JavaJunkie_99",
        "NodeNinjaX",
        "PyroPanda",
        "RustyRebel",
        "CyberLlama",
        "ZackAttack_7",
        "GigaGolang",
        "CppCrusader",
        "JavaJedi",
    ]
    ScrollBar.vertical: ScrollBar {
        padding: 2  // 添加内边距
        policy: ScrollBar.AsNeeded  // 需要时才显示
        interactive: true  // 可以交互
    }
    ListModel {
        id: dataModel
    }
    model:dataModel
    delegate: FriendAuthItem {
        id:friendAuthItem
        width: friendAuthList.width
    }

    Component.onCompleted: {
        for(let i = 0; i < names.length; ++i){
            dataModel.append({
                "name":names[i],
                "avatar":"qrc:/states/" + (i + 1) + ".jpg",
                "desc":"nihao"
            })
        }
    }
}
