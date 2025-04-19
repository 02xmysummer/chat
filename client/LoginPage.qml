import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import httpmgr
import global
<<<<<<< HEAD
=======
import tcpmgr
>>>>>>> feature/login-register
/******************************************************************************
 *
 * @file       LoginPage.qml
*               登录界面
 * @author     xuorz
 * @date       2025/03/13
 * @history
 *****************************************************************************/
Rectangle {
    id: loginPage
    width: 280
    height: 350
    color: "#f5f5f5"

    signal switchRegister()
    signal switchForgetPassword()
    signal login()
<<<<<<< HEAD
    property var _handlers: new Map

=======
    signal sig_connect_tcp(var obj)
    property var _handlers: new Map
    property string _uid
    property string _token
>>>>>>> feature/login-register
    Connections {
        target: HttpMgr
        function onSig_login_mod_finish(id, res, err) {
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
<<<<<<< HEAD
=======
    Connections {
        target: TcpMgr
        function onSig_con_success(ok) {
            if(ok) {
                console.log("聊天服务连接成功，正在登录...")
                const jsonObj = {
                    "uid": _uid,
                    "token": _token
                }
                const jsonStr = String(jsonObj)
                TcpMgr.sig_send_data(Global.ID_CHAT_LOGIN, jsonStr)
            } else {
                console.log("网络异常")
            }
        }
    }

    onSig_connect_tcp: (obj)=>{
        const s = JSON.stringify(obj)
        console.log(s)
        TcpMgr.slot_tcp_connect(s)
    }
>>>>>>> feature/login-register

    Column {
        anchors.fill: parent
        spacing: 20
        anchors.margins: 30

        //头像
        RoundImage {
            width: 100
            height: width
            radius: width
            anchors.horizontalCenter:parent.horizontalCenter
            source: "qrc:/src/avatar.jpg"
        }
        //用户名
        XTextInput {
            id: emailInput
            hint: "请输入邮箱地址"
        }

        //密码
        XTextInput {
            id: passwordInput
            hint: "请输入密码"
            echoMode: TextInput.Password
        }
        //登录按钮
        Button {
            id: loginButton
            text: "登 录"
            width: parent.width - 40
            height: 35
            anchors.horizontalCenter: parent.horizontalCenter

            // 取消默认的按钮样式
            flat: true

            background: Rectangle {
                radius: 4
                border.width: 1
                border.color: "#198754"
                color: {
                    if (loginButton.hovered) return "#157347"    // 悬停时深绿
                    return "#198754"                             // 正常状态绿色
                }

                // Add MouseArea for cursor change
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onPressed: loginButton.pressed()
                    onReleased: loginButton.released()
                }
            }

            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
            }

            onClicked: {
                const json_obj = {
                    "email": emailInput.text,
                    "passwd": passwordInput.text
                }

                HttpMgr.PostHttpReq("http://192.168.56.101:8080/user_login", json_obj, Global.ID_LOGIN_USER, Global.LOGINMOD)
            }
        }

        // 添加注册和忘记密码的行
        Row {
            width: parent.width - 40
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Text {
                id: registerText
                text: "注册账号"
                color: registerArea.containsMouse ? "#666666" : "#999999"
                font.pixelSize: 14
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    id: registerArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("register")
                        loginPage.switchRegister()
                    }
                }
            }

            Item {
                width: parent.width - registerText.width - forgetText.width - parent.spacing * 2
                height: 1
            }

            Text {
                id: forgetText
                text: "忘记密码"
                color: forgetArea.containsMouse ? "#666666" : "#999999"
                font.pixelSize: 14
                anchors.verticalCenter: parent.verticalCenter

                MouseArea {
                    id: forgetArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("forgetpassword")

                        loginPage.switchForgetPassword()
                    }
                }
            }
        }
    }
    Component.onCompleted: {
        initHttpHandlers()
    }
    function initHttpHandlers() {
        _handlers.set(Global.ID_LOGIN_USER, (res)=>{
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
<<<<<<< HEAD
            const email = String(jsonObj["email"])
            console.log("登录成功")
            console.log("email is ", email)
=======
            let email = jsonObj["email"];
            const server = {
                "host": String(jsonObj["host"]),
                "port": String(jsonObj["port"]),
                "token": String(jsonObj["token"]),
                "uid": Number(jsonObj["uid"]),
            }
            _uid = server.uid
            _token = server.token
            console.log("email is ", email,
                        "uid is ", server.uid,
                        "host is ", server.host,
                        "port is ", server.port,
                        "token is ", server.token)

            loginPage.sig_connect_tcp((server))
>>>>>>> feature/login-register
        })
    }

}
