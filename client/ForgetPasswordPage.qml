import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import httpmgr
import global
Rectangle {
    id: forgetPasswordPage
    width: 280
    height: 350
    color: "#f5f5f5"
    property var _handlers: new Map()

    signal switchLogin

    Connections {
        target: HttpMgr
        function onSig_reset_mod_finish(id, res, err) {
            console.log("id is ", id)
            console.log("res is ", res)
            console.log("err is ", err)
            if(err !== Global.SUCCESS) {
                console.log("网络请求错误")
                return
            }

            _handlers.get(id)(res)

        }
    }

    Column {
        anchors.fill: parent
        spacing: 15
        anchors.margins: 30

        // 用户名输入框
        XTextInput {
            id: usernameInput
            hint: "请输入用户名"
        }

        // 邮箱输入框
        XTextInput {
            id: emailInput
            hint: "请输入邮箱"
        }

        //验证码区域
        RowLayout {
            width: parent.width - 34
            height: 30
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            TextField {
                id: codeInput
                Layout.preferredHeight: 30
                Layout.fillWidth: true
                property string hint: "请输入验证码"
                leftPadding: 10
                Text {
                    anchors.fill: parent
                    text: codeInput.hint
                    leftPadding: 20

                    color: "#999999"
                    verticalAlignment: Text.AlignVCenter
                    visible: !codeInput.text && !codeInput.activeFocus
                }
                background: Rectangle {
                    radius: 4
                    border.width: 1
                    border.color: codeInput.focus ? "#2196F3" : "#e0e0e0"
                }
            }

            Button {
                id: sendCodeButton
                Layout.preferredWidth: 80
                Layout.preferredHeight: 30
                text: remainingTime > 0 ? remainingTime + "秒" : "发送验证码"
                flat: true
                enabled: remainingTime === 0

                background: Rectangle {
                    radius: 4
                    border.width: 1
                    border.color: sendCodeButton.enabled ? "#198754" : "#cccccc"
                    color: {
                        if (!sendCodeButton.enabled) return "#cccccc"
                        return sendCodeButton.hovered ? "#157347" : "#198754"
                    }
                }

                contentItem: Text {
                    text: sendCodeButton.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 12
                }

                property int remainingTime: 0
                Timer {
                    id: countdownTimer
                    interval: 1000
                    repeat: true
                    onTriggered: {
                        sendCodeButton.remainingTime--
                        if (sendCodeButton.remainingTime <= 0) {
                            stop()
                        }
                    }
                }

                onClicked: {
                    function isValidEmail(email) {
                        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
                        return emailRegex.test(email)
                    }

                    if(!isValidEmail(emailInput.text)) {
                        console.log("邮箱错误")
                        return
                    }
                    var json_obj = {
                        "email": emailInput.text
                    }
                    HttpMgr.PostHttpReq("http://192.168.56.101:8080/get_varifycode", json_obj, Global.ID_GET_VARIFY_CODE, Global.RESETMOD)

                    // 启动倒计时
                    remainingTime = 60
                    countdownTimer.start()
                }
            }
        }

        // 新密码输入框
        XTextInput {
            id: newPasswordInput
            hint: "请输入新密码"
            echoMode: TextInput.Password
        }

        // 重置密码按钮
        Button {
            id: resetButton
            text: "重置密码"
            width: parent.width - 40
            height: 35
            anchors.horizontalCenter: parent.horizontalCenter
            flat: true

            background: Rectangle {
                radius: 4
                border.width: 1
                border.color: "#198754"
                color: resetButton.hovered ? "#157347" : "#198754"
            }

            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
            }

            onClicked: {
                console.log("点击重置按钮")
                var json_obj = {
                    "email": emailInput.text,
                    "user": usernameInput.text,
                    "passwd": newPasswordInput.text,
                    "varifycode": codeInput.text
                }
                HttpMgr.PostHttpReq("http://192.168.56.101:8080/reset_pwd", json_obj, Global.ID_RESET_PWD, Global.RESETMOD)
            }
        }

        // 返回登录
        Text {
            id: backToLoginText
            text: "返回登录"
            color: backToLoginArea.containsMouse ? "#666666" : "#999999"
            font.pixelSize: 14
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                id: backToLoginArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: forgetPasswordPage.switchLogin()
            }
        }
    }
    Component.onCompleted: {
        initHttpHandlers()
    }
    function initHttpHandlers() {
        //获取验证码回调
        _handlers.set(Global.ID_GET_VARIFY_CODE, (res)=>{
            let jsonObj;
            try {
            // 尝试解析 JSON
                jsonObj = JSON.parse(res);
            } catch (e) {
                // 如果解析失败，打印错误信息并返回
                console.error("JSON 解析失败:", e.message);
                return;
            }
            const error = Number(jsonObj["error"])
            if(error != Global.SUCCESS){
                console.log("网络请求错误")
                return
            }
            const email = String(jsonObj["email"])
            console.log("验证码已发送到邮箱，注意查收")
            console.log("email is ", email)
        })
        //重置密码回调
        _handlers.set(Global.ID_RESET_PWD, (res)=>{
            let jsonObj;
            try {
            // 尝试解析 JSON
                jsonObj = JSON.parse(res);
            } catch (e) {
                // 如果解析失败，打印错误信息并返回
                console.error("JSON 解析失败:", e.message);
                return;
            }
            const email = jsonObj["email"]
            const uuid = jsonObj["uid"]

            console.log("重置成功,点击返回登录")
            console.log("email is ", email)
            console.log("user uuid is ", uuid)
            forgetPasswordPage.switchLogin()
        })
    }
}
