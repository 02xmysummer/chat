import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Controls.Material
/******************************************************************************
 *
 * @file       ChatList.qml
 *              聊天列表
 * @author     xuorz
 * @date       2025/03/16
 * @history
 *****************************************************************************/
ListView {
    id:chatList
    clip: true  // 防止内容溢出
    boundsBehavior:Flickable.StopAtBounds
    width: parent.width - 20
    property int activeIndex: 0

    property var lastmessages : [
        "hello world !",
        "nice to meet u",
        "New year，new life",
        "You have to love yourself",
        "My love is written in the wind ever since the whole world is you"
    ]
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
    property bool isLoadingMore: false

    // 添加滚动条
    ScrollBar.vertical: ScrollBar {
        padding: 2  // 添加内边距
        policy: ScrollBar.AsNeeded  // 需要时才显示
        interactive: true  // 可以交互
    }
    ListModel {
        id: dataModel
    }
    model: dataModel
    delegate: ChatItem {
        id:chatItem
        width: chatList.width
        isActive: index === chatList.activeIndex

        onClicked: {
            if(activeIndex === index)
                return
            activeIndex = index
            p_object.name = dataModel.get(index).name
        }
    }
    Component.onCompleted: {
        loadInitialData()
        p_object.name = dataModel.get(activeIndex).name
    }
    onContentYChanged: {
        if (contentY + height >= contentHeight && !isLoadingMore) {  // 距离底部 10 像素时加载更多
            loadMoreData()
        }
    }
    onHeightChanged: {
        console.log(height)
    }

    function loadInitialData() {
        for(let i = 0; i < names.length; ++i) {
            var randomlastmessageIndex = Math.floor(Math.random() * lastmessages.length);
            var randomavatorIndex = Math.floor(Math.random() * 20) + 1;
            dataModel.append({
                "name" : names[i],
                "avatar" : "qrc:/states/"+ randomavatorIndex + ".jpg",
                "lastmessage": lastmessages[randomlastmessageIndex],
                "lasttime": "00:12"
            })
        }
    }
    function loadMoreData() {
        if (isLoadingMore) return
        isLoadingMore = true
        console.log("Loading more data...")

        // 模拟延迟加载（例如从服务器获取数据）
        Qt.callLater(() => {
            for (let i = 0; i < 5; ++i) {  // 每次加载 5 条数据
                appendRandomData()
            }
            isLoadingMore = false
            console.log("Finished loading more data.")
        })
    }
    function appendRandomData() {
        if (names.length === 0) return
        let randomNameIndex = Math.floor(Math.random() * names.length)
        let randomLastMessageIndex = Math.floor(Math.random() * lastmessages.length)
        let randomAvatarIndex = Math.floor(Math.random() * 20) + 1

        dataModel.append({
            "name": names[randomNameIndex],
            "avatar": "qrc:/states/" + randomAvatarIndex + ".jpg",
            "lastmessage": lastmessages[randomLastMessageIndex],
            "lasttime": "00:12"
        })
    }

}
