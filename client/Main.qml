import QtQuick
import QtQuick.Controls

FramelessWindow {
    id: window
    visible: true
    Loader {
        id:loader
        y:30
        source: "LoginPage.qml"
        Connections {
            target: loader.item
            ignoreUnknownSignals: true
            function onSwitchRegister() {
                loader.source = "RegisterPage.qml"
            }

            function onSwitchLogin() {
                loader.source = "LoginPage.qml"
            }
            function onSwitchForgetPassword() {
                loader.source = "ForgetPasswordPage.qml"
            }

            function onLogin() {
                loader.source = "MainWindow.qml"
                // UserMgr.UpdateFriendList()
                // ChatMgr.UpdateChatList()
            }
        }
        onLoaded: {
            // 使用 toString() 并检查是否包含目标文件名
            var sourcePath = loader.source.toString()
            if(sourcePath.includes("LoginPage.qml") || sourcePath.includes("RegisterPage.qml") ||
                    sourcePath.includes("ForgetPasswordPage.qml")) {
                window.is_resize = false
                window.minBntShow = false
                window.maxBntShow = false
                window.width = loader.item.width
                window.height = loader.item.height + 30
            } else if(sourcePath.includes("MainWindow.qml")) {
                window.is_resize = true
                window.minBntShow = true
                window.maxBntShow = true
                window.minimumWidth = 670
                window.minimumHeight = 500
                loader.y = 0
                // loader.item.width = window.width
                // loader.item.height = window.height
            }
        }
    }
}
